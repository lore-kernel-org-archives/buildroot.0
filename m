Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACCCC54E65
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D87C613C7;
	Thu, 22 May 2025 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJj-7Sai1rIb; Thu, 22 May 2025 20:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A794D61390
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A794D61390;
	Thu, 22 May 2025 20:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A12BC
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3388E813B5
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlTaDWLSom8u for <buildroot@buildroot.org>;
 Thu, 22 May 2025 20:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B1A380FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1A380FF5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B1A380FF5
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:41:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E5240B00539;
 Thu, 22 May 2025 22:41:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 May 2025 22:41:20 +0200
MIME-Version: 1.0
Date: Thu, 22 May 2025 22:41:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
References: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <339ce3be0a9df37991aaa4daca9a75d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747946483;
 bh=7O0AVgqF0bnz7rIfC6m4OA91Ys1BgMY3YWl740QjSD0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RJTNHkm05d6vdnG3ZrSkW1yPeGOEGzLmHKM/0zoR1yo1In7T4IxF5qaG2FolSk11d
 avoU6vmgplSTQHyCszzJJk18DxQfS63wp+VDNHovpXQQT+ISp5AR3lx2zYaPSOBO/9
 I/vTUAsT11rXVxnAERY+AbEzJNJTPsh+kW5/O1HXxFFMo+bJmTGU6J1R28z95IfpQO
 PVaBMzUBrYrYVkeZtWMgAWlsivTuxhfGeuoUSki/D/DOzkEwfl3kRVGyAuJCKv9S0y
 J5wekW4e4exbizgg64qq5INfjbtmN7xW/6/UbYEvOyIESr+A4dXAV1YQa1j8YrqQH9
 mR3lN67X0iM5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RJTNHkm0
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 1.0.4.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thanks for the patch.

Unfortunately, I was not able to download the archive with this patch.
See below.

On 22/05/2025 00:45, Giulio Benetti wrote:
> Esp-hosted project released a new tarball after almost 3 years where 
> they
> only committed patches to git repository. They also defined a template 
> for
> releases[1]
> 
> Release notes:
> https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-v1.0.4.0.0
> 
> [1]: 
> https://github.com/espressif/esp-hosted/commit/ced8383c2b8d44b0d15e04dbb424d5a51e7f468c#diff-2e8cb17d6e84161bc5a232fbdf4c0b8893c4330f185c66c564e33ced6ffc864f
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/esp-hosted/esp-hosted.hash | 2 +-
>  package/esp-hosted/esp-hosted.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/esp-hosted/esp-hosted.hash 
> b/package/esp-hosted/esp-hosted.hash
> index 8de3c00190..8b0b3e5f90 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  
> esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
> +sha256  
> 1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  
> ng-v1.0.4.0.0.tar.gz
>  sha256  
> ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  
> LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk 
> b/package/esp-hosted/esp-hosted.mk
> index 4c249eec46..4d0224bb95 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,8 +4,9 @@
>  #
>  
> ################################################################################
> 
> -ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
> -ESP_HOSTED_SITE = $(call 
> github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
> +ESP_HOSTED_VERSION = 1.0.4.0.0
> +ESP_HOSTED_SITE = $(call 
> github,espressif,esp-hosted,ng-v$(ESP_HOSTED_VERSION))

Trying to download the archive with the "make esp-hosted-source" fails
with 404 not found errors.

This is because the tag name is "release/ng-v1.0.4.0.0" and not just
"ng-v1.0.4.0.0". I believe, _SITE should then be:

ESP_HOSTED_SITE = $(call 
github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))

Could you check and test on your side and send an updated patch please?

> +ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
>  ESP_HOSTED_DEPENDENCIES = linux
>  ESP_HOSTED_LICENSE = GPL-2.0
>  ESP_HOSTED_LICENSE_FILE = LICENSE
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
