Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A0EEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D994607A4;
	Thu, 14 Sep 2023 21:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D994607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-PpzV1RoLlV; Thu, 14 Sep 2023 21:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AA0612C3;
	Thu, 14 Sep 2023 21:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AA0612C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C477C1BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FCC160BF0
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FCC160BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nG-rGIUnDdof for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:03:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E58C66070A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E58C66070A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64135E0002;
 Thu, 14 Sep 2023 21:03:22 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:03:21 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230914230321.3b9bec12@windsurf>
In-Reply-To: <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694725403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nv9VRYlGLQfYJd+tZciX5tA0QB1bMY4Kr3cr2bIOESI=;
 b=UxsQ8RKH6J5a/vybo/ANPxn823yGY7uNyDNKpOgh/JxT2R59w6DCqcJE7OVHUQaR+qKm0D
 6ZikmXD01M68Up7XS957Rb+TuK5kQJPO5F1KUuFCSh+rEybcVMwupWEW5pOgYMzFVcQsyU
 QoDSe90HMrrIgbZ7hNGbNTyKqYeRDfk7sURA79HTpO80jVUyvzpD6tpZk+OUUZA9JOsILr
 GuQ9itvKOxYWUjXbyZjzHjhXsCDFN1zTKSDs+2Pr/svxvMwwzLLnLBOxLSFyKs26d4P2gu
 HeF6l1q6QcleRQUbjc6Iow+rZrhwPDltxC3HMD9Tnw3iR5slluiy38KaYsXJbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UxsQ8RKH
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5: fix upstream git trees
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Sep 2023 00:15:48 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since commits 4e8b5f9bee9c [0], 6cfbd51d98d1 [1], and d838a416c4ed [2],
> the repository we clone from is the cgit browser, and it does not serve
> the git tree, only the browser:
> 
>     $ git clone https://code.qt.io/cgit/qt/qtcoap.git
>     Cloning into 'qtcoap'...
>     fatal: repository 'https://code.qt.io/cgit/qt/qtcoap.git/' not found
> 
> Browsing there displays the cgit UI, which gives a proper URI to clone
> from; switch to using that.
> 
> [0] 4e8b5f9bee9c package/qt5/qt5mqtt: bump version to 5.15.2 (and fix download)
> [1] 6cfbd51d98d1 package/qt5/qt5coap: bump version to 5.15.2 (and fix download)
> [2] d838a416c4ed package/qt5/qt5knx: bump version to 5.15.2 (and fix download)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> CC: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5coap/qt5coap.mk | 2 +-
>  package/qt5/qt5knx/qt5knx.mk   | 2 +-
>  package/qt5/qt5mqtt/qt5mqtt.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Thanks, patches 1 to 4 applied. I'll reply to patch 5 separately.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
