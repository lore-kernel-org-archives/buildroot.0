Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3676D4920E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 05:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44981614EA;
	Tue, 19 Nov 2024 05:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1uGl20Z4WqY; Tue, 19 Nov 2024 05:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424DF61561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424DF61561;
	Tue, 19 Nov 2024 05:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 104ACDB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E267A4004A
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKBqP2G8EOhb for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 05:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAE21405A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE21405A8
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAE21405A8
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 05:42:52 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 6B822441018;
 Tue, 19 Nov 2024 07:39:10 +0200 (IST)
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241119015957.47737-1-vjardin@free.fr> (Vincent Jardin's
 message of "Tue, 19 Nov 2024 02:59:57 +0100")
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 19 Nov 2024 07:42:47 +0200
Message-ID: <874j43g4o8.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1731994750;
 bh=phIUVpGrSK+qz708Ym6b2LQ++uzOtMCLbRF13+WI1WQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UdtyyFMGg7owbiYNUxrAJ/SVnchJoeXCzSDIJtbT803QyR1equRS+3xaJqmYxLNAt
 Wn+LZVXa+mfUIyZJb/68CddDtfBDqzjHny5zRAho1GDIPudMLJZtBP1xZFO2JfPM4S
 erS+HQECuP2KDDbPty0+Vce9+Bp2HszcQjeePI90/oZdiV98FCLce8U4X5oQYr5ZuQ
 hspGDji8AGCiEnfJTJHSe2OnJaFM2f28I8PUlqzq3kP/A//JgMUjzfC8qs+dBwpbD3
 cK7HyBPZsEpLAosXBepMCep7RhpryPn5wo+0+xE12xz2y+LIRCm7sWNYxfZ6Hkq7yg
 dDjIYh297lBkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=UdtyyFMG
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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

Hi Vincent,

On Tue, Nov 19 2024, Vincent Jardin wrote:
> The libnss_ato module is a set of C library extensions which allows to
> map every nss request for unknown user to a single predefined user.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
> diff --git a/package/libnss-ato/Config.in b/package/libnss-ato/Config.in
> new file mode 100644
> index 0000000000..ca3b7413d9
> --- /dev/null
> +++ b/package/libnss-ato/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBNSS_ATO
> +	bool "libnss-ato"
> +	help
> +	  Library to map every nss request for unknown user to a
> +	  single predefined user.

I think this should depend on BR2_TOOLCHAIN_USES_GLIBC. Other C
libraries do not provide NSS functionality. It looks like this won't
even build without glibc headers.

baruch

> +
> +	  https://github.com/donapieppo/libnss-ato
> diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
> new file mode 100644
> index 0000000000..5e828f1be6
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
> +sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
> +sha256  87e17468eec71254e7848cb7c9dae5603ab376a719b05e2f5e69038ffed8beef  libnss-ato-4a29c8410cdac590a210dab2dec41d5f4b40d282.tar.gz
> diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
> new file mode 100644
> index 0000000000..46b8a7963b
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# libnss-ato
> +#
> +################################################################################
> +
> +LIBNSS_ATO_VERSION = 4a29c8410cdac590a210dab2dec41d5f4b40d282
> +LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,$(LIBNSS_ATO_VERSION))
> +LIBNSS_ATO_LICENSE = LGPL-3.0+
> +LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
> +
> +# Skip the default build system (no configure/Makefile to use)

I see Makefile here:

  https://github.com/donapieppo/libnss-ato/blob/master/Makefile

Doesn't this work for you?

baruch

> +define LIBNSS_ATO_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
> +		-Wl,-soname,libnss_ato.so.2 \
> +		$(@D)/libnss_ato.c
> +endef
> +
> +define LIBNSS_ATO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
> +	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
> +	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
> +endef
> +
> +$(eval $(generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
