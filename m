Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B3684318;
	Sun,  5 Jun 2022 20:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEZEKnJoUXJP; Sun,  5 Jun 2022 20:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC358411D;
	Sun,  5 Jun 2022 20:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0FFF1BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06FF41A4B
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-9pFCW4khZc for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:25:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 479E240902
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:25:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB57860003;
 Sun,  5 Jun 2022 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654460723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9vxFF+wqA3pNm+o+iDiVyb4oGleuxJ53F8jv1VTQzQ=;
 b=lNyB11qacVvFqO6rYsN+v6dOGTZe86Rja4YZSZIBIxiEiTYwPQrOOVtwutOwCIa0pMLQw1
 /46ZkxDjRlkqR3JdesmNXBCVYUra6OJ1uHeX70nMDRbBwwuCgbUEk/QoLCy+kfeYFUXAz3
 jI/LW8gVEya4E52/hNwzJU8pbfBoncH9bJlAoRkEoZS6FCSK05schwC7+u/OcinyzC5gqU
 DhEIjV7nc66xL43lM3oMV+79R4oihLL4UXpukNUxXqNhm/I08NNQoJON5bgZUKnX1+RkbI
 YnECsEo6dvcteLg/3tCAqtP8TT+RL133n8lGMsL5/6/LETiCkDMK4hS5gZDb3g==
Date: Sun, 5 Jun 2022 22:25:21 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220605222521.52d102df@windsurf>
In-Reply-To: <20220604115458.7914-1-heiko.thiery@gmail.com>
References: <20220604115458.7914-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/rauc: bump to version 1.7
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Jun 2022 13:54:58 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Drop patch that is already in upstream.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...src-verify_hash.c-include-inttypes.h.patch | 38 -------------------
>  package/rauc/rauc.hash                        |  2 +-
>  package/rauc/rauc.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch

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
