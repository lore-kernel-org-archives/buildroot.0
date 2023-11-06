Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87809C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA5F4097B;
	Mon,  6 Nov 2023 22:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA5F4097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42sQ6TCYt_pD; Mon,  6 Nov 2023 22:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62140421BC;
	Mon,  6 Nov 2023 22:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62140421BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3346A1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF3141708
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF3141708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xPKHOKA0IQT for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A304842157
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A304842157
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB7460005;
 Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232340.0937d1f2@windsurf>
In-Reply-To: <20231105072652.2879462-1-james.hilliard1@gmail.com>
References: <20231105072652.2879462-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0uDQqBT3vfdqE5cgJlJj5sGVBj27bJJcjQT6Y1EJ3o=;
 b=O/laRBvgyPtR5yRUpfwVGsGQtFrN+dAVuezOJmmO1jZko9n75ayLl/0bT1+7kzQL0z+jGY
 d0vSWGCuMxBrI8nGPuRblYoLIU5H0p3qe1obK6FYvpnAPqtrXHK73wd5+/fE2VMjxXRvuT
 aarNLWkWofsu8y0ujfvAhrzHLokuoFsQ4dwUJMqb2JqIf4s+uGncOlzzii7ZCNIvh9DUBG
 oEg2k69Xstf0AQGrITIuRs4CvqwNDMK3tPGppi1ND0ohCtWKmaoR0KvmSlNDV4rijyX02h
 8VSu7usH0qX2CbX4rmoNhq4zeBsQybpC77dtSDIbutjBvfAavv+wXjKhcUt90Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/laRBvg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to
 version 21.2.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:26:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop python-setuptools runtime dependency.
> 
> Add new python-packaging runtime dependency.
> 
> License hash changed due to date update:
> https://github.com/benoitc/gunicorn/commit/378f0d04ec390a754cb819f095bf65bfcc04ed99
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-gunicorn/Config.in            |  2 +-
>  package/python-gunicorn/python-gunicorn.hash | 10 +++++-----
>  package/python-gunicorn/python-gunicorn.mk   |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
