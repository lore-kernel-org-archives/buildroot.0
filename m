Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF213EEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2B941737;
	Fri,  8 Sep 2023 20:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2B941737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pourcvd0ZXQW; Fri,  8 Sep 2023 20:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57CED410B8;
	Fri,  8 Sep 2023 20:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57CED410B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0287B1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD608401F3
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD608401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHmxQMCfBZo2 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:46:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B576D401A3
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B576D401A3
Received: by mail.gandi.net (Postfix) with ESMTPSA id D59D91C0004;
 Fri,  8 Sep 2023 20:46:45 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:46:45 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230908224645.100409f0@windsurf>
In-Reply-To: <20230908082741.409005-2-marcus.folkesson@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908082741.409005-2-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694206006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn6HRavTRqSgszCZqF6VgFRhKF8XaLy7wuQgyTeoJao=;
 b=N0oif+cymQKPGetngg4JcrSa6aZD8FHhE9L0MQCzuNXMaOchf1z36NpATe0PGWTyW4v2rl
 H48mHix5VMAnWNUzm7+EU6VOTDlLlgEHLqn90HYgehlsKmaGW9K3G4E90/XxpjJ/6vQzhk
 sYt/DF0B/kCBD3zokI3qjx9wPjDH5Ch6S3+lBGMEWDUCwNKgYPEwWkZaq5HmKtXxs9Mpx0
 b/bv3Rj+D4zAAkvlcKPKVLmE8DVOxP2953bdT7QjQOxpySZW2GqcZkXI8dWbjOdYE2xqMZ
 1LOB3FG8czvnGoJERLmlEcCZXzwCg5alszMgbwLSELWDBP959zpC5pMQTBVsMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N0oif+cy
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Marcus Folkesson for
 package/criu
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

Hello Marcus,

On Fri,  8 Sep 2023 10:27:41 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

This should be within the patch adding the package itself.

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
