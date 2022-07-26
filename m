Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85378C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173DC40918;
	Tue, 26 Jul 2022 21:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173DC40918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rlhrzv9Y-m_e; Tue, 26 Jul 2022 21:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADB74090F;
	Tue, 26 Jul 2022 21:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADB74090F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21EC11BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B3D607B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B3D607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8h3ZfkSJG32 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:37:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9135E60671
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9135E60671
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:37:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2184920003;
 Tue, 26 Jul 2022 21:37:31 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:37:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726233730.2d2babdb@windsurf>
In-Reply-To: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
References: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658871451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tiwBmRvw5S4OtIGf3rC/YmJi7Ayjd5ynYWCFdf9qOw=;
 b=p3gupvsojaUjumE79YujbNYA0IkI+Edev3jCfK2Y5BIOXWppPNKQIR/5//N9HfrxViDrO3
 63x6WjsnqId9M/UhmdeSY6uEE/4jvDXz3Xnz1EfC5Hfws8cR1FjWyd61W3Hu0BCvbknq+R
 knC0f9Qf5iul2CztDjZIFyl/VMdoSnR9HbtjvXsBqvjZdVQd0VSQjJfvVnK7jLBp2U7eYR
 v/cRv3xgtBIx3kBLp58mHRP+2Cin0G36nVAFO4NUSMg/yCJ8yV/0LwB0L2YywPI1qpu3c4
 mAgxjqqTT+4LnOkIu1bRMV8VE82v5zE1cpAZhgkJ4z95Dl/JrOt8A1s52gBW9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p3gupvso
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 May 2022 11:21:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure:
> 
> ERROR: modpost: "video_ioctl2" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "__video_register_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_new_custom" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_handler_init_class" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_device_alloc" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_device_register" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_device_release" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_handler_free" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_device_unregister" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_unregister_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/v4l2loopback/v4l2loopback.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied with the fixes suggested by Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
