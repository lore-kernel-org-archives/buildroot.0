Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6607C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FA840860;
	Fri, 29 Jul 2022 11:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FA840860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wy7TQOt4ZKJt; Fri, 29 Jul 2022 11:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5C141B8C;
	Fri, 29 Jul 2022 11:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5C141B8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44EE41BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CFAA61086
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFAA61086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCIVHSlEdogA for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:27:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6DB6107A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B6DB6107A
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:27:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 516231BF206;
 Fri, 29 Jul 2022 11:27:48 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:27:47 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729132747.48c1b071@windsurf>
In-Reply-To: <20220728211018.247787-1-giulio.benetti@benettiengineering.com>
References: <20220728211018.247787-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659094068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0GJ71NM2t57CjL/POfgeiejnoiDtSj2gw0ESlFEZO4=;
 b=AAO3gEurvNsq8Gh7jTnBtcjfeVz85n5Qdr2lg0exOPnwzDf2HcvNv+CCD0XQA3sRMY4B24
 rfyHfPlOhrYJccx4CXreDIwfHDyfN0f8eyEaLgZrX49asjjj0DpcpCAosFmv+j1d28d8c/
 eHvhGa7omOtceAM4vG+fQBel+Mk857dmza2pmmFdB1/C4sjjfIcJSGLuaTcO5hxaj7Ko34
 CBSMloib5rK4w9KSWhMc+NUVRDgAQ/AIJdb1J4oeWeP8eVez3XUzD4HMUw5QAazhuTbVBZ
 auLyeP0i+InU/3ZBziDflhW7Rk9cRjJQgJyAbw9BngfpAUI8hBpjMymrMyhrLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AAO3gEur
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.5.0
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

On Thu, 28 Jul 2022 23:10:18 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> - Drop local patches that have been upstreamed
> - Remove AUTORECONF since configure.ac patches have been upstreamed
> - Add --disable-asciidoc to avoid generating manual pages that require
> asciidoctor leading to build failure
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...d-check-program-for-symver-attribute.patch | 56 -------------------
>  ...onfigure.ac-replace-argp_usage-check.patch | 40 -------------
>  package/cryptsetup/cryptsetup.hash            |  4 +-
>  package/cryptsetup/cryptsetup.mk              | 10 +---
>  4 files changed, 5 insertions(+), 105 deletions(-)
>  delete mode 100644 package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
>  delete mode 100644 package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch

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
