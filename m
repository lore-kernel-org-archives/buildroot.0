Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB70C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A4160BD4;
	Sun, 11 Dec 2022 17:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A4160BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwdVaOINwOBP; Sun, 11 Dec 2022 17:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B310608B7;
	Sun, 11 Dec 2022 17:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B310608B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC061BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF59C608B7
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF59C608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPL1_3XwmvsX for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:06:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D40AF6059B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D40AF6059B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:06:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC80F100005;
 Sun, 11 Dec 2022 17:06:09 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:06:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211180609.2f54d7d6@windsurf>
In-Reply-To: <20221206044156.2804371-1-james.hilliard1@gmail.com>
References: <20221206044156.2804371-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeTDQvsqp/Lk9tVX+3dZyfObk05lE73QTF5/8AQw1Mk=;
 b=NQSg3iDz16DZxP1gZKPO3JH4bMC4N5YPaE/FJZFgwvtyG58BZZ1b6oPQ4UT8BMl9pFMmX0
 7GEelqZjnDukOGYO942TYfRdPSKdBIuV2Hixua3damsjafFbIJCy0s3JXdowDLd+iLJXdg
 EfKJenY4SopT9VbPDuel0iZWgD0Ok2qKMkTU4BeGykOgcv5a/5MyO09pFMqdeihjx8a7Sd
 0BMhzlbv9ztDjee8wYKEQqEu64FNv2hjJX58YD1ZozdL/z8h4HWznzvqvtgu+Lf7ZGgvbG
 hS3MXJG5d4/UXkTi/MV5GVhgxlNcOu1s9hOsmWreRLkjbsqWcgMYrO591Bk+NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQSg3iDz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: drop
 host-python-tomli dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Dec 2022 21:41:56 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The host-python-tomli dependency is not required on python version
> 3.11 and newer.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pep517/python-pep517.mk | 1 -
>  1 file changed, 1 deletion(-)

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
