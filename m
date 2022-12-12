Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BC2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B3960C28;
	Mon, 12 Dec 2022 09:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B3960C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIpl8wB6Y8ra; Mon, 12 Dec 2022 09:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2DFC60C24;
	Mon, 12 Dec 2022 09:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2DFC60C24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8731BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35ABE4045C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35ABE4045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBTkkv3_8ETO for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:31:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2397B400F2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2397B400F2
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:31:39 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBBDC20008;
 Mon, 12 Dec 2022 09:31:37 +0000 (UTC)
Date: Mon, 12 Dec 2022 10:31:36 +0100
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20221212103136.71c0a850@booty>
In-Reply-To: <20221209194043.28673-1-brandon.maier@collins.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670837498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKRNCcNu6a0c1ejqfJlIXRY3gq8kiGOzjDucdXz7C9o=;
 b=DF+kPGw6/fdrtZA4TeR6wy1opB5jxfwGwqlRaoQNvbnUHFd2Vm4fsGPOLXHxNnuCWFmFZu
 VN+yglXf5a9LvqmwFT6VPL7KsurUR7wgtWWNXEkstUfhu6iZQZ8teuLTevLxvx6uExj4JV
 Rx9GS9kxbXVIgZ+R9h6AAo/0ZG1grw8p+r81aIxZ8qo7EdcaM0s5XeGQe4t/pF1ccL0s58
 Ir60VHbMWpX1AqxpRloR7KcvBXV9YNAKrnIwIH6alPHv+VskiNuYgh7PswmJSCWeffr3sW
 8nSFQyPPoD21kR9uWt3m6EZwjSB+zvGFwDcOwSUcXKnei93NaQWL/Qa+2bS3EA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DF+kPGw6
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

thanks for your patch.

On Fri,  9 Dec 2022 13:40:43 -0600
Brandon Maier <brandon.maier@collins.com> wrote:

> BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always
> tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. Rework
> the logic so if the pm_cfg_obj isn't a C file, it is provided directly
> to U-Boot.

Can you describe a use case where this would be useful? While I
intuitively understand there _might_ be some, I cannot find any good
example based on my experience.

Building the pm_cfg_obj from source code is very easily done by
Buildroot, unlike building the PMUFW. Additionally one PMUFW binary
can be used on multiple zynqmp hardware, while the cfg obj is very
likely to change across different projects, and a somewhat readable
text file is way more understandable than a binary blob.

> This mimics changes done to the ZYNQMP_PMUFW which had a similar issue.

That is different: we now support two different binary formats, not
binary-vs-source, and detection is based on the file extension.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
