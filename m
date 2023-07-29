Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3397C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7062E40951;
	Sat, 29 Jul 2023 21:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7062E40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghg-Xcm6ThAc; Sat, 29 Jul 2023 21:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF07409DB;
	Sat, 29 Jul 2023 21:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF07409DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E491A1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8ED640951
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8ED640951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsROSnoGe_0A for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:27:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C244C409DB
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C244C409DB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3451D40003;
 Sat, 29 Jul 2023 21:27:24 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:27:23 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230729232723.68fb6289@windsurf>
In-Reply-To: <20230522202346.209785-2-christian@aperture.us>
References: <20230522202346.209785-1-christian@aperture.us>
 <20230522202346.209785-2-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690666045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0BFlE5MncVmdq0z+9l+elB7w4WozX8VgntJGNX5N4M=;
 b=dk1I3fuqLLmx/c471il82+2ntzIEwx7cdPX2E7ZCZpWt1UM+3E7LaiiWpeLssL/S/+Xm54
 mrr6s4rJnbO5KN7yiMiXkWL5JL6/IR8nkYA4uY6K7Q81LshP3i5G8mLwVJTOa9LOGIXUp8
 F6c7ekv/Xg7J9J0mlC9GnW5nvIQsEOePtYRDPqqC+JGXDFjU1L3NlUA95KaYeISJ3YLa8D
 l/PyoEtzfPQszFzp0jXJnvGOQoMMKYA6FQ9XvjOB/OzbTo5zsW36YVuWvX7y9mHvgPgPK3
 WmNqaBWmWflRm+4CF19272h5vYhm2AzUpsZ17Wq6aag/7e3lExwd8DlcdxG+yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dk1I3fuq
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon, 22 May 2023 13:23:46 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> podman is a CLI tool for spawning and running containers according to the OCI
> specification.
> 
> https://github.com/containers/podman
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Overall it looks good of course, but I have a couple of questions.

> diff --git a/package/podman/Config.in b/package/podman/Config.in
> new file mode 100644
> index 0000000000..92f5d6ae3d
> --- /dev/null
> +++ b/package/podman/Config.in
> @@ -0,0 +1,58 @@
> +config BR2_PACKAGE_PODMAN
> +	bool "podman"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

I don't think that's true. That was inherited from crun, and I just
sent a patch that allows crun to build with uClibc.

> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # conmon -> libglib2
> +	depends on BR2_USE_MMU # libgpgme, conmon -> libglib2
> +	depends on BR2_USE_WCHAR # conmon -> libglib2

I think you can just say "conmon, libglib2" as you inherit the
dependencies from both.

> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
> +	select BR2_PACKAGE_CNI_PLUGINS
> +	select BR2_PACKAGE_CONMON
> +	select BR2_PACKAGE_CRUN
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGPGME

Out of all those dependencies, you only have build dependencies on
libglib2 and libgpgme. Are the other runtime dependencies? If so,
please add a # runtime comment, like you did for the cgroupfs-mount
dependency.


> +if BR2_PACKAGE_PODMAN
> +
> +config BR2_PACKAGE_PODMAN_DRIVER_BTRFS
> +	bool "btrfs filesystem driver"
> +	depends on BR2_USE_MMU # btrfs-progs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
> +	select BR2_PACKAGE_BTRFS_PROGS
> +	help
> +	  Build the btrfs filesystem driver.
> +
> +config BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER
> +	bool "devicemapper filesystem driver"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_STATIC_LIBS # lvm2
> +	select BR2_PACKAGE_LVM2
> +	help
> +	  Build the devicemapper filesystem driver.
> +
> +config BR2_PACKAGE_PODMAN_DRIVER_VFS
> +	bool "vfs filesystem driver"
> +	depends on BR2_USE_WCHAR # gvfs
> +	depends on BR2_USE_MMU # gvfs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
> +	depends on !BR2_STATIC_LIBS # gvfs
> +	select BR2_PACKAGE_GVFS
> +	help
> +	  Build the vfs filesystem driver.

Normally, we would need a Config.in comment about the dependencies, but
I agree almost all of them are covered by the top-level option, and the
only one remaining is !BR2_STATIC_LIBS... Perhaps not worth adding a
Config.in comment for this, I agree.

> +
> +endif
> +
> +comment "podman needs a glibc or musl toolchain w/ threads, wchar"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
> +		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_TOOLCHAIN_USES_UCLIBC

Needs to be adjusted once the uClibc exclusion is removed.

> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> new file mode 100644
> index 0000000000..f888f3ae5e
> --- /dev/null
> +++ b/package/podman/podman.mk
> @@ -0,0 +1,75 @@
> +################################################################################
> +#
> +# podman
> +#
> +################################################################################
> +
> +PODMAN_VERSION = 4.5.0
> +PODMAN_SITE = $(call github,containers,podman,v$(PODMAN_VERSION))
> +PODMAN_LICENSE = Apache-2.0
> +PODMAN_LICENSE_FILES = LICENSE
> +
> +PODMAN_CPE_ID_VENDOR = podman_project
> +PODMAN_GOMOD = github.com/containers/podman/v4
> +
> +PODMAN_BUILD_TARGETS = cmd/podman cmd/rootlessport cmd/quadlet
> +PODMAN_DEPENDENCIES += libglib2 libgpgme

Change += to =.


> +define PODMAN_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
> +		install.bin
> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d

What do you need this?

> +	$(INSTALL) -D -m 644 $(@D)/cni/87-podman-bridge.conflist \
> +		$(TARGET_DIR)/etc/cni/net.d/87-podman-bridge.conflist

$(INSTALL) -D will create all directories that are needed to allow
creating the destination file.

> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/containers
> +	$(INSTALL) -D -m 644 $(PODMAN_PKGDIR)/containers-policy.json \
> +		$(TARGET_DIR)/etc/containers/policy.json

Same comment.

> +endef
> +
> +define PODMAN_INSTALL_INIT_SYSTEMD
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
> +		install.systemd
> +endef
> +
> +$(eval $(golang-package))

Otherwise, looks good. So it's really the question about build-time vs.
run-time dependencies that didn't allow me to tweak the patch when
applying.

Could you rework the patch and send a new iteration? I promise, it will
take less than 2 months to be handled :-)

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
