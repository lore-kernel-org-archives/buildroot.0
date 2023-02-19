Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A8C636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6119B40B72;
	Sun, 19 Feb 2023 21:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6119B40B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88eShkUuHx8l; Sun, 19 Feb 2023 21:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C2D40B48;
	Sun, 19 Feb 2023 21:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C2D40B48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC3961BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A248C60E5C
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 21:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A248C60E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ofZS0HLMxub for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 21:02:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D78260E57
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D78260E57
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 21:02:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 041CE40004;
 Sun, 19 Feb 2023 21:02:17 +0000 (UTC)
Date: Sun, 19 Feb 2023 22:02:17 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230219220217.6b34a65f@windsurf>
In-Reply-To: <20230218114837.1761715-1-buildroot@heine.tech>
References: <20230218114837.1761715-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676840538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq2qFBtCJkAJu2iYMMoC2aOPeM7u9sDUlg6kQUQPY0w=;
 b=bIvhbfCWcSn8y6M6Sh2bcXA6N30o7ZoPyQ3omKMlGC+fXpt89Aw8/9V857FDMXmrcMTAos
 qES3L4D+QDIYoaC9t3JT/P1o+afEiGCJixpwPwHDhseiAF+a0wX1t6aJbHnV+esFNNJTG8
 dbb6g8HvdzxnWsNi4KVjVREk4X+r71d06n4xcrJsDOFkGd+on7gAT7mrTMHp01OAvPFtiw
 xcH7RzEloYXULmUBlRPGNdeIC7qumHebGvOlXaeQ9Q3RYE4/Ap6LK55R3uKzlFQgtAR0XG
 sX8vi4WNYevBUgRW2ohrazT2sy/y+U27AVmef4i3Dqf3UUNvDIgWgDq3SZcrMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bIvhbfCW
Subject: Re: [Buildroot] [PATCH] packge/libabseil-cpp: bump to version
 20230125.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Sat, 18 Feb 2023 12:48:37 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> libabseil now depends on c++14 and gcc >= 7.3.1 [0][1]
> 
> [0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
> [1] https://github.com/google/oss-policies-info/blob/main/foundational-cxx-support-matrix.md
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
> 
> Note:
> I'm not sure if the BR2_TOOLCHAIN_GCC_AT_LEAST_7 dependency is sufficient.
> But I don't think we have a more version specific Flag available?

We don't have more specific blind options than 7.x, 8.x, etc. to
describe a gcc dependency.

>  package/grpc/Config.in                   | 6 +++---
>  package/libabseil-cpp/Config.in          | 6 +++---
>  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>  package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)

I'm afraid this is not sufficient. Indeed, you need to look at the
reverse dependencies of GRPC for example.

So, package/falcosecurity-libs needs to be adjusted, then
package/sysdig as well, and also the BR2_PACKAGE_COLLECTD_GRPC option
from package/collectd.

Could you have a look into this, and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
