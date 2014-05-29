From: Mahmood, Nassar <Nassar.Mahmood@nortechonline.co.uk>
Date: Thu, 29 May 2014 15:11:04 +0000
Subject: [Buildroot] Help in generating a test case for GCC
Message-ID: <a7cf0475c9a649748861f69584d94d90@DBXPR06MB303.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm using Buildroot to create a root file system for a custom board based on the AT91SAM9G20.
I've discovered that gcc versions 4.7 onwards generate incorrect code for linux regardless of the linked C library, in my case the AT24 EEPROM driver, ultimately causing a reboot.
However if I downgrade gcc to 4.6 it all works, this is based on gcc from a variety of sources, from the standard in Buildroot, the Red-Hat snapshot, and the GNU version of Sourcery.
I submitted the bug on gcc's website (#61285) but they need more information and a specific test case, here I'm at a loss on how to proceed.
I've tried introducing the -save-temps flag (in the linux.mk file) but that does not appear to generate .i or .ii files in the output/build/linux-xyz folder.
Any ideas on how to get something to them, which will allow them to work on the bug?
The reason for requiring this fixed is due to plans to introduce the C++11 based OpenDNP3 library onto our boards.

Regards,
Nassar Mahmood | Software Developer
Office: +44 (0)8700 111992   Email: Nassar.Mahmood at nortechonline.co.uk<mailto:Simon.Hodgson@nortechonline.co.uk>
Nortech Management Ltd Unit 2, Deer Park Business Centre, Woollas Hill, Eckington, Pershore, WR10 3DN, United Kingdom
Company Info: www.nortechonline.co.uk | Telemetry Systems: www.WebScada.co.uk<http://www.webscada.co.uk/> | Utility Networks: www.iHostExplained.co.uk<http://www.ihostexplained.co.uk/>
Registered in England no: 2777816 VAT No: GB606132871

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140529/12a04d7e/attachment.html>
