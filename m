Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEE4EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7682260F4D;
	Mon, 10 Jul 2023 16:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7682260F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqylXVT4sBBD; Mon, 10 Jul 2023 16:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A796260FD4;
	Mon, 10 Jul 2023 16:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A796260FD4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C12B91BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A80160FD7
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A80160FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM7ea8WP1L4C for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:14:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF3760FDB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BF3760FDB
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:14:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8764CC0002;
 Mon, 10 Jul 2023 16:14:12 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:14:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710181411.152ed82d@windsurf>
In-Reply-To: <20230709180249.3839609-1-bernd@kuhls.net>
References: <20230709180249.3839609-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv2UlGLBbWEw9JwTMS6vSc35zLEINklkaofwNxLZHBw=;
 b=pIvmzNeFwVBDArEHV7xQPdaefG2QsbK3fCCkMPgmt7ZqC62K8FwpJgoyVgm4U52NKUH14Z
 MK5rNdR55kOmTy7aUxdwfzahFx22fScMP1l+EDynBETWd0ylhsmF5XOha8JxmPx1Fydd4Y
 JrDUjjIVYFrDQfRIzPVZ5P6UMG6ayX51oOqlhGq3bmLVrme8ZgA8uqQ84xLKVB3e6CvOVo
 jk7u4rWmC+VdBkW8fVSteU0fGPH5KJewH5q5G3b66UU1xpWl3bPjAmNmbDHQSjgDzXG9E3
 fKMfmAJTkNDwfmWKAG77D3gaAB1pmZR1wiFi6WLBCl31i1R2j6MYMZLj5klFyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pIvmzNeF
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with
 kernel < 6.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jul 2023 20:02:49 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 840b5527466502f02b86c95f9bf95557d35c8571 added a patch
> from upstream bug tracker which fixes build with kernel >= 6.3 but broke
> the build with earlier kernels.
> 
> This patch adds additional code for compatibility with kernel < 6.3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c8c/c8c51153d3a61842d57a2a4be3dc75ec9964e41c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...atch => 0005-Fix-build-on-Linux-6.3.patch} | 40 ++++++++++++-------
>  1 file changed, 25 insertions(+), 15 deletions(-)
>  rename package/dahdi-linux/{0005-drivers-dahdi-fix-build-with-clang-16.patch => 0005-Fix-build-on-Linux-6.3.patch} (75%)

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
