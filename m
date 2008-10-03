From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 2 Oct 2008 23:32:11 -0700
Subject: [Buildroot] [buildroot 0005224]: Default kernell headers version
	(2.6.26.2) doesn't match default stable kernel (2.6.26.3)
Message-ID: <5aed7048a193a56871b1196ff902ba1c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5224 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5224
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-02-2008 23:32 PDT
Last Modified:              10-02-2008 23:32 PDT
====================================================================== 
Summary:                    Default kernell headers version (2.6.26.2) doesn't
match default stable kernel (2.6.26.3)
Description: 
After selecting the latest stable kernel (2.6.26.3), uClibc still tries to
install header files from 2.6.26.2.

How to reproduce:

tar -xjf ../dl/buildroot-svn-snapshot.tar.bz2
cd buildroot
cp target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig .config
make menuconfig
  Choose "Kernel"
    Choose "Linux Kernel Version"
      Choose "Latest stable kernel (2.6.26.3)"
  Exit and save
  
[mjd at mjd buildroot]$ grep BR2_DEFAULT_KERNEL_HEADERS .config
BR2_DEFAULT_KERNEL_HEADERS="2.6.26.2"

Even if you hand-edit BR2_DEFAULT_KERNEL_HEADERS to be 2.6.26.3, a further
run of "make menuconfig" will return BR2_DEFAULT_KERNEL_HEADERS to be
2.6.26.2.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-02-08 23:32  mjd            New Issue                                    
10-02-08 23:32  mjd            Status                   new => assigned     
10-02-08 23:32  mjd            Assigned To               => buildroot       
======================================================================
