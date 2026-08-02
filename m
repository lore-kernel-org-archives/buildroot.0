Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2657CC55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3FB580C94;
	Sun,  2 Aug 2026 15:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJJ5KUjMlG2X; Sun,  2 Aug 2026 15:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E767E80C9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785684944;
	bh=Ae+uKxAgt793WpBVSer+VpSDMTzkgMBSJnyZSvlUIW4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k4sFkG+hDQcXZFl3os87mzZg3PbQ9fpkqgh7tI/hL1p2Vi1z4djKJGTLv/lSgG0I6
	 iwZtx0nhqqpZU++oDTPxDslIs+RuDoX1FYMHbNGnz/93nbGsstvEW0pVj+H8YMxl7u
	 SJTFioNgr6nkNV2eCyQo+muQkMwOJhx6p1IPH6ZUghI0Td2Ul05Vi8qWHhbqkky8AJ
	 K2GWCN/ExdU32CYwH4VnuqQC56zw6hDmAQbAq8nbzBOCSR3oWIXg8vRKR4F6ry8HNY
	 ofzoU/tonSz8jXkzcz+X9v5rFpIwIDCZ3/6VwH/2jONY4Z7TGO8yeiy8jqakImFOLV
	 EKXPRYqwI5spA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E767E80C9A;
	Sun,  2 Aug 2026 15:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE55313
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA22A80C9A
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9F_F6TqtAAZ for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6C2580C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C2580C94
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6C2580C94
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:35:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E0AE213F88E;
 Sun,  2 Aug 2026 17:35:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:35:37 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:35:37 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-3-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-3-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <37396fe33ac575b6419b32a159b0376b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785684939;
 bh=sZAaf4GomFeI7T2IPvILPBr+5mBsCB2cjhy3o3hU+dY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMwCJz6yu3suk4nHOHUO0StLjAFUExAtypGEkZz5H3YBUOSTuwf+pXcHN1YvLaVkg
 Ld8njOGYXzKP5eRbxc66EAd98wgGm12ggGW0TzFSWAH5AV6wnjWC+AeEZs46lEB+9k
 v719i+ljxhIDZyuUm+mbrr/HRRfgDNxqWt5vvHdyBMYFeYZVq0iDnFJDdzeVttAGjX
 uDfaiaEStgXz9IbMMlD80piTimMaSEL2K9ltbzc5DrQ9NlRyUPufp+udybjVnsfnem
 XMyNT9eHm8qacJtWnG+zhVVzsl6ToE9Yt70frLHaipo3L1P9AoFxJ2nmu431iWqrom
 qMIykgwWximKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SMwCJz6y
Subject: Re: [Buildroot] [PATCH v3 2/8] package/scdoc: new host package
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
[...]
> diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
> new file mode 100644
> index 000000000..80ee9ce76
> --- /dev/null
> +++ b/package/scdoc/scdoc.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# scdoc
> +#
> +################################################################################
> +
> +SCDOC_VERSION = 1.11.4
> +SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
> +SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
> +SCDOC_LICENSE = MIT
> +SCDOC_LICENSE_FILES = COPYING
> +
> +define HOST_SCDOC_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
> +endef
> +
> +define HOST_SCDOC_INSTALL_CMDS
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
