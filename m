Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E66ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 08:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC489610D0;
	Fri, 26 Aug 2022 08:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC489610D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwsR4iZY-6b2; Fri, 26 Aug 2022 08:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C98CE610C3;
	Fri, 26 Aug 2022 08:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C98CE610C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527061BF86D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D750610CD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D750610CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpkJgdL_7j_Y for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 08:07:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6823610C3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6823610C3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 08:07:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F99C6000F;
 Fri, 26 Aug 2022 08:07:09 +0000 (UTC)
Date: Fri, 26 Aug 2022 10:07:07 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220826100707.3fd75419@windsurf>
In-Reply-To: <20220826064758.3968647-5-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
 <20220826064758.3968647-5-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661501230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VRPBZJTbFduRoC8s9ZME3MretyIQboIogfTDRNuCnI=;
 b=Q/ge093+nZ06vuNht+gFoTsGeVEnVOhk2xjEGG/x93RursuOwdBlRHBXjUuAdwFBQByDw/
 VwvWCU9u8RRBcUEdJ0lRhUl4T0p2n0NK1FT5MZp5vdv7gVsPstbQ7QWz/ul5xWtCdGMpg/
 eQ0KogohCPVMkwP31lc6eqjZyzryw7UcsbVuvXajqQ/sHXEc9we2kA4vmjAfAJB164UZmN
 FtB+1q+nBySpxc4+ndYYtYuFsHQieDCJf6WBqg5xrYqGsPnTXLzNXSjj4gXk6wznXOmEoN
 O1S8X7Po5NVlckXf8mii9DsuSFtxuGqSAnPe1nQ0/YCf8cGciT1f63R6vfIsYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q/ge093+
Subject: Re: [Buildroot] [PATCH v2 04/29] package/qt6/qt6base: add support
 for concurrent module
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
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 08:47:33 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> ---
>  package/qt6/qt6base/Config.in  | 5 +++++
>  package/qt6/qt6base/qt6base.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 68bca728e2..50cdb52761 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -22,4 +22,9 @@ config BR2_PACKAGE_QT6BASE_NETWORK
>  	help
>  	  This options enables the Qt6Network library.
>  
> +config BR2_PACKAGE_QT6BASE_CONCURRENT

Please sort options alphabetically, i.e BR2_PACKAGE_QT6BASE_CONCURRENT
should be before BR2_PACKAGE_QT6BASE_NETWORK.

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
