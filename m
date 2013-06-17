From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Mon, 17 Jun 2013 14:57:21 +0200
Subject: [Buildroot]  gcc-4.7.3 potential issue with barebox
Message-ID: <51BF07B1.6060900@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I noticed an issue with barebox binary about the nandflash detection.
Indeed barebox is unable to detect the nandflash when i build barebox from gcc-4.7.3 (buildroot-2013.05)
By digging a little bit  i noticed  that  the size of atmel_nand.o was different according to the toolchain release (atmel_nand.o 4732bytes vs 5096 bytes for gcc-4.6.3 )
If i disassemble atmel_nand.o i notice that  atmel_nand_enable & atmel_nand_disable are missing.
Is it an known issue ?
Gr?gory
