Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C7EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 17:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2745361206;
	Tue, 22 Aug 2023 17:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2745361206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvAEA2GTvYkC; Tue, 22 Aug 2023 17:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A48861204;
	Tue, 22 Aug 2023 17:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A48861204
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45E2F1BF348
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1919081AA7
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 17:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1919081AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F74pnPIAyZ0w for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 17:57:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D55381A99
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 17:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D55381A99
Received: by mail.gandi.net (Postfix) with ESMTPSA id E549E40003;
 Tue, 22 Aug 2023 17:57:27 +0000 (UTC)
Date: Tue, 22 Aug 2023 19:57:26 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230822195726.0f691945@windsurf>
In-Reply-To: <CAN=fXj29fRXvHHZVG03LfTfPQeBrzroV5VN3nwavTw3gejS90Q@mail.gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
 <20230822001341.7256e67d@windsurf>
 <CAN=fXj29fRXvHHZVG03LfTfPQeBrzroV5VN3nwavTw3gejS90Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXmqshorMW5rlnulsJBG/4o9TmzgX9e8yVNBQas5qi0=;
 b=YQdU/6RXGQD6sZvsTtMlHMsUtSQYoc6ffijfrnYdTWbvdS0uJ8W3+qIF1rkgX9wDqJCVFH
 gW3ZWYecnMnwI5zlgSgI4jVL6VmjTlkKoAAvsVKxV/cDLYaqCdEUD/FMhZE1zk3Xp/fVK2
 ZDOlSMOHddE3B2ScKOJHvapqvnvx8ItNDMQPLmJ/M5gb7FmZTcHSVWhzz4HtEok12sywox
 pv6hACwTQlF6FlXcJRyfHCkkS8/AIgWjcJF7mDh97WcdhkaAuhX5x5xkMA2rWL1yosk2Wn
 f9uSkewjurarppVT1/pJxsL+nukgu5fuBhLAK5a6gcDxlbWnzGfDVoyXudIxHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YQdU/6RX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Mon, 21 Aug 2023 16:45:23 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> https://github.com/zephyrproject-rtos

Yes, I know what Zephyr is :-)

> The build is cmake derived but relies on calling into some python scripts to
> generate some build dependencies
> 
> https://github.com/zephyrproject-rtos/zephyr/blob/main/scripts/requirements-base.txt

OK.

> So, we have various RTOS MCUs that are hooked up into linux controllers,
> and this is just a simple hook so that the same SDK can be handled to build
> both firmware for something like an STM32 and a Raspberry-pi

If I rephrase this: you want to use Buildroot to build the Zephyr
firmware for your STM32 micro-controller, alongside with the Linux
system running on the RaspberryPi?

> Assume a reference to
> https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee to add
> the gcc eabi toolchain has been done in an external package, with the
> patches above we can actually build both firmware and the drivers in
> buildroot from one tree with external recipes like below

Note: this gcc eabi toolchain is now in Buildroot upstream, no need to
add it as an external package.

> env PATH=/opt/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin:$PATH cmake
> \
> 
>     -DCMAKE_TOOLCHAIN_FILE=/opt/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/share/buildroot/toolchainfile.cmake
> \
> 
> 
> -DARMGNU_GCC_TOOLCHAIN_PREFIX="/opt/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/share/gcc-arm-none-eabi"
> \
> 
>     -DCMAKE_BUILD_TYPE=Debug \
> 
>         ../buildroot-external

Not sure to really follow in which projects this cmake command is used?
To build Zephyr?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
