Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C7C77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 13:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300F342986;
	Thu, 11 May 2023 13:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300F342986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zn5GAYvx2Son; Thu, 11 May 2023 13:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD1E42981;
	Thu, 11 May 2023 13:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD1E42981
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0AB1BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADED570009
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADED570009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hBvwXq46czs for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 13:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC446FFDC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BC446FFDC
 for <buildroot@buildroot.org>; Thu, 11 May 2023 13:56:32 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F7C0E0008;
 Thu, 11 May 2023 13:56:29 +0000 (UTC)
Date: Thu, 11 May 2023 15:56:28 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230511155628.08fb5dbd@booty>
In-Reply-To: <20230510113648.52895-1-neal.frager@amd.com>
References: <20230510113648.52895-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1683813390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GzAXD2QsS46vz+IscQ3PFlCqHTuaeY0dm0YLkiY314=;
 b=PYjLhH1WYt72Fhnr15wfsPcb7gQotzjJIL8a4gvaajyd0CGokB2PkkoVHUTejAVtYOY/be
 fSbcLnc6b72b8vVX2XeWhtN/4fDhe+R2r7dIO+ThOrAn3KdJKQFoZLftw12hzQ5ciSwo+3
 XYQeOmYU/9WKOZpSToR765sU9YTHt1bA7wl20jywWgDxBs/RX9ate8As2S0Phj/S15Jjx2
 stTetLhVX0XhzWn6bXO59ekLKQ5ZLm/Z7cGAt0HYQOY9fPIDG+1FFZ8cxd+dXMw1T73LEx
 F2JDJUPtBoalYtYoA9zYNktROc3ssFyfgqcjt+vALHl+mpNGBMT2T7dB1L+JFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PYjLhH1W
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: set
 BR2_cortex_a72
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 10 May 2023 12:36:48 +0100
Neal Frager <neal.frager@amd.com> wrote:

> The versal vc1902 on the vck190 evaluation board has an ARM Cortex A72 core.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
