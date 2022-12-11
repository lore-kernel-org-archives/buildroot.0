Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E3681494;
	Sun, 11 Dec 2022 17:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E3681494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Js5UOpthp2gI; Sun, 11 Dec 2022 17:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8348145E;
	Sun, 11 Dec 2022 17:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8348145E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1AF1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F784091F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F784091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZAfnvuzbMTc for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1182340863
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1182340863
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:06:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4926060005;
 Sun, 11 Dec 2022 17:06:06 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:06:05 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211180605.2482e589@windsurf>
In-Reply-To: <20221206044120.2803159-1-james.hilliard1@gmail.com>
References: <20221206044120.2803159-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9JiksmgLlb2bYGMd85EHpz0lN0Z5ZWwXp6xP42A1yQ=;
 b=AImxh8fYlt9lDuwrxhgq1ngQwVrWFmIDG/o7yVyj5PZmgnskDYggvXNO94uXuHTfL1OB4S
 n4mmRpUUCwBoykSzBlTQG+AGQKUzLwLYQ8ehCHlDWbk7XR3XLmyzFhY2DUbCT5Gnks9nEn
 ldKfv/h3fZJb42tHOm9PZWi4YnWHgTRNYIxOXccSPl2v+GIfBwYbl6BhdCLm3rjJjdH0pT
 eq96ThBcEySNDpvZO3AoJjv37A++Rb9mAs+puai9+tImg/rL2VBIbXe92FcgCCxPitB/iE
 4XTrEyGucGiSff4MZvQ/Qmguu/YDG/mMCEPUUtMztIxPUrGKD5qoXB2gqPkBdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AImxh8fY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypa-build: drop
 host-python-tomli dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Dec 2022 21:41:20 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The host-python-tomli dependency is not required on python version
> 3.11 and newer.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypa-build/python-pypa-build.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
