Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD77C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E70A8204B;
	Sat, 18 Mar 2023 21:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E70A8204B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZncUpmcZr6Q; Sat, 18 Mar 2023 21:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9FA81FBF;
	Sat, 18 Mar 2023 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9FA81FBF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 764F31BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 502604031C
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 502604031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEnh9tTY4nQI for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:42:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B33400B9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9B33400B9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:42:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72F391C0004;
 Sat, 18 Mar 2023 21:42:03 +0000 (UTC)
Date: Sat, 18 Mar 2023 22:42:02 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230318224202.7c40e3ca@windsurf>
In-Reply-To: <20230318123217.4940-1-fontaine.fabrice@gmail.com>
References: <20230318123217.4940-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679175724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5v8qmcwkGBTAiPWGpnk8VCq5vXm9D6hmQ+w2Qz367C8=;
 b=YNzyByYgdZkaCq4oTauK+Gy1h81bY//L35blc5SwRsPVrd9oZjSli//I+qFTR0b1kgqxez
 HZMDdpXr35pR6viRn4aaqL2Xg8qowTGwnhbOvBYf3H1G/AMOcFFjpTSsulOfK4mayVYg8K
 HNHI8A3kldVT6To7hvFQqqXRKiD+MriXYep1b1Ff9IW5pvBu0+38/Fonrl9Yu0Jfx7d3wP
 LRq9qjtOm1My3RsWz4N+2ViuDu35cosia+HKh6exLMMXRaGi1PwEPRx9tWf0VAP0QrYI1G
 BxzoYIpYDBZQnbdVxknAA7P1To6oAiDdPgdpUCs4jJDQgiw9pJoJ3VUXJ4dnJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YNzyByYg
Subject: Re: [Buildroot] [PATCH 1/1] package/snmppp: security bump to
 version 3.5.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 Mar 2023 13:32:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Improved (security): Avoid timing attacks on authentication
>   verification.
> - Drop patch (already in version)
> 
> https://www.agentpp.com/download/changes_snmp++v3.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-build-with-libressl-3-5-0.patch  | 39 -------------------
>  package/snmppp/snmppp.hash                    |  2 +-
>  package/snmppp/snmppp.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/snmppp/0001-fix-build-with-libressl-3-5-0.patch

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
