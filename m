Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB4C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD05606A0;
	Tue,  1 Aug 2023 21:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD05606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6rZYovP3f7S; Tue,  1 Aug 2023 21:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B7D6110D;
	Tue,  1 Aug 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B7D6110D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99CD91BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 891A680B44
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891A680B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUoNwrdT8Neq for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:20:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 209AE80E2C
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209AE80E2C
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEA7CFF804;
 Tue,  1 Aug 2023 21:20:24 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:20:23 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230801232023.50086a5f@windsurf>
In-Reply-To: <20230801100204.3111852-1-neal.frager@amd.com>
References: <20230801100204.3111852-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o35AhS4ZLs90N7oGz9iU1O9qW3Zc2SotTLHqc2B8wO4=;
 b=aWuEAfuE5ZFUt/FRC9CQ/k4+jKzLG8cq5u5B1eJI2cZx8zvNqjYrOBcDoMTZ4MqPRxxG6Y
 BLMcuuJ2zlWhtGcSckCTa0LlbX+M406cxk3UBdjWU6oXLvatdwTxIydE5GwSx9DdGPdGJx
 TDw13GiroK73OM022nkay/zU6zcFh9msiyg0lNDufnRn1Fs0HOAQOtuw6hxnXwHydqH6Ce
 FKpXzgjWQqzVdduyWSKBf4v+T8zJEdCLckflS/Vert9r538ejb1+Gmjr42DlFIFabQgzOw
 xejMHwAlr/v2v+OQ3PRLfx1OxtgEEy2769T3wuqYJF00JSSBnnuSiVoQJHVZxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aWuEAfuE
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal: clean shellcheck issues
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

On Tue, 1 Aug 2023 11:02:04 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

>  mkdir -p "${BINARIES_DIR}"
>  cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
>  	the_ROM_image:
>  	{
>  	  image {
> -	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
> -	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
> -	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
> +	    { type=bootimage, file="${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi" }
> +	    { type=bootloader, file="${BINARIES_DIR}/${BOARD_NAME}_plm.elf" }
> +	    { core=psm, file="${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf" }

Is it OK for bootgen.bif to contain double quotes around the file paths?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
