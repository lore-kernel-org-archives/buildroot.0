Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C510C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66D960761;
	Mon, 31 Jul 2023 20:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66D960761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSATlaX2Fjz1; Mon, 31 Jul 2023 20:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8000C60A89;
	Mon, 31 Jul 2023 20:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8000C60A89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60C071BF954
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDAEA60A89
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAEA60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5Tu260hGAWE for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:18:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FFDD606BF
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFDD606BF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A79FC0002;
 Mon, 31 Jul 2023 20:18:44 +0000 (UTC)
Date: Mon, 31 Jul 2023 22:18:43 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230731221843.61feafea@windsurf>
In-Reply-To: <20230428152211.20394-2-flaniel@linux.microsoft.com>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
 <20230428152211.20394-2-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690834724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lW/QNWVYhd6KuOctX28FI8VFJjIX3p0sSDdakZpPMo=;
 b=m488UhYh80GgLGij2fYjCvvjtb6hSMqJfEjNS7D8y1lPU9dw0Q+7+gOHRvwqLKPDQDdMpy
 59XNtsqPpQ3QLv5TfMkw/901mO5Ufs3ZbwzCc2JA8OeDEl0eqnjfXmH94T1GJhzBg1aQT2
 t7Q8QFP86xoNMVL1vOcNZstJMJ6dnL8FuatxBxai1iDRxVh5GTF7i7SiSk1+5Bl5DEtmqc
 oyZqBMkHddg0oHmJznd9GfMvbwE9D4PDJPc3Olw6rOQyPs7aHHEW+pPgzkcB1iE6kEc7KU
 JwFmqvDDZCreaL7B5ZBIANBY8HiIC8kkr2MhgvxpPYp7CnIAZXnEK2Ii63LVLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m488UhYh
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/sysdig: bump to version
 0.31.4
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Francis (and perhaps Angelo who can help?),

On Fri, 28 Apr 2023 16:22:10 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> - Remove upstream patch as it is no more needed.

Actually I had to remove it from current master, because sysdig was
bumped to 0.29.3 already, which includes the patch... and so the patch
in Buildroot doesn't apply anymore.

I tested your version bump, and it fails to build with:

CMake Error at /home/thomas/projets/buildroot/output/build/falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a/userspace/libscap/CMakeLists.txt:131 (add_subdirectory):
  The binary directory

    /home/thomas/projets/buildroot/output/build/sysdig-0.31.4/buildroot-build/driver

  is already used to build a source directory.  It cannot be used to build
  source directory

    /home/thomas/projets/buildroot/output/build/falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a/driver

  Specify a unique binary directory name.

during the configuration step of sysdig.

Configuration tested:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SYSDIG=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_1=y
# BR2_TARGET_ROOTFS_TAR is not set

it would be good to have a runtime test for sysdig in support/testing/,
as it's not trivial to build, and the autobuilders never caught the
patching issue.

>  SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
> +	-DDRIVER_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR)/driver \

So apparently something goes wrong with this. Perhaps because
falcosecurity-libs needs to be bumped first?

>  	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \

One thing that is a bit annoying with the packaging here is the fact
that sysdig needs to look into the source directory of
falcosecurity-libs and the source tree of valijson. Packages should
normally not need to access the source/build tree of other packages.
Not a strict requirement for this version bump, but would be good to
address on the long run.

By the way
-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson is truly
horrible, because if valijson gets updated to another version... like
it has:

VALIJSON_VERSION = 0.7

then this doesn't work anymore.

It needs to be VALIJSON_SRCDIR.

Curious that we can build sysdig today (I verified, it builds) with
this mistake. Probably means this option is irrelevant.

Could you have a look at all those issues?

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
