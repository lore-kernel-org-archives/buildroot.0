Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAABC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A169B6077D;
	Fri, 10 Feb 2023 22:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A169B6077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukkLV_-DbfSc; Fri, 10 Feb 2023 22:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C583A60C12;
	Fri, 10 Feb 2023 22:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C583A60C12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E67C1BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFCA181F04
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFCA181F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5z9V1JL0WWK for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:27:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915BF81ED0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 915BF81ED0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:27:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 738991C0002;
 Fri, 10 Feb 2023 22:27:14 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:27:13 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230210232713.05954d68@windsurf>
In-Reply-To: <20230106210133.28803-1-ps.report@gmx.net>
References: <20230106210133.28803-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676068035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsTY4HPxlTaBeDKryrW5hSsHNIAyoFN+5wNM4TF2Qbo=;
 b=Ve02cyb0Aq8bK6E1ndVvma45U5KQB6sPIxNtbcMu4sOX1qFzuQyID2CRmxWidcu3kto+Ew
 VSrim37Dhq23CE7cAUkZ20oRWaaeyjkTDnzo9WYz418+OddzsfOoUPx7X/KLzxE2Iwrnv7
 ny98LbW6asWzdvD66UgFRQnQMVtW84b4tDhQQToMhRxd3KoDhIthuw2WqecTdas8D1jAt+
 osIIQXR0MdaoX8Y7kBLqMbk9Chjf74oYAFFfHxSak+oFTaIxO0TwlKeSeLIm5JmoCwIppB
 VlvUQbEKOPQzlr9X0OhWIMKBQFdiqI7OQspnnB2Jigsfi6V/TQAQxss9E3x2Eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ve02cyb0
Subject: Re: [Buildroot] [PATCH v1] package/gtest: drop patch adding debug
 'd' to library names in pkg-config files
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

On Fri,  6 Jan 2023 22:01:33 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - drop patch adding debug 'd' to gmock/gtest library names in pkg-config files
>   (not longer needed since gtest version bump to 1.22 ([1]) and upstream
>   commit 'FIX #2174 -- remove `DEBUG_POSTFIX`' ([2]).
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb
> 
>   .../host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=a336b731af5979a25213b33c5840de6d1ed88bdc
> [2] https://github.com/google/googletest/commit/ca3ffd90f2726f6c0c6e790f05c7c88491a16466
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...test.pc-gmock.pc-library-names-for-t.patch | 62 -------------------
>  1 file changed, 62 deletions(-)
>  delete mode 100644 package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch

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
