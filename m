Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF0C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 10:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE514415E9;
	Sat, 12 Aug 2023 10:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE514415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gD0C1jB6HN4Q; Sat, 12 Aug 2023 10:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26DA4160D;
	Sat, 12 Aug 2023 10:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26DA4160D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 155D21BF288
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F1D415DF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F1D415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uUF1dqhGRwb for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 10:48:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D67D40318
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 10:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D67D40318
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13F24E0003;
 Sat, 12 Aug 2023 10:48:13 +0000 (UTC)
Date: Sat, 12 Aug 2023 12:48:13 +0200
To: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Message-ID: <20230812124813.11d786dc@windsurf>
In-Reply-To: <20230812010118.2654653-1-drinkcat@google.com>
References: <20230812010118.2654653-1-drinkcat@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691837294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HD56LYGhjSAUytNiMKoocPu36o3u56vGCKweJ7Sgcc=;
 b=FHW5fnZSWFIdEvQJkGrpja1T5ExywqDp7Q0AEOedZr9oKtLD/ewIEuvPhJpVwxtCMYN3ji
 QqzCgtCyjjdYaK6En6E4aGZox8/OIHzGPHq6jvgLbwIrzTi7et8E2v3qvi4uSidXlCQ2bv
 DBwQzAO7Hc+tGGtG14nn7GPyPm2ZvkogoYNZBkoWTWmUJCROMnxHhJWF2JDEvu4BC+xMxA
 6AWiKp24R9emr2d1P4/d9GnvYfs0i71jpp/onou8BEDo9brAJFkDzckW7+bK83WvreGQUk
 0tDSleCrtxL3uebuEv4AGFSBWeWubWWHHhtSGHMh1NjNrWwQ37Op76TBmCFqwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHW5fnZS
Subject: Re: [Buildroot] [PATCH v3 1/1] package/screenfetch: Add upstream
 awk detection patch.
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
Cc: Nicolas Boichat <drinkcat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 01:01:17 +0000
Nicolas Boichat via buildroot <buildroot@buildroot.org> wrote:

> screenfetch requires an "awk" implementation, but upstream would
> only use an executable called "awk": pick up upstream patch that
> can autodetect awk implementation, so that "mawk" can be used.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@google.com>
> ---

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
