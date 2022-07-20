Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB6D60E7D;
	Wed, 20 Jul 2022 20:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB6D60E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDcRreOJGgm6; Wed, 20 Jul 2022 20:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F25D60D52;
	Wed, 20 Jul 2022 20:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F25D60D52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEDBF1BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8001883F53
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8001883F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kmm1tDt9WtFU for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:58:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BB183F52
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BB183F52
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 20:58:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F22B240003;
 Wed, 20 Jul 2022 20:58:55 +0000 (UTC)
Date: Wed, 20 Jul 2022 22:58:54 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220720225854.5d025455@windsurf>
In-Reply-To: <20220615161753.2580142-1-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658350735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmeKqCLZ1iyaTdRthH7lcf7JYkrU+wPUpPMMTfYLnO4=;
 b=hpCnsr+vxnOeYzx2iT7G0BROSzE9moCj/FcHfvmGe9XTsGMwxGe2bgpchJ/SJUT9UvHhke
 iclrYCnIcJPY5eojUlQmZGKvdVaJlSsMfadQBn4RbY2HnTggP/zQMN9HYYMEfFcbk4mnxn
 aWe+0vAjvKloZLTKgf2Vs7+32jy3RDTCJSbbiVHeWNnkfWxD/4mXxS61+Bf1VmGhsykc17
 b0jMnhS9+ASZaljnc/J1f14Xurt7CcRK10FwjTPXxpBPruk4J40OsODfhTFhoIBPtTFgqv
 1/WD1oo7RDYIRgNz4yDCSqvcYaMJgi4kOGS0myMBtpqpN/SKEv0FL7CSKZjUYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hpCnsr+v
Subject: Re: [Buildroot] [PATCH 1/5] package/open62541: bump to version 1.3.1
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

On Wed, 15 Jun 2022 18:17:49 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> remove patches
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...sts.txt-project-only-contains-C-code.patch | 27 ----------
>  ...eLists.txt-fix-build-without-threads.patch | 37 -------------
>  ...licit-cast-to-avoid-compiler-warning.patch | 25 ---------
>  ...4-CMakeLists.txt-add-UA_FORCE_WERROR.patch | 54 -------------------
>  package/open62541/open62541.hash              |  2 +-
>  package/open62541/open62541.mk                |  2 +-
>  6 files changed, 2 insertions(+), 145 deletions(-)
>  delete mode 100644 package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
>  delete mode 100644 package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
>  delete mode 100644 package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
>  delete mode 100644 package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch

"remove patches" is really a short justification, so I have expanded
that to explain why each patch is dropped. Could you try to do that for
your next version bump with patches dropped?

Applied to master with this change!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
