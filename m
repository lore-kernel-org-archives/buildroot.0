Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03608D132B0
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A535D403EB;
	Mon,  4 Nov 2024 11:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFRbFsQ8UAXa; Mon,  4 Nov 2024 11:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7751840438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7751840438;
	Mon,  4 Nov 2024 11:12:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A5E0723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C17580F3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCdrQz7IvMoo for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 11:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 219A580DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 219A580DFC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 219A580DFC
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 16C82C37DA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:12:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FA7B1BF208;
 Mon,  4 Nov 2024 11:12:19 +0000 (UTC)
Date: Mon, 4 Nov 2024 12:12:18 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20241104121218.20112fd0@booty>
In-Reply-To: <20241104081453.430619-2-neal.frager@amd.com>
References: <20241104081453.430619-1-neal.frager@amd.com>
 <20241104081453.430619-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730718740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUTX9cxnbRuV7Hbc0/BX0gYI2xXHD8UepKW+Qm2PtPI=;
 b=FnE8yZexvYWhnsFdIbNlbVboJ9Q6irkeLppp0ol52cKs701BxGlENsQfq+h5PGweKB/vRm
 j2XuYYhZu/gOyqJqKtkEmYcqXNfXBtxWTDH81/tip4g/OAIqrKRkAKKWs5CkPG28bnduXn
 fG9stJxbcjs7Y95TXXw5BNx18Q1inBADIEPQu3YPXiWi07xPVSZaii5PFOKl9M/Zod/JSB
 cGt6HnIK7HgsGURLL57K6Py3e5+dKcaHZESL5/ylf9wIPY3dJllYK4kIYwLJOg8C4e6mbN
 wKps1a0nwF5QSG9PO+OTu5Lftzx+QLT7EW4hJ9ciAWlOH26Vui5KfFZ2rXGMyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FnE8yZex
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp: re-adding
 xilinx-prebuilt version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Nov 2024 08:14:53 +0000
Neal Frager <neal.frager@amd.com> wrote:

> From: Neal Frager <neal.frager@amd.com>
> To: <buildroot@buildroot.org>
> CC: <luca.ceresoli@bootlin.com>, <thomas.petazzoni@bootlin.com>,  <peter@korsgaard.com>, <michal.simek@amd.com>, <ju.o@free.fr>,  <brandon.maier@collins.com>, <romain.naour@smile.fr>,  <yann.morin.1998@free.fr>, Neal Frager <neal.frager@amd.com>
> Subject: [PATCH v1 2/2] configs/zynqmp: re-adding xilinx-prebuilt version
> Date: Mon, 4 Nov 2024 08:14:53 +0000
> X-Mailer: git-send-email 2.25.1
> 
> The regenerate all defconfigs commit removed the xilinx-prebuilt version from
> the zynqmp defconfigs.  If the version is not defined in the defconfig, then
> it is not possible to change the xilinx-prebuilt default version number
> independently of the board configs.  For this reason, this patch re-adds the
> xilinx-prebuilt version to the zynqmp defconfigs.
> 
> Also, the zcu102 board name has been added to the zynqmp_zcu102_defconfig in
> case the default zynqmp board name ever changes.
> 
> And, the kr260 board name has been added to the zynqmp_kria_kr260_defconfig
> in case the default kria board name ever changes.
> 
> https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99
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
