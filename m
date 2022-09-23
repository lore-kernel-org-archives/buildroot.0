Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC5CC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88947841CC;
	Fri, 23 Sep 2022 21:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88947841CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZuHpi6gMXWR; Fri, 23 Sep 2022 21:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD32841B4;
	Fri, 23 Sep 2022 21:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD32841B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CFB1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E86B184185
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86B184185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bt93Mq_r1OQA for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:32:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C42E84264
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C42E84264
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:32:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 711B1100004;
 Fri, 23 Sep 2022 21:32:05 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:32:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220923233204.1c698867@windsurf>
In-Reply-To: <20220923175132.3174421-1-aperez@igalia.com>
References: <20220923175132.3174421-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EppOgMFuWPons6OlVR/mO+0HJ6nFALeWlKQFosPKUPE=;
 b=lLJqoT8Ao641QH8G1o2kzhneL4Off9T03XGoD4xdeXTiDRAgT6bBOK6+gBSOTxnbsXdQB5
 iZIwcs7GuXxdhJ9OPSQeJc0y9fZLVMV4p9slj9mJSKo/e6wwupZEVY+haptKhnWKRVXD7X
 4GucT7v7pYxD2zuO7/ygW65zZKYIIjMeLENZw2SCkbEUnqyZkwmfyb2zw7C5cM0MRNPkuj
 goCKTsOsP1TAjdaGUIVB/hZdRpBVyn/26Vh3JPeTvhFwgcA4fE1GPEcrfMjcr7JNi9cHAq
 u7+gS49e3ZmfK2bgbSguAoAKjc7wMxOk9Dkv+ZcyyTFFYrrstdeMiRodrihISA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lLJqoT8A
Subject: Re: [Buildroot] [PATCH] package/libmanette: fix static build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Sep 2022 20:51:32 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Import a one-line patch that removes the hardcoded usage of
> shared_library() from the Meson build system in favor of plain
> library(), which allows to choose a static build as well.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/7263324435d6d25d7da98824d4313e7c45071de8
> - http://autobuild.buildroot.net/results/9e6c807455b5a4e8986e8388426d98024119aa9c
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...n-hardcode-building-a-shared-library.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch

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
