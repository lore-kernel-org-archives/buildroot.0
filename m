Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A795DC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 536F6405A7;
	Thu, 28 Jul 2022 20:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 536F6405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7BfMK9OMrmX; Thu, 28 Jul 2022 20:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 669AA40566;
	Thu, 28 Jul 2022 20:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669AA40566
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40DE01BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED3D60ACD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED3D60ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mK_wWxOghqWl for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC867607C1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC867607C1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:57:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 403BC40003;
 Thu, 28 Jul 2022 20:57:53 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:57:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225752.04dd0a50@windsurf>
In-Reply-To: <20220728144206.2786718-1-fontaine.fabrice@gmail.com>
References: <20220728144206.2786718-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ygz2gro0UkqF6fohj1JrL32Pkis4Fl7V2PN87iARhoU=;
 b=Pcp77AKNIZADx3qZW8RD7KhuTmNGxgMp0TRHpvXaBbVdvyAtu7KgGOloNke+P23EvooOtq
 xTMx/gxw2iD7BYFWXmrM+gemhWj750Wk/xB72cr01gcF+41hgQ11xPuITMnSFR2Givv+wr
 56Mj3zkmXRgwHxA/3+aGmn87ydHoyFgDvFBJNNGvuw8PczPd8rnYuaWPA22S/WxFE4Yi9t
 aEuPWcR6v8DOOpPe5I8QdJ1luYiD4QbiYbiW+jpAuvplQv+l16E6D0JexDTwcDwFk+8zeV
 apREMgy0nrG95m4VXESAYPiFxkfJzGKd9n3Q72P9mDRJ9xCAEejs2l+3QeDl8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pcp77AKN
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.8.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 16:42:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop fourth patch (already in version)
> 
> https://github.com/FreeRDP/FreeRDP/releases/tag/2.8.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...uilding-with-LibreSSL-2.7.0-or-newer.patch | 126 ------------------
>  package/freerdp/freerdp.hash                  |   4 +-
>  package/freerdp/freerdp.mk                    |   2 +-
>  3 files changed, 3 insertions(+), 129 deletions(-)
>  delete mode 100644 package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch

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
