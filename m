From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 7 Apr 2008 00:47:04 -0700
Subject: [Buildroot] [buildroot 0002874]: libglib2 does not build
Message-ID: <bc7991469d1b0ab9459e752ec465b429@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2874 
====================================================================== 
Reported By:                joedawson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2874
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-07-2008 00:47 PDT
Last Modified:              04-07-2008 00:47 PDT
====================================================================== 
Summary:                    libglib2 does not build
Description: 
libglib2 fails to build. Is tested for ARM and x86 builds, giving the same
error:
make[4]: Entering directory
`/srv/br-svn/build_arm/libglib2-2.15.4/gobject'
make[4]: `glib-genmarshal' is up to date.
make[4]: Leaving directory
`/srv/br-svn/build_arm/libglib2-2.15.4/gobject'
echo "#ifndef __G_MARSHAL_H__" > xgen-gmh \
        && echo "#define __G_MARSHAL_H__" >> xgen-gmh \
        && /usr/bin/glib-genmarshal --nostdinc --prefix=g_cclosure_marshal
./gmarshal.list --header >> xgen-gmh \
        && echo "#endif /* __G_MARSHAL_H__ */" >> xgen-gmh \
        && (cmp -s xgen-gmh gmarshal.h 2>/dev/null || cp xgen-gmh
gmarshal.h) \
        && rm -f xgen-gmh xgen-gmh~ \
        && echo timestamp > stamp-gmarshal.h
/bin/bash: line 2: /usr/bin/glib-genmarshal: No such file or directory
make[3]: *** [stamp-gmarshal.h] Error 127
make[3]: Leaving directory
`/srv/br-svn/build_arm/libglib2-2.15.4/gobject'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/srv/br-svn/build_arm/libglib2-2.15.4'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/srv/br-svn/build_arm/libglib2-2.15.4'
make: *** [/srv/br-svn/build_arm/libglib2-2.15.4/.stamp_built] Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-07-08 00:47  joedawson      New Issue                                    
04-07-08 00:47  joedawson      Status                   new => assigned     
04-07-08 00:47  joedawson      Assigned To               => buildroot       
04-07-08 00:47  joedawson      File Added: config                           
======================================================================
