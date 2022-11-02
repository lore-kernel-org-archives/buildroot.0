Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E13C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 11:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A35D813F8;
	Wed,  2 Nov 2022 11:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A35D813F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFb8lu0VVnJt; Wed,  2 Nov 2022 11:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5732C813E8;
	Wed,  2 Nov 2022 11:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5732C813E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912F91BF831
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 11:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759BE60BD3
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 11:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759BE60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pnIUy8UwNG4 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 11:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6568860B12
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6568860B12
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 11:44:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 2BA6C1814B9; Wed,  2 Nov 2022 12:44:36 +0100 (CET)
In-Reply-To: <20221101222033.407401-1-thomas.petazzoni@bootlin.com>
Date: Wed, 02 Nov 2022 12:44:36 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <51-63625800-1-2f1cf980@54001900>
User-Agent: SOGoMail 5.7.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1667389477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=Z36rzx0cIusm2w6sXQQWlfQDzSfybfvIt+Hdi5f3m+8=;
 b=S+h6ObLxIlJa132qddmbrcWqzjRyEFp8ZPNHfI2EeNoQwEjbDpLEn2UADzagDXgEhr8iTy
 Ov0d7nSTO3+kha3EGJvi1gzeZihybhpCqdISB4N0gjPde8FlQdTHOHuf22c7IZisa/4IeP
 vw+SOaoR9ZBtierQ9DoIV6NMcFdnhWc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=S+h6ObLx
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_21/21=5D_configs/pine64=3A__remov?=
 =?utf-8?q?e_defconfig?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Tuesday, November 01, 2022 23:20 CET, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This defconfig has been failing to build for several months, with
> nobody stepping up to fix it. It's time to drop it.
> 
> See
> https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
> for a notification on August 6, 2022 about the issues with this
> defconfig.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499154
> 

I submitted a patch for this as it seems to be having the same issue as the pine64_sopine defconfig before..

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
