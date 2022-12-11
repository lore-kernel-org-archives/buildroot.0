Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BCC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 703E840497;
	Sun, 11 Dec 2022 16:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 703E840497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XB4JZMARYJag; Sun, 11 Dec 2022 16:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E294026A;
	Sun, 11 Dec 2022 16:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E294026A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F06041BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB61A60BE5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB61A60BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGcdPhnQh5Ig for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D5760BD8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8D5760BD8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:58:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B622860005;
 Sun, 11 Dec 2022 16:58:09 +0000 (UTC)
Date: Sun, 11 Dec 2022 17:58:08 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221211175808.533b3ba2@windsurf>
In-Reply-To: <20221207122133.14860-2-neal.frager@amd.com>
References: <20221207122133.14860-1-neal.frager@amd.com>
 <20221207122133.14860-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670777890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgbCyz6IYlvnue5Mne2RBtQYLm02x0Hl/mQZODTpsDU=;
 b=cX5mbXDDQLGD4eesmn8rt0RhR0nseyl2kpqpZx9lXuzkoHi3mdVf9GzbRbXYRAiG2RcH0s
 CPTQ6r/IU/s+IbFE/YcDIhrHPKKbXijmp4TiAc5zSYNWlfYrifam0nacRFTssJhX3vFjnz
 thLFAJwaOpZ7VzaIolM4vfGGv7W1j8Z+Uft1x/cRa7q/LnP/V1zk6+osjihTPQVWc6c2zi
 ZRcbgtcUHqCZ86LobxHMiWjX/41yaeSzh1fBupTM6A6bX0wRz62sppWOH00urwCuOCfem9
 zFh0Znp/QyxvoNSKW1IKGJzhD7xNwIUe2DBnSDPR2pCmwsJjsA7B9WENzuvwjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cX5mbXDD
Subject: Re: [Buildroot] [PATCH v1 2/2] board/zynqmp/kria/patches: remove
 patch
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Dec 2022 05:21:33 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> The 0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
> is already committed in the Xilinx 2022.2 u-boot release tag.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  ...qmp-sm-k26-revA-Fix-DP-PLL-configura.patch | 39 -------------------
>  configs/zynqmp_kria_kv260_defconfig           |  1 -
>  2 files changed, 40 deletions(-)
>  delete mode 100644 board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch

Also applied with an improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
