Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6313C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 08:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3889160C04;
	Thu,  1 Dec 2022 08:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3889160C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PopDhEKAzZww; Thu,  1 Dec 2022 08:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751DB60777;
	Thu,  1 Dec 2022 08:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751DB60777
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C259F1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2A914019E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A914019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXachksSznFi for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 08:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F1C400C8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F1C400C8
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 08:38:46 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 01BCE60015;
 Thu,  1 Dec 2022 08:38:42 +0000 (UTC)
Date: Thu, 1 Dec 2022 09:38:41 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221201093841.7d21d5c9@booty>
In-Reply-To: <20221126105350.14687-2-neal.frager@amd.com>
References: <20221126105350.14687-1-neal.frager@amd.com>
 <20221126105350.14687-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669883923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79PXLQDxmcX7ZT8ZaNzfyc1n567S8OxQebHU1Ieg8jA=;
 b=Fr+Kf+BW6ZnT66wBw/0ie8+EBQI2tkvqluFIKYN4Fa6ARQX9iDBB40S53d+uAJigEpYj7c
 MZiN4470EXBsCH6iGjU/alw6Y2m2pdIkEfbd4S+oJwKuuSA9dB7b5jG40CeSSaxPcpkcTH
 uDVfykQuX36mRvEHv5AT8ppp0WHzyDfzTxvl8R8GTsEc12sDfGPyPLAF9qYOiucHQjLW6L
 D6lDPlF3285DxhZ+AeHUwJYjT+zA8E3uj7yVNwAkc5Br8SpF1ycMF209+7qH804dCfO/jq
 rlspe5uriOrJiMD56ZzZH60+69fP091VqShxRH7tLP49RgAFwgcp1gWTO0yGvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fr+Kf+BW
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu106_defconfig:
 bump to Xilinx 2022.2
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

On Sat, 26 Nov 2022 03:53:49 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_zcu106_defconfig to Xilinx release 2022.2.
> 
> Xilinx 2022.2 includes:
> - U-Boot 2022.01 bug fixes
> - Linux bump to Linux 5.15.36 with bug fixes
> - TF-A 2.6 bug fixes
> - PMUFW bug fixes
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
