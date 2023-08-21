Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F11EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D209E4063C;
	Mon, 21 Aug 2023 22:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D209E4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGysAtzax_PG; Mon, 21 Aug 2023 22:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24ED540B4F;
	Mon, 21 Aug 2023 22:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24ED540B4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5F4F1BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8119540918
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8119540918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMZjBd9HlRV3 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:05:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5078440908
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5078440908
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60EFE40003;
 Mon, 21 Aug 2023 22:05:39 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:05:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230822000537.65a9d246@windsurf>
In-Reply-To: <20230816200600.1399409-1-bernd@kuhls.net>
References: <20230816200600.1399409-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1mfTcj/uRhZTWtkVRYwpZlryvC4+NA/Z2SLWcP1TD0=;
 b=F+xxLvUB3jbWYRhT1zOqf89yY6A981zJWmPxoN/wv0lkBQrikn3rFoHR+GxEcJGHeBztQp
 MTrVL4Jo45CKlIW8ClaaZhXTPIxw/hJs4oFKs0V7n/bZ2mHDafKDEpSLh5xGGwSTGqo+HI
 0TrwGWN2ghB/22axPVCu6eEum/lMyzgwG9sSb7F2dJUhXpNL7jncnewBcnFCi9mzdJr3Yh
 iAii2ll+5YlOdp9XB6FbhxrZ5E8YacBjrX2/0+IYtQGHbR0OI9ZgRoIuFrDsInZwlHu4gK
 6zDdnCtcRVuT5rsb7SdUghGZUP82sZfDNcpcUuD+OVLcfJqZ7YoqK4UdZluzlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F+xxLvUB
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.18.6
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

On Wed, 16 Aug 2023 22:06:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.18.6.html
> 
> Includes a mitigation for CVE-2007-4559.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
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
