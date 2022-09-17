Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEBCECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226326112C;
	Sat, 17 Sep 2022 15:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 226326112C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vgzhd-JhNXfx; Sat, 17 Sep 2022 15:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5446161113;
	Sat, 17 Sep 2022 15:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5446161113
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 646CD1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4041161113
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4041161113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGJTYoWnmZbF for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:58:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFCC360AF8
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFCC360AF8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:58:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDFA4100006;
 Sat, 17 Sep 2022 15:58:21 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:58:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: luca.ceresoli@bootlin.com
Message-ID: <20220917175819.3bd303e7@windsurf>
In-Reply-To: <20220917123256.960765-1-luca.ceresoli@bootlin.com>
References: <20220917123256.960765-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663430302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsOugvfdOtSO0kVSkZEQEALNnxx5vpqDHr2AfDgxR+E=;
 b=BxFnicnpgXur6gxOGBQTmhVgQsk205o76jD/ZG7fc6lOwCS5rhMUkp7BK8GtzcCkrhEdZG
 oFEafuHQnjCOcwqSyBysItLJPv8Xnd4DesdgJvmYGWIaoaCrIytkUB9uQMQLGtizT9GH2M
 dJaoCauSl7h7E+5XpQKjtGocJJrdSaT5jyZoQDtz4J2mnBCCgVQsRUv2nrkjnktkUbTjOS
 Z3oUA1HBEhYC6jS8pjszt1K8/bKrauKgmKFk/NSZwKi3QzAUyi8oDPoO6fDy3tPWUfd2vc
 HRVB8pW5bCaAMBOhkv+I1AcZNEpQruMYxOmcaZ2DfNXRcciHgKZFovPLwImLlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BxFnicnp
Subject: Re: [Buildroot] [PATCH] utils/test-pkg: show default build dir in
 help test
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

On Sat, 17 Sep 2022 14:32:56 +0200
luca.ceresoli@bootlin.com wrote:

> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Avoid the "Where did it put my builds?" step.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  utils/test-pkg | 1 +
>  1 file changed, 1 insertion(+)

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
