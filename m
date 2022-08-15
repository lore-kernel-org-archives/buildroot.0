Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA64C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E8482423;
	Mon, 15 Aug 2022 12:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E8482423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSAQerJ8TmPx; Mon, 15 Aug 2022 12:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4089C81AF6;
	Mon, 15 Aug 2022 12:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4089C81AF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 734D11BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E84260BA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E84260BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U66mEh0rAAoJ for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:36:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BB260590
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44BB260590
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:36:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 423351C0002;
 Mon, 15 Aug 2022 12:36:14 +0000 (UTC)
Date: Mon, 15 Aug 2022 14:36:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815143613.6d798a30@windsurf>
In-Reply-To: <20220809172257.2058928-1-fontaine.fabrice@gmail.com>
References: <20220809172257.2058928-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660566974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4E+Epm09Be5tFjc+b1FBxwl2sXvKE2hXQIGYBGW3EsY=;
 b=Te8wAZKo/wiHFXlSd8zUovUW74/VolvVfgX7vdzR10sMSQUhG7Jipgai4tQbdeWo8r6O5x
 GxLkNUICB1Dtpw9taOnGxdIRe4I+DxvNquznRPpsqNAISeq9/1RYNku+/RvXGoyrHnUfXU
 3oSyZt/mcXAHcWidmPrDudnd5t1oirWCis+Daj4RzRwk+Gw0EKpUJUnmQNcX8ZN3m+LV9w
 llqRFyeGTv2nBEAGbNiI1xenQLfmOy6JV6Ofjjuq+kP3M0ourW9gu2oKhCn1CVE5/QnxAe
 MRAQ/CmrTkCG57+PxNMN9pjcu5ZC+Gqe6eqLehtod4Lvaji2+frgjo0syQTDmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Te8wAZKo
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: fix build without
 threads
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 19:22:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since bump to
> version 9.21.4 in commit e4c81885ed487ccb511c4a4c4f8a8c1aa5180f78:
> 
> CompactDisplay.cpp:13:14: fatal error: pthread.h: No such file or directory
>    13 |     #include <pthread.h>
>       |              ^~~~~~~~~~~
> 
> For an unknown reason, previously drbdmon (which unconditionally uses
> threads) was always wrongly disabled:
> 
> configure:5846: checking whether /home/fabrice/buildroot/output/host/bin/arm-linux-g++ supports C++11 features by default
> configure:6141: /home/fabrice/buildroot/output/host/bin/arm-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
> configure:6141: $? = 0
> configure:6149: result: yes
> configure:6824: WARNING: No C++11 compiler found, disabling drbdmon build.
> 
> The correct activation of drbdmon could be a side-effect of
> https://github.com/LINBIT/drbd-utils/commit/b235e83409b0daf5a3454cdc83aec2e5b335d38e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2cc7d771176ccde7539cc93d83e9621d9ada8357
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/drbd-utils/drbd-utils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
