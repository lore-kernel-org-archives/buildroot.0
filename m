Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1DCCA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008E383B5A;
	Fri, 22 Aug 2025 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_29VZhXnlOC; Fri, 22 Aug 2025 21:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 127DD83B1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 127DD83B1D;
	Fri, 22 Aug 2025 21:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C00742E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8129340BE3
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2tpNuj64oJX for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:08:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8154E40BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8154E40BE4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8154E40BE4
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:08:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D9FCA1A0D52
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A3988604AD;
 Fri, 22 Aug 2025 21:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A75321C22D4A8; 
 Fri, 22 Aug 2025 23:08:32 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:08:31 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822230831.078510ea@windsurf>
In-Reply-To: <20250820163921.1968030-2-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20250820163921.1968030-2-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755896914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6u1G02pAQpYPrzVIGuR2RVQLwHBkqq7Z/75Fks1V6IY=;
 b=acbjIqBdx7e+Bbyq1JT05xTwiH31NoeL67GRpdSqnF11azgxq6IE/UqgrLRz1z5WnTd2pM
 K0Kvt0eXI77VNb+Xxt27ELVxqqmEsrDscCRrw5Sat31cAcyIdplzW/KDw0zRPX2dGY1gcu
 TvHQqUNh7MIRGw/ScaC8U5D44JM/jeC7FwJF5gbNH2NCuElK74csqtCXTol7EdcI9QJmTt
 /oLRzPILZNL3wcZ+FM2FrYhfwGyLXX1L9vDgPuxENomlfeKTuPeOA2nn4HGRWFgyH2TjHY
 eCpdosC8r1J55YJWHzlOKUBNGH96eng3EqMkvXOBhWT7bDALp2SChzMSj/6m5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=acbjIqBd
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/qpdf: bump to version 12.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Angelo,

Thanks for this patch, which looks great. I have a few questions below.

On Wed, 20 Aug 2025 18:39:18 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
> index d479515789..2a4e7f3386 100644
> --- a/package/qpdf/qpdf.mk
> +++ b/package/qpdf/qpdf.mk
> @@ -4,36 +4,30 @@
>  #
>  ################################################################################
>  
> -QPDF_VERSION = 10.5.0
> -QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
> +QPDF_VERSION = 12.2.0
> +QPDF_SITE = https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
>  QPDF_INSTALL_STAGING = YES
>  QPDF_LICENSE = Apache-2.0 or Artistic-2.0
>  QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
>  QPDF_CPE_ID_VALID = YES
>  QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
> +QPDF_SUPPORTS_IN_SOURCE_BUILD = NO
>  
> -QPDF_CONF_OPTS = --with-random=/dev/urandom
> -
> -ifeq ($(BR2_USE_WCHAR),)
> -QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"

Are you confident that qpdf no builds properly in configurations with
BR2_USE_WCHAR disabled, without anything special?

> -endif
> +QPDF_CONF_OPTS = -DSKIP_OS_SECURE_RANDOM=ON \
> +	-DUSE_IMPLICIT_CRYPTO=OFF -DREQUIRE_CRYPTO_NATIVE=ON

What are these 3 options doing? -DSKIP_OS_SECURE_RANDOM=ON seems scary,
and the other ones would benefit from a bit of explanation so we
understand how it interacts with the options below to select crypto
support.

>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
> -QPDF_CONF_OPTS += --enable-crypto-gnutls
> +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=ON
>  QPDF_DEPENDENCIES += gnutls
>  else
> -QPDF_CONF_OPTS += --disable-crypto-gnutls
> +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -QPDF_CONF_OPTS += --enable-crypto-openssl
> +QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=ON
>  QPDF_DEPENDENCIES += openssl
>  else
> -QPDF_CONF_OPTS += --disable-crypto-openssl
> -endif
> -
> -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -QPDF_CONF_ENV += LIBS=-latomic

This is no longer needed? Did you test building with a SPARC toolchain
for example, which is known to be picky as all __atomic built-ins are
implemented in libatomic?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
