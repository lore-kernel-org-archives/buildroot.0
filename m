Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C21AD111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 12:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE66640A41;
	Sun, 30 Nov 2025 12:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBlIFLFMYaZs; Sun, 30 Nov 2025 12:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1AF40A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A1AF40A4B;
	Sun, 30 Nov 2025 12:02:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 266B7219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D59A40A41
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH-M01KdLA87 for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 12:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8160240A2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8160240A2C
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8160240A2C
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:02:20 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 89F364407ED;
 Sun, 30 Nov 2025 14:00:09 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251130115052.3005204-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 30 Nov 2025 12:50:52 +0100")
References: <20251130115052.3005204-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Sun, 30 Nov 2025 14:02:15 +0200
Message-ID: <87h5ubvid4.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1764504009;
 bh=rYJr69frjfas8Boq3V3HrmGfmRoPnctHJg7Uo7ifAgM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Diq2O80hfQLDh53/B3lYWNJyyN3tih8Ob2lvdDtrXhO5nnIxJRPHpcrD3pSHw3KQ6
 /oK87fgY/X7ezhf3IogoATNHOND7pZabQwVr8rcwvyjB6uMj9ifUBwRznpNdHcE+Ox
 5o1ANdYMFCVy0z8XlFaw5q8adFeMcChFEu360ydKToInfQmWCa9zGugW24akj0hFe1
 aObgj/jE+LiL9np37HpMZzadOFhHs8sJbAEoXuiLqCn+PfpxqM/tMSf6aKistNL1Oh
 dUzrDkr0N0vJ8YdoJR65WIWd1/Cf78qjOqE/ouLjrfJyBVaGLX5TDZNmKJlOBx1adu
 s5YTx5Hz/QycQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Diq2O80h
Subject: Re: [Buildroot] [PATCH 1/1] package/18xx-ti-utils: switch to git
 repo
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

Hi Bernd,

On Sun, Nov 30 2025, Bernd Kuhls wrote:
> Downloading the snapshot tarball has been unstable in the past so we
> switch to git for fetching the source code.
>
> Fixes:
> https://autobuild.buildroot.net/results/8b9/8b9b15e578ee13c47bdfe77f8bd79cd34c49de91/
> https://autobuild.buildroot.net/results/bfc/bfcfb6e5014e017334604ba8fdcfac2acc65d161/
> https://autobuild.buildroot.net/results/6c6/6c69077ea076c3c28d0e8599913cde31ee27b0c5/
> https://autobuild.buildroot.net/results/b43/b431fabedd709f660f556a7a6539a0b1e28aeb49/

The download error message is this:

wget -nd -t 3 --no-check-certificate -O '/home/thomas/autobuild/instance-0/output-1/build/.18xx-ti-utils-R8.8.tar.xz.50OaB7/output' 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot/18xx-ti-utils-R8.8.tar.xz' 
--2025-11-21 19:35:47--  https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot/18xx-ti-utils-R8.8.tar.xz
Resolving git.ti.com (git.ti.com)... 198.47.28.208
Connecting to git.ti.com (git.ti.com)|198.47.28.208|:443... failed: Connection timed out.

That is, HTTPS connection request fails. I can't see how git access over
the same HTTPS service would improve download stability.

The autobuilder reported a few download failures of that sort in
November 20-21. There is no download failure since then. So I guess that
was a transient network issue.

baruch

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/18xx-ti-utils/18xx-ti-utils.hash | 2 +-
>  package/18xx-ti-utils/18xx-ti-utils.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
> index 7ecca54b9b..116d05e8e9 100644
> --- a/package/18xx-ti-utils/18xx-ti-utils.hash
> +++ b/package/18xx-ti-utils/18xx-ti-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ce0185ba8a9bf456cc94a798bf66903775065e337e53ff812f18a6d88f5bac13  18xx-ti-utils-R8.8.tar.xz
> +sha256  33be3c90719bf36d5da76c6faaefb07bf3697635f81b86e28b92307d7825483e  18xx-ti-utils-R8.8-git4.tar.gz
>  sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
> index 5d45191cde..3e6f715730 100644
> --- a/package/18xx-ti-utils/18xx-ti-utils.mk
> +++ b/package/18xx-ti-utils/18xx-ti-utils.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -18XX_TI_UTILS_VERSION = 8.8
> -18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot
> -18XX_TI_UTILS_SOURCE = 18xx-ti-utils-R$(18XX_TI_UTILS_VERSION).tar.xz
> +18XX_TI_UTILS_VERSION = R8.8
> +18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
> +18XX_TI_UTILS_SITE_METHOD = git
>  18XX_TI_UTILS_DEPENDENCIES = libnl
>  18XX_TI_UTILS_LICENSE = BSD-3-Clause
>  18XX_TI_UTILS_LICENSE_FILES = COPYING

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
