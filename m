Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C7BC001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2E640070;
	Fri,  4 Aug 2023 20:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2E640070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mvLBjKWT8rl; Fri,  4 Aug 2023 20:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457124194D;
	Fri,  4 Aug 2023 20:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457124194D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05CF71BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 268DB40083
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268DB40083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RLs93WDMZzy for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:28:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD6F7418D0
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6F7418D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id BED9C240006;
 Fri,  4 Aug 2023 20:28:47 +0000 (UTC)
Date: Fri, 4 Aug 2023 22:28:46 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230804222846.0d1b93c7@windsurf>
In-Reply-To: <c5722386-f614-e42e-72e0-79728276fa42@benettiengineering.com>
References: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
 <48bef18e-b43b-cc91-6ce4-e214ddf300f0@benettiengineering.com>
 <20230804221815.6fbf8bc5@windsurf>
 <c5722386-f614-e42e-72e0-79728276fa42@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691180928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cvRXnOJL1TVgqie6tz2uqaZjaDLsiCJTDKvxxozKaE=;
 b=RAHo2mJjkPTpPpHkHrAWDmv7HncVPn3d2+qc4JzmB7xq+gEmqgnTqahmRLdMpV45bs1Kj7
 dkTUVY6SCUO0cscntlCmTKOz+4iPUK30HESBsGEtJ2RsLIkz5Z7CY0bDRceiq5vNeE1Hek
 e8xSkbdmu4G2aIG58FvFMmrGC6lNOJ1Rtrp+yk6QzMK/o/Iw4mNOG1NILBlihq2GlzkMzS
 COag9fXeXajMLnduwsBhPkfISdgvt926ItHQLoxiLfzTQYwJ3CXsi74U3vsrRct2BuLgbh
 SPYMy7k0wXdQ2AlIEzpmouzDlTWonOiNmF0cAPEl2XNGU+tHQAj0B17IUNpBkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RAHo2mJj
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.0
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

On Fri, 4 Aug 2023 22:25:38 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Yes, I've already done it, I thought I had to point it anyway on Mailing
> List but then it's useless because you pick patches from Patchwork in
> the end.

Absolutely: if you already mark your patches as Superseded in
patchwork, then there is no need to say anything on the mailing list.
Your patches marked as "Superseded" are no longer part of the
maintainers "TODO-list" on patchwork, so we will only consider your new
version/iteration of the patch.

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
