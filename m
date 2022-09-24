Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF39C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 07:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02317840BE;
	Sat, 24 Sep 2022 07:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02317840BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHV1RjUyX7vJ; Sat, 24 Sep 2022 07:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3007084066;
	Sat, 24 Sep 2022 07:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3007084066
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0D11BF315
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 07:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DB964185B
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 07:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DB964185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddVRwE7DSVth for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 07:16:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D0841858
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71D0841858
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 07:16:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73600C0008;
 Sat, 24 Sep 2022 07:16:33 +0000 (UTC)
Date: Sat, 24 Sep 2022 09:16:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220924091632.5c89823c@windsurf>
In-Reply-To: <20220823054811.360322-1-christian@paral.in>
References: <20220823054811.360322-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664003793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3ro46qG1iZUrW04wwc83M7wHKK7OaH4rPuwDfTnhM0=;
 b=YLMsBz6CVYkJi0t8Rin5BH3tmFggrUYaKMpMwJILOuTSheBbwUVDUjiCQgoUAr7boAscOH
 1EPNotLhpG9vbsctRcVvj81Pf5s+sUvC0DQqxUepeLwokgceontrMCxSnF4rlXwsekJZFK
 MW8vIVmy37WSyyBBAiyTUKVld+mAqGap9HT4bzLWuzAZEu8Bk9nZ/T8uJI2MWrWpiD6Wsv
 tV+FwEGCe5sUrmo+dXBv10ZjmoUXmYWFymshx1S2ctLleSHvLKy7iPGQsMlvLJzIHXLGZm
 d8Ohy5pXiE59adYQjMWT6blC7F9ZUahDKkDEI4CBtn3OxZ1fOzQUd2EkyBvArw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YLMsBz6C
Subject: Re: [Buildroot] [PATCH v2 1/1] package/crun: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 22 Aug 2022 22:48:11 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> +CRUN_AUTORECONF = YES
> +CRUN_CONF_OPTS += --enable-embedded-yajl=no

Changed += to just =, and changed --enable-embedded-yajl=no to
--disable-embedded-yajl.

> +
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +CRUN_DEPENDENCIES += libcap

Added --enable-caps

> +else
> +CRUN_CONF_OPTS += --disable-caps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +CRUN_DEPENDENCIES += libseccomp

Added --enable-seccomp

Applied with those minor adjustements. Thanks a lot!

Could you have a look at the review from TIAN Yuanhao
<tianyuanhao3@163.com> who suggested enabling some kernel config
options?

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
