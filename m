Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78EFC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 08:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 567EE4059B;
	Tue,  7 Feb 2023 08:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 567EE4059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qik4Rjdyw90k; Tue,  7 Feb 2023 08:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A327E4053F;
	Tue,  7 Feb 2023 08:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A327E4053F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1A481BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61441400CF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61441400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrG3x8JVPjY3 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 08:39:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EAA40053
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9EAA40053
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 08:39:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 185D3240005;
 Tue,  7 Feb 2023 08:39:25 +0000 (UTC)
Date: Tue, 7 Feb 2023 09:39:25 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230207093925.6cd7a7c9@windsurf>
In-Reply-To: <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
 <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675759166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJum5MMgA/XRC29whMJNTsndlQDq60nTGdehUHFulkI=;
 b=Ome31Ov2HEn+VWVztHSUIskISjR7IGlmQvsDRV4hA5RoEKH2CBfl98XMKe/ofODIw1mAYf
 ywSd3hMrBAWgAx7ufRUxv8F1h/9/eRLZAljs0pgQvfIjEHFJ2kro2OeAEhg6gUoiTAdNLy
 8aTuQP6ttjLjYYblBLaD8EK+Vx2hka3HCZNyq86AbS1S3p0NIS/TGqiDtRoCVHE0XJeey1
 E4oc4+zlw9XzBpNjjt32e/ZsDZXQDX56LTMW8VAyzWC7kEvwGYb+PDD6eOTpBNCnhC9vyC
 xgpbHBsbGpv95tl2wsw2Sbjg4A77YrRreoylsdhD25OQ1tGcfJd8plS984mrEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ome31Ov2
Subject: Re: [Buildroot] [PATCH 2/3] support/tests: allow top-level parallel
 builds
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

On Sat, 24 Dec 2022 10:18:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Running tests with top-level parallel builds can speed up running some
> tests, expecially those that have a lot of packages like the systemd
> init tests.
> 
> Trigger TLPB when the configuration enables per-package directories.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/infra/basetest.py | 2 +-
>  support/testing/infra/builder.py  | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Thanks to the additional explanation you provided, I understood better
the idea, and therefore applied the patch. I updated the commit log a
little bit to summarize the explanation you gave, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
