Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61513E7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02FD74158E;
	Sat, 30 Sep 2023 17:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FD74158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0U8rMXBvDb-D; Sat, 30 Sep 2023 17:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A47541563;
	Sat, 30 Sep 2023 17:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A47541563
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBC31BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF4EB41B31
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4EB41B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUWojhSxVjyD for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:06:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C24E41B23
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C24E41B23
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02637C0002;
 Sat, 30 Sep 2023 17:06:19 +0000 (UTC)
Date: Sat, 30 Sep 2023 19:06:19 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230930190619.71f4b94a@windsurf>
In-Reply-To: <20230608140933.1814667-1-sebastian.weyer@smile.fr>
References: <20230608140933.1814667-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696093580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BmvnSfqqjxozwto7H/6tTUtnMLr9sTdJkiI40nfzgM=;
 b=FQiMQyU0a9dH8BIReAo56rKMilcIYp8B0dOysqeXH0+nHFI/zITWdrf2QcY5WORGMJPYqC
 Dk/RW0ziR2QKirU9fsTIlXolOgw+WbErWCIPg3IG79vdAIZycmiMdhrU9dWom/v8V4RU+K
 pfs1D47Tpq9A4WtHIj8eF6GK3XjcAgHs0i12GIziVLaR9qHRHaVKXwxALyBKQT8lmOP8xN
 8i6aGgDpL99eRwIgClDAKEkCkmVuy0fqPYAgPD0LWZ6JmL6mbwrnd+E1MiE9BqefFwvnTM
 D3Z0ee8rJ0da6VqwqafGDzNElg73w19Nv0mRxE9ivQjGa6FgfT6a4aO17n5VVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FQiMQyU0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-mako: add missing
 dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Jun 2023 16:09:33 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

>  config BR2_PACKAGE_PYTHON_MAKO
>  	bool "python-mako"
> +	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
> +	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime

In fact, only markupsafe is a mandatory dependency, not pygments. So
I've applied (after discussing with Romain), but only with markupsafe
selected.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
