Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F106C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3BD41C3B;
	Thu, 24 Aug 2023 20:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3BD41C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w_wh3Q0wDpu; Thu, 24 Aug 2023 20:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E33416F8;
	Thu, 24 Aug 2023 20:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E33416F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D79741BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 508A0416F8
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 508A0416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75h--1MuGtQZ for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:38:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ACFB4004A
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACFB4004A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09CF620004;
 Thu, 24 Aug 2023 20:38:32 +0000 (UTC)
Date: Thu, 24 Aug 2023 22:38:30 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230824223830.44b9f4a2@windsurf>
In-Reply-To: <20230822194922.71368-1-ju.o@free.fr>
References: <20230822194922.71368-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692909513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4y8tHAWartyWgJa5weMjD8ILOuonYogTuFDQMmdY5d8=;
 b=oAVyW084DlgSrNyC9w8wqyjI0n8CGvQ/DAC3wehOQ6QmItAucEmcmFWjHyjkQeHozStk9m
 fN0/ROE0CZhj3lwkAWvXzdw1ndvhSC2zuby1hEMEmME+vy0qPgPlj/8UFwiLBJp0AA4oda
 Ust0l0J/J5AuauFWWDbRoZVtJaO8q0s5uATFIpoynkMoPAvq1Z9O78oFClTPnR0/UCDohN
 NGxYdupLd0KnA3Mc6sunp+B+ElqZDqvRbNrbOQeF/keNzfBkijz/bjBx9fQtnd5qLnYWx9
 aWNSZV02wRC9GJCOE9zH9XC7ZwML1KYT5qftPnhv3tie8+5u9cM6NhxCcXgYug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oAVyW084
Subject: Re: [Buildroot] [PATCH 1/2] package/screen: security bump to
 version 4.9.1
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

On Tue, 22 Aug 2023 21:49:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnu.org/archive/html/screen-users/2023-08/msg00000.html
> 
> Fixes:
> CVE-2023-24626: https://www.cve.org/CVERecord?id=CVE-2023-24626
> 
> Note: Buildroot installs screen as setuid, so the described scenario
> in CVE applies.
> 
> This commit also rebases all patches on this release. Patch were
> regenerated with 'git format-patch -N', so patch file name changed in
> this process. The file .checkpackageignore is also updated accordingly.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch series tested on branch master at commit 6d8deb4 with commands:

Applied to master, thanks. It would be nice to upstream those 5 patches
we have against screen :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
