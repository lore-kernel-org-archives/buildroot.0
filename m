Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EC560E52;
	Wed, 20 Jul 2022 21:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EC560E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKmanBhKfHJI; Wed, 20 Jul 2022 21:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B1C60A8C;
	Wed, 20 Jul 2022 21:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B1C60A8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE711BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F4D60A8C
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F4D60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wyXrijeqzLf for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:37:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A6560784
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05A6560784
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:37:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D04B71C0004;
 Wed, 20 Jul 2022 21:37:35 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:37:34 +0200
To: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Message-ID: <20220720233734.675cd49f@windsurf>
In-Reply-To: <703d2f07-9c45-9bfa-2278-8bcec8f584ba@googlemail.com>
References: <20220619210102.1021263-2-fontaine.fabrice@gmail.com>
 <703d2f07-9c45-9bfa-2278-8bcec8f584ba@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658353056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKQt96B5KPejwDh9kD/vhC/v8e5JRDFHFJxrScwRVlE=;
 b=VaVhYppxsZkI99f9fgzXnkSBQjsioj5G2jYpxPm6NfN3rx7kKNQgOzqHR/kU4YJ8wxSmgY
 nvJ/2OboSDNYNwcA3/wPUG+kCUnhOehoIGIUMUr8Z/S3DbXWw3s82JnAgLC60zdQuwR5S5
 jD9T9IlxWw6ALKfnqmOiEcu8UkUFe7SHcLWVjS8gRpCd0wESUr48kM6Ao3KNQFecRq1SVw
 Polt9QpqxRVji2uSj/7oX8FCzk0WjMqKM55NZnRAQDu+88uoN5lFpB8ssR6xyNkOhJt0ZT
 g3DmYK0lEXpTVInVzUGR/Ujoo9L2WHniMjMurs+vAX4dREhG9BJJJR+jJyW6tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VaVhYppx
Subject: Re: [Buildroot] [PATCH 2/3] package/bind: disable cmocka
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
Cc: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

On Tue, 28 Jun 2022 20:10:07 +0200
Raphael Pavlidis via buildroot <buildroot@buildroot.org> wrote:

> Maybe we could make this dependency dynamically, if the 
> BR2_PACKAGE_CMOCKA is enabled.
> 
> For Example:
> 
> ifeq ($(BR2_PACKAGE_CMOCKA),y)
> BIND_CONF_OPTS += --with-cmocka
> BIND_DEPENDENCIES += cmocka
> else
> BIND_CONF_OPTS += --without-cmocka
> endif

Correct, but we don't "require" this. Indeed, if nobody has ever had
the need for cmocka support in bind, it's fine for the moment to have
an unconditional --without-cmocka. This can be improved later by
someone needing this cmocka support.

Essentially all what I'm saying is that we don't require supporting all
possible optional dependencies/features: it's fine to have some of them
not supported in Buildroot, until someone really needs them.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
