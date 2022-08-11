Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E98C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2AC60F5C;
	Thu, 11 Aug 2022 20:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2AC60F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJXR9uqal0b2; Thu, 11 Aug 2022 20:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E6760EA1;
	Thu, 11 Aug 2022 20:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E6760EA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4B331BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 715A941820
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715A941820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjiEVYO1rsL9 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:25:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041E7417FA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 041E7417FA
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:25:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E74FC240005;
 Thu, 11 Aug 2022 20:25:22 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:25:21 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220811222521.3972689f@windsurf>
In-Reply-To: <20220811133658.170963-1-bernd.kuhls@t-online.de>
References: <20220811133658.170963-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU1P/gDbD/DgM5PwYPbG+Llc+DGNCrGbB06spZnoP1M=;
 b=da2uf0VHouzvPiyYKdCmF5+5MS30lGEpHnBKiU+nZ6KkR7gIMgc6wWA+7KJmrTHfWeXOqv
 4PiqXLIKIxB1e8tSfFDImbb5GVsCtH/ZuUuCx1Fquu9PumEVE669GLy34URXai3pRTt6ho
 TozkO3wXv+cAZOc/VPC3q3tIJsFG47LtPTL2lS+q25DVC83/jxf4n5/NO4Sn0rIZkE3brj
 Av/0iT+BbUcHUDw3QnWYSzmt6XonGDoCmXW+M95k6Dc2+nUphsBcobhs7eVBWvRfYEOZE6
 JjEppc5/ejz5raoKBQO51z8JuiOqVfQxwJpjlOYfCRdKmmM6+vj1/bwfa0OaBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=da2uf0VH
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-dvbviewer: bump
 version to 19.1.0-Matrix
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

On Thu, 11 Aug 2022 15:36:57 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
>  package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
