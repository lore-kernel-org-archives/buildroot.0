From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Mar 2007 11:56:16 -0700
Subject: [Buildroot] [buildroot 0001282]: ccache
Message-ID: <bb63311bd748c25d3bf478867782ab72@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1282 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1282
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-21-2007 11:56 PDT
Last Modified:              03-21-2007 11:56 PDT
====================================================================== 
Summary:                    ccache
Description: 
Hello,

1) ccache is built at the end of the toolchain (gcc/uclibc/binutils). It
serves for nothing (ok I except if you slected other package it may...).

2) the ccache_dir is fixed inside 'toolchain_build_i486' It would be
better if the  CCACHE_DIR could be setup somewhere else outside
'buildroot'.
Why? In automated procedure constructing distro, buildroot.tar.gz is
expanded then configured then built as all other packages making the
distro.
It means everytime, buildroot dir is like a virgin.. ;-) No ccache_dir
inside.

but if ccache_dir is outside....ok, it will be preserved accross rebuilds
and the final touch would have ccache used for ALL the toolchain
construction...!


Adding a new option in 'make menuconfig' is beyond my knowledge of
buildroot for now.

Franck
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-07 11:56  Franck78       New Issue                                    
03-21-07 11:56  Franck78       Status                   new => assigned     
03-21-07 11:56  Franck78       Assigned To               => buildroot       
======================================================================
