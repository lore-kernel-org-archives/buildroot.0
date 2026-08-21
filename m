Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C9C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D51A80F01;
	Fri, 21 Aug 2026 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjiqFeDSheSS; Fri, 21 Aug 2026 20:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787343530;
	bh=S35GbJD39SIViBY8d+WQgoOB8gxPDNaQs8BZH6Zd/Cw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mfGkufx38riGoB8hqFWqGltU2l/5yRiskDJBcHr2gtrwSj0ueEijH5+4SZOgQh464
	 bkiD0PxKrp5rOWLe7iVEHMlRXGJAobZh46yZnhtYL/6iJdIARlV6I7cJUnaGSBehZL
	 bEcA1FmYp6rJ4sdXGN1fJPH7ZY5xVvLWKX5zM88aCBbTRZCLQdZDT9GaqhI1pCkTA6
	 zRFMzDUrTS4wauybIfNFyL0SHRciWttzFlvYE1ELWKtTv8dCyLcKGQzjDEI9og1sW6
	 5xFnXPFQGN6YnEqYaYRm++HGgaElh1Fx4Kf6Vz1yscsvJVCQecZZM4yMG/a/H0eCwP
	 rY9/L5eYbloMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AACE80E16;
	Fri, 21 Aug 2026 20:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC98A4C4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA39F80E16
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfcHphMEBZgi for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0D3D80C48
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:18:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6F02D1A178F;
 Fri, 21 Aug 2026 20:18:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 30CB7604AA;
 Fri, 21 Aug 2026 20:18:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2B5111C77601; 
 Fri, 21 Aug 2026 22:18:38 +0200 (CEST)
Date: Fri, 21 Aug 2026 22:18:37 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aoiygeLjEM7yic6u@windsurf>
References: <20260821-qt5_allow_other_openssl_implementations-v2-1-7f3f82c610ca@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821-qt5_allow_other_openssl_implementations-v2-1-7f3f82c610ca@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/qt5: relax openssl constraint to
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

On Fri, Aug 21, 2026 at 07:11:42PM +0200, Alexis Lothor=E9 wrote:
> Qt5 can be built with or without openssl support. Following some build
> failures, commit a94d39d693d8 ("package/qt5: fix build failure due to
> libressl use") enforced libopenssl as the only valid implementation for
> Qt5 openssl support.
> =

> While this solution is fine to filter between the two openssl variants
> officially supported by Buildroot, it prevents users bringing their own
> OpenSSL implementations (through the virtual package mechanism) from
> building Qt5 with openssl support, even if the custom implementation
> matches the expected OpenSSL API.
> =

> Allow compatible external implementations to be provided for Qt5 openssl
> support. Relax the constraint by partially reverting a94d39d693d8 and
> checking that the selected openssl implementation isn't libressl. It
> then becomes up to users to ensure that the implementation they are
> providing is fully compatible with libopenssl's. Some qt5
> sub-packages enforce BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, they don't
> need any update as it does not really strictly select libopenssl, it
> rather prevents libressl, so it still allows custom providers.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(This is material for next: it's an improvement, not a fix.)

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
