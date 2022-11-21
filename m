Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45361C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCFCE409FA;
	Mon, 21 Nov 2022 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCFCE409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWpMvW3YTYd2; Mon, 21 Nov 2022 21:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4026409E7;
	Mon, 21 Nov 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4026409E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50B611BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3962C60F61
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3962C60F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezvWAQcx-mlB for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:21:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED35E60F58
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED35E60F58
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:21:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D0EFE20004;
 Mon, 21 Nov 2022 21:21:27 +0000 (UTC)
Date: Mon, 21 Nov 2022 22:21:26 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221121222126.0096d82d@windsurf>
In-Reply-To: <20221116180452.700415-1-bernd.kuhls@t-online.de>
References: <20221116180452.700415-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669065688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/3djh4F6itaxSnBYrJTIv8t0ZqmGLQ52F6QIWOTlqY=;
 b=hofKlHpMQrIF0IIDpaqAUvkK9HqHb3znYCXKz3uDInDgmW2OtR95Sa+qiQd8+uTF3F9Qk9
 2xrxDb0V8O6l8wgztHcpf2o6eWVHA1da/8MXJmNmj17cKOfxVJnWt2HUOK4fQD1l96TzpD
 omXd2ONG/8ou6xHl5o1f1pJ2KfQQ9wrSJR8iZiJFlfeMYoGBbv1SgG7ZM1ga2hgKQbONlV
 h8eBo0/Ircxka04yZnyzWvirwdqz2jmHF21fhwGbM07V5yVWBScXnBpyvm2kkB3h0IYQmt
 ia0wE8WZHFrxtgK36rr3AudUlDJ9YDkVkLh7UMtdxg74VAIyy+d/tE0VJ316Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hofKlHpM
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix uClibc build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 19:04:52 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Moved the util/compiler.h include to util/macros.h due to upstream
> commit which added static_assert() to src/util/macros.h
> https://cgit.freedesktop.org/mesa/mesa/commit/src/util/macros.h?h=22.2&id=f1023571e8ce7ccb6ec7bc115240cb76aef3e5e5
> 
> Please note that this patch can be removed when buildroot toolchains
> are updated to uClibc 1.0.42:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=v1.0.42&id=03fbd941e943976bb92cb392882c2ff7ec218704
> 
> Fixes:
> http://autobuild.buildroot.net/results/a55/a55d6980faad8b5063f8f4f8b89467061d44a2ae/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/0004-Fix-uClibc-build.patch | 37 ++++++++++++----------
>  1 file changed, 21 insertions(+), 16 deletions(-)

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
