Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE87EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A28B4017A;
	Tue, 18 Jul 2023 09:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A28B4017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjNprU2MRHSE; Tue, 18 Jul 2023 09:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50DCC40190;
	Tue, 18 Jul 2023 09:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50DCC40190
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABBA51BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89DCF40346
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DCF40346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0W2C06zeoWi for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:20:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19164033A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E19164033A
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:20:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 554B51C0012;
 Tue, 18 Jul 2023 09:20:52 +0000 (UTC)
Date: Tue, 18 Jul 2023 11:20:50 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230718112050.6d453ad0@windsurf>
In-Reply-To: <20230716212856.24353-1-giulio.benetti@benettiengineering.com>
References: <20230716212856.24353-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689672053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMfJSJ5tjTJ23Mk5ArNsXxcH7QVQMiYB3S2oDCXmeSc=;
 b=TNSMd1K+7FNtHG0cplVc4vCE8r2lE5hEDl94VZbBBMcAYfbnOaD+tlwVlWOlH5VmevKc33
 ebBBGbeAt4IokbuHLhc4wieKX1Vvi34w+ZMxsxojJVygoMg2dvNi0EeFFEk9RnAObokA1O
 I3z8n1qqo5lHhnwMQBHo2V56/I625R83AYLYmejFq9xKNxixDGwDp0dm/lg2piWag1OF6x
 uKPZn+mzECFGGIkjMk3+v7dbC8ZaL3C9JaUHL682mtvRSw4bFv0EyxJA8kKrdJYBxwp7Ct
 TIELZlN5RfTAtM3AkV4nTnBOHwsHAI/iitYILNLYEb0Repoh8Ep9Z06L2mXYaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TNSMd1K+
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: fix build with big endian
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jul 2023 23:28:56 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch to allow to override CFLAGS and undefine
> CONFIG_LITTLE_ENDIAN by default and use the correct endianness according
> to target architecture.
> 
> Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101

This Upstream tag...

> diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
> new file mode 100644
> index 0000000000..93ce8ee33e
> --- /dev/null
> +++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
> @@ -0,0 +1,39 @@
> +From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 28 Sep 2022 21:17:17 +0200
> +Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
> + end of EXTRA_FLAGS assignment
> +
> +At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
> +since it's assigned at the beginning of the Makefile. For example it's not
> +possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
> +allow to build these modules for big endian architectures. So let's move
> +the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
> +EXTRA_CFLAGS assignment.
> +

... needs to be here. Otherwise, "make check-package" will complain.

> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---

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
