Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C273C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 09:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 141E080F85;
	Fri, 21 Aug 2026 09:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr832MQgbXuj; Fri, 21 Aug 2026 09:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787305035;
	bh=c0qnJDJRGSBX2qm+y+vyFcV6C0jXlObiV+sXwXDSyQA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iYOP6wcgSlT+ITXiMjn1xp53yFWutgPF81P0eerwYLjTVwv7uzytDOQBcMcJuMROP
	 8BGv7YxGEic1JjBIp6ZzmxTdo5Fc+/rCtf8oi5Y1/9FjZdlTGjfuXcpF8z+meZWZLO
	 G5QjOik/NV8/NAoNA2J6wI4ssXC6lpbc7KQQB4+wJ9Fs8yYHxkYTePpXh4FLDe92Sg
	 6tNLfzBcAsOJw6czl7B1m6aVaV053jRJ0h59HKoF3HPLJnpNGihuAdGLhoA6feEa5C
	 BJ/WqaA9z5tueXrr6pjerMNpgSsJNBwkyz+Z0l0B1t9HwoSt7JeQuOt0nIsKikiTvl
	 MTWtaRzUuxVlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D07380FB3;
	Fri, 21 Aug 2026 09:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6187BEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 471E7810A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXGlZKyQLIDU for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 09:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47D9380F1B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:37:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 402984E41307
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 09:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE542604AA;
 Fri, 21 Aug 2026 09:37:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5B2D11C76D0D; 
 Fri, 21 Aug 2026 11:37:04 +0200 (CEST)
Date: Fri, 21 Aug 2026 11:37:04 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aogba9rQ9QphwNrW@windsurf>
References: <20260821-qt5_allow_other_openssl_implementations-v1-1-be1438707393@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821-qt5_allow_other_openssl_implementations-v1-1-be1438707393@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qt5: relax openssl constraint to
 allow compatible implementations
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, Aug 21, 2026 at 10:58:59AM +0200, Alexis Lothor=E9 wrote:
> Qt5 can be built with or without openssl support. Following some build
> failures, commit a94d39d693d8 ("package/qt5: fix build failure due to
> libressl use") enforced libopenssl as the only valid implementation for
> Qt5 openssl support.
> =

> While this solution is fine to filter between the two openssl variants
> officially supported by Buildroot, it prevents users bringing their own
> OpenSSL implementations (through the "provides" mechanism) from building
> Qt5, even if the custom implementation matches the OpenSSL API.
> =

> Allow compatible external implementations to be provided for Qt5 openssl
> support. Relax the constraint by partially reverting a94d39d693d8 and
> checking that the selected openssl implementation isn't libressl. It
> then becomes up to users to ensure that the implementation they are
> providing is fully compatible with the libopenssl one. Some qt5
> sub-packages enforce BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, they don't
> need update as it does not really strictly select libopenssl, it rather
> prevents libressl, so it still allows custom providers.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Thanks for the good commit message.

> -QT5BASE_CONFIGURE_OPTS +=3D $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-=
openssl)
> -QT5BASE_DEPENDENCIES   +=3D $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
> +# Qt5 officially only supports OpenSSL. Users can also provide their own
> +# OpenSSL variant through the "provides" mechanism, but it is then up to

The mechanism is not really "provides", but rather "virtual package"
(probably to be fixed in your commit message as well)

> +# them to ensure that the provided API is exactly compatible with the
> +# libopenssl one
> +QT5BASE_CONFIGURE_OPTS +=3D $(if $(BR2_PACKAGE_OPENSSL),$(if $(BR2_PACKA=
GE_LIBRESSL),-no-openssl,-openssl),-no-openssl)
> +QT5BASE_DEPENDENCIES   +=3D $(if $(BR2_PACKAGE_OPENSSL),$(if $(BR2_PACKA=
GE_LIBRESSL),,openssl))

I don't really like how it's written because my brain has to put all
CPUs at max frequency to process how this works.

What about:

# Qt5 officially only supports OpenSSL, and doesn't build/work with
# LibreSSL. We want to allow any OpenSSL provider (which can be
# libopenssl or another provider), except libressl.
ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_PACKAGE_LIBRESSL),y:)
QT5BASE_CONFIGURE_OPTS +=3D -openssl
QT5BASE_DEPENDENCIES +=3D openssl
else
QT5BASE_CONFIGURE_OPTS +=3D -no-openssl
endif

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
