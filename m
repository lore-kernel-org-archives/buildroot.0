Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56135C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051124094C;
	Sun, 12 Mar 2023 22:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051124094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcikHhtBJ9rG; Sun, 12 Mar 2023 22:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE64640884;
	Sun, 12 Mar 2023 22:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE64640884
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB5B1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35B938176B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B938176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6oaOOuSblY6 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B5E8143B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10B5E8143B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:12:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32ADD100004;
 Sun, 12 Mar 2023 22:12:30 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:12:29 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312231229.5566a6aa@windsurf>
In-Reply-To: <20230304214120.136162-1-ju.o@free.fr>
References: <20230304214120.136162-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRW3aJwG3GiRyQcyZzXTYoSRTYhsffD8jrqA9rCcbrI=;
 b=OCXjMXiB+L/xs0twx31r1uOYyvev3CPApaIPvYlpe8Nd/Lzq0565ZlugjLXAgGuzGoB6b0
 MmU1m3x3NY+5P2zlkDkfA7DsDXgcP24OjnKsY3PvF8/uCf+9uXuSA9moiy3qrA+tPdEFiX
 4H9cqtkvUrjQZIwZ6iw2Pg+ipM5SDzpMEeqx0Tef2Zn03XxpAWx1XTAvlBY6Gk6Xlev/jK
 +azIbYnOBxq64vK5P6XzA2wldIyTdAV0pEDHxXkbUc2TVgXFLbLkMMjabJ0HkBYhVlK27y
 bFfnVakzzHzYzjLwKpZJKEORyDMSvsF620e1MkwAmYL8+ZkMrIqf3GcrKw5Q5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OCXjMXiB
Subject: Re: [Buildroot] [PATCH next 1/1]
 support/testing/tests/package/test_mtools.py: new runtime test
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

On Sat,  4 Mar 2023 22:41:20 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

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
