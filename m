From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 Jul 2008 03:45:03 -0700
Subject: [Buildroot] [buildroot 0004004]: Default ngw100-base config fails
	to find u-boot config
Message-ID: <490107ef7cc12284af8e165a0c530aae@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4004 
====================================================================== 
Reported By:                mpfj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4004
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-08-2008 03:45 PDT
Last Modified:              07-08-2008 03:45 PDT
====================================================================== 
Summary:                    Default ngw100-base config fails to find u-boot
config
Description: 
Adding u-boot to the default ngw100-base config does not work.  The
following error occurs ...

		/usr/bin/make MAKE='/usr/bin/make -j1 ' -C
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3	\
		"atngw100-base"_config
make[1]: Entering directory
`/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3'
make[1]: *** No rule to make target `atngw100-base_config'. Stop.
make[1]: Leaving directory
`/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3'
make: ***
[/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3/.configured]
Error 2

This can be temp fixed by changing the u-boot board name from $BOARD_NAME
to atngw100.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-08 03:45  mpfj           New Issue                                    
07-08-08 03:45  mpfj           Status                   new => assigned     
07-08-08 03:45  mpfj           Assigned To               => buildroot       
======================================================================
