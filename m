Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D829CC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9340760B00;
	Tue, 25 Oct 2022 18:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9340760B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eum907r2N9C3; Tue, 25 Oct 2022 18:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF4F760A70;
	Tue, 25 Oct 2022 18:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF4F760A70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFDF01BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E2AA4012B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E2AA4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSBiAIVzJQL3 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C2484010C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C2484010C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A25BA60007;
 Tue, 25 Oct 2022 18:23:31 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202330.64f8e443@windsurf>
In-Reply-To: <20221023214220.70941-1-fontaine.fabrice@gmail.com>
References: <20221023214220.70941-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nBpWSPY5cFe6/ofOlLqbUELEqKI6fPvCWgsvGVlspk=;
 b=Otm35QvQvKQVdBRffRp/gP/3ugj4HwqrEN9bLmP2ERpUkMNT/unU3KFaV71E1enFYBGIWI
 S+xwu8ghFIWcfNsXoQws4tPPEJr/2NTG+tWy6dFF6+zzjnBL1VhywzI/fkXNrYUrgeCFvP
 30c8ImY6WWWy9rqeLyHd9KnRNlqNCYBooVkw3e+mofW11QSrQeZJ5UCu5e9zfkxAyyUFZo
 XDO8bUszLE441ZRTBdYXI3QiOGCtUmjNqQMlM0dSmxQ3vq8mt972QFAVz0proFMtpWGMQb
 9h06aFisLioZ6HLo2z+fvOcb9Fs7Da1XqmpVJ1Jl8Mvk1KfSLiHvcBk9Pqn4VA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Otm35QvQ
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.12
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 23:42:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of LICENSE file (update in year with
> https://github.com/esnet/iperf/commit/76bd67f6e90e239a7686202d2b1b595159826d24)
> 
> https://github.com/esnet/iperf/blob/3.12/RELNOTES.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iperf3/iperf3.hash | 6 +++---
>  package/iperf3/iperf3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
