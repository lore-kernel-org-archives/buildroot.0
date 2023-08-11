Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AA0C001DE
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 03:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 039CA60BBF;
	Fri, 11 Aug 2023 03:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 039CA60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHXuTobWClRg; Fri, 11 Aug 2023 03:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA3C60B24;
	Fri, 11 Aug 2023 03:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA3C60B24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBC111BF847
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 03:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABFAB83BB6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 03:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABFAB83BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEPVs6vApObk for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 03:32:46 +0000 (UTC)
Received: from m1312.mail.163.com (m1312.mail.163.com [220.181.13.12])
 by smtp1.osuosl.org (Postfix) with ESMTP id B21BE82210
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 03:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21BE82210
Received: from tianyuanhao3$163.com ( [39.152.157.120] ) by
 ajax-webmail-wmsvr12 (Coremail) ; Fri, 11 Aug 2023 11:32:05 +0800 (CST)
X-Originating-IP: [39.152.157.120]
Date: Fri, 11 Aug 2023 11:32:05 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, 
 "Christian Stewart" <christian@aperture.us>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <20230729232723.68fb6289@windsurf>
References: <20230522202346.209785-1-christian@aperture.us>
 <20230522202346.209785-2-christian@aperture.us>
 <20230729232723.68fb6289@windsurf>
X-NTES-SC: AL_QuySA/uZu08p4yGfZukXmU0Ugec2WcO4vP8u1IRSOZE0vyn83CkCZ1tJAVzv0PqzJiSTlDyHWihizsdbf5J3UJ1EBdxwgswMvzIWfzwJF296
MIME-Version: 1.0
Message-ID: <36b75f0a.4ecc.189e2a6bbb8.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DMGowACnori1q9VkgUgZAA--.33261W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBdhXIjWDkou259gAAsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ION0TAixO9JqROIAD2dm/nh16Z/+1Za32SRAu3ntSVA=; b=W
 tivTD06Rz6SFSiZF9AAVMk5z+XCzsoczxfOYWcbfg5NQG0vxlD9uIz4cYz/YycEI
 ANXTPXWF1YFLtq1Z9zICh5BRvBYGlsYCQH8ki8bVxTeTqFwkl5w86HuMED1PPgeH
 /NGPSEqdrNsvklUgZ16y7jZk6P922DIyaBATcLFAVw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527
 header.b=WtivTD06
Subject: Re: [Buildroot] [PATCH v3 2/2] package/podman: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas and Christian,

At 2023-07-30 05:27:23, "Thomas Petazzoni via buildroot" <buildroot@buildroot.org> wrote:
>Hello Christian,
>
>On Mon, 22 May 2023 13:23:46 -0700
>Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
>> podman is a CLI tool for spawning and running containers according to the OCI
>> specification.
>> 
>> https://github.com/containers/podman
>> 
>> Signed-off-by: Christian Stewart <christian@aperture.us>
>
>Overall it looks good of course, but I have a couple of questions.
>
>> diff --git a/package/podman/Config.in b/package/podman/Config.in
>> new file mode 100644
>> index 0000000000..92f5d6ae3d
>> --- /dev/null
>> +++ b/package/podman/Config.in
>> @@ -0,0 +1,58 @@
>> +config BR2_PACKAGE_PODMAN
>> +	bool "podman"
>> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>
>I don't think that's true. That was inherited from crun, and I just
>sent a patch that allows crun to build with uClibc.
>
>> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # conmon -> libglib2
>> +	depends on BR2_USE_MMU # libgpgme, conmon -> libglib2
>> +	depends on BR2_USE_WCHAR # conmon -> libglib2
>
>I think you can just say "conmon, libglib2" as you inherit the
>dependencies from both.
>
>> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
>> +	select BR2_PACKAGE_CNI_PLUGINS
>> +	select BR2_PACKAGE_CONMON
>> +	select BR2_PACKAGE_CRUN
>> +	select BR2_PACKAGE_IPTABLES
>> +	select BR2_PACKAGE_LIBGLIB2
>> +	select BR2_PACKAGE_LIBGPGME
>
>Out of all those dependencies, you only have build dependencies on
>libglib2 and libgpgme. Are the other runtime dependencies? If so,
>please add a # runtime comment, like you did for the cgroupfs-mount
>dependency.
>
>
>> +if BR2_PACKAGE_PODMAN
>> +
>> +config BR2_PACKAGE_PODMAN_DRIVER_BTRFS
>> +	bool "btrfs filesystem driver"
>> +	depends on BR2_USE_MMU # btrfs-progs
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
>> +	select BR2_PACKAGE_BTRFS_PROGS
>> +	help
>> +	  Build the btrfs filesystem driver.
>> +
>> +config BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER
>> +	bool "devicemapper filesystem driver"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
>> +	depends on BR2_USE_MMU # lvm2
>> +	depends on !BR2_STATIC_LIBS # lvm2
>> +	select BR2_PACKAGE_LVM2
>> +	help
>> +	  Build the devicemapper filesystem driver.
>> +
>> +config BR2_PACKAGE_PODMAN_DRIVER_VFS
>> +	bool "vfs filesystem driver"
>> +	depends on BR2_USE_WCHAR # gvfs
>> +	depends on BR2_USE_MMU # gvfs
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
>> +	depends on !BR2_STATIC_LIBS # gvfs
>> +	select BR2_PACKAGE_GVFS
>> +	help
>> +	  Build the vfs filesystem driver.
>
>Normally, we would need a Config.in comment about the dependencies, but
>I agree almost all of them are covered by the top-level option, and the
>only one remaining is !BR2_STATIC_LIBS... Perhaps not worth adding a
>Config.in comment for this, I agree.
>
>> +
>> +endif
>> +
>> +comment "podman needs a glibc or musl toolchain w/ threads, wchar"
>> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
>> +		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>> +		BR2_TOOLCHAIN_USES_UCLIBC
>
>Needs to be adjusted once the uClibc exclusion is removed.
>
>> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
>> new file mode 100644
>> index 0000000000..f888f3ae5e
>> --- /dev/null
>> +++ b/package/podman/podman.mk
>> @@ -0,0 +1,75 @@
>> +################################################################################
>> +#
>> +# podman
>> +#
>> +################################################################################
>> +
>> +PODMAN_VERSION = 4.5.0
>> +PODMAN_SITE = $(call github,containers,podman,v$(PODMAN_VERSION))
>> +PODMAN_LICENSE = Apache-2.0
>> +PODMAN_LICENSE_FILES = LICENSE
>> +
>> +PODMAN_CPE_ID_VENDOR = podman_project
>> +PODMAN_GOMOD = github.com/containers/podman/v4
>> +
>> +PODMAN_BUILD_TARGETS = cmd/podman cmd/rootlessport cmd/quadlet
>> +PODMAN_DEPENDENCIES += libglib2 libgpgme
>
>Change += to =.
>
>
>> +define PODMAN_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
>> +		install.bin
>> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
>> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d
>
>What do you need this?

That's because the permissions for those two directories are 700 instead of 755.

>
>> +	$(INSTALL) -D -m 644 $(@D)/cni/87-podman-bridge.conflist \
>> +		$(TARGET_DIR)/etc/cni/net.d/87-podman-bridge.conflist
>
>$(INSTALL) -D will create all directories that are needed to allow
>creating the destination file.
>
>> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/containers
>> +	$(INSTALL) -D -m 644 $(PODMAN_PKGDIR)/containers-policy.json \
>> +		$(TARGET_DIR)/etc/containers/policy.json
>
>Same comment.

This directory permission is 755, so this line should not be required.

>
>> +endef
>> +
>> +define PODMAN_INSTALL_INIT_SYSTEMD
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
>> +		install.systemd
>> +endef
>> +
>> +$(eval $(golang-package))
>
>Otherwise, looks good. So it's really the question about build-time vs.
>run-time dependencies that didn't allow me to tweak the patch when
>applying.
>
>Could you rework the patch and send a new iteration? I promise, it will
>take less than 2 months to be handled :-)
>
>Thanks!
>
>Thomas
>-- 
>Thomas Petazzoni, co-owner and CEO, Bootlin
>Embedded Linux and Kernel engineering and training
>https://bootlin.com

It should be noted that the Linux kernel requires CONFIG_ NETFILTER_ XT_ MATCH_ COMMENT option.

Tested-by: TIAN Yuanhao <tianyuanhao3@163.com> 

Thanks,
Yuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
