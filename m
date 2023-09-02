Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13DCA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1772A6142B;
	Sat,  2 Sep 2023 10:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1772A6142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flTk9nJsnn1b; Sat,  2 Sep 2023 10:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 080EC60EAA;
	Sat,  2 Sep 2023 10:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080EC60EAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB791BF419
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5363F60EAA
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5363F60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPmyHDuFbtaY for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:03:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 497C360C16
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497C360C16
Received: by mail.gandi.net (Postfix) with ESMTPSA id BADF51C0005;
 Sat,  2 Sep 2023 10:03:54 +0000 (UTC)
Date: Sat, 2 Sep 2023 12:03:53 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902120353.4d363616@windsurf>
In-Reply-To: <20230830195446.3958486-7-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
 <20230830195446.3958486-7-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693649036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxX1Cdw/TPMefV86OE/axFkKG40E+U6nJ8eMFJVc3Ww=;
 b=TVQowXUyBu+l3MOy2E03TGpB5tNR0ux+OyxCOk4lLJUa/6MLZCCHTQAfi2wqShbYKb8k90
 1O8oYh6hbHEMbEkMVeHzXrTb12Qmx/9/xwja5mt0YFT8cregO2qDprlShRKMHeRKs2HF3i
 HlrMitS546RuyTlV2l7Oqmfno4+vX0sXuSYSE/VKzhe8FbJcb6Z/32FTOCNKLegILRMr+W
 xpcACLxFxNKP3BlNCExRUUWiiMmnd4/flgP5UxCXl0nooCJSSYUmcfhGWztm0ivOgdN9OP
 h6kl8t08FLDPYEBYWTCTTnAYt+Q6t/pHJNh8mV3EbWvaqvLytQIlgQ+TPQXtWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TVQowXUy
Subject: Re: [Buildroot] [PATCH vnext 7/7] package/qt6base: add vulkan option
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 13:54:46 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  | 10 ++++++++++
>  package/qt6/qt6base/qt6base.mk |  7 +++++++
>  2 files changed, 17 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
