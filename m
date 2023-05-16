Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A2FC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 049B840B72;
	Tue, 16 May 2023 04:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 049B840B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzycbuJxm1_z; Tue, 16 May 2023 04:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35CDC401E1;
	Tue, 16 May 2023 04:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CDC401E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5558F1BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C2A5401E1
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C2A5401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6P1RxRGfhtQo for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:21:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 991B340195
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 991B340195
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:21:35 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 1C2A4440F55;
 Tue, 16 May 2023 07:21:21 +0300 (IDT)
References: <20230516041533.22408-1-neal.frager@amd.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Neal Frager <neal.frager@amd.com>
Date: Tue, 16 May 2023 07:20:32 +0300
In-reply-to: <20230516041533.22408-1-neal.frager@amd.com>
Message-ID: <878rdoc3ec.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1684210881;
 bh=250gn3VCkflNfBNJggmv3QUsOW7BK7j48i1V+0zS1u4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=GMzM3+AorIp3ZMeEJfF+cFLwgVUoJvE0yRrVVTMoOjxbFgToNY/H6/CipIMmjlaMH
 3/tuSj2sPEmI7ezRr58PPj7AvP2PKhMeTihkKby33GjbZ7ODQuCkKUI0OJIHuO+CI+
 I1VPQR1OQ5T82LjxZYsVA3TtQg8+IBd9pud5mK/2z+nc+t/ED99Qfo5B38QHI/eBBg
 R5u4R5paBx3v3TTMoknZCN4GTTnfrw4Df0dr9sRIaY/hQW16RFZaBc0X1qVYm9Y8rr
 jl6tBg6TPBfgPTBMsVNivYNe8SFh2TUaw8gb/oMECZoJgcAuMM1VtCBFRENiZMV3bV
 QV+gIDw100G6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=GMzM3+Ao
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2023.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, May 16 2023, Neal Frager via buildroot wrote:

> This patch bumps bootgen to version xilinx_v2023.1.
> The patch for build machines with modern flex is no longer needed.

This patch does not remove
0001-Fix-build-on-machines-with-modern-flex.patch.

baruch

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/bootgen/bootgen.hash | 2 +-
>  package/bootgen/bootgen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
> index 5d77c164f3..937509c859 100644
> --- a/package/bootgen/bootgen.hash
> +++ b/package/bootgen/bootgen.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
> +sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
>  sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
> diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
> index 88bc73b604..d83980d925 100644
> --- a/package/bootgen/bootgen.mk
> +++ b/package/bootgen/bootgen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOOTGEN_VERSION = xilinx_v2022.2
> +BOOTGEN_VERSION = xilinx_v2023.1
>  BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
>  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
>  BOOTGEN_LICENSE = Apache-2.0


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
