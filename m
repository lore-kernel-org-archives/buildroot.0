Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B26C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B2F41554;
	Sat,  5 Aug 2023 22:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B2F41554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYYAfIh0AtJz; Sat,  5 Aug 2023 22:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45862402F3;
	Sat,  5 Aug 2023 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45862402F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75AB21BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37CE5405FA
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CE5405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Buunb1ABxUvo for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:43:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07E2840185
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E2840185
Received: by mail.gandi.net (Postfix) with ESMTPSA id E680660004;
 Sat,  5 Aug 2023 22:43:39 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:43:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004338.61228af3@windsurf>
In-Reply-To: <20230805213437.3588243-1-bernd@kuhls.net>
References: <20230805213437.3588243-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1g/Qb2dBMqYAKD2KjaU0Sr2hmBeX0mtKBu+K8UKDons=;
 b=ppDww3b6tRLryhgEv63Usn3sELJvBeWMWQftQ7Io8r96AI59OITXqXIAmrqALYJH/xKZ0s
 cqcr8Zk8avda/aQY4OkgO5u7hSHsBUkWhdcs8N+6ei8v+eBPvxQvXKzfPeoG/crTSNyEbh
 Tv20QU/NgPt37nk5mRhpa9HdhwvezzDVvpEyFaHJrSUaoJj6Rr0l+LFaBfZJjna5nIil0i
 IzsfQihYKoqIprh91i2OOcTnyGYYz0/6dXasDUeMMnuE9i07cnk9Jzjh0kgsJywpwNy13x
 DZRziBxUJg4Sd0otuX1DdKBIEvDW5hCcmsSN2TuhbBI0pbP+SkEWD2MimxpbYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ppDww3b6
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.4.4
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

On Sat,  5 Aug 2023 23:34:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;hb=HEAD
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xz/xz.hash | 4 ++--
>  package/xz/xz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
