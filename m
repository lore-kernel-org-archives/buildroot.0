Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224C0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 06:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81502408DD;
	Thu, 13 Oct 2022 06:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81502408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNYF45PnGYaw; Thu, 13 Oct 2022 06:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C05408C3;
	Thu, 13 Oct 2022 06:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C05408C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 012861BF86D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B90EC83E92
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90EC83E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-84ELO4YIJs for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 06:39:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B09F6824E3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B09F6824E3
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:39:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 952561C000C;
 Thu, 13 Oct 2022 06:39:53 +0000 (UTC)
Date: Thu, 13 Oct 2022 08:39:52 +0200
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20221013083952.145dbb8f@windsurf>
In-Reply-To: <20221013041616.491620-1-damien.lemoal@opensource.wdc.com>
References: <20221013041616.491620-1-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665643195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv6iHkDRbQy2t29nTeM7O03ERfLDsGrZsi7651YerFc=;
 b=GlqH8QDCQ+LDX5LYESUq3S+0SZ8mzkj4hjage05Tch0ZBQ5kW1mv0aRY5sjpUD9YozjUca
 pddGA6CD/tuVadY2YUDTxljUEAnwmsoIDUQjKQV4Miy47VunWXqD6idlMMZ8waRJEHbt0B
 wrnVUsIOA6Uo7xAG9dDOkf1IXgb4i3joJMsTD8/slaIzJ8boT21jOvSCQ8luvGehA2VXHo
 Y/N8YuIYfYnXz2VriWNcPGt0b53zcLSPsqTgBv/BNT91rciS5h4I2yCuQmIO1rHP5TAcaE
 szqxglPmciROjaDlcccLOXa4WKHL8Psuf8mYvKV7wqIrsXx/z9GTqHsjAxYj3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GlqH8QDC
Subject: Re: [Buildroot] [PATCH] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Oct 2022 13:16:16 +0900
Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:

> Gitlab CI reported build failures for the sipeed RISC-V nommu boards
> with the u-boot/sdcard enabled default configuration. The compilation
> errors are related to the openssl/evp.h header file missing, e.g.:
> 
> In file included from tools/imagetool.h:24,
>                  from tools/fit_common.c:20:
> include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
> directory
>  1166 | #  include <openssl/evp.h>
>       |            ^~~~~~~~~~~~~~~
> 
> Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
> files so that host-openssl gets built as a dependency of U-Boot.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Thanks for the patch. Could you provide the links to the Gitlab CI
failures that are being fixed by this, so that we can add them to the
commit log when applying?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
