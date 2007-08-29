From: Brad House <brad@mainstreetsoftworks.com>
Date: Wed, 29 Aug 2007 17:46:46 -0400
Subject: [Buildroot] [patch] modem driver packages
Message-ID: <46D5E946.4060907@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

I've attached the patch which adds these directories:
package/hcfpcimodem
package/hsfmodem
package/ltmodem

And modifies the package/Config.in by adding a new
drivers/kernel modules section.

Note: The HCF and HSF drivers require a license key
from Linuxant (www.linuxant.com) to operate at speeds
greater than 14.4.

-Brad

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: modem_drivers.diff
Url: http://busybox.net/lists/buildroot/attachments/20070829/8a5ea796/attachment.diff 
