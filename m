Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DDAC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5180B4011F;
	Sun, 14 Jan 2024 19:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5180B4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hey-vO8N5IUR; Sun, 14 Jan 2024 19:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 682FD40156;
	Sun, 14 Jan 2024 19:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 682FD40156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3E41BF574
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4316382486
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4316382486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kMf_kOvD6Pe for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 19:21:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BE1382477
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 19:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE1382477
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82348A4C00B3;
 Sun, 14 Jan 2024 20:21:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39674)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rP62t-000000002ga-1H0m;
 Sun, 14 Jan 2024 20:21:23 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 20:21:23 +0100
Message-Id: <20240114192123.3237389-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705260083;
 bh=vGTXv1Q3NazEL3LJ2H4G8nZLqLTpwyZe9pNKznInFt4=;
 h=From:To:Cc:Subject:Date:From;
 b=TK2f5AUAT3HHkpPeLPWyQ5gRAAZr4+daTykGLZHsVlBd1PbvN9vNqn7FdbVDuju3w
 i7V+VZNi7l8jvT9+gF5wMI92lOf+xwtQ8aDNNv6gUNfxC8zQhN1YZiIS7VX87KcztM
 JWGSPpele0MoGukw26c2ME3iZHDW+bmlHS1YSJ/LBlmaSr6Mo+jW9Lm1JUom1+R7J4
 N0vffKgHZ2yKuR9m+3++P5GhgIh/1EnulRWpVrP1JwCijwABVCdO4kUabL6bjWnkGU
 eY5Wp87YgD13V94nB0f1cy5Ib21hPf4eHwaaW/b3BqytKqde5aRdfJ1BVTV3QUuMf2
 E/MyLOoEcEWqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=TK2f5AUA
Subject: [Buildroot] [PATCH/2023.11.x 1/1] package/onevpl: fix libdrm
 dependency
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit c50e9c21f0444b064bc257fcc0d3073fee945623 initially
added the package onevpl and forgot to add all dependencies of
BR2_PACKAGE_LIBDRM_INTEL.

Fixes:
http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
index a750e54d52..cd5b284531 100644
--- a/package/onevpl/Config.in
+++ b/package/onevpl/Config.in
@@ -12,7 +12,9 @@ config BR2_PACKAGE_ONEVPL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
+		(BR2_i386 || BR2_x86_64) && \
+		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
