Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B1BC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 13:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B09404BF;
	Sun,  7 Aug 2022 13:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B09404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u33vVdRZ7uJ3; Sun,  7 Aug 2022 13:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFF19404AE;
	Sun,  7 Aug 2022 13:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF19404AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B65571BF3CD
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91EE440475
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91EE440475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64q3ywYhsTT7 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 13:46:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7DD404AE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7DD404AE
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 13:46:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD437240002;
 Sun,  7 Aug 2022 13:46:27 +0000 (UTC)
Date: Sun, 7 Aug 2022 15:46:26 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220807154626.3dff1bf1@windsurf>
In-Reply-To: <20220804024126.1103291-1-christian@paral.in>
References: <20220804024126.1103291-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659879988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZOW5hXVn/clZ9fBaicYXyk823cP0iGOX2CQ7SSyyLo=;
 b=YOJRMXYdMt/KAEfDMl/SPPyF8gVxibxUT7tRoZABBmrtCnzkpW0rC4LQkxTVGAE0jQJNMT
 QNt70HCe39heX30vHHPt8otd+RZZYXlqdr0ts4vQEFfnXjdbjq7DTQKEwVIbwcRffdhnPu
 SjxVV0B8K1p1n8Q2aR/dfH/YF7PeLwV59vPJJEFSIvRvZO6Yu0WmFx8vjxOsfTDx6gfKYu
 VJ+t/UAmmu2CeqQ1Uww1Hb2as7rOG99hAUaKiP4+qw3GS1l/WQ9kCU+ytP5fW3Lv51uCJS
 rv9eNEsDig1i0Cbh/WNN+s3yJhAmuYxo3SMSKzegI5Pl4pL/y5+3LnCBU0OUkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YOJRMXYd
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.19
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 19:41:26 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Go 1.19 is a major release with changes to the implementation of the toolchain,
> runtime, and libraries.
> 
> Dropped patch 0002-cmd-dist-use-gohostarch... as it was merged upstream.
> 
> https://go.dev/doc/go1.19
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...explicit-option-for-crosscompilation.patch |  4 +-
>  ...use-gohostarch-for-ssa-rewrite-check.patch | 95 -------------------
>  package/go/go.hash                            |  2 +-
>  package/go/go.mk                              |  2 +-
>  4 files changed, 4 insertions(+), 99 deletions(-)
>  delete mode 100644 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch

Since it's a major release, I think I'm going to defer this to the next
release, and therefore wait until the next branch opens (which should
happen soon).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
