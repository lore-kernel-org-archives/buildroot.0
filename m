Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AC0ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E141400FD;
	Sun, 30 Oct 2022 20:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E141400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyER9VGPSgrZ; Sun, 30 Oct 2022 20:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A45C3400EC;
	Sun, 30 Oct 2022 20:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A45C3400EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60C341BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B3C58100D
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3C58100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ity0ZWhXbNHi for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:04:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D3680FB6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9D3680FB6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:04:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71479240002;
 Sun, 30 Oct 2022 20:04:22 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:04:21 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221030210421.6c2777b2@windsurf>
In-Reply-To: <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
References: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
 <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667160263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4hkTe0m4EM0aJnl3gIbLVtVL5B4aGkK3qC1UbOplyI=;
 b=Dl9rPCFniDyaoSP79m0pqN/MpTvERrLiZWlO8u3Sdt5hHPtMHkkFWJ4oED6ooKkC+Thh1U
 +88MdWKPmV7k+km0FFmDx+WqNSf0uNQT9kqCm/C3zQ/6xttK+8yQwMrh+Tc6hwSwfyuL59
 Kr14731K8ALasTA66R814jAFIQheL+LOtgE4BuRBqW59C6VC1FGxnQzuSGGD0Q5ekDq12h
 H+tOiDlTqDepYjNEwfE0Nf5dtCgX6GwZE6j8dSz0DJrBDBOLqO0diW8aMGJnz7TwKxycJu
 /Xm7B1rO1VkVm6S1P/C+4c9hf2eeYq8J3gcBVwmSDkfPaj5u2UgQsvrHedliaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dl9rPCFn
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to
 rtl8188eu package
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 22:18:04 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

However, please *always* resend complete patch series. For PATCH 1/2,
you had sent a v2, and then a v3, and for this PATCH 2/2, only a v1 was
there. This is *extremely* confusing for the maintainers.

So when you need to send a new version of one patch in a patch series,
please *always* resend the complete patch series, and mark the entire
previous patch series as Superseded.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
