From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 25 Jun 2007 11:02:13 -0700
Subject: [Buildroot] [buildroot 0001282]: ccache
Message-ID: <b62ed16d4ea778746792529833f575a9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              06-25-2007 11:02 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 06-25-07 11:02  
---------------------------------------------------------------------- 
Although i don't understand a word, i think that this sounds like "Doctor,
it hurts when i do.."

Please describe the problem you are facing and suggest what should be done
why and how, i shall close this bug otherwise. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-07 11:56  Franck78       New Issue                                    
03-21-07 11:56  Franck78       Status                   new => assigned     
03-21-07 11:56  Franck78       Assigned To               => buildroot       
06-25-07 11:02  bernhardf      Note Added: 0002507                          
======================================================================
