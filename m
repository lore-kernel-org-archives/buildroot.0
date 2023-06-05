Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCA2C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF13822DA;
	Mon,  5 Jun 2023 07:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF13822DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4le-OBENBo8d; Mon,  5 Jun 2023 07:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A3E822A8;
	Mon,  5 Jun 2023 07:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A3E822A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC1EF1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFFD241763
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFFD241763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUDkI6WTHZ_e for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F90E4175D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F90E4175D
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:46:40 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3B6F1BF20A;
 Mon,  5 Jun 2023 07:46:36 +0000 (UTC)
Date: Mon, 5 Jun 2023 09:46:34 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230605094634.61f94358@booty>
In-Reply-To: <20230530055353.43786-1-neal.frager@amd.com>
References: <20230530055353.43786-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1685951197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8PTRUQuGFcL+6fn69CTz0vJsKGd06QGNOMo4whXQcs=;
 b=OPrVCaRX0917KcbIRGsnIBevH538AkiQTlNHTbqGjzLD+PMFFg2aBrGeW0x7ouWsUmNYHM
 68/SiJ4PtB91lRfWN4iCpC0OlvruhNQH8WrxeAR4ZCI+n1gg4Fq7ZdDs3BhncVjMP3Womb
 6wDVWfASyHr0fWIhJN+TpJYHZCzoiH58b1qRZJyuSY2vQTm96f8Fw82Sdpj+COmzQ5cJ+I
 AGd5T+sZW25/L6P4jhs8p5lIJFgCEV2UJ+WX3ysId8mYg6ZqCtPzILFGHyraSAEK7CfJdj
 gEjuzhe/EnqY8T5H0B7Vp/2ti+CLBdBDpHoo7WlBNDFJJsEL8OUB8zrY9kBP2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OPrVCaRX
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig:
 bump to xilinx-v2023.1
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, 30 May 2023 06:53:53 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which includes
> the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - ATF v2.8
> - PLM xilinx_v2023.1
> - PSMFW xilinx_v2023.1
> - versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware repo
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
