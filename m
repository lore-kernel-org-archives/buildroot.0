Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D2D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38C28440B;
	Thu, 27 Nov 2025 19:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmRIgtrK0xi6; Thu, 27 Nov 2025 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3046843F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3046843F6;
	Thu, 27 Nov 2025 19:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E032A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2209460A58
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23ebqdysDGpV for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C4FB608BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C4FB608BE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C4FB608BE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:49:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45794B979CE5; Thu, 27 Nov 2025 20:48:58 +0100 (CET)
Message-ID: <5fb900a7-8409-438c-9f57-fad8eae2492a@rnout.be>
Date: Thu, 27 Nov 2025 20:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251112184357.3358550-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251112184357.3358550-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764272938; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CyElvtaHAC+LYJltVZAUxoEoLHH7RTBvJMyjL4+EvHE=;
 b=fndB2cZNeQG+RfL8v5usqodgEBGbxHmGDDiNNkbYyufAbVr5hBmsOvs9SHilE3qpVIWaxX
 p8eOLZbbpp0cylxxJgUCWUTN7UhZ3lEpr30EiDQPt8jVc7OJaKqM3KaLWgvJk/yHcnj7vy
 cMrmIoCsYG9rD7sKrZIrONwFdRMgBm6OXARcoxn3qIMdFPKUR2YEyLLJgZQyo8Iefgm7KN
 nyZZlx4ZuMqqucZzEvfYRHS5mxKJSkHEGWzBfsueSmpntEMMUBKeMVqnnuJyCoKEnbG/V4
 RuQuStl/vQVgTA/HnkEZ4lk0EjM0oR2wWV1x5Va1UzWyYHzks8mVI+xdq99z0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fndB2cZN
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.20
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2025 19:43, Bernd Kuhls wrote:
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-20/20781
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/tor/tor.hash | 4 ++--
>   package/tor/tor.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index ca2d49fb19..bf88d14578 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.19.tar.gz.sha256sum
> -sha256  3cb649a1d33ba6a65f109d224534e93aaf0a6de84a5b1cb4b054bfa06bb74f5a  tor-0.4.8.19.tar.gz
> +# From https://dist.torproject.org/tor-0.4.8.20.tar.gz.sha256sum
> +sha256  1bb22328cdd1ee948647bfced571efa78c12fc5064187b41d5254085b5282fa7  tor-0.4.8.20.tar.gz
>   # Locally computed
>   sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 208e71ae51..513cac9f0f 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TOR_VERSION = 0.4.8.19
> +TOR_VERSION = 0.4.8.20
>   TOR_SITE = https://dist.torproject.org
>   TOR_LICENSE = BSD-3-Clause
>   TOR_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
