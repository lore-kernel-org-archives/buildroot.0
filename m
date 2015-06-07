From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 7 Jun 2015 12:34:02 +0300
Subject: [Buildroot] nand id format in /nandflash.c
In-Reply-To: <B03A893ADFE80748942D13AFAF28451924E7512BF8@ITSVLEX06.it.maxim-ic.internal>
References: <B03A893ADFE80748942D13AFAF28451924E7512BF8@ITSVLEX06.it.maxim-ic.internal>
Message-ID: <20150607093402.GG2671@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ted,

On Sun, Jun 07, 2015 at 02:00:54AM -0700, Ted Salazar wrote:
> Not sure why this is not commented in the source code by Atmel but can one 
> of you tell me what the nand id format is in /nandflash.c. You guys must do 
> this all the time. I know the first four hex numbers are the manufacturer ID 
> and the device ID from the data sheet but what is the format for the other 
> hex values?

This file is not part of Buildroot. In case you refer to driver/nandflash.c 
from the at91bootstrap project, please direct your question to at91bootstrap 
developers as listed at the end of the README file.

Two short answers below.

> For example,
> 
> static struct nand_chip nand_ids[] = {
>                 /* Micron MT29F2G16AAB 256MB */
>                 {0x2cca, 0x800, 0x20000, 0x800, 0x40, 0x1},
>                 /* Micron MT29F2G08AAC 256MB  */
>                 {0x2cda, 0x800, 0x20000, 0x800, 0x40, 0x0},
> ...
> 
> What does the 2nd (0x800), 3rd (0x20000) , 4th (0x800), 5th (0x40), and 6th 
> (0x1) hex numbers represent since I need to move to a different memory 
> manufacturer and will need to create a new nandflash option.

See the definition of 'struct nand_chip' at include/nand.h.

> Micron nandflash data sheet link below:
> http://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/MT29F2G%2808,16%29AAD,ABD.pdf

This NAND flash chip is ONFI compliant. Hard coding its parameters in the 
nand_ids array should not be needed.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
