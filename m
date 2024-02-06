Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A50C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F013E41590;
	Tue,  6 Feb 2024 15:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F013E41590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dWtrXlFLeiv; Tue,  6 Feb 2024 15:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4552A4158B;
	Tue,  6 Feb 2024 15:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4552A4158B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D841BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34EA6128F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34EA6128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6PSin1mdJpH for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A03AF6128C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A03AF6128C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50AA0C0002;
 Tue,  6 Feb 2024 15:21:06 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:21:04 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162104.4a327738@windsurf>
In-Reply-To: <20240110050337.1106376-1-james.hilliard1@gmail.com>
References: <20240110050337.1106376-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqvYfIUZsguOkFjphG0GvFPqZkISoNa5BaCdVpv/haY=;
 b=IWQL0Rpp5d9rEVqYFVVKZcrr5lu3dZc4aJ2HvzI0+bag4jBdNvalDhpQLZL8DIBFJPgLBc
 JpspKpnEP6fUciVYpMofK+M5E0D0kEBbYjAKTyk2YzZZjo8Y7oCQ5M/2MCn/Bs1XrWYbEI
 z6jV7FGdHIKkZWG++2YAjzSIyOGbwQ63zC5LIuLMtmou2GM3PaWWrqN0Id/c36wH1jSL8a
 IKMGcscxeHmCw+LrY42CicOfIq5s2t9HBNHTqBvumeL7xyE+TTficz4kEhmd5KVFYFq1lf
 EU28pcmIi5C+QOZEZZoIypZRcn9ZEr+70N7mNNKW/iCURu+jo8f1kNUIofHgVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IWQL0Rpp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pygments: bump to
 version 2.17.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:03:37 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to hatchling pep517 build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pygments/python-pygments.hash | 4 ++--
>  package/python-pygments/python-pygments.mk   | 9 +++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)

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
