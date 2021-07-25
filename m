Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFAAC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:06:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517F260F38
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 517F260F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08CC340203;
	Sun, 25 Jul 2021 16:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaQRs1M699QV; Sun, 25 Jul 2021 16:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CAB2401D2;
	Sun, 25 Jul 2021 16:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C28C81BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0CFB40368
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJhWEBOO2Vrz for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:06:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE3540364
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 16:06:49 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 16PG6kKC010970
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Jul 2021 18:06:47 +0200
Date: Sun, 25 Jul 2021 18:05:33 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210725180533.46734897@x230_1.trabucayre.com>
In-Reply-To: <20210725160833.4d86c502@windsurf>
References: <1626872348-69423-1-git-send-email-gwenj@trabucayre.com>
 <20210725160833.4d86c502@windsurf>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v3] board: Add support for terasic DE10 Nano
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, all,

On Sun, 25 Jul 2021 16:08:33 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Wed, 21 Jul 2021 14:59:08 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Terasic DE10 Nano is an SoCFPGA cycloneV based board.
> > References:
> > - https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=1046
> > - https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard
> > 
> > Note: there is no dts in kernel (mainline or intel), but since DE0 Nano Soc is
> > similar, the corresponding dts is usually used
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>  
> 
> Thanks for the patch. It looks mostly good, expect for a few details,
> see below.
> 
> > diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
> > new file mode 100644
> > index 0000000000..3261c62741
> > --- /dev/null
> > +++ b/board/terasic/de10nano_cyclone5/genimage.cfg
> > @@ -0,0 +1,57 @@
> > +image boot.vfat {
> > +	vfat {
> > +		file zImage {
> > +            image = "zImage"
> > +        }  
> 
> Starting from here the indentation is not correct.
Oups... -> fixed in v4
> 
> > +
> > +        file socfpga_cyclone5_de0_nano_soc.dtb {
> > +            image = "socfpga_cyclone5_de0_nano_soc.dtb"
> > +        }
> > +
> > +        file barebox.bin {
> > +            image = "barebox-socfpga-de10_nano.img"
> > +        }
> > +
> > +        file barebox.env {
> > +            image = "barebox-env"
> > +        }
> > +	}
> > +	size = 8M  
> 
> Could you fix the indentation in this block ?
> 
> > +}
> > +
> > +image boot.img {
> > +	hdimage {
> > +		partition-table = "no"
> > +	}
> > +
> > +	partition spl {
> > +		in-partition-table = "no"
> > +		image = "barebox-socfpga-de10_nano-xload.img"
> > +		offset = 0
> > +		size = 64k
> > +	}
> > +
> > +	size = 1M
> > +}  
> 
> I don't understand why you have a boot.img, which apparently only
> contains the raw contacts of this xload.img file. Why not use this
> xload.img file directly...
> 
In fact unlike some others CPU, this is not a raw area but a real partition
with type 0xA2. This genimage is based on socrate board wich use the same way.
> > +
> > +image sdcard.img {
> > +	hdimage {
> > +	}
> > +
> > +	partition spl {
> > +		partition-type = 0xa2
> > +		image = "boot.img"  
> 
> .. here ?
> 
> Example from another genimage.cfg:
> 
>         partition spl {
>                 in-partition-table = "no"
>                 image = "sunxi-spl.bin"
>                 offset = 8192
>         }
> 
>         partition u-boot {
>                 in-partition-table = "no"
>                 image = "u-boot.itb"
>                 offset = 40K
>                 size = 1M # 1MB - 40K
>         }
> 
> > +	partition rootfs {
> > +		partition-type = 0x83
> > +		image = "rootfs.ext2"
> > +		size = 500M  
> 
> I'd suggest to not put a size here, and instead tweak the size of the
> ext2 filesystem in the defconfig. Indeed, having a larger partition but
> not a larger filesystem is kind of useless (or requires a resize of the
> filesystem when booting).
>
Done for v4
> 
> > diff --git a/configs/terasic_de10nano_cyclone5_defconfig b/configs/terasic_de10nano_cyclone5_defconfig
> > new file mode 100644
> > index 0000000000..4a356f31a8
> > --- /dev/null
> > +++ b/configs/terasic_de10nano_cyclone5_defconfig
> > @@ -0,0 +1,28 @@
> > +BR2_arm=y
> > +BR2_cortex_a9=y
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_ENABLE_VFP=y
> > +BR2_ARM_FPU_NEON=y
> > +BR2_KERNEL_HEADERS_5_11=y  
> 
> Could you use:
> 
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
> 
> instead ?
Done for v4
> 
> Could you adjust those small details and send a v4?
> 
> Thanks a lot!
> 
> Thomas

Thanks
Gwen
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
