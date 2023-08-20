Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CE2EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81BF415E2;
	Sun, 20 Aug 2023 21:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81BF415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNk8y14RKWuH; Sun, 20 Aug 2023 21:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2ED415F2;
	Sun, 20 Aug 2023 21:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2ED415F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 108DA1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3BB781B36
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3BB781B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjcANyLZWrch for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:20:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A957C81AD1
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A957C81AD1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38D7E40002;
 Sun, 20 Aug 2023 21:20:12 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:20:11 +0200
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20230820232011.754121bc@windsurf>
In-Reply-To: <20230818003124.3770152-1-mmayer@broadcom.com>
References: <20230818003124.3770152-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692566412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtlWttDqTwHk6HPrwLZCbARsO+PUD5UVjAaEbGMiT1s=;
 b=SKv/V6NtqPO4mO7K+j6wuYFOtm9wje1StlCi6LdhjXLnj73i1uZeroYaaC2gxKpOPtGkFm
 0JPFsjIH8+VNsWxsUuPWLQCH4IP9qknNRAs3/j5w8dE0Vn7bkdfj2JQt4hWyma9gOi+Pqj
 +dVs80yQmmtBFD9sJWkO5ji16G4ZDfxlLzkw3CESzbkhBhi1GMUWzY4WEHySx9QWhASbdL
 jW541hhE3AD7irWSoBfy28RbAK0EU56/VrADr6ms9yqGVZP7FiObzxrwxy42cMqRBAaklm
 O/zAt18pZqBBfq/4Tszkm5dG88P6VjSwepE3P85RTxIFL1SLggN3mAS4DqREgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SKv/V6Nt
Subject: Re: [Buildroot] [PATCH 0/2] util-linux 2.39.2
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
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 17:31:22 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> Markus Mayer (2):
>   package/util-linux: bump version to 2.39.2
>   Revert "package/util-linux: add missing autoreconf"

Both applied to next, after squashing them together (and cherry-picking
into next the few commits from master that these patches depended on).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
