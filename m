Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903E6C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 102F3432A2;
	Wed,  1 Nov 2023 22:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 102F3432A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnQDF018uBWT; Wed,  1 Nov 2023 22:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA4B432A5;
	Wed,  1 Nov 2023 22:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AA4B432A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 895341BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6228683638
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6228683638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LS8WRtmUd2Vc for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:10:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8215A832B3
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8215A832B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B95AE0002;
 Wed,  1 Nov 2023 22:10:21 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:10:19 +0100
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20231101231019.4e297333@windsurf>
In-Reply-To: <20231024214108.1602700-1-colin.foster@in-advantage.com>
References: <20231024214108.1602700-1-colin.foster@in-advantage.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698876621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWBf1zt8OsNLPaUZ7+D3H5CMo9eNSXh5ephlb05Aqao=;
 b=dvEJOYu7kvQop/XPAd4MJ/dgyngQauM44+pdodIx4qxainA5NwJOZZFOwTHeb0JnHP9epJ
 spoZIo5HcX/+Gbi36j7REYgTkcvBJCFmcrYEYKXryV3iuyD+95CclfWY+itF7GSRR5NWpv
 tUXf9WH6KVjA6RDl8BMlFu6ACoMk5QDXcnlv0Ja2qHBpIdtQGtClTgJOjIiHkyWw+IBETt
 xPliLXEKlJQllbuFUb9N+muYoS6BSskpp68Kt732DCjKIh4wp1q3k51FGD+7LBuRuQaBCF
 YThTP5rjVq6k08tGqlZJcCg8sU2YdbVb/Pj88Sa3hrQn28GCCLO3dwD3JcO1sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dvEJOYu7
Subject: Re: [Buildroot] [PATCH] package: python-tftpy: add python-tftpy
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Colin,

On Tue, 24 Oct 2023 16:41:08 -0500
Colin Foster <colin.foster@in-advantage.com> wrote:

> tftpy is described as a pure Python impelemtation of the Trivial FTP
> protocol. Add support for this package.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Thanks for your contribution, which I have applied, after doing a few
changes (see below). 

One thing that would be really good to add is a small test case for
this package, in support/testing/. You can have a look at all the
support/testing/tests/package/test_python* tests for some examples on
how to do this.

>  package/Config.in                      |  1 +
>  package/python-tftpy/Config.in         |  7 +++++++
>  package/python-tftpy/python-tftpy.hash |  3 +++
>  package/python-tftpy/python-tftpy.mk   | 15 +++++++++++++++
>  4 files changed, 26 insertions(+)

Entry in the DEVELOPERS file was missing.


> +PYTHON_TFTPY_VERSION = 0.8.2
> +PYTHON_TFTPY_SITE_METHOD = git
> +PYTHON_TFTPY_SITE = https://github.com/msoulier/tftpy.git

I switched to using the github macro instead:

+PYTHON_TFTPY_VERSION = 0.8.2
+PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
+PYTHON_TFTPY_LICENSE = MIT

Applied with those changes. Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
