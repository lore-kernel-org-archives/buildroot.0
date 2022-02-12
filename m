Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73A1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 674A140329;
	Sat, 12 Feb 2022 16:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fomLgjP6CgRa; Sat, 12 Feb 2022 16:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAF94038D;
	Sat, 12 Feb 2022 16:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7931BF34F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5922260A7B
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oke21-FOkuQK for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 16:52:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58A426068D
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 16:52:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9140:15a5:f29a:157f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 48B5019F59E;
 Sat, 12 Feb 2022 17:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644684737;
 bh=qHcaE1luAg3Ar+j/IY0+071aQ9GhX7JEKjZdrXODJH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jX5R2435MeFPw2SNSgGvpoHOdz7BYzHwRlHRnn1ZSa8utdCZ407DIqIl8XE4ToCka
 pscgp557sD3sq4XE4XedD8jycXV3sdH8ROO0CWmw4KvxGRfXWzW7emSDFEu7kKwLU6
 S/HARlr/1ajNxObjgiOJ4aEC7OXcohqakWY3cKfvNnh7SN6CMaDPQYT5Xn/xPVS1LI
 WP4Kyag8KAGEpq3q+n34NvEyBpxesf2T3XEDYBCCSld5ejZMf6YmveRxxd+W3LHJbf
 FIBABEUOvkPoKxjDglzcRKugvYUoGxELdzRzogiqenFoEVtfWhjpyHPPJIqcTIYpx7
 TkjPNO3Z9DYsQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Feb 2022 17:52:15 +0100
Date: Sat, 12 Feb 2022 17:52:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <20220212165215.GF3752867@scaer>
References: <20220211112245.1357817-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211112245.1357817-1-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libcamera bump to
 1966b9a58436fab51f8270aad6a228b935e4fac4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kieran, All,

On 2022-02-11 11:22 +0000, Kieran Bingham spake thusly:
> Update to the latest libcamera commit.
> 
> This incorporates fixes and improvements for Raspberry Pi which will be
> needed to go along side the new libcamera-apps package.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Applied to master, with the minor typo spotted by Peter fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index a7ca27a96b7f..8d5abf0e621c 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
> +sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 534d8d26371f..cf1af5aaf065 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
> +LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> -- 
> 2.32.0
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
