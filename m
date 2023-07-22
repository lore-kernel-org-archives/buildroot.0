Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0A1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F0F481E86;
	Sat, 22 Jul 2023 21:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F0F481E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nmnhsnZg6NR; Sat, 22 Jul 2023 21:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000D281E8E;
	Sat, 22 Jul 2023 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000D281E8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5156F1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A531405F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A531405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4i81B5zIwVPD for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:22:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07DCC40500
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07DCC40500
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACAC160005;
 Sat, 22 Jul 2023 21:22:52 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:22:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722232251.41dfd80a@windsurf>
In-Reply-To: <20230722070636.22554-1-bernd@kuhls.net>
References: <20230722070636.22554-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MZL2FSmDg1p2Mmime7WltY59iZC9zWTFBem2biYZgM=;
 b=mKe6Plax+Wri6RofvMrUL5hfjE39RTQvmyftrpA0R1u9Ig2tup1XfZbOsfVN4y9SVa2G2U
 4RcHZT0MfR3aya3qbLti3n9EXRPiP199QOTT2Dp4R/zVEtdo7eyOnDOLwLlrrzkpRpWZZT
 NCqH3hqhhH7P0wyHyaSbXtV1XtD8Rn+5p7iLR/tvYoyjPL0ZIIaPbUF3VSQjI0IsTsSlai
 PlrGag8mUZ5bUqLPbp+Q+XwOF362asNUkvWzeq3PdpRjV29ceq933vXtrU/1EcQkwJAK6V
 Fo3OueVLeAwJyxquG4wOBmBAG38y45E8UnC9I6xx8RUsghkJdp7tpA/1/aY/kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mKe6Plax
Subject: Re: [Buildroot] [PATCH 1/1] package/libpthread-stubs: bump version
 to 0.5
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

On Sat, 22 Jul 2023 09:06:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Use xz tarball.
> 
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-July/003410.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpthread-stubs/libpthread-stubs.hash | 4 +++-
>  package/libpthread-stubs/libpthread-stubs.mk   | 4 ++--
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
