Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271BEC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C03560B73;
	Thu, 28 Jul 2022 21:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C03560B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PYw-ld2eOuP; Thu, 28 Jul 2022 21:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDCF60B72;
	Thu, 28 Jul 2022 21:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDCF60B72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3389D1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE93A402F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE93A402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eRRETi7QCto for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:12:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70DE840515
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70DE840515
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:12:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42890240005;
 Thu, 28 Jul 2022 21:12:54 +0000 (UTC)
Date: Thu, 28 Jul 2022 23:12:52 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220728231252.58c33587@windsurf>
In-Reply-To: <20220727202307.101999-1-ju.o@free.fr>
References: <20220727202307.101999-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659042774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSbO/aY5oJ1aqh5kKgFUOTrqDHYlse8yK79XFq1mYBA=;
 b=GO2xKCbuATI1+beWeIjL78UzcwLtUm/dijmIbMPmtXT5n4bg8wNigbjLFaytYpYUNHj5Wh
 XT4EWmz0ukR7w8Nb7WAS9c1IzM3Q4k0Rk8hGpqIlr/sPpmNYGq/WhdYWnIG+TC4ZFLcPun
 OBA2op5IQo9E4qdLmSnGrV+2aGsNO3H9eyn+l9tUI6O1IFEfavgQ8/hZHRnUIZXUofdu53
 NUqVGSuW2t2qaxPfwz99KErwt1fMKvb6Z3k/DKk9v2DOe27T3mW0Fs77gK3ejRvqY2b6qS
 e/eZ8NNJX6OewpPvU4uwo0W79edCRd4JZjeSmtvC46x/eeH6SSCtb7xpMkr7fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GO2xKCbu
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add test for
 python-pyalsa
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 22:23:07 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This is a simple test importing pyalsa, showing alsa library version and
> attempting to list cards.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                           |  2 ++
>  .../testing/tests/package/sample_python_pyalsa.py    | 12 ++++++++++++
>  support/testing/tests/package/test_python_pyalsa.py  | 11 +++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_pyalsa.py
>  create mode 100644 support/testing/tests/package/test_python_pyalsa.py

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
