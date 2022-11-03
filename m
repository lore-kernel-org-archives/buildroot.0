Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E375C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A03081E89;
	Thu,  3 Nov 2022 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A03081E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dffZRaFatlVk; Thu,  3 Nov 2022 21:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D358813DC;
	Thu,  3 Nov 2022 21:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D358813DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1761E1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F412B40BEB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F412B40BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDFv11vfxoj2 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:12:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD3B40BC0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCD3B40BC0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:12:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEA0AC000D;
 Thu,  3 Nov 2022 21:12:45 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:12:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103221244.17f40c1a@windsurf>
In-Reply-To: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
References: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdsy6PWj1ZfsqKWNqEpz6+x2KcNLOMQ/fqB236IEm3Y=;
 b=icaV1crcwyXUDBxCvuFbcSOBKaB2NtBBm0NPvLjBx/13IXyJcwNbhHaFYuC1Zqtwjxx2cq
 q68Rs88shiKQ4PmDBS9bTM3PsoYo8YgcEWMFkUJ2m/59d58pn1fDr7I2AUxdbZyqnpdXO5
 X//ece+h79Y8BTjfR6yJppmTZ4/9e8rQ5cwod3W3tnNI7zsZcPVJbnFTGGFvV1FeWUJyIC
 /hGcO1DmIGprTB2Z/nAugagH7TZbFMiacIFfzFeMbmH5MoIX6jUUKhbIQFeoD7qaAWOB9J
 e2RklPM8v3irZCv9LxfxxigzCz67DOhRcSVEhb6oZxIwQNxulnReGmMLaXY3zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=icaV1crc
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: link with -latomic if
 needed
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 13:35:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 2.0.16 in
> commit e9bc980d93a189a16e7320bd254b906c87ca9f87:
> 
> /nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
> libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a92c1c60518d3fe08f3f808f9cc812031e85a4e9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-link-with-latomic-if-needed-again.patch | 41 +++++++++++++++++++
>  package/numactl/numactl.mk                    |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/numactl/0001-link-with-latomic-if-needed-again.patch

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
