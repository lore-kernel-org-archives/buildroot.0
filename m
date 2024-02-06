Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1CC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0492541EF3;
	Tue,  6 Feb 2024 14:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0492541EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWe-fU1R47ZW; Tue,  6 Feb 2024 14:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4502141EB9;
	Tue,  6 Feb 2024 14:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4502141EB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08DE91BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C6660B5C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C6660B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5VPrSbvhJrx for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:15:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEE6060AA4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE6060AA4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 329DB20003;
 Tue,  6 Feb 2024 14:15:12 +0000 (UTC)
Date: Tue, 6 Feb 2024 15:15:11 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206151511.175b500c@windsurf>
In-Reply-To: <20240109085421.33259-1-james.hilliard1@gmail.com>
References: <20240109085421.33259-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707228912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCtsO0cq2VDOtTFJih6gnj5szd36tjfbw8MgNcwETM4=;
 b=SeK8RnVy25wn9MgJQRmIOC3eoNu219V2Wqp7u+GDvDRoSqiIrAFkRy/O6BTEDHsn484x9c
 VgMGx6SSVJQdgCcQS/MTYEjYb1D1sVVKoJZfMjgAdkqicpNMP9RLEOFL3UbTgVESJIpqvG
 zXGcKQ9+5ZLGzOW11G2U2A7OnCzuggfvc26W05ubm6EpmRuiwV/itYurfm/zVSzh2OYu9p
 8MseWyRwDcG5FKhgyBa5AAjKpqYJK+yniZAnGNNymP947ZPwiLPgJCFy+F33EL1l3mgeye
 XRZzsMwce2PtcSoUPrjHpZXBfGVGB4M4XllVKGfXsibtd3+G2WqQf/EONAJelw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SeK8RnVy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version
 5.1.0
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

On Tue,  9 Jan 2024 01:54:21 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-lxml/python-lxml.hash | 2 +-
>  package/python-lxml/python-lxml.mk   | 4 ++--
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
