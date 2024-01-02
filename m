Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81565C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EAF54055F;
	Tue,  2 Jan 2024 21:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EAF54055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2CG4gjKvpdb; Tue,  2 Jan 2024 21:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02C040467;
	Tue,  2 Jan 2024 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02C040467
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2411F1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0DD660F39
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0DD660F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0dwJB1pLGaV for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:44:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC4960BC8
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC4960BC8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30524FF805;
 Tue,  2 Jan 2024 21:44:44 +0000 (UTC)
Date: Tue, 2 Jan 2024 22:44:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102224443.132a88fe@windsurf>
In-Reply-To: <20240102204756.1666286-1-fontaine.fabrice@gmail.com>
References: <20240102204756.1666286-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704231884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvz3A96giQDMiYeSHqvreUenN7931PKgLkBJRB7ubqc=;
 b=VE0jEBnbXDiGXjuBP1btcuLhHmJ3pHz6I6aoVXStfWALO583aRXxv+G8TkeFKV8OSRiPlt
 dTKP8G9+XBOls8yXHqshSTLCyMtP3vuj1N3q2TdlJXtYYsqHaqaFucBKazd86PM9NbDfkz
 iofzJOVv4m5+7meCUiJkF8dwYTtfZ6HITRSoUTu6Q8gT6dNyoy0KOcqWc1FPKgZ4lVUplK
 nUk8SvumYlOsERTI3hXZTtxADJs9uqfF3UjyCiVB/Q9FQ6FZaeQSN6ojCgxCLRvCFdjsKx
 rhDkoWWwYuC0UVvgeghybbjwqu2ipZ9Lvya7RovM8eVhif0xlJCs3/41f79D5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VE0jEBnb
Subject: Re: [Buildroot] [PATCH v3,
 1/2] package/gdal: giflib and qhull are mandatory
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 21:47:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> giflib and qhull are mandatory since the addition of the package in
> commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513 and
> https://github.com/OSGeo/gdal/commit/cb136fc051341ab99579daae3c8d8246fe918a76
> 
> Indeed, as explained in above commit, internal (bundled) libraries will
> be used if GDAL_USE_GIF and GDAL_USE_QHULL are set to OFF
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Update commit message with bundled library explanation

Thanks so much for extending the commit log to point out the part that
I was missing. I've applied both patches to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
