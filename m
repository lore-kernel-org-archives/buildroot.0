Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A662C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124A6610AE;
	Mon,  6 Nov 2023 19:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 124A6610AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKEB8cte75Zp; Mon,  6 Nov 2023 19:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624D260B9A;
	Mon,  6 Nov 2023 19:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624D260B9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 623681BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355D741721
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355D741721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbzkbCZN9rx1 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:37:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18FC141720
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FC141720
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CA8FC0006;
 Mon,  6 Nov 2023 19:37:57 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:37:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106203756.561c6bb4@windsurf>
In-Reply-To: <20231105223454.432408-1-fontaine.fabrice@gmail.com>
References: <20231105223454.432408-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHk0quMOETtpE03W/BfYrYjlmKEfPPLJVM0gYT6imP4=;
 b=C0Om8s6h09YyUJYL8Eid3gFP92jf1xvCLFwVD4V3HzW/qir1TcqDEz5S5aIb3BRQso1ugV
 UVULEgM2NczSh5FyWsRQsm8oq4yG1llldXZzn3uYgGJBKX24hSgCagRWptiWvWq+BVZAUm
 mll6YDq49f2mS5+m3fGn8xjOC+P15/u9V4fSA8kwKl8zRJv8G+jQD00RxCqr/mjrlTc64S
 IEH8Akk9omFMCQXAnmw4HYFI7C0/sFIAQblMp5Y1/ZV4LwvUOAA2UgRtnb/heFDTPPaHjv
 QoWHBKBCjIMdoVn832g4agx1ISurIqXPwedNT2yHTEg5KibaVx20sbqQcBXjxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C0Om8s6h
Subject: Re: [Buildroot] [PATCH 1/1] package/jq: bump to version 1.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 23:34:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest release
> - Drop autoreconf as official tarball is now used
> - _GNU_SOURCE is correctly set since
>   https://github.com/jqlang/jq/commit/52d5988afb5999c71fd24484a93efefa2a9e9a8f
> - maintainer mode is disabled by default since
>   https://github.com/jqlang/jq/commit/54fef09ac39d6fb003367d65709349c43078405e
> - Update hash of COPYING (BSD-2-Clause for Windows build using jv thread
>   added by
>   https://github.com/jqlang/jq/commit/34182cca7babec086bbc93dec209275be896ca9e,
>   mispelling fixed by
>   https://github.com/jqlang/jq/commit/5cebe86a7b90e5718077c5e1d5c2165939d3f3cb)
> 
> https://github.com/jqlang/jq/releases/tag/jq-1.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jq/Config.in |  2 +-
>  package/jq/jq.hash   |  4 ++--
>  package/jq/jq.mk     | 17 +++++------------
>  3 files changed, 8 insertions(+), 15 deletions(-)

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
