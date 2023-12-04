Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B228BC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5834011A;
	Mon,  4 Dec 2023 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5834011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLyuMZwRBglN; Mon,  4 Dec 2023 21:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DA7441466;
	Mon,  4 Dec 2023 21:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DA7441466
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D8B1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A498408D4
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A498408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwJIygxM_CUi for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:10:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 852B64024D
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852B64024D
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18C64A4C042A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:10:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59116)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGDC-00068O-2i
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:10:42 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:10:42 +0100
Message-Id: <20231204211042.12470-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724243;
 bh=F/r3cIaJ4uNrgAxnfkUMhYG5TNO5GI8q3sHkevsT9cA=;
 h=From:To:Subject:Date:From;
 b=m/bLK8Y9t/9sNAz8s1JFAnsImbFpo1oQ9VWtHNQFpmJpGPC+T3TyqvpfspPxi5y8s
 qiyRMmu/FRGSQ97nzB+GbFCsO4Zb7hqdghNe7VBTLzvk87y1821zmyeg+/d0vpD3TX
 +MnWjGm9Rp/+VK+guE+PabnLB4TUZF4GzWlQ8cNMG+DJb4tngjZg6AIYtrMVSm+lf9
 aUprcfofwVOijtR0L3P3exRP3/d9+STU7vxFk+sqRPbBX8fUXR1zR+TEmARz9TmvqJ
 YejkkBWd59m1cJN3gVZDP4X6gylFd12z9sog4GbGoPoT5U1Aul+5OKoNzdl1IHXP3W
 Ol6mwwCUCourw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=m/bLK8Y9
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.118
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-November/003433.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 73f3d29f5a..bcbcdccf30 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003429.html
-sha256  a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  libdrm-2.4.117.tar.xz
-sha512  326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d271cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.117.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-November/003433.html
+sha256  a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88  libdrm-2.4.118.tar.xz
+sha512  2740ec10dfe96b520345c3f6f0d99a30aac95b1f96656bd9cd11269c2a83a9dac423da29d74a3deb55360e3ae2ca4a1de283e1e443667bedd22673f6629c9920  libdrm-2.4.118.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b9201e4bd3..0db0c51284 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.117
+LIBDRM_VERSION = 2.4.118
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
