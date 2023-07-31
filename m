Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7601C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 596C84013B;
	Mon, 31 Jul 2023 21:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 596C84013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhF5BWoWR82N; Mon, 31 Jul 2023 21:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4823140BCA;
	Mon, 31 Jul 2023 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4823140BCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05CC71BF2B5
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A91E341735
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A91E341735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVykMeF_RP-f for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:26:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43EA040282
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43EA040282
Received: by mail.gandi.net (Postfix) with ESMTPSA id 016D41C0003;
 Mon, 31 Jul 2023 21:26:29 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:26:28 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230731232628.4824f155@windsurf>
In-Reply-To: <20230711215502.3638293-1-giulio.benetti@benettiengineering.com>
References: <20230711215502.3638293-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690838790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GBlGtddhVKdnui7g+kiG+RuhfvlgQyhGD3EppjOLoI=;
 b=PvGkm8YvFN9mHwNZZKiFeoWqOMlaNz1OCPXZnqctABk4UFChNICvyWcDcZquY0jT7VKb+Z
 EA6f0u2Zycrjp4iBUBDzOWvGZp6pqMx8pJPmA2ZAYKHjbYX/o8E51gv+2jAZVR70xODBvi
 bf+aMHVfxaNWKIQafYDmxOPoHsmwhbifhrVwszUkOMq4hR3Y5JSyu3wd0RHFxlWNiikmYS
 elSpE3G3kPHl+JqE/E3KNLUgSkheyQOeVyPrvS5zKvuuGO/LYXR9pmWGCOx42rJHgfPfoi
 zabi6cNDkNMMT4ra3F6HlcRdBIOuW0upTSbkvOc24Jc5vK0MGfTyf8Ucir3Flw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PvGkm8Yv
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted-ng: add package
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
Cc: Jesse Taube <jesse.taube@benettiengineering.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 23:55:02 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This patch adds esp-hosted-ng package that allows to build Linux Kernel
> Driver for Espressif Esp32-* SoCs, that once programmed with the
> corresponding firmware behave like a normal Wi-Fi module. Both SDIO and
> SPI busses are supported and selectable.
> 
> Cc: Jesse Taube <jesse.taube@benettiengineering.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * bump to version 2023-07-11 to support latest Linux versions and ESP32-C6
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/esp-hosted-ng/Config.in          | 29 ++++++++++++++++++++++++
>  package/esp-hosted-ng/esp-hosted-ng.hash |  3 +++
>  package/esp-hosted-ng/esp-hosted-ng.mk   | 29 ++++++++++++++++++++++++
>  5 files changed, 63 insertions(+)
>  create mode 100644 package/esp-hosted-ng/Config.in
>  create mode 100644 package/esp-hosted-ng/esp-hosted-ng.hash
>  create mode 100644 package/esp-hosted-ng/esp-hosted-ng.mk

I don't understand why it was named esp-hosted-ng, the upstream Github
repo is just esp-hosted. Yes, recent versions are "ng", but we normally
don't name our packages according to the versions, except in some very
specific cases (libgtk3, qt5, qt6, etc.). So I renamed everything to
esp-hosted (hoping I didn't mess up anything in the process) and
applied. It built fine against a vexpress_defconfig ARM32 Linux 6.1
kernel.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
