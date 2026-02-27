Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84234104891D
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 23:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F6F83CA1;
	Fri, 27 Feb 2026 23:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiHrq6ASwiIW; Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB3B83C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772234068;
	bh=4ecd06RiNQjyhNOI0u4N9xkKA/miFZ4PDqqZ9+y8R5w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLlsC4hJZoJUDKaKWhlQX+IcayS3BnqkNO0oGhWPuUtEANPUeSQt+FCdJiwHx+L7h
	 iCbHfx8xNnvQLcMECfDao3aLI+kAJLQg42leUI4Tz1BjyqQ4oblPn20ipFbnFUBF4R
	 ieyorj2oJfHVfFlSgg6kVRgDlzV/qmzkipje0JaqJRPZutx8e1flBKnFLCqrtyL8Ko
	 TrvsdHexrw3xaQHswTO4ywyRqihmXghtlhOFBYq7BktTQKO/SFmQ/IjbxvNP/mT/IW
	 sV0ns90NS39E0Xcs34lP1Zk0prs+hJ1vL6y0XNZfxOUMjzbnKOAlRwUfp4ckUk3Uf2
	 aGXAYXViLEpXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB3B83C51;
	Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A355131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD56418CF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70b4o0vtZhb3 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 23:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D0CB418A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0CB418A6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D0CB418A6
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:25 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c70fb6aa323so860264a12.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772234064; x=1772838864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fQkdHq2rIsxFq2HLFER7EHxvvzjdIM8R6w0re8URLwk=;
 b=OldQ07o7D9VxU5fTGPJw6CkrePuQHQAJgpS/fVStJ5QS3DlN51kmWyGjc+i8s+qv3U
 0VbWFas67I7ScaNpATd+ovyYNGrtBipMU+yqdkc91/wqTBoqwiUK6f+XngQWlMH47Ezt
 YwPlWlxptBd09v3YQryyTug+xvB+32hJZT1fTZzFNdJHbHydcFMAkUM7OfxohqvlfFmY
 T1kZGdX64/uPmH9AI9ZZQlplRIuqxdA+pBdVs6GNIVCmQL1XlWFJ1L5ONXSIKqkYj+U5
 d4U6VrrEBJ9fsgWJCQlqxjj7f3Mtji0NKHMH6bvc8R1QKk67nZZgSS+EV7VAvKAEDly2
 0OLA==
X-Gm-Message-State: AOJu0YxxokH+CvQcvkCPPssvesDa2xWk5LTzXIKJR9GdQtuWM80RD+Ev
 aOEvRmFpDicwDhZQKlUdleShw22UJcd/J/qKyaH9zLN6QlW7loLWwkj7vLofzmvYKYI1HkJTJRZ
 x27b73as=
X-Gm-Gg: ATEYQzw8llV/FwapRtZgAlg9tp5f6FqIfVJn8VpQ0z+SeuMbXPFyQCEV+yCPSHdrHdf
 Q7HKCNYW3+bzWASLEEWFq1gRY/tRqEE6R3CVAnTSSkrVMkStKxUCOp7oAOVjSkH4CjH7BWJah2b
 y4hyxOynVniSxVukQOvzcqmGtCQcChrKSSnvsjEUa9iXroEhz0ZEksKrXHQrPLs+19JLb1Mjlps
 PYAuZvrys+AKaqQpQY6s+inlNvcKex+SguyqfE33ugoTt9JVlFjy1ybbLHzf8S+DZMdeY5WOVf/
 bMXwdwq5Qfd6HE729Iir5/dAPYv+zvjL3Ox4u6uTPQKrGamqSKhyHTZpxv3uRlAJ2FPYB40o+r9
 WgeVRFJUgVka+suswkCXl0PwjKdJcKHo9HoRpum+fJmiAl0MQbj9dVs4fAxPswr93qyaNeFx1zy
 sjKmSlXnQ+6qK5IFC1AoXq9w7eTZCtLMu5O1g=
X-Received: by 2002:a17:903:b8b:b0:2aa:daf7:84ea with SMTP id
 d9443c01a7336-2ae2e3fb944mr43050295ad.45.1772234064243; 
 Fri, 27 Feb 2026 15:14:24 -0800 (PST)
Received: from wash.clouded-fir.ts.net ([50.120.91.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fff3sm72007995ad.48.2026.02.27.15.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:14:22 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Joseph Kogut <joseph@anodize.com>
Date: Fri, 27 Feb 2026 15:14:05 -0800
Message-ID: <20260227-mesa3d-amdgpu-virtio-v1-1-3e6d10d4eaef@anodize.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
References: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772234064; x=1772838864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQkdHq2rIsxFq2HLFER7EHxvvzjdIM8R6w0re8URLwk=;
 b=KSGlVA6S8XHcRb0POvLZsSo8y5fEO6HUQCpHq+x8OgVocgI+IrbPR/nEer01CmqDdE
 LN2qXCmf6aaDwIa8yGwsSpeLYJBHH6s8O2cVz5ooIprVrXr7XW5TtjJ+zT/Gt1I+Tnqm
 xFzMPrnGlGtYGQjFtgjHAQnrQ6/ALNtey/o0+LYHS8vWCqw1zbA3iIPUdGT+4ydnXa8y
 PM1twjyP8dDr5st7xdSA3S/kOSSTnKTOKSEmgNyJbhrIEjqwJOJUvfD0v549HyXwHqjb
 6rF+Dga2c6zpfV65e+UglmcpT/7IkccoD7GDdM4gW8H1K1FB4BDLVJrekEwWDVeCpiGO
 ULBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=KSGlVA6S
Subject: [Buildroot] [PATCH 1/4] package/mesa3d: add amdgpu-virtio config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a config section for host native context drivers, which currently
use virtio-gpu as a backend to mediate access to the host kernel's DRM
uAPI.

https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 19 +++++++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 63acf0cc6e..015c47af54 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -248,6 +248,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU
@@ -332,6 +333,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  RADV is a userspace driver that implements the
@@ -406,6 +408,23 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO
 	help
 	  Vulkan VirtIO (venus) driver.
 
+comment "Host native context drivers"
+	depends on BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
+	bool "amdgpu-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	help
+	  Enable VirtIO support for AMDGPU native contexts
+	  used by the radeonsi (OpenGL) and RADV (Vulkan) drivers.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	bool
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e5880cc995..5405aa3d50 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -151,6 +151,12 @@ ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_DEPENDENCIES += host-python-pycparser
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU),y)
+MESA3D_CONF_OPTS += -Damdgpu-virtio=true
+else
+MESA3D_CONF_OPTS += -Damdgpu-virtio=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif

-- 
2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
