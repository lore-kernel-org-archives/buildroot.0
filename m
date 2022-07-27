Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62221C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B7C817D3;
	Wed, 27 Jul 2022 06:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B7C817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9TqqgDaQq-J; Wed, 27 Jul 2022 06:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF0C0819BC;
	Wed, 27 Jul 2022 06:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF0C0819BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A09F1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E54A0817AD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54A0817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLXkVw6CZKBo for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:25:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059B1817D3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 059B1817D3
 for <buildroot@busybox.net>; Wed, 27 Jul 2022 06:25:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1754240008;
 Wed, 27 Jul 2022 06:25:03 +0000 (UTC)
Date: Wed, 27 Jul 2022 08:25:02 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220727082502.17cc05e2@windsurf>
In-Reply-To: <20220219181554.32204-1-guillaume.bressaix@gmail.com>
References: <20220219181554.32204-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658903104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+5tFrS+lESHAR96qkSLLadwn+lK4A2sy7wnFAIL+aU=;
 b=jc35YCEbj5eaICMB/m6YOxQG596iUj9lkvqcNsnThG1TlwGbzaGbvKIb7IW4SvV0EXwqBw
 q+tOM8FiQP3OVkrbiNsJ/Ad9Yc032g9T0D/gQ8IK9fuXhhpJYEI4ffmWaqTfuQJOie/b8t
 OK+64N6DJTG4IizfzYi0EQqs/JFnSDjAvUDNN+HTbjgRRO/GkC+kgx0wdEos69dn4CnA5T
 GWsD4sfglFQFLZDj1HfEIWtoZNfUXenCIQAiFDSqIVcrk78++uD0GSju9k5ukRvnJSmjaq
 MdpjeSN5GiKgQQKkiedidf0r4vol0JrEjpFhcajapq2dzfoHM00nXYxr+XFOLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jc35YCEb
Subject: Re: [Buildroot] [PATCH] package/python-joblib: new host-only package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Sat, 19 Feb 2022 19:15:54 +0100
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Joblib is a set of tools to provide lightweight pipelining in Python
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Thanks a lot for this patch. It looks good. However, could you send it
in a patch series that includes python-scikitlearn? Indeed, we don't
really like to have orphan host packages in Buildroot, i.e host
packages that are not used by any other package visible in menuconfig.

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
