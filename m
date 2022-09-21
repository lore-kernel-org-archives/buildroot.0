Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A02C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD55C4051D;
	Wed, 21 Sep 2022 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD55C4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zqeyT0plLVe; Wed, 21 Sep 2022 20:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5BEB404B1;
	Wed, 21 Sep 2022 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BEB404B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EAD91BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DCBD60B9F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DCBD60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4MTiwbcKyxR for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0914860AD0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0914860AD0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84E761BF20B;
 Wed, 21 Sep 2022 20:09:27 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921220926.1a974b34@windsurf>
In-Reply-To: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
References: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjHwUpnZPOC6atMEpziR4QMoXrg+HPH905GuyWBQHWQ=;
 b=IM0ciggTOWLj4ec/bPYzGdw+0lqwoZDz0F3GFJ/VGnpZD/fSMqaGHUaiey97AsNkHOm1R8
 YiRiPfpDHLDIT3PWjwLh3bxqHdZfJDguArh/BtfIHn7riOf2N033Rp1nT3uJKQgHMEomqJ
 DzeZUTttpFcCtuoyxgQnh42IVyA6wjasj688OxMPb+q8j35Jr5DhaopE2ZUaLg+8hl9GVV
 XPeeCU2clkt/OdaCeYJMvezuLC4dTKxyW2HcrAXnG6A0joegD9ya3SBPmFltCbCTmye3aH
 w7xy8+rwuzJ7rLwbhOW6NT75wKRTg3If335VRFra1swoCU7Xvh3gfKH6FwO7Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IM0ciggT
Subject: Re: [Buildroot] [PATCH 1/1] package/popt: bump to version 1.19
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 23:17:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version) and so autoreconf
> - Update hash of COPYING (license adjusted to use the original, straight
>   MIT variant:
>   https://github.com/rpm-software-management/popt/commit/dcec86df3cfc96d3dd3a3e9f7f1086b768d2d88f)
> 
> https://github.com/rpm-software-management/popt/compare/popt-1.18-release...popt-1.19-release
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../popt/0001-add-libiconv-to-popt.pc.patch   | 19 -----
>  package/popt/0002-Detect-glob_pattern_p.patch | 53 -------------
>  ...-configure-replace-deprecated-macros.patch | 76 -------------------
>  .../popt/0004-fix-build-without-wchar.patch   | 53 -------------
>  .../0005-fix-build-without-mbstate_t.patch    | 68 -----------------
>  package/popt/popt.hash                        |  4 +-
>  package/popt/popt.mk                          |  4 +-
>  7 files changed, 3 insertions(+), 274 deletions(-)
>  delete mode 100644 package/popt/0001-add-libiconv-to-popt.pc.patch
>  delete mode 100644 package/popt/0002-Detect-glob_pattern_p.patch
>  delete mode 100644 package/popt/0003-configure-replace-deprecated-macros.patch
>  delete mode 100644 package/popt/0004-fix-build-without-wchar.patch
>  delete mode 100644 package/popt/0005-fix-build-without-mbstate_t.patch

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
