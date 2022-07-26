Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D2C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D67CE40145;
	Tue, 26 Jul 2022 21:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D67CE40145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZpK1BopKBoI; Tue, 26 Jul 2022 21:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB2AB400E5;
	Tue, 26 Jul 2022 21:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2AB400E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE3881BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99739402B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99739402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAfHDZVUtIlB for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:41:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0322B4027D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0322B4027D
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:41:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 341141C0007;
 Tue, 26 Jul 2022 21:41:36 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:41:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726234135.3a89b278@windsurf>
In-Reply-To: <20220517192439.1034654-1-james.hilliard1@gmail.com>
References: <20220517192439.1034654-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658871696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJ5LiuBPhXcpnoca+0PXJV7/l/ez54c7axisQiDo8Ss=;
 b=aO+qCyrCjoG+tRMDlbCgMF1lEjEcCvnaURfJqj7xDvFbDFJ/vL3pS42xnPsjRqASlKeWi7
 AQvfh7UurtylF/9V3I0OytCOk0sEPajQ9iyNIXfjAqBEhZ2hezNDfJtDd3R4lrSoNDKEfL
 cjcf0km8Rpxpy2Jm6LMuvl3aZf8lSnLT95XTG1bOO5sEI7s6O+og+VT3IZeazRoxu/q6Ck
 Z50lLSXEd/bGbn0SxfWsOKwnA0Am2L9KR8EYuWhT9kqnyuf3aLGHBUpB6DWoQ8hViLNPe/
 1wjEusKvggPBIaTJTwYeoX8/1fVWMO4sb6d1xoMAQCxgk5mDk+/ob00KBU1wyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aO+qCyrC
Subject: Re: [Buildroot] [PATCH 1/1] system: generate and set C.UTF-8 locale
 by default
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

Hello James,

On Tue, 17 May 2022 13:24:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Now that glibc/localedef supports the C.UTF-8 locale we should default
> to it as software like systemd generally expects it to be the locale
> used.
> 
> This should in general reduce the amount of locale related
> compatibility issues and is what many distros have been using for
> their default locale for quite a few years so it should be a well
> tested configuration.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  system/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Based on the feedback you have received, it appears that this patch
needs to be revisited to make sure it makes sense and works not just
for glibc, but also for uclibc and musl. Could you have a look at this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
