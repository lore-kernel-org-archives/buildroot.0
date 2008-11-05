From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 5 Nov 2008 01:46:57 -0800
Subject: [Buildroot] [buildroot 0005994]: gdk-pixbuf-csource is missing in
	the $HOST toolchain
Message-ID: <4824839adfc121ca86d4f1012f5163b3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5994 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5994
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-05-2008 01:35 PST
Last Modified:              11-05-2008 01:46 PST
====================================================================== 
Summary:                    gdk-pixbuf-csource is missing in the $HOST toolchain
Description: 
Making all in demos
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/libgtk2-2.12.12/demos'
/usr/bin/gdk-pixbuf-csource --raw --build-list		\
	        apple_red  ./apple-red.png	\
                gnome_foot ./gnome-foot.png	\
        > test-inline-pixbufs.h				\
	|| (rm -f test-inline-pixbufs.h && false)
/bin/bash: /usr/bin/gdk-pixbuf-csource: No such file or directory
make[3]: *** [test-inline-pixbufs.h] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libgtk2-2.12.12/demos'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libgtk2-2.12.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libgtk2-2.12.12'
make: ***
[/home/roberto/gles/buildroot/build_i586/libgtk2-2.12.12/.stamp_built]
Error 2


This problem could be avoided removing 'demos' from SUBDIRS into
libgtk2-2.12.12/Makefile*, however this could not fix because:


>>> gqview 2.1.5 Building
/usr/bin/make -j1  -C
/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5'
Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src'
Making all in icons
make[4]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons'
Making all in svg
make[5]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons/svg'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons/svg'
make[5]: Entering directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons'
gdk-pixbuf-csource --raw --extern --build-list
folder_closed		./folder_closed.png folder_locked		./folder_locked.png
folder_open		./folder_open.png folder_up		./folder_up.png
gqview_icon		./gqview_icon.png gqview_logo		./gqview_logo.png
icon_float		./icon_float.png icon_thumb		./icon_thumb.png
icon_scroller		./scroller.png icon_broken		./sheet_broken.png
icon_book		./icon_book.png icon_config		./icon_config.png
icon_tools		./icon_tools.png icon_view		./icon_view.png > icons_inline.h
/bin/bash: gdk-pixbuf-csource: command not found
make[5]: *** [icons_inline.h] Error 127
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src/icons'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/gqview-2.1.5'
make: ***
[/home/roberto/gles/buildroot/build_i586/gqview-2.1.5/.stamp_built] Error
2

The gdk-pixbuf-csource still be there for those packages they require it.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 11-05-08 01:46  
---------------------------------------------------------------------- 
Exactly, it's the same issue - That we rely on the user having the
glib/gtk/whatever development packages installed instead of compiling them
ourselves for the host 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-05-08 01:35  robang74       New Issue                                    
11-05-08 01:35  robang74       Status                   new => assigned     
11-05-08 01:35  robang74       Assigned To               => buildroot       
11-05-08 01:35  robang74       Issue Monitored: robang74                    
11-05-08 01:46  jacmet         Note Added: 0015154                          
======================================================================
