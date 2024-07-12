Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A05C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB2C40199;
	Fri, 12 Jul 2024 10:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adYu1XTIkUID; Fri, 12 Jul 2024 10:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8EE641722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EE641722;
	Fri, 12 Jul 2024 10:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85BFE1BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F05E41722
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JsA6O8ROpk8 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A450041515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A450041515
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A450041515
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:43:26 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SDkJsrp8h6epjSDkKsOjdd; Fri, 12 Jul 2024 12:43:24 +0200
Message-ID: <50c765a8-eaa3-4394-8ad3-61ec65959c66@benettiengineering.com>
Date: Fri, 12 Jul 2024 12:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
 <20240712090956.24409852@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240712090956.24409852@windsurf>
X-CMAE-Envelope: MS4xfFm1N7v/pGSA0Ei8shvAkyaTRVjG6l5aRBIA0HJQi3KC2VzZv5q2DogNANMzSXbrfP+X4ogr4EfwL0h4CwmobQprRA0+gHCJDE4xdQBVLH0imSS5o1qg
 3kLUevYjgjC15UM4g2fss8hfR+gDBvTirNxrpYujYPsAkkEiJLIKQEKjO2P8s5Hbkh5reN26ZRiFxjNWzmsibKP1UKyi6aMthMCz7yGEKeSvae0jgQ0GOpbD
 UDAmXPXLEBEcEFtQ0WTnDiOzi+daHUUvGbqBeYKbqNMyNDWTOg7T7g6nGVH5OJyautPBmolZiQsF3Q1rDK4fkg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1720781004; bh=pqH3ah85MaXsgg03IAxk9WlP95KCBP3FkohSWYuQXo4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UF9JPJYAvjReErsG8ejIp5XCqwCGgneIadj9sa0xZWM/APx7v8hiDSXU2ZSh0MGsZ
 RZBqPr6lSjlRM4xAcmlQj/rLUlwotECYy/JnchIqZMRt/IZWSSUN+BRl/LW7x+3+Fk
 qI3leVEue5bp4mkAP0Z4R73Jo5hRAgFJ2o0+XJQ/ewAZD+e3u493cYAEBdDhRHfg7B
 tl/XD66sn1V6pIRf1q4EGQCv/RLCX20AfPZg4+XxvgzNyUAjY2BxPwn6I6WadvMfrd
 p7VKJxZPD4cqcwsu9zslHw58fLE3oIIFmVFUQL23y6vaJ68TFvw46XpnKUTAb2HN89
 5b2F4Wf7uGSUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UF9JPJYA
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2024-07-11
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Dario,

On 12/07/24 09:09, Thomas Petazzoni wrote:
> On Thu, 11 Jul 2024 21:15:39 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This version provide patches that can be applied with fuzz 0 and this is
>> now required by Buildroot.
>>
>> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>>   package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks for this update. However it seems to not work here:
> 
>>>> sunxi-mali-utgard-driver ad7e98bc1e81c7ac9c897f854c1a429d33e45d58 Extracting
> gzip -d -c /home/thomas/dl/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58   -xf -
>>>> sunxi-mali-utgard-driver ad7e98bc1e81c7ac9c897f854c1a429d33e45d58 Patching
> 
> Applying 0001-build.sh-do-not-apply-patches.patch using patch:
> patching file build.sh
> ln -sf /series /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/patches
> TAR="tar" PATH=/home/thomas/projets/buildroot/output/host/bin:$PATH support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/ /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/patches
> 
> Applying 0001-makefile-Add-install-target-and-build-the-module-by-.patch using patch:
> can't find file to patch at input line 16
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |From 063c492b89cdbb8739d04b5190105cf2c9e12e6f Mon Sep 17 00:00:00 2001
> |From: Maxime Ripard <maxime.ripard@free-electrons.com>
> |Date: Tue, 29 Nov 2016 10:11:12 +0100
> |Subject: [PATCH 1/4] makefile: Add install target and build the module by
> | default
> |
> |Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> |---
> | src/devicedrv/mali/Makefile | 7 ++++++-
> | 1 file changed, 6 insertions(+), 1 deletion(-)
> |
> |diff --git a/src/devicedrv/mali/Makefile b/src/devicedrv/mali/Makefile
> |index 44c7bb83981a..2fee5e096b51 100755
> |--- a/src/devicedrv/mali/Makefile
> |+++ b/src/devicedrv/mali/Makefile
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> make: *** [package/pkg-generic.mk:242: /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/.stamp_patched] Error 1
> 
> Am I doing something wrong?

This defconfig works at me:
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
BR2_PACKAGE_SUNXI_MALI_UTGARD=y

Which defconfig are you using?

Note that at the moment both sunxi-mali-utgard-driver and mali-driver
fail to build after Linux version 6.6 due to new shrinker_*() API that
is not that easy to solve. I need more time to do that.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
