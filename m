Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B267C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 18:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D582A40213;
	Tue, 30 Apr 2024 18:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHGgt7Lh2QQ7; Tue, 30 Apr 2024 18:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805244021F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805244021F;
	Tue, 30 Apr 2024 18:57:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF741BF29A
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C9081FB0
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BcWudXhil3L for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 18:57:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7991E80F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7991E80F00
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7991E80F00
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 18:57:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5021A13F8AE;
 Tue, 30 Apr 2024 20:57:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 20:57:22 +0200
Date: Tue, 30 Apr 2024 20:57:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjE_EpaDRfqJ0BRO@landeda>
References: <20240427161256.71818-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427161256.71818-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714503445;
 bh=nXfO8WkJf+6HkB8B56MYtMCFUrJqHLw9TS8tYvrrc8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IY2ywRI23LzWzzk5+iB8iyorg+c70oI9iy3FB91TLNmVF0HWyK9EM5DVa4ocvZA3j
 oCrtINUoJVoxr8K04wBMzTnZkdoHfpoOPZx1B2BuglO1e5CaKJe5on9n0Y9yfpxrF1
 f5HBO9nRYR0FzxI1YY3HO8cQF4eTZbpMlQoL02yoGIncOwb4yz0nRAoaH3T+Z/5NGt
 f2gVJZLm13BgqDeQ1aVFcuTD6yUA+vbf5W32UxfcXzzr5EpEGv77gA3Ko4jtAqDnN6
 65RwPubnBl+Hc5nD4VBsUNRwdch8iTuqDaZCf390byPwuJJrwD6P5ahv2PcYsU3EFc
 XDXmuS2QHRWqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IY2ywRI2
Subject: Re: [Buildroot] [PATCH 1/1] package/libsrtp: bump to version 2.6.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Fabrice, All,
On 2024-04-27 18:12 +0200, Fabrice Fontaine spake thusly:
> https://github.com/cisco/libsrtp/releases/tag/v2.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libsrtp/libsrtp.hash | 2 +-
>  package/libsrtp/libsrtp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
> index f95dc2e7b0..95daf0d792 100644
> --- a/package/libsrtp/libsrtp.hash
> +++ b/package/libsrtp/libsrtp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  8a43ef8e9ae2b665292591af62aa1a4ae41e468b6d98d8258f91478735da4e09  libsrtp-2.5.0.tar.gz
> +sha256  bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b  libsrtp-2.6.0.tar.gz
>  sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
> diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
> index 0ffdd98283..269c1ae3f8 100644
> --- a/package/libsrtp/libsrtp.mk
> +++ b/package/libsrtp/libsrtp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSRTP_VERSION = 2.5.0
> +LIBSRTP_VERSION = 2.6.0
>  LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
>  LIBSRTP_INSTALL_STAGING = YES
>  LIBSRTP_LICENSE = BSD-3-Clause
> -- 
> 2.43.0
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
