Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0277EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBB06072A;
	Sun,  9 Jul 2023 16:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBB06072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLzMm5TcwWKc; Sun,  9 Jul 2023 16:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80792606F5;
	Sun,  9 Jul 2023 16:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80792606F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCC191BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D3F409B6
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D3F409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O--rspQFaz1z for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:31:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84A9409B0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D84A9409B0
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:31:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6E59CD02D1
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:28:21 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69CFCFF804;
 Sun,  9 Jul 2023 16:28:15 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:28:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709182814.6723f5fd@windsurf>
In-Reply-To: <20230709100930.3224540-1-bernd@kuhls.net>
References: <20230709100930.3224540-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688920095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ri/QP5ZhstRmi7+I4uFBtjCbj3QGG5yVWgh6OSDoz9E=;
 b=CbW/zdbPL1J71G3pWui37N5HeqEL12uuZFt3PAJziO6Sh1hGIAKOfVCVLKWmDtcYZwEXJo
 XSwtfX3tkh5OKJDquZ5FTmeZAVM2ezdrGvker0AEMR3gDSNud5IZB751BI7Zup5+fvm4QZ
 EN+W+rsiLKsVCOSGcBuUkOMrOsDfNejNyFsH0liMSwqhmD/XbRQcUMMaMtp+98Omm2FTde
 K++c1Gg2D0YplyCfGOEA58omf1tV5J5sSwFR9nKuN27imekAMKncX8t/e9o7p2l8TxdfOg
 Xdmznbl3ldeVidQLA+pOlZjFmiEvnAAq0JimqAAmVszOeBmMncA15xABbYEd9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CbW/zdbP
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: bump version to 1.2.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jul 2023 12:09:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Switched _SITE according to http://www.musl-libc.org/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...rameter-name-in-internal-netlink.h-R.patch | 33 -------------------
>  package/musl/Config.in                        |  2 +-
>  package/musl/musl.hash                        |  4 +--
>  package/musl/musl.mk                          |  4 +--
>  5 files changed, 5 insertions(+), 39 deletions(-)
>  delete mode 100644 package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch

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
