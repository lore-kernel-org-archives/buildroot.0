Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2CDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86DF540650;
	Sat, 23 Jul 2022 19:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DF540650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8Qmluh9hh_S; Sat, 23 Jul 2022 19:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DC5340566;
	Sat, 23 Jul 2022 19:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC5340566
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 825401BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 698CA42476
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698CA42476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQdMxZmhSzHO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:20:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E889F42465
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E889F42465
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:20:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A180F20007;
 Sat, 23 Jul 2022 19:20:27 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:20:26 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220723212026.6cf8d13c@windsurf>
In-Reply-To: <20220511080148.5084-1-yegorslists@googlemail.com>
References: <20220511080148.5084-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658604027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVbufrcmhnvrZn6XCHpC54MwS+4h+jd7aF2x8ENwe4I=;
 b=YzWKk/uX0rHC8ywX/P48kwD+lkVmdsDKTKcb7i1YfagSUKkLcC//A/05qrdexZHru1zk3H
 q0ePZqkxiZSynPRi8UCHRnrDR+i9U+9e5MgGNXShCU8eaVMZg9+GUEeiq4rTrer/rpQsf/
 OKyErQVdBdXZwL7+vozj7MuGZw3/GoZyZTYQTrN7L8RtHWhh3oeoHo9mMngeZYdoduFKPc
 JDpx5QKwZLdxuYLGCwRcWA7cUL9T/UXRCNf2mlsO0hwWjY0r1S7MOScNf1BN6i3HSqGQKO
 WVIB5dnMMa91jcvu+EhdyrtXd9CBISb3vXAJEZDYxJ0Y8iufiWT5inLBgp26zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YzWKk/uX
Subject: Re: [Buildroot] [PATCH] package/python-pylibfdt: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 May 2022 10:01:48 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> +PYTHON_PYLIBFDT_VERSION = 1.6.1
> +PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
> +PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
> +PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
> +PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause, GPL-2.0+

According to the SPDX tags in the code, the license is BSD-2-Clause
*OR* GPL-2.0+, so I changed that here, and applied.

I hope this will not cause any conflict with the bundled pylibfdt that
exists in U-Boot for example, but we'll see :-)

A short comment on those new Python packages: it would sometimes be
useful to have a corresponding runtime test in the support/testing/
infra, as it helps ensure that the dependencies have been properly
taken into account in the packaging.

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
