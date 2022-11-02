Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B20C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E22416DC;
	Wed,  2 Nov 2022 20:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E22416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIALzfTTh77v; Wed,  2 Nov 2022 20:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C70B416C5;
	Wed,  2 Nov 2022 20:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C70B416C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A241BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9842B8196A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9842B8196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hGjLz1mK6NZ for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:02:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6474481801
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6474481801
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:02:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4034640006;
 Wed,  2 Nov 2022 20:02:18 +0000 (UTC)
Date: Wed, 2 Nov 2022 21:02:16 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221102210216.4ae702df@windsurf>
In-Reply-To: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
References: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667419338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRwLwPvRdPgYUH3hGLPs1+pM61STWS6Mu353QhDeIvI=;
 b=JEBObBkwVdGhhjgq54boDxAw+gaO9SXTQr1PLUpSEWLLITxYiSVQarAyfhKtXyJj/9OCQu
 IqZ74zhQNIngbtRC6wK+O/Ks0WCDsASsBmhO/Qv4hcQ8e5juqupf2FlJyH9xhBy+Q734V0
 22DuTWiF4n+GHVYxcMclTTm94K/UZkXU3bV8BKlHSdn8J5+z4d3/COARvKYbIKv4oiTMYQ
 4q2gCy6XFliYvwr4ifUxC2ivAfuElzW34pj6alJ1lA1gpAVDJtHKRcE7YlnZbzag9QzVT4
 qvly44gWQIUrE0WgXlWFnXmSRsp4InPH2e1EKs/bVLN8peOFCXjwcV2uzlC5PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JEBObBkw
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

Also related to numactl and libatomic, we also have this pending patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20221024174911.75444-1-abrodkin@synopsys.com/,
which still seems weird to me.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
