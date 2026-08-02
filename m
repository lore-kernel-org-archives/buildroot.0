Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0005BC55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB924061D;
	Sun,  2 Aug 2026 15:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVHNkWgoamDk; Sun,  2 Aug 2026 15:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23C0405C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785684869;
	bh=FTjmllAjWIhC9byVUlzSr1ffGDfASXX4SbvDdrWVnVE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QID2xpURXK3U+f4Un35HblbjRZ3ekaEAoLJIGmF8RI8amOLia8Y9GyQxMxeMOnj/1
	 jUyMb0xPYRsENoYYm4U5kjHjyeYrU92TmrF4hNIZ/v/z9uaLwqDVRGGPFYHsI7i/ow
	 /V9zhU099W4VLS0VTnDevuJ56B8BVDXeEhKGE95NvoTKbREnSAEIEM+j2vZ3Sd8gkt
	 dXo8f4MBSrMObfGFT3ry3CJuz9iDPxZMYjZMsQ/FLjBysDBMFZAbO2llVd8l3C4oCC
	 wyUyg7FDxvNb8SGnKXMUdADwZDOrEhPWW0/4ajnaYi8PF2Ekp8deH6iOcz2YsJpFNY
	 OlrPg+1ATiVVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23C0405C5;
	Sun,  2 Aug 2026 15:34:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD63FE3
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CC8A80994
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sin-a8zZXa3J for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FC9180970
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC9180970
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FC9180970
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:34:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 437D719F57E;
 Sun,  2 Aug 2026 17:34:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:34:23 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:34:23 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-2-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-2-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <99cacf73d36b6773a390e5b62b2cdf99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785684864;
 bh=yABJgSAIqnbhHm7t9NC1dh3lrHOwkkeus8yRylZNJao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gy+4AfRom+5Wm9rh29apGx2SS/kj6RPdq9zDA2TVSBQE4DH+mSKFUhJkzBEYQY9dA
 VHFelfSDFZSrWiK94xnHEq+tOXMTUpX8OQml7T98tnXm+6ljy/Jz3+TnRQnCpeUTwp
 OussVZafo37sBOR0xhDNX6bgPofrKsI/9Vo6kxh7KHOcViFxdOc7Wgk4LJI/M3bKsb
 qqMoNBjvlHQ/g8TyW+OaG6ajJF8BDlqR4N2XcxekrHP5kAlJxXbdbuCKOk9vWIHI5r
 2/T2F9bZRY9FRK4VDuB7UHZZKD+CJjaXcRB8WJ/rTwQ4pH2vNTELAkDZKRjo+LXg2u
 EgCGHtS9ZuL+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gy+4AfRo
Subject: Re: [Buildroot] [PATCH v3 1/8] package/qbe: new host package
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

Hi Francois,

On 21/07/2026 11:39, Francois Perrad wrote:
> dependency for host-hare
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
>  DEVELOPERS           |  1 +
>  package/qbe/qbe.hash |  5 +++++
>  package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/qbe/qbe.hash
>  create mode 100644 package/qbe/qbe.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3530d515a..23c95db6f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1177,6 +1177,7 @@ F:	package/coxpcall/
>  F:	package/dado/
>  F:	package/ficl/
>  F:	package/janet/
> +F:	package/qbe/
>  F:	package/libtomcrypt/
>  F:	package/libtommath/
>  F:	package/linenoise/
> diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
> new file mode 100644
> index 000000000..2250c493a
> --- /dev/null
> +++ b/package/qbe/qbe.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: https://c9x.me/compile/releases.html
> +sha256  
> a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  
> qbe-1.2.tar.xz
> +
> +# Locally computed
> +sha256  
> 2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  
> LICENSE
> diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
> new file mode 100644
> index 000000000..a6e3e4d57
> --- /dev/null
> +++ b/package/qbe/qbe.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# qbe
> +#
> +################################################################################
> +
> +QBE_VERSION = 1.2
> +QBE_SITE = https://c9x.me/compile/release
> +QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
> +QBE_LICENSE = MIT
> +QBE_LICENSE_FILES = LICENSE
> +
> +define HOST_QBE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_QBE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR="$(HOST_DIR)" install

Buildroot decided a long time ago to avoid installing
files in "$(HOST_DIR)/usr/". So the previous line should
be changed to:

	PREFIX=/ DESTDIR="$(HOST_DIR)" install

> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.43.0

Could you send and updated series addressing this, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
