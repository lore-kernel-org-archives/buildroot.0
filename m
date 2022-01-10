Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63088C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D8D60E5B;
	Mon, 10 Jan 2022 22:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cal4SqoyiAuv; Mon, 10 Jan 2022 22:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 930F960E4D;
	Mon, 10 Jan 2022 22:11:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEF071BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C592A4063F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDzN0WRfDeeb for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18CA3400D0
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:10:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6171A19F57C;
 Mon, 10 Jan 2022 23:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641852657;
 bh=r68ygYvRBwkjBjKXLHb0xN2AV67rLLKzxmKh5eJfr3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UwExRTiQ3/UNqwwGpqu9SuNn6Trr7e6mvLUYXPXcJ5xazJ34sVhDEukcg7MwNG2cw
 DvyY/UmaUn9zasbSfu3XrYmm83mwwrumOga3S0tdOjr0RK/uFCTLY4kTBORzlIcZJy
 urt9TTOYPZLy0pizHDpr0ce/ddYivH04BTv18xsUtlpheQzxuaFMPixmXWKdNjyquM
 x9fgl4/xA/N5d1WlIa1JKsUD1RtVakL62abbPxhB49iCItZz6Lsw3RjQ5GKYqBF4IK
 Y6GV/2KoRIY3qMWHIodcgfOqgQ0DI+G7PZoYG39NDac40vSx1TAAmhjvtZ5AIHO19L
 h81Ctj7dIPNZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 23:10:51 +0100
Date: Mon, 10 Jan 2022 23:10:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220110221051.GT1477939@scaer>
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231202620.3521230-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zynq-boot-bin: port to python3
 and move to support/scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Julien Olivain <juju@cotds.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-12-31 13:26 -0700, James Hilliard spake thusly:
> The zynq-boot-bin.py script is no longer maintained upstream, so move
> it to support/scripts/zynq-boot-bin.py and port to python3.
> 
> The python3 version produces the same output as the original python2
> version.

So, zynq-boot-bin.py has disapeared in upstream repository [0] somewhere
between v2015.4 and v2016.1  (they are mreging branches here and there,
and git-bisect gets lost and finds spurious bad commits... meh...)

Use of zynq-boot-bin.py in Buildroot is guarded by BR2_TARGET_UBOOT_ZYNQ_IMAGE
and none of our defconfigs, not even any of our 5 zynq defconfigs. In 2016,
with commit 6b669b61a84f (zynq_microzed: bump U-Boot to xilinx-v2016.2),
we eventually got rid of the latest defconfig that used
BR2_TARGET_UBOOT_ZYNQ_IMAGE.

What's more, in commit 6dd5a33c485c (zynq_zed: bump U-Boot to
xilinx-v2016.2), Masahiro stated:

 - Replace BR2_TARGET_UBOOT_ZYNQ_IMAGE with BR2_TARGET_UBOOT_SPL_NAME
   since U-Boot can natively generate the Zynq boot image now. The
   Zynq image support for mkimage tool was upstreamed at v2016.01
   (so xilinx-v2016.1 as well), so no additional tool is needed
   any more.

So I wonder if it even makes sense to keep package/zynq-boot-bin now.

[0] https://github.com/Xilinx/u-boot-xlnx

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  boot/uboot/uboot.mk                      |   6 +-
>  package/zynq-boot-bin/zynq-boot-bin.hash |   2 -
>  package/zynq-boot-bin/zynq-boot-bin.mk   |  22 ---
>  support/scripts/zynq-boot-bin.py         | 230 +++++++++++++++++++++++
>  4 files changed, 233 insertions(+), 27 deletions(-)
>  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
>  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk
>  create mode 100755 support/scripts/zynq-boot-bin.py
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..9ff2ccda68 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -434,12 +434,12 @@ endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
>  define UBOOT_GENERATE_ZYNQ_IMAGE
> -	$(HOST_DIR)/bin/python2 \
> -		$(HOST_DIR)/bin/zynq-boot-bin.py \
> +	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
> +		$(TOPDIR)/support/scripts/zynq-boot-bin.py \
>  		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
>  		-o $(BINARIES_DIR)/BOOT.BIN
>  endef
> -UBOOT_DEPENDENCIES += host-zynq-boot-bin
> +UBOOT_DEPENDENCIES += host-python3
>  UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
>  endif
>  
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.hash b/package/zynq-boot-bin/zynq-boot-bin.hash
> deleted file mode 100644
> index 0bc23de197..0000000000
> --- a/package/zynq-boot-bin/zynq-boot-bin.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# From https://raw.githubusercontent.com/Xilinx/u-boot-xlnx
> -sha1	940331ee02b0007099effa61e382fe7ea4174054	zynq-boot-bin.py
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
> deleted file mode 100644
> index deba5f4096..0000000000
> --- a/package/zynq-boot-bin/zynq-boot-bin.mk
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -################################################################################
> -#
> -# zynq-boot-bin
> -#
> -################################################################################
> -
> -ZYNQ_BOOT_BIN_VERSION = 2015.1
> -ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
> -ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/xilinx-v$(ZYNQ_BOOT_BIN_VERSION)/tools
> -ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
> -
> -HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
> -
> -define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
> -	cp $(HOST_ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
> -endef
> -
> -define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
> -endef
> -
> -$(eval $(host-generic-package))
> diff --git a/support/scripts/zynq-boot-bin.py b/support/scripts/zynq-boot-bin.py
> new file mode 100755
> index 0000000000..f7fb18225d
> --- /dev/null
> +++ b/support/scripts/zynq-boot-bin.py
> @@ -0,0 +1,230 @@
> +#!/usr/bin/env python3
> +# -*- coding: utf-8 -*-
> +# Copyright (C) 2014, Xilinx.inc.
> +#
> +# Hack origin version and just take the part which generate boot.bin
> +# for U-BOOT SPL.
> +#
> +# Copyright (C) 2013, Elphel.inc.
> +# pre-u-boot configuration of the Xilinx Zynq(R) SoC
> +# This program is free software: you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation, either version 3 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +
> +__author__ = "Andrey Filippov"
> +__copyright__ = "Copyright 2013, Elphel, Inc."
> +__license__ = "GPL"
> +__version__ = "3.0+"
> +__maintainer__ = "Andrey Filippov"
> +__email__ = "andrey@elphel.com"
> +__status__ = "Development"
> +import os
> +import struct
> +import sys, getopt
> +from functools import reduce
> +
> +inputfile = ''
> +outputfile = ''
> +argv = sys.argv[1:]
> +try:
> +  opts, args = getopt.getopt(argv,"hu:o:",["uboot=","outfile="])
> +except getopt.GetoptError:
> +  print('test.py -u <inputfile> -o <outputfile>')
> +  sys.exit(2)
> +
> +if len(argv) == 0:
> +  print('test.py -u <inputfile> -o <outputfile>')
> +  sys.exit()
> +
> +for opt, arg in opts:
> +  if opt == '-h':
> +      print('test.py -u <inputfile> -o <outputfile>')
> +      sys.exit()
> +  elif opt in ("-u", "--uboot"):
> +      inputfile = arg
> +  elif opt in ("-o", "--outfile"):
> +      outputfile = arg
> +print('Input file is:', inputfile)
> +print('Output file is:', outputfile)
> +
> +exit
> +
> +ACCESSIBLE_REGISTERS=((0xe0001000,0xe0001fff), # UART1 controller registers
> +                      (0xe000d000,0xe000efff), # QUAD SPI controller registers
> +                      (0xe0100004,0xe0100057), # SDIO 0 controller registers
> +                      (0xe0100059,0xe0100fff), # SDIO 0 controller registers
> +                      (0xe000e000,0xe000efff), # SMC controller
> +                      (0xf8006000,0xf8006fff), # DDR controller
> +                      # SLCR_LOCK disables all (0xf8000000,0xf8000b74), but it is locked at reset seems to be unlocked, http://www.xilinx.com/support/answers/47570.html
> +                      #prohibited: SLCR_SCL, SLCR_LOCK, SLCR_UNLOCK, SLCR_STA
> +                      (0xf8000100,0xf80001b0), # SLCR registers
> +                      #DOes not seem to be any gap between 0xf80001b0 and 0xf80001b4
> +                      (0xf80001b4,0xf80001ff), # SLCR registers
> +                      #prohibited SLCR_PSS_RST_CTRL 0xf8000200
> +                      (0xf8000204,0xf8000234), # SLCR registers - is  SLCR_SMC_RST_CTRL 0xf8000234 also prohibited?
> +                      #prohibited? SLCR_OCM_RST_CTRL 0xf8000238 SLCR_FPGA_RST_CTRL 0xf8000240
> +                      (0xf800024c,0xf800024c), # SLCR registers SLCR_AWDT_CTRL - watchdog timer reset control
> +                      #prohibited SLSR_REBOOT_STATUS 0xf8000258, SLCR_BOOT_MODE 0xf800025c, SLCR_APU_CTRL 0xf8000300,
> +                      (0xf8000304,0xf8000834), # SLCR registers SLCR_AWDT_CLK_SEL,  DDR, MIO
> +                      #prohibited SLCR_LVL_SHFTR_ON 0xf8000900, SLCR_OCM_CFG 0xf8000910,
> +                      (0xf8000a00,0xf8000a8c), # SLCR registers All shown "reserved" ???
> +                      (0xf8000ab0,0xf8000b74)) # SLCR registers iostd, voltages,  - more DDR stuff
> +
> +def verify_register_accessible(address):
> +    for interval in ACCESSIBLE_REGISTERS:
> +        if (address >= interval[0]) and (address <= interval[1]):
> +            print('Register accessible:' , hex(interval[0]),'<=', hex(address), '<=', hex(interval[1]))
> +            return True
> +    else:
> +        return False
> +
> +def image_generator (image,
> +                       reg_sets, # registers,
> +                       options,
> +                       user_def,
> +                       ocm_offset,
> +                       ocm_len,
> +                       start_exec):
> +    reserved0044=0;
> +
> +    rfi_word=0xeafffffe #from actual image
> +    waddr=0
> +    for _ in range (0x20//4):
> +        image[waddr]=rfi_word # fill reserved for interrupts fields
> +        waddr+=1
> +    #width detection
> +    image[waddr]=0xaa995566 # offset 0x20
> +    waddr+=1
> +
> +    #image identification
> +    image[waddr]=0x584c4e58 # offset 0x24, XLNX
> +    waddr+=1
> +
> +    #encryption status
> +    image[waddr]=0x0 # offset 0x28, no encryption
> +    waddr+=1
> +
> +    #User defined word
> +    image[waddr]=user_def # offset 0x2c
> +    waddr+=1
> +
> +    #ocm_offset
> +    if ocm_offset<0x8c0:
> +        print('Start offset should be >= 0x8c0, specified', hex(ocm_offset))
> +        exit (ERROR_DEFS['HEAD'])
> +    elif (ocm_offset & 0x3f) != 0:
> +        print('Start offset should be 64-bytes aligned, specified', hex(ocm_offset))
> +        exit (ERROR_DEFS['HEAD'])
> +    image[waddr]=ocm_offset # offset 0x30
> +    waddr+=1
> +
> +    #ocm_len
> +    if ocm_len>0x30000:
> +        print('Loaded to the OCM image should fit into 3 mapped pages of OCM - 192K (0x30000), specified ',hex(ocm_len))
> +        exit (ERROR_DEFS['HEAD'])
> +    image[waddr]=ocm_len # offset 0x34
> +    waddr+=1
> +
> +    #reserved 0
> +    image[waddr]=0 # offset 0x38
> +    waddr+=1
> +
> +    #start_exec
> +    if (start_exec>0x30000) or (start_exec<0):
> +        print('Start address is relative to  OCM and should fit there - in 192K (0x30000), specified ',hex(start_exec))
> +        exit (ERROR_DEFS['HEAD'])
> +    image[waddr]=start_exec # offset 0x3c
> +    waddr+=1
> +
> +    #img_len == ocm_len for unsecure images
> +    img_len = ocm_len
> +    image[waddr]=img_len # offset 0x40
> +    waddr+=1
> +
> +    #reserved 0
> +    image[waddr]=reserved0044 #0  # offset 0x44
> +    waddr+=1
> +
> +    #calculate image checksum
> +    def add (x,y): return x+y
> +    checksum=(reduce(add,image[0x20//4:0x48//4]) ^ 0xffffffff) & 0xffffffff
> +    image[waddr]=checksum # offset 0x48
> +    waddr+=1
> +    print('After checksum waddr=',hex(waddr),' byte addr=',hex(4*waddr))
> +
> +
> +    #initialize registers
> +    print('Number of registers to initialize',len(reg_sets))
> +    if len (reg_sets)>256:
> +        print('Too many registers to initialize, only 256 allowed,',len(reg_sets),'> 256')
> +    waddr=0xa0//4
> +    # new_sets.append((addr,data,mask,self.module_name,register_name,self.defs[register_name]))
> +
> +    for register in reg_sets:
> +        op=register[0]
> +        addr=register[1]
> +        data=register[2]
> +        if (op != 's'):
> +            raise Exception ('Can not test registers (0x%08x) in RBL, it should be done in user code'%addr)
> +        if not verify_register_accessible (addr):
> +            print('Tried to set non-accessible register', hex(addr),' with data ', hex(data))
> +            exit (ERROR_DEFS['NONACCESSIBLE_REGISTER'])
> +        image[waddr]=addr
> +        waddr+=1
> +        image[waddr]=data
> +        waddr+=1
> +    #Fill in FFs for unused registers
> +    while waddr < (0x8c0//4):
> +        image[waddr]=0xffffffff
> +        waddr+=1
> +        image[waddr]=0
> +        waddr+=1
> +
> +if (inputfile):
> +    try:
> +        uboot_image_len=os.path.getsize(inputfile)
> +        print('Using %s to get image length - it is %i (0x%x) bytes'%(os.path.abspath(inputfile),uboot_image_len,uboot_image_len))
> +    except:
> +        print('Specified u-boot.bin file: %s (%s) not found'%(inputfile,os.path.abspath(inputfile)))
> +        sys.exit()
> +else:
> +    uboot_image_len=int(raw_options['CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH'],0)
> +    print('No u-boot.bin path specified, using provided CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH as image size of %i (0x%x) bytes for the RBL header'%(uboot_image_len,uboot_image_len))
> +
> +image =[ 0 for k in range (0x8c0//4)]
> +reg_sets=[]
> +num_rbl_regs=0
> +
> +raw_configs=""
> +raw_options={}
> +
> +
> +image_generator (image,
> +                 reg_sets[:num_rbl_regs], #
> +                 #registers,
> +                 raw_options,
> +                 0x1010000, # user_def
> +                 0x8c0, # ocm_offset,
> +                 uboot_image_len, #ocm_len,
> +                 0) #start_exec)
> +
> +if outputfile:
> +    print('Generating binary output ',os.path.abspath(outputfile))
> +    bf=open(outputfile,'wb')
> +    data=struct.pack('I' * len(image), *image)
> +    bf.write(data)
> +
> +    spl=open(inputfile,'rb')
> +    bf.write(spl.read())
> +
> +    bf.close()
> +    spl.close()
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
