Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE876C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD1A605F3;
	Sat, 29 Aug 2026 21:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O7Kv8eIrtaw; Sat, 29 Aug 2026 21:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037610;
	bh=Rq0OBRnraBwH3LnyibBVoJp8pqg6AAFgL39BRqDW3so=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bQPbuovGHMlUK0ixelWIc5TY/Fbu2Y9z6Vc/rsUee1CYJVYYvEwqbW7WQnlVgC/DP
	 Ip30wrCUu3idambqdB+p1iceALxYyKBHxdLq63UobMeqfr+YeLJiTJZEHErEfbomyE
	 mUOSTOd8yhxDHmGHG7+H7/aIskVtcHL6esRZ5drqF1ZYYxGD5YRfSQ9ooEx8S6QmRj
	 yHodOOo8NuvKT/wni2P4z5+cu2ImIOgX18oXE95GYmb0zbGLqXpAIr137ZR+Zhta4n
	 YeaDLRWzXw5oYTmRE7GpDOm1tPL94jHRznoOEVSpSSYZRVA3oXSs09t61gSE0sBClL
	 KQnOzqm4P6KEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2CC605EE;
	Sat, 29 Aug 2026 21:06:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B043C355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96069605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o15MatcvkjHu for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1217605ED
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:06:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 342FD1A1868
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:06:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EED6A6053C;
 Sat, 29 Aug 2026 21:06:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A079811C781D9; 
 Sat, 29 Aug 2026 23:06:38 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:06:37 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <apNJvp4qRblpoJuk@windsurf>
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

On Fri, Aug 21, 2026 at 07:11:42PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
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

Applied to next, thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
