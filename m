Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ACEC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DF580C1C;
	Fri, 28 Oct 2022 06:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DF580C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2hUJjDpW4YC; Fri, 28 Oct 2022 06:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5099E80BC5;
	Fri, 28 Oct 2022 06:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5099E80BC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 860431BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E60360AB5
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E60360AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3acW62QSYzye for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:57:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADC960A92
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ADC960A92
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:57:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 523A2FF807;
 Fri, 28 Oct 2022 06:57:12 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:57:11 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028085711.03c25f54@windsurf>
In-Reply-To: <20221021220800.10420-1-fontaine.fabrice@gmail.com>
References: <20221021220800.10420-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666940232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSMOtSwihGQldoU5akwvdw65vPHfuMQqUbW5bF+oniU=;
 b=AP6P225wkzCttpCDbyyVRu9Wv06JVBanMhkWsrA5AKq+Wl1KVK4tZBvMYJhjpnpKBzpKqP
 S/21aY39fWkxsK0hYlQ2DAufsC2U7tOTKyfjXgaZ2zHaGzipCu9e7sMjKjYZfp+wjAVyU/
 cBUP1aZ8hf4OH+ptmMrOoCcOpfgTPxh3M77ORki+ANLYkQJxo+Tl9cEmLLP+81p1un97Ok
 MF1S+x6/pe7h7py0uyZc81c8U+xGrGnaZryYCtxkg4WPfI7+Pbm3kgX42CRvWxnAAj++ej
 pRZ2paXx0gk/cEHkzXOedBvvPOQK9pFr8w8NbMaO11wcY9MQa+I0iN2/DBcmSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AP6P225w
Subject: Re: [Buildroot] [PATCH 1/1] package/empty: bump to version 0.6.22b
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

On Sat, 22 Oct 2022 00:08:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop EMPTY_STRIP_COMPONENTS (not needed anymore)
> - Update hash of COPYRIGHT (update in year with
>   https://sourceforge.net/p/empty/code/ci/c308663530aba4f808b76ee6b4a4b144be9f8a84)
> 
> 10.08.2022 0.6.22b
> --------------------------------------------------------------------------------
> * Man pages directory parameterization
> * Tarball clenup, repacking

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
