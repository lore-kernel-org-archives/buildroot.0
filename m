From: Mahmood, Nassar <Nassar.Mahmood@nortechonline.co.uk>
Date: Thu, 29 May 2014 15:42:06 +0000
Subject: [Buildroot] Help in generating a test case for GCC
In-Reply-To: <CALo-6+itKgdr94X5idwf39eB0s9dFAfTCOZ=KAUk_zmB=JPpUA@mail.gmail.com>
References: <a7cf0475c9a649748861f69584d94d90@DBXPR06MB303.eurprd06.prod.outlook.com>
 <CALo-6+itKgdr94X5idwf39eB0s9dFAfTCOZ=KAUk_zmB=JPpUA@mail.gmail.com>
Message-ID: <aba3b397f0174a83b21895723bdc833b@DBXPR06MB303.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is that part of the configure options - additional gcc options, or does it go with CFLAGS, i.e target optimizations?

Regards,
Nassar Mahmood | Software Developer
Office: +44 (0)8700 111992   Email: Nassar.Mahmood at nortechonline.co.uk<mailto:Simon.Hodgson@nortechonline.co.uk>
Nortech Management Ltd Unit 2, Deer Park Business Centre, Woollas Hill, Eckington, Pershore, WR10 3DN, United Kingdom
Company Info: www.nortechonline.co.uk | Telemetry Systems: www.WebScada.co.uk<http://www.webscada.co.uk/> | Utility Networks: www.iHostExplained.co.uk<http://www.ihostexplained.co.uk/>
Registered in England no: 2777816 VAT No: GB606132871

From: Charles Krinke [mailto:charles.krinke at gmail.com]
Sent: 29 May 2014 16:21
To: Mahmood, Nassar
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] Help in generating a test case for GCC

There is a gcc option called "-mno-unaligned-access" which has caused me problems with some versions of gcc and some versions of ARM's.
Some of the folks like Mentor changed the default in their gcc distributions from aligned access to unaligned access.
You might find it interesting to ask the question "Could you test behaviour be explained by a difference in default behaviour of gcc between 4.6 & 4.7?"
Charles

On Thu, May 29, 2014 at 8:11 AM, Mahmood, Nassar <Nassar.Mahmood at nortechonline.co.uk<mailto:Nassar.Mahmood@nortechonline.co.uk>> wrote:
Hello all,

I'm using Buildroot to create a root file system for a custom board based on the AT91SAM9G20.
I've discovered that gcc versions 4.7 onwards generate incorrect code for linux regardless of the linked C library, in my case the AT24 EEPROM driver, ultimately causing a reboot.
However if I downgrade gcc to 4.6 it all works, this is based on gcc from a variety of sources, from the standard in Buildroot, the Red-Hat snapshot, and the GNU version of Sourcery.
I submitted the bug on gcc's website (#61285) but they need more information and a specific test case, here I'm at a loss on how to proceed.
I've tried introducing the -save-temps flag (in the linux.mk<http://linux.mk> file) but that does not appear to generate .i or .ii files in the output/build/linux-xyz folder.
Any ideas on how to get something to them, which will allow them to work on the bug?
The reason for requiring this fixed is due to plans to introduce the C++11 based OpenDNP3 library onto our boards.

Regards,
Nassar Mahmood | Software Developer
Office: +44 (0)8700 111992<tel:%2B44%20%280%298700%20111992>   Email: Nassar.Mahmood at nortechonline.co.uk<mailto:Simon.Hodgson@nortechonline.co.uk>
Nortech Management Ltd Unit 2, Deer Park Business Centre, Woollas Hill, Eckington, Pershore, WR10 3DN, United Kingdom
Company Info: www.nortechonline.co.uk<http://www.nortechonline.co.uk> | Telemetry Systems: www.WebScada.co.uk<http://www.webscada.co.uk/> | Utility Networks: www.iHostExplained.co.uk<http://www.ihostexplained.co.uk/>
Registered in England no: 2777816 VAT No: GB606132871


_______________________________________________
buildroot mailing list
buildroot at busybox.net<mailto:buildroot@busybox.net>
http://lists.busybox.net/mailman/listinfo/buildroot



--
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140529/a1ae0ee3/attachment.html>
