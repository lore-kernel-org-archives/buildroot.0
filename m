Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D82EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B009383CA7;
	Wed,  1 Nov 2023 17:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B009383CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jvriGLtbC1c; Wed,  1 Nov 2023 17:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4E483C8B;
	Wed,  1 Nov 2023 17:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4E483C8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC4381BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A572F83C56
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A572F83C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFf2_Co61w_q for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:31:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A2DA83BFE
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2DA83BFE
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEDFF240007;
 Wed,  1 Nov 2023 17:31:25 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:31:24 +0100
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20231101183124.260acebf@windsurf>
In-Reply-To: <20231019112110.1802-1-post@lespocky.de>
References: <20231019112110.1802-1-post@lespocky.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698859886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucWu1e4BqWubrz3uw3PtX0uihMn/UMuDLZvY1XaLyxg=;
 b=SDEsmgh8hYOs1lDXQxxWKSNZAi3nU6gAes95bbeixfG3XXpT6hkRRbV7kI8rTFJmUcziI2
 gnykfaKQsAz6DLQqwBxTTkAfE2IzEIhew/6em3vZ2z7zZaGJTwHhoOORB3ylsuMHvN9ckF
 mGIJUCKDLfMgF4wnYd1zZIxOxtpzLPB9t62WnWICGMSx11b7Xwag65USdC8flFp0Yy/fqn
 2IyO9zn250fXZ80KmJ+Joz/jRLt62WGXj3vcifxLFBSx5FF1jKuCn/nKt80GKunTz1h+l6
 /miKKTU7NtxfpikUD7QHweQ6OLRdKA/hylrI5EaKacoL9ukSbNx4y+QveHHKOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SDEsmgh8
Subject: Re: [Buildroot] [PATCH] package/lighttpd: Bump to version 1.4.72
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

On Thu, 19 Oct 2023 13:21:10 +0200
Alexander Dahl <post@lespocky.de> wrote:

> Link: https://www.lighttpd.net/2023/10/6/1.4.72/
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/lighttpd/lighttpd.hash | 6 ++++--
>  package/lighttpd/lighttpd.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
