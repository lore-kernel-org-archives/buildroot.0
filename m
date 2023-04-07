Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE2C6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 15:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25797616A7;
	Fri,  7 Apr 2023 15:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25797616A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHwADb2QHGIX; Fri,  7 Apr 2023 15:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 544E4616AC;
	Fri,  7 Apr 2023 15:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544E4616AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9551BF2A3
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 15:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 754D5404AB
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 15:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 754D5404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNR8iEIt1hN6 for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 15:16:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45DF4400D6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45DF4400D6
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 15:16:55 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E1E3100003;
 Fri,  7 Apr 2023 15:16:50 +0000 (UTC)
Date: Fri, 7 Apr 2023 17:16:48 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230407171648.6fca3a4d@booty>
In-Reply-To: <20230327170604.22854-1-neal.frager@amd.com>
References: <20230327170604.22854-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680880611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDj+of2N3V9RzpTJ2I31282KdRIQkaikZO1QVC4U2tE=;
 b=aBwd4OacgxPy1F0uNtGodMzFOhbIKfOe7NPXqHwblaCDXCXTm9YECCcEkxlWGqpc/SiUuO
 uOZUHut5JPtq1/t+nybFV/DNv9nILCVywFaMIrSMua1c0qp/yuaPnUVi+e0ccGQnRGxEUi
 qg1bZrHCP2EWhsK0fWiwRWRrhm7QNGqDjPXz1gu4gwN5fnfTX1HGgW4WyGm/J14lM11wp3
 +XgglPYaSgH1tA+HOAcX6vHRb1reBt0wXzASooFVAn4Yod9TTxdtp2g0Jm/PZgJgwes6EG
 1H6jNpniEhMhwUscOQslx6squgRuHcASZUWDOYGN/m2LA5PNkMrn3Y2stjPc1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aBwd4Oac
Subject: Re: [Buildroot] [PATCH v2 1/2] package/zynqmp-firmware: new package
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 27 Mar 2023 18:06:03 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new package to buildroot for building the zynqmp pmufw
> with the requirement that the user must provide an external microblaze
> toolchain.
> 
> The below example config options can be used to build the pmufw.elf v2022.2
> using the Xilinx toolchain.
> 
> BR2_PACKAGE_ZYNQMP_FIRMWARE=y
> BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION="v2022.2"
> BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH="/opt/Xilinx/Vitis/2022.2/gnu/microblaze/lin"
> BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX="microblaze-xilinx-elf-"
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

These two patches look good, and I appreciate a lot your effort, however
I'm not sure it's a good idea to support both an external and a
generated toolchain. It makes things more complicated on the Buildroot
side and I'm not aware of any actual benefits.

Moreover if we take these patches now we would to some extent encourage
users to use an external Microblaze toolchain, possibly reducing usage
of the generated one for initial users. And I guess we would stick to
the external toolchain as a default for the future because it's what
was there initially.

So I would prefer waiting until we have a working
Buildroot-generated toolchain and initially support only that. Support
for an external toolchain can be added easily later, in case the
generated one were not suitable for good reasons.

Do you have any updates on your work to generate a minimal Microblaze
toolchain within Buildroot? Should you be facing any issues, remember
the Buildroot community can be very helpful!

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
