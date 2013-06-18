From: =?UTF-8?B?R3LDqWdvcnkgSGVybWFudA==?= <gregory.hermant@calao-systems.com>
Date: Tue, 18 Jun 2013 17:02:59 +0200
Subject: [Buildroot] gcc-4.7.3 potential issue with barebox
In-Reply-To: <20130617162507.0cf4a4b3@skate>
References: <51BF07B1.6060900@calao-systems.com>
 <20130617162507.0cf4a4b3@skate>
Message-ID: <51C076A3.4040008@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,
Same issue with gcc version 4.7.3 (Sourcery CodeBench Lite 2013.05-24) toolchain.
BR,
gr?gory

Le 17/06/2013 16:25, Thomas Petazzoni a ?crit :
> Dear Gr?gory Hermant,
>
> On Mon, 17 Jun 2013 14:57:21 +0200, Gr?gory Hermant wrote:
>
>> I noticed an issue with barebox binary about the nandflash detection.
>> Indeed barebox is unable to detect the nandflash when i build barebox from gcc-4.7.3 (buildroot-2013.05)
>> By digging a little bit  i noticed  that  the size of atmel_nand.o was different according to the toolchain release (atmel_nand.o 4732bytes vs 5096 bytes for gcc-4.6.3 )
>> If i disassemble atmel_nand.o i notice that  atmel_nand_enable & atmel_nand_disable are missing.
>> Is it an known issue ?
> I don't remember hearing about this, but maybe you could check with
> another ARM gcc 4.7 based toolchain such as the Linaro toolchain, and
> see if the generated code is correct or not. If the generated code is
> also not correct, then maybe it's a Barebox issue, otherwise it would
> most likely be a Buildroot toolchain issue.
>
> Best regards,
>
> Thomas
