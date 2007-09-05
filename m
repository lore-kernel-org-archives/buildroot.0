From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 5 Sep 2007 06:37:44 -0700
Subject: [Buildroot] [buildroot 0001488]: [patch] kernel modules/drivers
	(various modems)
Message-ID: <8d2edc0ff4c6f8339825fa13461b384d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1488 
====================================================================== 
Reported By:                bradmssw
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1488
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-05-2007 06:37 PDT
Last Modified:              09-05-2007 06:37 PDT
====================================================================== 
Summary:                    [patch] kernel modules/drivers (various modems)
Description: 
I'm not sure how useful this is to anyone else, but we have
a need for cheap modem support on Soekris net4801/net5501
systems, so we've tested Conexant HCF and HSF based modems
and Lucent/Agere based modems with these drivers, and they
appear to work as expected.

The HCF driver works on i386 and ppc.
The HSF driver works on i386 and x86_64.
The ltmodem driver only works on i386 (the next-gen
martian driver which works on i386 and x86_64
crashes immediately with uclibc, so I patched
the ltmodem driver to work with 2.6.22.1).
The agrsm driver only works on i386 for agere softmodems
(different PCI IDs from the ltmodems).

I've attached the patch which adds these directories:
package/hcfpcimodem
package/hsfmodem
package/ltmodem
package/agrsm

And modifies the package/Config.in by adding a new
drivers/kernel modules section.

Note: The HCF and HSF drivers require a license key
from Linuxant (www.linuxant.com) to operate at speeds
greater than 14.4.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-05-07 06:37  bradmssw       New Issue                                    
09-05-07 06:37  bradmssw       Status                   new => assigned     
09-05-07 06:37  bradmssw       Assigned To               => buildroot       
09-05-07 06:37  bradmssw       File Added: modem_drivers.diff                   

======================================================================
