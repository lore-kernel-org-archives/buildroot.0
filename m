Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD00C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23FD81431;
	Mon, 31 Jul 2023 12:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23FD81431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiPDxHr3d7aM; Mon, 31 Jul 2023 12:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB778142E;
	Mon, 31 Jul 2023 12:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB778142E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 041A31BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D697D40489
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D697D40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPVfDHCRZpZi for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:49:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2BAC4016D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2BAC4016D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39EC560003;
 Mon, 31 Jul 2023 12:49:57 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:49:56 +0200
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20230731144956.09d56866@windsurf>
In-Reply-To: <20230731122022.1686951-1-robimarko@gmail.com>
References: <20230731122022.1686951-1-robimarko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690807797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc58VrNrRb2E2LD5HndFBoDK9cVa9iCBmd2VVpf+T48=;
 b=ajLRP+hZWM12JVQn2RG0DYa6lOQMNoMnmGHlCKcaAWvMKjiq9TKaRi1UkxmHbuy47T7S9h
 0QoiNUdqVCi38kzd6gEnQh07nZU49nKsMjd0Zn08cnxQ2mCHKXDe44nlwv9JCr86QaU+K2
 JnRCeheGMq980vds+Vtt1djSf1hlz5+0VHn7bXHY4ZpM/Bbp7+xyoIWEA/ld/vgzadir+a
 X0bmUKNJYFbv4E5tEWOyZZGz3l7817DQMyhAqnfGoaSMur/3nugXJLgW0acTKxvvQA37JT
 OavS/YmThzTzBw4butLduZKbDg1OodWetW8yCzG3cGabU7eOOowZIkROTBNBBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ajLRP+hZ
Subject: Re: [Buildroot] [PATCH v2] package/mhz: add new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

On Mon, 31 Jul 2023 14:20:22 +0200
Robert Marko <robimarko@gmail.com> wrote:

> mhz is a tool to mathematically calculate the real running CPU frequency
> and as such has proved as invaluable tool for developing CPUFreq and
> similar features in the kernel.
> 
> Its source finally got a license recently so it can be packaged.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Use the Makefile from source and override CC and CFLAGS
> ---
>  package/Config.in     |  1 +
>  package/mhz/Config.in |  6 ++++++
>  package/mhz/mhz.hash  |  2 ++
>  package/mhz/mhz.mk    | 21 +++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/mhz/Config.in
>  create mode 100644 package/mhz/mhz.hash
>  create mode 100644 package/mhz/mhz.mk

On top of what Baruch said, you also need to add an entry in the
DEVELOPERS file.

> +define MHZ_INSTALL_TARGET_CMDS
> +	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz

	$(INSTALL) -D -m0755 $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz

is preferred here.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
