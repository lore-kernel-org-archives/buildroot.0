Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB8C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A853A60B63;
	Sun, 14 Aug 2022 10:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A853A60B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rx7IQBdHcrS8; Sun, 14 Aug 2022 10:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0836076A;
	Sun, 14 Aug 2022 10:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0836076A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61C7E1BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D2856076A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2856076A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWDcmWcukWg2 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:10:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10835605AD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10835605AD
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:10:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC69A20005;
 Sun, 14 Aug 2022 10:10:03 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:10:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814121002.3ccf23dd@windsurf>
In-Reply-To: <20220813113114.986655-1-fontaine.fabrice@gmail.com>
References: <20220813113114.986655-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSx/gPkqAtz32kLwrX/cz38BOoDsPZssWGWpl8KcQCQ=;
 b=C3hoJp8Mup3qvsnAj9L5kMdRiQs7e0MeH/u5o7Qg+NptlHAoY3NdqWKfrz4Qd7jwAKHUoW
 sDefp+en1xrdYC/ZA6jW7eUddthU+O/nI44ajfLXsSPzI7bSKV0TbfnfBmX1bRhv48U2cf
 nL4ReMLWw/WwnD2m4MZWTFoHN7AoSFrMTNIxTfW7K4I550PCjatzvAQgJ6XNJmeshSKMfp
 6Kq5n1SGr/+FFcW56yzwnO/KRGFreGEhkM1a1rc18Je8id6CTwuwFdSV40xcHV25VRCDiC
 6ZV8ly8gAqbIh71EqwFAtOYJwHl4KtGJWrmIlrV5SrnbcZa1BXsfHNMRQlhH8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C3hoJp8M
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/jack2: add host-pkgconf dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 13:31:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since commit
> 69284b6700e5f45e25a583e87b86ed1eb95038fd:
> 
> Checking for program 'pkg-config'        : not found
> The above check failed, but the checkee is required for --alsa.
> 
> Indeed, before this commit, host-pkgconf was pulled by libsndfile
> dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cbdc251980f5571f75281202ebffc04ddecbf28d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update commit log

Applied to master, thanks for having researched the root cause!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
