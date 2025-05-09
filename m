Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B5DC3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 04:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDA0F41514;
	Fri,  9 May 2025 04:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJCsFbSY00mM; Fri,  9 May 2025 04:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007DA41486
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007DA41486;
	Fri,  9 May 2025 04:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4468E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58BC83C72
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ihg9V-B-bGnV for <buildroot@buildroot.org>;
 Fri,  9 May 2025 04:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32B9683BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B9683BEC
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32B9683BEC
 for <buildroot@buildroot.org>; Fri,  9 May 2025 04:40:17 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id DE919440A92;
 Fri,  9 May 2025 07:40:01 +0300 (IDT)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250509041939.11656-1-kadambini.nema@gmail.com> (Kadambini
 Nema's message of "Thu, 8 May 2025 21:19:39 -0700")
References: <20250509041939.11656-1-kadambini.nema@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 09 May 2025 07:40:13 +0300
Message-ID: <87a57mxuqa.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1746765601;
 bh=ve2mvwg7ROBijsvgpAc23D+vGizKn6khh6VFhktdkN8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SDua/4F5Hj5kE/QcIN0R5wp3iGQ3aW1VNzYmsJ0EZrn0bB/BsARhPBS/sl7gODl18
 yY4WZe0MDiNkflwVCr9CBfptEc9kRltwArHqXfRa5U+xjpXeHlPlbSbj842g4EsJ+w
 /Er0n6UNBQCcL0nIGuBarTB0UfJ+QGdWy/7DWZ1OvDmAVALA5UAyU+jCoUsfLfD0Uw
 dJXMu0km5ePfKEaVTfZMpQUJehrvudDxVHDyJe7QvsqIe57LHhP779if5B9TdZDrWP
 BhwhIr2cTjrnKwhodCRdBHvsz6hmuneWMoqXJsdKm6rk6aerxjWaJZc9iYgCCE3i/j
 H+A3gMptzor9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=SDua/4F5
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump to
 version 2025.88
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kadambini Nema,

On Thu, May 08 2025, Kadambini Nema wrote:
> Fixes CVE-2025-47203.
> https://security-tracker.debian.org/tracker/CVE-2025-47203
>
> Release notes:
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.88
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.87

The 2025.87 release removed SHA-1 from the default build. See my comment
on Bernd's suggested 2025.87 bump patch:

  https://lore.kernel.org/all/874j02d3h7.fsf@tarshish/
  https://lore.kernel.org/all/20250309083216.824179-1-bernd@kuhls.net/

baruch

> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index cf2dd18d61..b18aca3aab 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
> +sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e043893aa1..c383212e76 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2024.86
> +DROPBEAR_VERSION = 2025.88
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
