From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 Jul 2008 03:02:47 -0700
Subject: [Buildroot] [buildroot 0003994]: Default ngw100-base config fails
	with invalid directory when compiling gcc
Message-ID: <95e7cc33deeab93d180cf51ba6b2a69e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3994 
====================================================================== 
Reported By:                mpfj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3994
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-08-2008 03:02 PDT
Last Modified:              07-08-2008 03:02 PDT
====================================================================== 
Summary:                    Default ngw100-base config fails with invalid
directory when compiling gcc
Description: 
Checked out latest svn copy

# make atngw100-base_defconfig
# make

Fails with the following ...

# Apply any files named gcc-*.patch from the source directory to gcc
toolchain/patch-kernel.sh
/usr/local/dev/avr32/buildroot-cvs/toolchain_build_avr32/gcc-4.2.2-avr32-2.1.5
Atmel/avr32/gcc-4.2.2-avr32-2.1.5 \*.patch
Aborting.  'Atmel/avr32/gcc-4.2.2-avr32-2.1.5' is not a directory.
make: ***
[/usr/local/dev/avr32/buildroot-cvs/toolchain_build_avr32/gcc-4.2.2-avr32-2.1.5/.patched]
Error 1

This can be temporarily fixed with ...

# mkdir Atmel
# cd Atmel
# ln -s ../toolchain_build_avr32 avr32

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-08 03:02  mpfj           New Issue                                    
07-08-08 03:02  mpfj           Status                   new => assigned     
07-08-08 03:02  mpfj           Assigned To               => buildroot       
======================================================================
