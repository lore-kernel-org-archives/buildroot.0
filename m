Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00397C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F9F408A6;
	Tue,  7 Feb 2023 10:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F9F408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9mqJgR85cxj; Tue,  7 Feb 2023 10:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C56540884;
	Tue,  7 Feb 2023 10:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C56540884
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04B7B1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C70EF60E4B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70EF60E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghY0MgwbaniE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB38D60B00
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB38D60B00
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:38:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4DE9240011;
 Tue,  7 Feb 2023 10:38:38 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:38:37 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230207113837.64b654d1@windsurf>
In-Reply-To: <20230206133149.910237-1-giulio.benetti@benettiengineering.com>
References: <20230206133149.910237-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675766319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtUVJmrfhMNczFDONWV4W2+oMAQJ6QY455McBu87Inc=;
 b=Bveo4+7Oj6o2yuSsHU2I5j8POpdiSuFDLQLtyhYD0Z5FC0vHGatA5vlYja/YfHXrYNP7sQ
 zwlyUplP5c8BK4In3DaLGGCuo/GznxCnxnq/+3Kxy6Hzc03C57Ax6PVtClbyF1UzfoSwrD
 ejnRJK5NBQyEhsK6aJmodIvsq/5U3BNKXLf1duKhS+LQZhGxKT3vLpy4/fCB68CVR240fE
 kE5wFCLT2SCTM++ZthUsC4iOqre0XS2M6uvy61dvMRm5MX/r7CSOiGIY9CazTYO7pDFkcY
 Ue9rbFVh76OuNMSsx2mOyb6rmePjTUvHdveOtoSAdxksFbmchu4pe/YrfALRFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bveo4+7O
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: disable package for
 s390x architecture
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Feb 2023 14:31:49 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
> package for this architecture.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9987dfc041c7cc3327b73b8d97e8d482b20555e2/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8192eu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

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
