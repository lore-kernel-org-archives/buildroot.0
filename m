Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35899C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF377843A1;
	Sun,  5 Jun 2022 21:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSZONAAuYTST; Sun,  5 Jun 2022 21:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 105D584394;
	Sun,  5 Jun 2022 21:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8607B1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7409740D76
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8YgLRwGLv5a for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:17:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9F3540104
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:17:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8336240003;
 Sun,  5 Jun 2022 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654463869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhUshJ1sYISQ7zZ+ZDfaciCHge1khd0ZqVNDJStSvLs=;
 b=Y6If2DEauYOk2xj3VGpyzL8Jz4osP+NsJD8/oaEDEAvHYAq+Bv9wJw2q1QeFsnZpDLGDY3
 v34wDq5qToQvETIkXWCanaOIvClO/878JxhQt2ZGnHwniejpFRGFwr8S8wKw5vgN1nr9rX
 SkiWUqL8zoQoqVEltwqJSNOAxPtGBfCAjrN/L3sIxwvZb8ELRVElB7xhoYh1oClrfNdWxX
 neyC1luDj9kp6ZQfLN6hu4XGmv5RVopxueX26bG+tJIB2Urxe/tAu4pR5BAWB1R1GlqpA2
 ZCezQoSP8gqEcOMBOXYiOFVU38anXxlNiOi/0fPJobm8dpGj5sbRAPj2CAMI5Q==
Date: Sun, 5 Jun 2022 23:17:47 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220605231747.2171b2a6@windsurf>
In-Reply-To: <20220529223248.51556-5-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
 <20220529223248.51556-5-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5] package/graphicsmagick: Bump to version
 1.3.38
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

On Mon, 30 May 2022 00:32:47 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/graphicsmagick/graphicsmagick.hash | 2 +-
>  package/graphicsmagick/graphicsmagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

You forgot to check legal-info after this version bump, and the license
file has changed, and therefore the hash of that license file need to
be fixed. I fixed that up, and explained in the commit log why it was
changed.

Applied to next with that fix. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
