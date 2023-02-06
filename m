Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB3C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 22:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CEE81389;
	Mon,  6 Feb 2023 22:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CEE81389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZ2RH8Vvt7VZ; Mon,  6 Feb 2023 22:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B168137B;
	Mon,  6 Feb 2023 22:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B168137B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 314E91BF422
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F69A8137B
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F69A8137B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kEYZST10uxX for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 22:45:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF95E81374
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF95E81374
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 22:45:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A79D860005;
 Mon,  6 Feb 2023 22:45:21 +0000 (UTC)
Date: Mon, 6 Feb 2023 23:45:20 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230206234520.4a140264@windsurf>
In-Reply-To: <20220929104648.324977-1-giulio.benetti@benettiengineering.com>
References: <20220928205527.GH1419013@scaer>
 <20220929104648.324977-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675723522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pFEwxL8tQnHovPAljk8v2iTgIvtaTRXlVKFSIdt0sU=;
 b=f0pmqJXzRb3BndkJ77tg53A51FppmnAMekqHP/i+clw62MLrabWiBZLBFATuhnUb8AyfTQ
 ACTpYTTkauYyGoElgny4nspy4sUtqbqBvcXPJS8m8znpHuXlK5AJAlB+hsmp8bXcBzN8DK
 5tiblSR2g8XdgkZuuEj/fYqX+98JAL9qjxy2FUxgclAtLLwVT9qYFAzh3ygZMDpLi2oxL7
 krtWUhvJZhH4gToIpsMjKC5eWFsZt9zNiAONOojnGOKnYDuXlpgosuHiFsEkaK7vxT+en3
 Ppcg9SMmwUQVhhHHhWZhj0JKKKWgynKFcEF8oJX49+im88Bh1BrZQ7zPAuSyRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f0pmqJXz
Subject: Re: [Buildroot] [PATCH v2] package/qt5: fix build failure due to
 libressl use
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 29 Sep 2022 12:46:48 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
> if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
> could be openssl or libressl) and for qt5enginio and qt5webkit let's select
> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
> This way we make sure that only openssl is selected and not libressl or
> other future openssl-like implementations.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/
> 
> [0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
> [1]: https://bugreports.qt.io/browse/QTBUG-68374
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of BR2_PACKAGE_LIBOPENSSL
> ---
>  package/qt5/qt5base/qt5base.mk   | 4 ++--
>  package/qt5/qt5enginio/Config.in | 1 +
>  package/qt5/qt5webkit/Config.in  | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)

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
