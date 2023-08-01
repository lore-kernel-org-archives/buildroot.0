Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2882EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 08:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FB161125;
	Tue,  1 Aug 2023 08:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7FB161125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYNTtNOC668h; Tue,  1 Aug 2023 08:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCA360E64;
	Tue,  1 Aug 2023 08:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCA360E64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 140811BF2F7
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2CE481469
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2CE481469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18qoEn7puNqI for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 08:22:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFD6D81585
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 08:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFD6D81585
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68340C0002;
 Tue,  1 Aug 2023 08:22:22 +0000 (UTC)
Date: Tue, 1 Aug 2023 10:22:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230801102221.264475b0@windsurf>
In-Reply-To: <20230725142120.318785-1-james.hilliard1@gmail.com>
References: <20230725142120.318785-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690878143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSUHooS0UeOnaQCvkhb6RCu2iS9ZXXII4eik09ihFHQ=;
 b=gQ4Ggo0oLm4B4M8+/JOVqPxL3OYTJI8hcG5/3VEvODu7o72dxT9olPLyahS2BX2AQ10ygB
 MRAF/JnG6xFJ3PrtuXDhq59Z6ispzZc6qe8kC/a0gDGIQIfkAi6/2opkrVLdoEiS6Sw3X+
 CTNno0z42/to5eYCWIK9/KEqmWME7RVflwftCyiQMdlW6IVleM7SlLL69U6J+vQ8j7ZkDL
 RKuRo+4LlJ9daBf3uhMbXyrTjplz3HgpWTRDeirm3hSG0sSRclX2mcQ8vsbrabMHTvBU35
 qkieKtTFr/IZT1lQLyZzAmMD7BNOzHs0OcMjGdxLMP74ytVVlMgfeMpaK4KLyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQ4Ggo0o
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.0.4
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 25 Jul 2023 08:21:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to hatchling pep517 build backend.
> 
> License hash changed due contributors change:
> https://github.com/urllib3/urllib3/commit/8e94754f85c59d826ac0604d0dd2a0b41874bb36
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This commit breaks two test cases:

    TestPythonPy3Boto3    | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561481  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561482  | ORPH 

Could you please have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
