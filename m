Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C7EC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D57F80ACB;
	Mon, 19 Aug 2024 11:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s8km-dt4LRS; Mon, 19 Aug 2024 11:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957A681053
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 957A681053;
	Mon, 19 Aug 2024 11:18:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8CC11BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B64146000A
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5J2d3mhzB1A for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 231356066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231356066E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 231356066E
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:18:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 293C42000B;
 Mon, 19 Aug 2024 11:18:05 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:18:04 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240819131804.38262a01@windsurf>
In-Reply-To: <20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-v1-1-30867a0e6f72@collins.com>
References: <20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-v1-1-30867a0e6f72@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724066285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVNsymSB98sVGMU4WTdXdImYUgiSa7UUK0zpxUc4BeA=;
 b=XBCgl/SX/qqvh1Oyi4dn5S/69o0nouoA3SO7MRjtJgTeAYR+rQ75NSo6eVHrtafZWzKPj6
 j/oyxHRzcyIiAsUiDFj0k1kQFLGUb2bv9PdcpbLyF3rYRvl0c5BOKnLzUpWb+WqvRiFEDL
 uTbvm7AlwwFTfK08LrnhyVqS03Svvk9WfXMVio7WS3EsefPReM5LWmvmBgjFkGBcqhIErt
 PP43R6N5xLFauPRfsXsZbw1q5EY3gw5pSZfrRGYFh2636mcEDxvUNUtSE64+DDiNMnE2/q
 ATNSXtDIdpS7PjKUTQXKqR9M+gHs4m+xwrS/MFWosybJJhr6iDUI0dyxvaBkVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XBCgl/SX
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_kria_*_defconfig: add
 missing U-Boot build dependency
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Aug 2024 16:37:30 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> From: Brandon Maier <Brandon.Maier@collins.com>
> 
> When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled,
> the following error occurs from U-Boot.
> 
>   tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
>      18 | #include <uuid/uuid.h>
>         |          ^~~~~~~~~~~~~
> 
> The U-Boot defconfig these boards use 'xilinx_zynqmp_kria' enables
> CONFIG_EFI_CAPSULE_ON_DISK, which requires util-linux.
> 
> This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This
> is because host-e2fsprogs requires host-util-linux, and
> host-util-linux always builds before host-uboot when single-threaded.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  configs/zynqmp_kria_kd240_defconfig | 1 +
>  configs/zynqmp_kria_kr260_defconfig | 1 +
>  configs/zynqmp_kria_kv260_defconfig | 1 +
>  3 files changed, 3 insertions(+)

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
