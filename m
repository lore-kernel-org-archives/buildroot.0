Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980FCDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B64180E8D;
	Mon, 22 Jun 2026 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmrTElyinikV; Mon, 22 Jun 2026 21:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441D480E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782164443;
	bh=+0qC6BatF02BH+gjBfTPoZt+qzi8g128w/FNJbT0ThM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NI/xrjDahKaHzjygRfADAxvkHb1+LeRBfbfn6INRO9G3Bw3ylW5olvQOGssfU30az
	 VPCwfacyPb7tKdmxxdOjLbQ+SmgQOkhsM0oK8lyc8R3dEbz4hNceMuPZDRXjSphPCC
	 4MhZ/tC8bD68+q/dw3aQQsQHHITkRt3J5Ik1+pfEWvk2TpWrnsWIJynIhuiNvU1lFN
	 PiQtw15FL4xzkUBAU0hJFH7POB7/1ZZLAUbJrJ3CS8Rv1vGyN6hjkMMzCIoyzVZ18R
	 9yNRxKtqmDHD4ukRwa0/hRT30NrWrqbj8B0nj9Auqkp+10dXXY32unamRdAuyKG9oj
	 wwQ8ywWYKzrUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 441D480E02;
	Mon, 22 Jun 2026 21:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 116EA256
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA73F606F4
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syvo7Yp_slxS for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C547606EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C547606EF
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0AC584020; Mon, 22 Jun 2026 21:40:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:21:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c370d3d8fc30d15f06aa3c318ee234590ece4b1
X-Git-Newrev: 899918c53bf7cbc4c4f2cf9b08ee44b854a273f4
X-Patchwork-Hint: ignore
Message-Id: <20260622214015.C0AC584020@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add virglrenderer integration
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/899918c53bf7cbc4c4f2cf9b08ee44b854a273f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add optional virglrenderer integration, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/qemu/Config.in | 21 +++++++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8e932c014f..bfb8ccea88 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable qemu support for virglrenderer.
+	  virglrenderer backends such as virgl, venus, or DRM native
+	  context are configured under the virglrenderer package.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
+comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
+	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
+	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index aff1762fb9..4f4786532c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -279,6 +279,13 @@ else
 QEMU_OPTS += --disable-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer
+QEMU_DEPENDENCIES += virglrenderer
+else
+QEMU_OPTS += --disable-virglrenderer
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
