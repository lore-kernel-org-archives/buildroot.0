Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27170C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A7460C1A;
	Mon,  7 Nov 2022 22:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A7460C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjP4aU-raGzx; Mon,  7 Nov 2022 22:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4B660BF5;
	Mon,  7 Nov 2022 22:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4B660BF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC081BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 486144064C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486144064C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4HPUZWhUZVL for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 523E14063E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 523E14063E
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:19:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0A7D40008;
 Mon,  7 Nov 2022 22:19:24 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:19:24 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221107231924.70bf9a55@windsurf>
In-Reply-To: <20221107131516.18488-1-neal.frager@amd.com>
References: <20221107131516.18488-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Mo6MpyiSoQXPCB4GVMVPKqQY60RQdOaqfCTqmh7yjQ=;
 b=HKORQXzgL/8zp4lW6OjuPFC8zT/cJpK1BCuCdQOnnV2xk9t+wtg+hxxeLXMSPGBjN8pCKZ
 tBiDFx9/yJSJMPs4jtQdRgJRqeHxu+GOXGRkmKum0OBz4CGwHTmsC2b/gywXGWFgc57Oup
 MaM2xtUICQAiz+XLC1g0r4VtP8F912V9du6CI70bm4mJwvY0hvBEgWzz57MI8aJtiZR49O
 7K/p2xtx/HXfeNNr36c381ijYuQvA1hDiRCRc0pVkSLrn5TXPAxuLN1MMDx0W3aMqNbJq7
 S3JYetggN3oO7b05zeKVgYthVIKMADUZv169FWkTU7xq+TYADevzR393RNi5iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HKORQXzg
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
Cc: michal.simek@amd.com, wesley@sonifex.co.uk, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Nov 2022 06:15:16 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch migrates the u-boot device tree definition
> from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> instead for the zynqmp_kria_kv260_defconfig.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/uboot.fragment | 1 -
>  configs/zynqmp_kria_kv260_defconfig    | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

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
