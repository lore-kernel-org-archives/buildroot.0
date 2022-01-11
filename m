Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DC4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE9F160F20;
	Tue, 11 Jan 2022 21:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfUPE7kuZUMt; Tue, 11 Jan 2022 21:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8AE60E73;
	Tue, 11 Jan 2022 21:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 700331BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD5D41606
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJxXUd4hYnEs for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:00:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AA8141602
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:00:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5566D1C0005;
 Tue, 11 Jan 2022 21:00:11 +0000 (UTC)
Date: Tue, 11 Jan 2022 22:00:10 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220111220010.75401b91@windsurf>
In-Reply-To: <20220110173640.1748895-1-fontaine.fabrice@gmail.com>
References: <20220110173640.1748895-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: disable neon if needed
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
Cc: Julian Scheel <julian@jusst.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 10 Jan 2022 18:36:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since commit
> bf4cf9de833e2d571d98d1ca935ea08a3468e463:
> 
> In file included from aria_simd.cpp:18:0:
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabi/4.8.3/include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
>  #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4fd947c118174a4fad62cbed18816f02d39ec25
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cryptopp/cryptopp.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
