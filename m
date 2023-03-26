Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39656C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 12:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9292460B51;
	Sun, 26 Mar 2023 12:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9292460B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-cg3Ja30CsL; Sun, 26 Mar 2023 12:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D86D4608D8;
	Sun, 26 Mar 2023 12:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86D4608D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51A7C1BF3ED
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 12:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28F5E402C5
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 12:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F5E402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFG5WdIrRsSx for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 12:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D224026C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D224026C
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 12:18:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF559C0003;
 Sun, 26 Mar 2023 12:18:05 +0000 (UTC)
Date: Sun, 26 Mar 2023 14:18:05 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230326141805.310d6e67@windsurf>
In-Reply-To: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
References: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679833086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYxiEuxL1wasCoTMIsJms6Wd0lxAUI/cV4kbUIZanr0=;
 b=dLiQVAmLIleGl/rI6ofQeSSeYpQOwZNATbiyZDAjmf1hRy1GZmKZDVjqU3CAX/KL0jyZ3n
 S4Blc/WUw0uAQ1RnSN3wzlDwOr+I4xHKytvQYsKA+wgpugVbM+T3lRKwVSnfoVMypD/Ol/
 /htXhwPQ+k3owkCZXfRJEaOJUZ6yW68OWG4NiVb+KR/fok6pJNkdM24/H6W4nOxrCBO7W7
 TOH54z1gX01DlfsplmVgWTNNRsWryhCfWEEVrKWKgmyjV+F3SIIVBLTjTZnC76JMjPOU22
 zL2eyiBBSCfufGmxJ1CVZhvcNdLpAQgWQOXWq4FqBfcv22RFKWTFpCpanF0UZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLiQVAmL
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Mar 2023 18:58:15 +0100
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Add a patch to fix the build if only yescrypt is enabled.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/df6a16a55bf02cf2d7377f9636913f0b3bca574f
>  - http://autobuild.buildroot.net/results/758d4fd297fbd77ef846d3a3d4c207021f866752
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  ...-sflg-for-USE_YESCRYPT-in-newusers.c.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch
> 
> diff --git a/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch b/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch
> new file mode 100644
> index 0000000000..6c2a15d898
> --- /dev/null
> +++ b/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch
> @@ -0,0 +1,29 @@
> +From 8f7d5e8adae3aa16c0e3a4cb5db34d6764aa0495 Mon Sep 17 00:00:00 2001
> +From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> +Date: Thu, 23 Mar 2023 19:16:12 +0100
> +Subject: [PATCH v1 1/1] Define sflg for USE_YESCRYPT in newusers.c
> +
> +If only yescrypt is used then the boolean sflg is not defined, but it is
> +access. Therefore, it causes a build error.
> +
> +Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Thanks for fixing this! Has this patch been submitted to the upstream
shadow project?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
