Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7128EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7653E41F8F;
	Wed, 12 Jul 2023 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7653E41F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmhM05fxBVKO; Wed, 12 Jul 2023 21:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892C041F83;
	Wed, 12 Jul 2023 21:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892C041F83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6D641BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE0961242
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE0961242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbiyOHpfyJih for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7734D60F0B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7734D60F0B
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:01:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EEA920004;
 Wed, 12 Jul 2023 21:01:32 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:01:31 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20230712230131.394f1ab7@windsurf>
In-Reply-To: <20230611233619.128038-5-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-5-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689195692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8cyY2kXJWEvUfKIaLYFQ+mspi2/jlt11MF8Gc2dJs0=;
 b=N7qMf31KdwhBXpX1dnEEpwLA7IWm79RjaqhKFxp0fCXvmWdDHr7y9BAgy6BCjGHYVM3kYM
 GRSb3pEv4kGko06KT3aByQrT9SDaFVVOHXAgktC18guGr5GvNFszKy8HRrkOpbPPmbrRbf
 QAy6d+3WLtc8GYtImyCsIMnyFzcVRe/kzvpaaNv4/4rsgmcum1fkYPS6gZdmQt4SR6/yNv
 BuDir4kCAvF6r3CTpQc3CCYs+GrrS9tHDLHXwpaz4qHSeSThc0ob0THu1Efu0NJ+XE570a
 Kgy252oS1mps+B4zkkITFJWshkmTQ5A8pxV92K1cpZ0ZiriHbS4oBCzUZfB8PQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N7qMf31K
Subject: Re: [Buildroot] [PATCH 5/6] package/python-redis: bump to version
 4.5.5
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

On Mon, 12 Jun 2023 01:36:18 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-redis/python-redis.hash | 4 ++--
>  package/python-redis/python-redis.mk   | 4 ++--
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
