Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F195C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 10:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17B8B60F82;
	Fri, 24 Jan 2025 10:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOwa946GRL8v; Fri, 24 Jan 2025 10:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36AF60A76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36AF60A76;
	Fri, 24 Jan 2025 10:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5397D94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE2460A58
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXqmxc5QMBCE for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 10:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F05DB60856
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05DB60856
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F05DB60856
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:19:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.19]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1tOgAo2nLi-00sTfv; Fri, 24
 Jan 2025 11:19:12 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Fri, 24 Jan 2025 11:19:00 +0100
Message-ID: <20250124101900.99783-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:EhHa/9c9Jksl42aeDCRQYgS5YWk+AnONKzmMcsMdYV1zYSZ+YrS
 uRXPL/BUxzhWPBm56AMVMgFr7jUVrwaN2SDcCQKsSl6AJXXrM+CMy/ucrZqSS4eNI0cZPsL
 phdB1aPsTyIMbVjJ87Rp/8CYCWc3wCj/D61q+oUM7/lSyZJ3XA/m6S1rI/Ofv3rfVilQ8+Q
 LnhvBR46mWgYp2R+tsv2w==
UI-OutboundReport: notjunk:1;M01:P0:pl+eRrA+dJk=;IJGV3mA0gWe6J1vrjfGWGLFzHCd
 NeP/mlSBGQTfay3eVE7y02WTAUoGM80TeQaog+NPwCnZk1XEGzqThnjTrjMFWcKxZKCprN/BN
 czmUY0BKjxbgdwxQt6rG/nii/irgrGXVxEmim4cRUT1HEq3MZWMfINh/b/OQA/1dcBTwSDr++
 t0gQbaCzyJP4v8LzlYyaiUZOp2gJFf+0W3Z1GNNLErGKa7dDGdNOAJCEP5Vnv27v70EZ+W/Sb
 DLaPx65mql1qyLEE3xZoM9wDOMpDwFYbfMzRZAYS+ywgj513NWKgedat4fGttoAadbEuk5X48
 /K89KTsOmhxeVPiTLlhwGRUA/XA66qoRCJsP/rr9bwd8PVKZIRGS0i4vuMtUe0xJYvJaYeHSp
 xi2Z+gDFNNJKKM+gRTTnDKyblGipCmS5ztgqWyPcCSGywX964sgPc9ZFZ+jcw328RlQ4yENa9
 rFbagVRuYSRrBMxlvV3IIfsedgBHCXNTDy8FO/r23YfF4v+ofTkc8n0fDsSkK7Sy0JEpkkeO8
 iWY9IACvcq1S/TEYCcvJjYUPiaYBpC97yPPNyseQaHPyE4LhLdj1zH/XhlnBfEzu40kL3QFaG
 Wp5ZzaU0F8mD+O0lStUM2FZEXTl5zbUON7oT2Q2OOZniI6BiHeFTqWTlxB+bli6rU7l25dvaY
 lGMIjxG2gy0+KKOA1Llu72nqWCb0mWlJHOH2equHz9yaPeqywEVRfnG3hmFHTnZUPoVXn4TXF
 r0/3uqsvWVlgBP0UaMaHxlSCpK/DXmPryVtuJmQxQHCZOSIQ3waYTe2SdruZeOv6FKpJ82OT9
 X23US9wRFQO1gdU1f6N1UPGwnrY6hJoVp7CMFIVoM9iJqNKPm5/YZcnZ0sk8ctkFAHRjcnXak
 kbu/WKkfXVOYyfMPVMQPBATRhOCQsZwx7pugrUvMElrE2L/jgQJD97Y3jrbFPresvxod4u0P7
 QncqypH0yiid5+Idm9o3EIyoz+Mydm/uAebUixrY32Yqe5Tx5qZeXPi0QNiMxemDwowROTRNX
 QrhPCIWxTi2v4PjHzgE8GGbDmOQVIqVqxxmE9a7doU340DCZF77UnjXivME2aZ4IkfGhm3TX5
 S0aNSsmJPM80FaVa20rXrp5CGwI5DTaH+62zNor5u+aI5uZeSAQWhobQlv6pC0XEvMoxDraa3
 /ssze/ezZP3JNVaMOL9NP+CzHs5DjQ3N3flakZj4EqQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737713952; x=1738318752; i=fiona.klute@gmx.de;
 bh=JNrHh4JmN88GPt6JGavIWRKxOiDzQ56uD4mjdMnVRWE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=f0wi6PvJlgTPyOHTCbHwjYUeCJudpYcI5x+rjC8HgtPtsFrYKT2wgmTr00ry4fuD
 eIqL4MuYk0lmXwVsEa3laYDqcoltEiMa6kByX5BHPWi7hC++OEuTceFkGQEDgnCM3
 A/t217lKTHSro0g7XsuZnVrkAmgJ+EuUbOjCz+Qx9SDYOH4BKaqEBZo+V0v0ekrLX
 5hiL5NHFck1f33bDsMTBUl95K10k6xoHxnb8evfDnktPLNJjJZeuZEUlmQ+HPcqhG
 6+CIck4Mx4L3wajCmp93YpYnbJJ9R8t2/HCInaqKzeGsxWXFXjywhun7DBRuf0tBB
 dTIqFkVqDO2p25plwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=f0wi6PvJ
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add option to build kmsro
 and zink Gallium drivers
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This allows using simple displays not directly connected to the GPU,
and platforms supported only via Vulkan.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/mesa3d/Config.in | 22 ++++++++++++++++++++++
 package/mesa3d/mesa3d.mk |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7761b0a650..1a446cac49 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -140,6 +140,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
+	bool "Gallium kmsro drivers"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	help
+	  Mesa drivers for kernel mode-setting render-only devices
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
@@ -262,6 +274,16 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	  virgl is the 3D acceleration backend for the virtio-gpu
 	  shipping with qemu.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK
+	bool "Gallium zink driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Zink is a Gallium driver that emits Vulkan API calls,
+	  providing OpenGL support on devices that only support
+	  Vulkan.
+
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "Gallium VDPAU state tracker"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..2a0b3aefe6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -99,6 +99,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedre
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
@@ -110,6 +111,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
