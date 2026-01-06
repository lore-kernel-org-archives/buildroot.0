Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E6ACEFD15
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 21:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124BA4068D;
	Tue,  6 Jan 2026 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0LV9p680fHQ; Tue,  6 Jan 2026 21:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5721A40596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767735683;
	bh=vkpShRcEKSsFvCTNheE30u+t5hAGIT8heoj+MFoOVXo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p55kAyUFk/7HI6m2RIZUcw4K358wL5tfvzGLXAl+2vODleCodsUGy9yWu5+ULG59h
	 9WeSLzfLyeNqC5qleM+7o6skOCXSt3RL3uF2helfTaOms13rAYIAXH7AIjGgLKFe+w
	 PomRFuCEXQznsnpJt1Uph9W99dhI4tknLxtwTuiHWy8aMDVSa1L2RbSCCtKi09Ng9g
	 jUEzOXMMgD4iJkYqKeGw2jKzYiK9n3hIsbeo1n41nLU+wxGtox7FLJD7yelfwAJTug
	 O177UKMglPfbutdGVB502Zl9HeygNn7UNqgGR50DJZuRnmXRa1TD17kKmw46IUBcN2
	 h2sTOlcMXD2NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5721A40596;
	Tue,  6 Jan 2026 21:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63B6A70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6148840747
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG8xh3qCppw8 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F4F84026E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4F84026E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F4F84026E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:41:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1A7551A26B0;
 Tue,  6 Jan 2026 21:41:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D084F60739;
 Tue,  6 Jan 2026 21:41:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B4F8103C85F6; Tue,  6 Jan 2026 22:41:15 +0100 (CET)
Date: Tue, 6 Jan 2026 22:41:15 +0100
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20260106224115.4f44da16@windsurf>
In-Reply-To: <20250805025930.315021-2-Mr.Bossman075@gmail.com>
References: <20250805025930.315021-1-Mr.Bossman075@gmail.com>
 <20250805025930.315021-2-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767735676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vk71I2cV2IWWO3a77s5Dh2Xic+ZEk8YP9bRtvlluwQ0=;
 b=S428b16dWnvcN/MMFHXFTNtMGFlR0LxCmt6oIYhj+BduJd0etVrQyTtD15MKgo7WnZvGuj
 WBeIJ6MF5C50Mvg4f5c0g86zaeUfjW1oQSxf41GEEsNBnXCg0f55HlvlUjs8Q/j7sS/thX
 zNguJdfASYHT/W02Nlq+vnOTmORFRg87aLDqucn9sYwVMocOeUuIoE6FOgP1/vG7vSly3H
 P5D1hXIpjnd7yq3/NB9DDDJVtzv5wklESyb7Hzadpk6zxhDZwAy8hf9LXxmTm0eSeP8/8O
 kVTOp+utrkr5897V/6uvjMcv+9Lf5wmKo8TA2593ddqhU8BB+T8UxeOFXvn+2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=S428b16d
Subject: Re: [Buildroot] [PATCH 2/2] package/picotool: Add host-picotool
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Mon,  4 Aug 2025 22:59:30 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add a host-picotool package to picotool.
> This will allow users to build rpi pico applications on the host system.

But what is the use-case for that?

> Also add cmake as a dependency to target picotool.

Nope this change is not correct, the host-cmake dependency is already
handled by cmake-package, if needed.

>  PICOTOOL_VERSION = 2.1.1
>  PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
> +HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
> +HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk2 host-cmake

                                                         ^^ sdk2 ?

Also, drop host-cmake.

>  PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
> -PICOTOOL_DEPENDENCIES = libusb pico-sdk
> +PICOTOOL_DEPENDENCIES = libusb pico-sdk2 host-cmake

sdk2 ?

Also, drop host-cmake.

>  PICOTOOL_LICENSE = BSD-3-Clause
>  PICOTOOL_LICENSE_FILES = LICENSE.TXT

Some reordering would make sense here:

PICOTOOL_VERSION = 2.1.1
PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
PICOTOOL_LICENSE = BSD-3-Clause
PICOTOOL_LICENSE_FILES = LICENSE.TXT

PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
PICOTOOL_DEPENDENCIES = libusb pico-sdk

HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk

So that we have:

1. Generic variables (independent from host/target)

2. Target variables

3. Host variables

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
