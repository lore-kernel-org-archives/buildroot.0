Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45274EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC37D611F1;
	Thu, 20 Jul 2023 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC37D611F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO1KpsrCVb_9; Thu, 20 Jul 2023 21:30:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 406A5607C9;
	Thu, 20 Jul 2023 21:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 406A5607C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFFE1BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 645C341E26
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 645C341E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWV515wERqeK for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:30:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33D2A41E13
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D2A41E13
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F82040003;
 Thu, 20 Jul 2023 21:29:58 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:29:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720232956.0644b5fd@windsurf>
In-Reply-To: <20230720053031.33014-1-bernd@kuhls.net>
References: <20230720053031.33014-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WqmwlTeoomcFwLLmG7U/e65SwQoReEQTR8TAMknLAI=;
 b=R3F3MyVu47NtuGHZrRQ6VrH4I+wSFojtuVMUoQeqnBQ90Y7BFphOrusxtTYHfuApTtFO6f
 yziab3DEt9IJEhGqQCNzv/R0a34pq5M5x7BsmrNeWvFa8OUUPSVXyU3ehuITa3MCzO1dS3
 tmyovR+VnfCMvj5TE3IKaabTUe8iV2gBDk4SeIhh+KMeJQQ+lQe8zj6wNiHDlwA29fNwM8
 XfO8YNua/ycs9JmDl7xFcUdzxtOVWBvbZevc9MfVCu1tMbFvVs/PwIIp/MdSZVI3LeQxDD
 g2RnRDz5I2lio7xs0F+FsE6tm5pju8IRvbmQAbGVf7ZiLOGQ0uhaYBPNIJCv9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R3F3MyVu
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.0
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

On Thu, 20 Jul 2023 07:30:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://curl.se/changes.html#8_2_0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
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
