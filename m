Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FF8C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495AD612D9;
	Wed, 20 Jul 2022 21:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495AD612D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OybRXfsI8W6; Wed, 20 Jul 2022 21:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F9A4612DE;
	Wed, 20 Jul 2022 21:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F9A4612DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1246D1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEF44179A
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFEF44179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm4zWkJLUrN4 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:15:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2618741576
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2618741576
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:15:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78085240002;
 Wed, 20 Jul 2022 21:15:32 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:15:31 +0200
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20220720231531.56e6f398@windsurf>
In-Reply-To: <20220629220332.14157-1-kris@embeddedTS.com>
References: <20220629220332.14157-1-kris@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658351733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wijxi7pf3sK3ewyhzRo1+oL9FMaMFjudXHN3MSRUo3A=;
 b=B2EZapqR8gG6ovgPcAea7QilECPuBtyNE80wH/wWnIB0RVJYJhTrk4bpvpsCNeI1ZrqJo+
 kCQR/hYiV3AcHkbAmZjFnBs4JM53ge6d7LZOd4lnZ4jZoZXpfvqLJCl+Xj4OZew0h38s6a
 jHlXpnK1ZKGRym4M+jH4UUxnJqikq059ZUNfYINSgO+bf5Kv6tW8W/N9/qAgmQBBjKGqFx
 V5hMtxGxRBlXZc+MVvesczwzSO5T1jVR732VgT6o0xT2ILElKmUSAiNgH3cfCaNLLgxrqq
 C+0aASs+rxJAQEZxor2u6GgabKp7gPEovXHcMEDB0jBFKshCCCJJZvNlGYYSnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B2EZapqR
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump version to
 15.7
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Jun 2022 15:03:32 -0700
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>  package/wilc-firmware/wilc-firmware.hash | 2 +-
>  package/wilc-firmware/wilc-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
