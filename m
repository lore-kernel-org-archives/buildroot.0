Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5113EEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E087D4007C;
	Mon, 10 Jul 2023 16:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E087D4007C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4Y_FFrUrDPD; Mon, 10 Jul 2023 16:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A204E417B0;
	Mon, 10 Jul 2023 16:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A204E417B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4777E1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2138D40180
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2138D40180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBYqsh-8PJeQ for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:20:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E5F4013F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15E5F4013F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:20:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8336760004;
 Mon, 10 Jul 2023 16:20:37 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:20:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710182036.227dc80e@windsurf>
In-Reply-To: <20230709092456.1035068-1-bernd@kuhls.net>
References: <20230709092456.1035068-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689006037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8odXo2RfWBeBObUUNNXW9EW0hDSZlA3iqSO6eqcXRLE=;
 b=oD9uI9abpdodkrCczjRaf8bRcmMwig5sfyszf2eKwsBPdF1HHuSEY+/YhZl1vWezsJ8DYj
 8FcNHeEl2Uh+wpBwciQnzNKtSLlfrLSTmRYyLBaI2BHko0ihCKKTb5Zd1aVPtc7ClyaZAN
 dXyb2fWXLJQTQ18qq6wATfOq8/Aben57CJvxeYaagNe7ASEyia8GIrbWfWjSoVeoLbUevz
 JjM6bZhYZO1TJ8suTad+ZewmUp9v7HvRNwpWQU40V6gvhOVsKkJrIRAFAW3n2x83fKmO5D
 1TjKdb8/HJwrelMPQsZ1JVYOOk6xv0U8TCYmP1ujQEpU0MyIdze2VZgM+PsA3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oD9uI9ab
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: bump version to 2.1.3
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

On Sun,  9 Jul 2023 11:24:56 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed all patches because they are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...rd-for-vec_sumsu-to-prevent-undefine.patch | 27 ------
>  ...ix-version-in-zlib.pc-when-building-.patch | 53 -----------
>  ...-sys-auxv.h-exists-at-configure-time.patch | 90 -------------------
>  package/zlib-ng/zlib-ng.hash                  |  2 +-
>  package/zlib-ng/zlib-ng.mk                    |  2 +-
>  5 files changed, 2 insertions(+), 172 deletions(-)
>  delete mode 100644 package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
>  delete mode 100644 package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch
>  delete mode 100644 package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch

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
