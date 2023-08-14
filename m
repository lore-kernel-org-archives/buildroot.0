Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2F2C04A6A
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5030760FB1;
	Mon, 14 Aug 2023 14:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5030760FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Bg3oVscXZyL; Mon, 14 Aug 2023 14:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0407D6107D;
	Mon, 14 Aug 2023 14:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0407D6107D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9061BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D930840569
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D930840569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P41SGrfyJtZq for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:53:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9B80402CE
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B80402CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3870FF80A;
 Mon, 14 Aug 2023 14:53:45 +0000 (UTC)
Date: Mon, 14 Aug 2023 16:53:43 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230814165343.2e3936c6@windsurf>
In-Reply-To: <ZNiFAM4q72gwMume@waldemar-brodkorb.de>
References: <ZNiFAM4q72gwMume@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692024826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khWVCZsBI6ZPjbo9Q60mfhNlXrdhgFSC4k4bw1v0tfw=;
 b=o1G/GabpapsGDU9Lxfi2uRki/G+J5Kq5yEa8mHoSyYIjjXgkQPjCH0FxcSktgqwIDJ39nk
 o4BurkcbyVmQdvVDOKE/MPKdBti9VhoHMoDezIol35OB9XrdUNj2+8Sjk/U4zQyEX4yuxo
 TPHPoZ6bxsLe/sHXRuorKt4HofSyqAjK3io84TWGuBJeDiv4o0na3hwJu23GEazGaLjDcW
 fnMzqBWP8H/yAaUVgh/HgM9TV2tsAKh73AVodUS6Fcvh5rRTFIZ1KHGl2HiUmRm54E3SoB
 tRpirMbDgldgRHxMbA8Nnna/UQRElSMaFfCE8cQoQ5SFfdFe/pboZ2gbUK8TzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o1G/Gabp
Subject: Re: [Buildroot] [PATCH 2/2] package/tcf-agent: fix uClibc-ng
 compile on ARM
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Aug 2023 09:23:44 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +endif

What is the situation with musl?

With glibc, BR2_STATIC_LIBS=y is impossible.

But with musl, BR2_STATIC_LIBS=y is possible. Is getauxval() always
supported on musl, regardless of static or shared?

Also, shouldn't the horrible "#  define USE_getauxval
(defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 &&
__GLIBC_MINOR__ >= 16)) || (defined(__UCLIBC__) &&
defined(__HAVE_SHARED__)))" be turned into a proper CMake test ?

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
