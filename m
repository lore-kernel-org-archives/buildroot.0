Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC30CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05057611E3;
	Sun,  7 Sep 2025 13:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bbq9V3cabMry; Sun,  7 Sep 2025 13:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD70861C5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD70861C5A;
	Sun,  7 Sep 2025 13:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC87273
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1FF240CAD
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-IgxfU7y7HC for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:16:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F4A140C9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F4A140C9F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F4A140C9F
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:16:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 13D604E40B52
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA9696061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:16:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAB76102F2873
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:16:34 +0200 (CEST)
Date: Sun, 7 Sep 2025 15:16:33 +0200
To: buildroot@buildroot.org
Message-ID: <20250907151633.00a5abd0@windsurf>
In-Reply-To: <20250907131412.3406724-1-thomas.petazzoni@bootlin.com>
References: <20250907131412.3406724-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757250995; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dG8vkuFC7HzkpwuLeZMr8z1RBvuxI/VavYDNAHc7JVk=;
 b=W3aTt2CXkhxJkmnVyer9XJUY0x6GIUTnKQdz6qPfOEofDvDDQSIfmuNL89yowpoJNaWPZZ
 dkeRAaVNKZ1eSBPn0zYuXAlI5jGCimNVfkp7PCuhEGLHZTKw2vbX+RfRPKTcoCDKcTG/lw
 S1+yvmnGh07SEgRxus2oczyVsdHQfEaEikk690CMv58f2QNhfqg2uNQ2iYNU2xCuOTLvrc
 heE8bnZgT9meWIJefRgdoNcP/XwYPtzgh0WtgyVvInPeXgielaqGtqVWDsuut/h+RFIAKF
 b/h0o1WA6JorB7PTgeR5owl4T5clL6+8E6XC+yczKMOLfHVicm2EpJ2okm0tOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W3aTt2CX
Subject: Re: [Buildroot] [PATCH v2] package/bctoolbox: disable mbedtls
 support
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

On Sun,  7 Sep 2025 15:14:11 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
> 
> Since mbedtls was bumped to version 3.6.3.1 in commit
> 3481a9643fc7223e400ed877f08ade34d44e6b78, the build of bctoolbox fails
> as its mbedtls support is not compatible with mbedtls 3.x.
> 
> This issue is known upstream:
> 
>   https://github.com/BelledonneCommunications/bctoolbox/issues/19
> 
> and is not fixed, even in newer version of bctoolbox. So for the time
> being, simply disable mbedtls support in bctoolbox.
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/7af784cb60b0ec5e5bd0e0915ce6827f69f4bb97/
> 
> Newer versions of bctoolbox have fixed support for mbedtls 3.x,
> however:
> 
> 1. They require mbedtls to be built with the MBEDTLS_THREADING_ALT
>    threading model, which is incompatible with the
>    MBEDTLS_THREADING_PTHREAD threading model with which we are currently
>    building mbedtls.
> 
> 2. The bctoolbox project itself has been archived, and merged into
>    linphone itself, making the work on bctoolbox version bump not very
>    useful/relevant.
> 
> Disabling mbedtls support is therefore the most immediate solution to
> fix the build issue.

In fact, while this solves the build issue for bctoolbox, it then
causes a build issue in belle-sip, which requires bctoolbox to be built
with crypto support.

Considering the issues, and anyway the change of packaging for
linphone, I'm going to send a patch series that drops linphone entirely.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
