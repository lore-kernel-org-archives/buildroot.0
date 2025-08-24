Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED7ECA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EF241CBD;
	Sun, 24 Aug 2025 20:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aITYTj8s3K5C; Sun, 24 Aug 2025 20:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F00CC41CC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00CC41CC3;
	Sun, 24 Aug 2025 20:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7687F19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6874561ABC
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY08pFwCsvhS for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 20:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4428161ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4428161ABB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4428161ABB
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:05:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E6E1F2003CA;
 Sun, 24 Aug 2025 22:05:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 22:05:19 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 22:05:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250823143807.3148002-1-bernd@kuhls.net>
References: <20250823143807.3148002-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e0b4d4716b9bea2b2b0ab8f7d03b4f6b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756065922;
 bh=sNCn6+gD5PkRvZTeUWw1tZDv5Lk8g8gXOegaysxDM3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QyC0X9MeQ/7THlhd5r3haKXRA9QW0OLEmWBAxYBdl9ZqRk7a38xPggqqkMrtDx0DW
 xA7rIO+nWlVAsLX6dPnS/ZRLtcquhkXvrSrltHD5oH6wD7WxExC8oyeAwVC3/gicIn
 812cmOBKohnHR54a6A8CqdzvVH6PCxh+3aUbIUu2zFDTgHcgtzonGzfZBWI+3Yw8zk
 HDxJbxG9gKP5xH359cnnFGM4fyZM8B8IrNK/oUgg/Krg1Jvvn9MZM4fXwKYFY5E12d
 U+6p07C9/Oc7gae9ZdJOfpLN+t/qqV4qpDXaq4hRfHY93velzTRjRD+wmUsHBUW39N
 foTBuBu1iPZCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QyC0X9Me
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 23/08/2025 16:38, Bernd Kuhls wrote:
> Changelog:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=01cd1ba06fa6570f34e41fd8374f543c7e181604;hb=01d3f764f79b2f571174a4cec855e651258f20ec

Looking at the commit log of this version at [1], I see
that this bump includes two commits [2] and [3] fixing
the CVE-2023-6602 security issue [4].

Could you send an updated patch marking it as a "security bump"
and including those references, please?

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index 50498a6ba9..99c3da5e74 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> f0b2b07c7014b7aa8c4689095b83a49a85d41887049fc5302543aec0bef7d066  
> ffmpeg-n6.1.2-27-ge16ff06adb-git4.tar.gz
> +sha256  
> bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  
> ffmpeg-6.1.3.tar.xz
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING.GPLv2
>  sha256  
> b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  
> COPYING.LGPLv2.1
>  sha256  
> cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  
> LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 2d65623926..d7fce41369 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,12 +4,10 @@
>  #
>  
> ################################################################################
> 
> -# Update FFMPEG_CPE_ID_VERSION if needed
> -FFMPEG_VERSION = n6.1.2-27-ge16ff06adb
> -FFMPEG_SITE = https://git.ffmpeg.org/ffmpeg.git
> -FFMPEG_SITE_METHOD = git
> +FFMPEG_VERSION = 6.1.3
> +FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
> +FFMPEG_SITE = https://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> -FFMPEG_CPE_ID_VERSION = 6.1.2
> 
>  FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
>  FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
> --
> 2.47.2

Best regards,

Julien.

[1] https://git.videolan.org/?p=ffmpeg.git;a=shortlog;h=refs/tags/n6.1.3
[2] 
https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=ceacc83011a0a5057769626faf14b9256bd3baa7
[3] 
https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=c599745377199fa75fffb30058fb2a6f39d64ab7
[4] https://www.cve.org/CVERecord?id=CVE-2023-6602
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
