Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A0C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A4041805;
	Mon,  6 Nov 2023 21:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A4041805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqdYVrJwjp5l; Mon,  6 Nov 2023 21:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE51C417FE;
	Mon,  6 Nov 2023 21:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE51C417FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 923F11BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C08282217
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C08282217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rNu9b3HCmAS for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:42:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FB82821FE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FB82821FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52FF61C0003;
 Mon,  6 Nov 2023 21:42:23 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:42:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106224222.5e8cab9a@windsurf>
In-Reply-To: <20231105165822.94701-1-fontaine.fabrice@gmail.com>
References: <20231105165822.94701-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhKWLrodScyuu2jYAgIGJ6Vzl3t29UEnc9EDAsx7APA=;
 b=CDIjKUScVWKXtjqGOZ0apW7B6h4wEF2SH7vujyVSyB0sd13OSStIki5HY0m+LOcwR07+Gp
 LYlKjqVugq80+DwporrzYq2czmI5OTTdtF1KpHq8NkpyUnU3a6O4xzfYSCsicognv1egBM
 S43y0OoNQSkcgX9zYY2HUClENCYTs2pmGm0iS6vXr1aJIjpOkaC+TO/zJ5qk+T3Or7dFK/
 TOmAoIl3ap4oeXOS7Ot+I9QiSTpgVFpv+xsCqZQQn+hr3BO1SCl+IzYX7OE4qaiQpZ/nEE
 S9vFfNQ7q1EVMJvEb6H8JzHckkQtYv6YUYrWhr8PnPXS0LoLD8iIijp+B+LmLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CDIjKUSc
Subject: Re: [Buildroot] [PATCH v2,1/1] package/nut: fix python build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 17:58:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 2.8.1 in
> commit 9c874557aa863d5282ca38b28a379730297496c8 and
> https://github.com/networkupstools/nut/commit/cada4bc8c4051fb961ae7c21d0bb329f79cc330c
> and
> https://github.com/networkupstools/nut/commit/902ce1327e912dfb6198900204b12e6804d1224b:
> 
> checking python3 site-packages location... /home/thomas/autobuild/instance-3/output-1/host/lib/python3.11/site-packages
> [...]
>  /usr/bin/install -c -m 644 module/PyNUT.py '/home/thomas/autobuild/instance-3/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/home/thomas/autobuild/instance-3/output-1/host/lib/python3.11/site-packages'
> [...]
> nut: installs files in /home/thomas/autobuild/instance-3/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot//home/thomas/autobuild/instance-3/output-1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0b2d0e292a9872f7ab7c2eeccbb7bb12e4afe36c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add Upstream link to patch

I have applied because your patch was accepted upstream. However, the
issue could perhaps have been fixed without a patch, by doing something
like this:

NUT_CONF_ENV += _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)"

This normally allows host-python to use the sysconfigdata from the
target python, and therefore return the correct values when
cross-compiling Python modules.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
