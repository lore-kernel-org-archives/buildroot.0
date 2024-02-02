Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18A1C4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6907084E51;
	Fri,  2 Feb 2024 19:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6907084E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgC78pSlUdsU; Fri,  2 Feb 2024 19:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B5384E4B;
	Fri,  2 Feb 2024 19:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B5384E4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2DC1BF3C3
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 380B784E4B
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380B784E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZiHuKCdpQC5 for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 19:21:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB6E784E3B
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 19:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB6E784E3B
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87FD5A4C00B7;
 Fri,  2 Feb 2024 20:21:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33488)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rVz6N-000000006J1-03MQ;
 Fri, 02 Feb 2024 20:21:27 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 20:21:26 +0100
Message-Id: <20240202192126.51102-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706901687;
 bh=WMJAEVNR+Ko3EWyA1VOMtGhml7fJvxLCfHrtKV88cbs=;
 h=From:To:Cc:Subject:Date:From;
 b=cT+dkNQhCcPKlms/H45Irw6kQJoZ3tgTwwJck49TWVFdk1kLs+KKwSSBORSESOL9A
 YuFjQzZ68r5Ifb4oEsFeM15Tdhd5WsSWop1q8Z6HTNBR64lcmBOHKtFSZEvHMgDr8e
 oQevTyUFdKNdPFZXf/Zq/FbQUQiviGohQj1vmRSjwGT74OCg/ragucZC3h6yN5txLf
 w0dHjrNXAonWrqWq2EozFDyjGG+Gwac5GpCTmCBpKllMqvp7r0wqsTJHX18fWkXJqw
 knVTvX9d8sOeLuvkRX/0yYj8SnmY8EdZVSszn9TB57MG2Xq72qe7P+nejym+Fh2WVH
 hhFliMPXZZ4PA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=cT+dkNQh
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.5
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000748.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d04fa10342..b9b328b268 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.3.4
+MESA3D_HEADERS_VERSION = 23.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e99027c013..7e49119c41 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-January/000745.html
-sha256  df12d765be4650fe532860b18aa18e6da1d0b07d1a21dfdfe04660e6b7bac39a  mesa-23.3.4.tar.xz
-sha512  026c424989a594dd840dc158ca09e0f57e604f0b1bd2a3981110b4b2b5a47c6cd9c7241c7f48957a781e2dd9f9760cc9db79b2fb7c7fe39b64eddb18dcf18412  mesa-23.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000748.html
+sha256  69ccb1278641ff5bad71ca0f866188aeb1a92aadc4dbb9d35f50aebec5b8b50f  mesa-23.3.5.tar.xz
+sha512  1ad29f524caee0000ef51abe58d29d9687de5fbc5168f7e677bb4e69c5e9a94918d5fbf6e10c6757fe7ce6d47bab109e452f0fa2e26aad2e6f8bfb744383b5ea  mesa-23.3.5.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d3bc7020b1..4e6cb3571a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.3.4
+MESA3D_VERSION = 23.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
