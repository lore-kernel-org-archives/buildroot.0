Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1E9C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 07:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B012E6102E;
	Thu,  9 Feb 2023 07:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B012E6102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pXQtGUy6mMr; Thu,  9 Feb 2023 07:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E863360FF9;
	Thu,  9 Feb 2023 07:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E863360FF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03DEA1BF3A7
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C48C360E7C
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48C360E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6G3hssT5p6tL for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 07:54:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE3660FF9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BE3660FF9
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 07:54:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD2BC1C0004;
 Thu,  9 Feb 2023 07:54:20 +0000 (UTC)
Date: Thu, 9 Feb 2023 08:54:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230209085419.29494fbb@windsurf>
In-Reply-To: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675929261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88ybyIPXYz3XgCAP6wbU9wYn1MYq2ET9mpGpP4uYQRs=;
 b=Rs4MPVVqRH7F61YXPe+W6hLvu1W08x0v/bVnzb/IQ+Q+SEDUUmh6c1EAPQs6MO+BmZD+VO
 yCpUssHrvMjwU16mFKEwRVGt+PR3facfPP9f8dEzWX3jQZkg4lVbCiESGVyBqTWvmL+l3X
 RK/5cm/ntaZ4pVLAahweQQ0Su/232R6Yvuc2y6oGHIXs1CwXgS4DetKTxWH1JDuG4TX4Pb
 /klitQfAiarwLRNL3JHlb0lwwBMvx2vLTb4v6dBpzGJ6IN4rQ23VPktcBYSHOADN1un3zI
 CfvQVvQzmp3o2njp8ZOzq/iI/n7J0kg5XvMZ1HZOZozJ3ngIK8Fh/nKjJJJSwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rs4MPVVq
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  9 Feb 2023 01:48:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package quickjs fails to build on architectures that don't support full
> float rounding. To support all kind of float rounding FE_DOWNWARD,
> FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD must be defined in fenv.h.
> Since package z3 locally implements this check let's make it global,
> rename it to be generic and use it for both package quickjs and z3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b6/0b67381e3643c134c92cbcd1c5dc258fd760cd7e/
> http://autobuild.buildroot.net/results/cf2/cf249a82c83d3c8503205f4c3c5859dd9d52afdf/
> http://autobuild.buildroot.net/results/9b3/9b37c6c55a5b468657af26ef9b57d4fe24d8fde2/
> http://autobuild.buildroot.net/results/4f1/4f13cf7d353260c6b8934dbdcf267bea884b356b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Apparently
https://patchwork.ozlabs.org/project/buildroot/patch/20221216221934.465323-1-ju.o@free.fr/
would also need the same thing.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
