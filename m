Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CBCC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9E440A00;
	Mon,  7 Aug 2023 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9E440A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiYexKCa_kGT; Mon,  7 Aug 2023 21:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92663410A5;
	Mon,  7 Aug 2023 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92663410A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 294361BF5F8
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E61F3408FB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61F3408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TKBlb1nBkeZ for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:34:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95E02408EB
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E02408EB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 883431C0003;
 Mon,  7 Aug 2023 21:34:53 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:34:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230807233452.0209f199@windsurf>
In-Reply-To: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
References: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691444094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HQ3zu7EDEUU3oyWM9BWvbiUiETi8Fz3I03QolGikyk=;
 b=QVpV07pBvOGeMN9TSxnfRW1oYIKeuzva8vnhs11gUXzMF4nol3TBLIHDYSEq8J4csZRiPm
 N+L/adldNI0nhJVve8vPQocVA9IG8ctAyrmuU2UIR6kK6bb0LPkTgNIeUswNsfhjxC42Q2
 8HxgUSHx4LlDrrPdUG2EBdSCdGEQtYj8hRzu2qJG62fbupiOBuODQvs9mLXg5244VRbt5G
 hcEIDKt8Q0Mqm5HO6uXeLWh8YL7eU4xngJI8tDl6XayaQcE0Fgoa6wObq8QHfRP9m61JnM
 hi8W1oQMtZ2Jw++fJISfiCb37eUMCYfoQ2BavCmDehpuWuvVPyWU3s66M8ZvZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QVpV07pB
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 23:51:26 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> libheif package fails to build for the M68K architecture due to a binutils
> bug that leads to:
> Internal error in emit_expr_encoded at dw2gencfi.c:215
> 
> Let's add binutils bug to avoid to deal with architectures in packages
> when a binutils bug arises. Let's instead deal directly with binutils
> bug number.
> 
> It's been reported upstream:
> https://sourceware.org/bugzilla/show_bug.cgi?id=30730
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

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
