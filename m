Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501EFC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAC460EF8;
	Mon,  5 Feb 2024 09:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAC460EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4x1u8tugZLjk; Mon,  5 Feb 2024 09:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F8C60EED;
	Mon,  5 Feb 2024 09:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F8C60EED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70C041BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49180417AD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49180417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RNPQnFHmGCX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:16:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13523417A5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13523417A5
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0716C0007;
 Mon,  5 Feb 2024 09:16:45 +0000 (UTC)
Date: Mon, 5 Feb 2024 10:16:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205101644.6bfbb1b4@windsurf>
In-Reply-To: <20240131204524.2098188-1-fontaine.fabrice@gmail.com>
References: <20240131204524.2098188-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707124606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nlrfIjS+QPn3/r93B+U/lIuuO3PZMt88YbfjkvDEkA=;
 b=HerZVMrK29wpNb/RpatWjzBqmUzy3QKQTVaT2nmqd3uVMaYol4ozBRPvuR8xDo9Sjoa37j
 6+IHK6kL18Z6TtFSZzIjToO66eC0OEcMEFBbR2TqvoHSLpJIcO8PcEVZ376dRubs+ytOXQ
 bDhwTOn/6n8qnSmFaB6yuPtTL5d9+AZ2nEwq46zhwvM9fxg5jsq9czypxXGsHVr4i07h7N
 OZU9GZ82jxlP0+QYs6pCD7fCIQQFVQYBVlaY59ec9s9wLizAyzwjAjwfg6Cj9vDx5dyjlX
 /8la86MBZ6JRykYFpuJQZ9E6JweObSP9uWfPdQ28ccwS2E5bPmicj1610DfjLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HerZVMrK
Subject: Re: [Buildroot] [PATCH 1/1] package/libjpeg: bump to version 9f
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

On Wed, 31 Jan 2024 21:45:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of README (changes not related to license)
> 
> https://jpegclub.org/reference/reference-sources/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjpeg/libjpeg.hash | 4 ++--
>  package/libjpeg/libjpeg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
