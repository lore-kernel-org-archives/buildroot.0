Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711A2ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5386110E;
	Sat, 17 Sep 2022 13:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5386110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sM7TIK2VFwIM; Sat, 17 Sep 2022 13:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326E7607F4;
	Sat, 17 Sep 2022 13:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326E7607F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7453F1BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4075141D81
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4075141D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vBP0yjVwZtx for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:06:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096AB41CA2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 096AB41CA2
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:06:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8EC48FF803;
 Sat, 17 Sep 2022 13:06:31 +0000 (UTC)
Date: Sat, 17 Sep 2022 15:06:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220917150629.0dba8856@windsurf>
In-Reply-To: <20220915212450.1799621-1-ju.o@free.fr>
References: <20220915212450.1799621-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663419992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCS29LGkosL5bIJmAid69aK63YbvxbyNsl9md5mBSXU=;
 b=jQrBBIytwkSQNOqlkZ4Wrtvy6F0/diVP3STUdh2Z3jbE+S+HLu+bnPr8b0jxLcKOoG1S4g
 IOM3nFff8frRFHgYrlYXOU9hRq11ZNTScLIMKh7C2m2Ybj48q3vDCDM/pk7pYaRi8I6mfm
 BxFOwYtPb3jWgLplgFXqvthxsCjjy31QKZ767lFjrXg+JTfY5FQf2yl5iFjKWG/DkT3CG5
 e/k3EGUb9z2VIsZOcWC7fXDLCyCVBKJjNcBkVbE8GINkmbN3Ok8U5ATjfTgMdG1ah2vScA
 ioGQP/bCg6ejWnJ/AhnVcIkfmsBdjC2SStGdV7uvZ1MQ0g8/00kgG7rUDwiieg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jQrBBIyt
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_hwloc.py: new runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Sep 2022 23:24:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_hwloc.py | 22 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 support/testing/tests/package/test_hwloc.py

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
