From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:13 -0800
Subject: [Buildroot] [buildroot 0000199]: glib1.2 doesn't compile shared
	library
Message-ID: <a654bd71627fa55f43a4de71d2ab71b3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=199 
====================================================================== 
Reported By:                Oliv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   199
Category:                   Shared Library Support
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-30-2005 05:27 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    glib1.2 doesn't compile shared library
Description: 
When I've included glib1.2 support in buildroot package, I got the
following error:
cp -a /data/LiveCD/buildroot/build_i386/staging_dir/lib/libglib.a
/data/LiveCD/buildroot/build_i386/root/lib/
cp -a /data/LiveCD/buildroot/build_i386/staging_dir/lib/libglib.so
/data/LiveCD/buildroot/build_i386/root/lib/
cp: ne peut ?valuer
`/data/LiveCD/buildroot/build_i386/staging_dir/lib/libglib.so': Aucun
fichier ou r?pertoire
de ce type
make: *** [/data/LiveCD/buildroot/build_i386/root/lib/libglib.a] Erreur 1

in English: libglib.so: no such file or directory
this error is normal if we consider the output of .configure:
checking how to hardcode library paths into programs... immediate
checking for
/data/LiveCD/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-ld
option to reload object
files... -r
checking dynamic linker characteristics... no
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes

But the problem is that ./configure has the --enable-shared option ???
====================================================================== 

---------------------------------------------------------------------- 
 solar - 03-30-05 10:37  
---------------------------------------------------------------------- 
glib-1.2 by default does not build shared objects. 
At some point we may have lost patch that handled linking glib-1.2 as a
shared object or the work is incomplete. For now this should do the trick. 

---------------------------------------------------------------------- 
 vapier - 09-07-05 18:51  
---------------------------------------------------------------------- 
fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-30-05 05:27  Oliv           New Issue                                    
03-30-05 10:37  solar          Note Added: 0000120                          
03-30-05 10:38  solar          File Added: libglib12-20050330.diff              
     
09-07-05 18:51  vapier         Note Added: 0000507                          
09-07-05 18:51  vapier         Status                   assigned => closed  
09-07-05 18:51  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
