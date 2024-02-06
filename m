Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C89C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0071241681;
	Tue,  6 Feb 2024 15:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0071241681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jae2VSRwvfqa; Tue,  6 Feb 2024 15:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E886E4158B;
	Tue,  6 Feb 2024 15:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E886E4158B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 619081BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 371F941595
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 371F941595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uq7endOSYY0 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10AD941590
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10AD941590
Received: by mail.gandi.net (Postfix) with ESMTPSA id F09361C0003;
 Tue,  6 Feb 2024 15:21:24 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:21:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162124.58dd2a51@windsurf>
In-Reply-To: <20240110051911.1137724-1-james.hilliard1@gmail.com>
References: <20240110051911.1137724-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEWO90zZ5P2vJSQbPl5sVA0yl+wMq1GXSyPW57uzYgA=;
 b=PoqAYYPGrNLRJgRB2bShlNYVaQ48AUmP+PwXupFz51CKTsK/RTRGH0hV0t3YRZWGoDivdt
 UGQS6kTpzUG2Hhq29bxVCuEX8h47GFKNFuKmWM3Q0CFQetLaPI65gNOdrPYGca0vGb5xv3
 UpRmKvw/nX9T0w1lKu5ftiCGS10PJcf2NRtCUz1yRhqmCpZUMhgoG71PGCC5oypC8I4LXJ
 5Aechs3ySun+PuIB9d9vxuNBmdkqWRRtmx2+QaqGv85ACrm2N69LzAXweJy4b9gRfAHsfU
 Kw/X+P4ty4VseYBiRzcxS9ctDfOdrZgykm8A8WwIyQWvBhpST74GmucBjfC0RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PoqAYYPG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version
 2.8.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:19:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyjwt/python-pyjwt.hash | 4 ++--
>  package/python-pyjwt/python-pyjwt.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
