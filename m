Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28EDC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C811B608F6;
	Mon,  3 Jun 2024 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOuZo5nBar7s; Mon,  3 Jun 2024 16:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBCC60A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBCC60A5B;
	Mon,  3 Jun 2024 16:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E135E1BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB49D81452
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckJXh1DrMLnR for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AFFB81442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFFB81442
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AFFB81442
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:25:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 50464C2C91
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:19:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C44081BF209;
 Mon,  3 Jun 2024 16:19:44 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:19:43 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603181943.1fa205b2@booty>
In-Reply-To: <20240603115212.184529-3-neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <20240603115212.184529-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtKRBxeIkdOmgbp2A361Z7VlaZMs1+sn606ND60vwK8=;
 b=fnKRFydH8+OTogMgTMNSujQIuZcIjecimdBWOCW79w96Od9kq3Qjl5brqfGJXHSgroSKL/
 Cj7ebPsT2j2fvHRy8eYaYKEEPEPO+ivBIyQvMAS4l+np2i7sA3645C7A0ncUKuOU94/E8k
 nWGKA9EYiiLnqmPDdmSHC/8OzsfGWp/DXWLAwbHhHX8eCtXcH+8av4uMYhZ2ARlONezW64
 2gBqTHMfahSFBz5l6GPXu47rmI0DYN3IlMFKU8Mi7Cwzwhg42Ld2iYBgnTpTJu9aIZpJ57
 b9Fdfox4Hc4kX5uFCIjD71zMLkfyi8UPpFiqNlsNRGEznbZoCVt5KoN+8NwVIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fnKRFydH
Subject: Re: [Buildroot] [PATCH v1 3/3] configs/zynqmp_zcu106_defconfig:
 bump to xilinx-v2024.1
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jun 2024 12:52:12 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
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
