Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CEF60806;
	Sat,  5 Feb 2022 22:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvIccT3Szda5; Sat,  5 Feb 2022 22:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B20F26079D;
	Sat,  5 Feb 2022 22:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5A061BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D2B40593
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30QfSR3zVf9v for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE534010E
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:50:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id s21so2451279ejx.12
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=08mPhtnkm6XMN5rVpyuW8MuS2ip5bPCRjvx4KPRY7nM=;
 b=K6zr5NanDZzftiWcYnmNKtnu3ntWPKmh5PVIJFV3sOTcFBmsJGd5TDxuo2YX+XJhC6
 c/haLJVCxXuN1+MvRAOCRhgkcYzazhtYTb2Xa771GN6TCIRTAQNcvKbXfB9zYkEshpSA
 u8oZLfn47M/vgu+2Goh4A8cAML7ZJE1YrkVKlnyJtjUk1DT1TWNUqYgya8Cyi+uU5TN3
 2U+zCIXu6sYM8Hz8lSZo1d2o3HDfaeWsnP4LP9XlhNgy/9rH29MdNVAKYOHt10F33zST
 3UAKll1QJdAK7DzdvNqgFouwYW/fbZoYTEL/cX5sYfKV1eu1YPt/N6pCyitc9lPccxxm
 ti7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=08mPhtnkm6XMN5rVpyuW8MuS2ip5bPCRjvx4KPRY7nM=;
 b=DS9sd6Ufvlt/RTuP9aWpPgQxnonkNZLtnBbafBK3dE5HbTsvhsPS9bGGHoCMXDqIAO
 Yk6qPkkIxxkGc45PBOo1ozJl1houA688i2WyDklKdnf2JtVlOOzY5welTXKmeS+fJknJ
 r1qHOvMKEAQ9b9n9CeABKyTWXo1X8EnO9a2LUlg5zARZ77H0rsylc4nkqFMIpgRpR3ly
 T1YdcZ4m2+e7cJSjZ/ceeQsi+E6Hd5Uw9JB779fVZwdM+RcLoZptzU8A8HnM44/WRLiY
 oUV3qHVOPj5uZvc/Mc1sfLHMszWiShfabXT7DI3HuNFANFsu1heWgbXgcUcXPMJ4ExL1
 MZ6g==
X-Gm-Message-State: AOAM530rKjQG4KEaItHheo8OHdlCzFSeGvyObTWrNLtup/t21j/Rr7sj
 TUdsaOiy0UWKnoRimI/UeV6C9Q==
X-Google-Smtp-Source: ABdhPJxc1XUvtm7kU0J0NnV/DHxPRcH7Nh6czjsMK430lOl5FV1VtKsHFsVz3OxHwDCMthCkMkg+rQ==
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr4561295ejc.767.1644101424868; 
 Sat, 05 Feb 2022 14:50:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w6sm2758085edd.50.2022.02.05.14.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:50:24 -0800 (PST)
Message-ID: <ccccd521-07d0-0f69-6548-42f5949a9b97@mind.be>
Date: Sat, 5 Feb 2022 23:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220124092612.4019025-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124092612.4019025-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.34.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/01/2022 10:26, James Hilliard wrote:
> CONTRIBUTING.md hash changed due to various style updates and
> additions.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/network-manager/network-manager.hash | 6 +++---
>   package/network-manager/network-manager.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index b007a6e88e..d25f0e8194 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,6 +1,6 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.12.sha256sum
> -sha256  a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b  NetworkManager-1.32.12.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
> +sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> -sha256  e70c2d84a038b972beff16d8662f35567709dff2d552220bd1af6014f6d2215d  CONTRIBUTING.md
> +sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 974320fce0..a90228992c 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -NETWORK_MANAGER_VERSION_MAJOR = 1.32
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
> +NETWORK_MANAGER_VERSION_MAJOR = 1.34
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
