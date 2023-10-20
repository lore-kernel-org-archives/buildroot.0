Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3014CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 15:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF0D60E35;
	Fri, 20 Oct 2023 15:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF0D60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IvbdaWEaBhA; Fri, 20 Oct 2023 15:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4C060F54;
	Fri, 20 Oct 2023 15:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C4C060F54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C09811BF34D
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9915F60F54
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9915F60F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nsNqtMmkaA6 for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 15:45:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7CAE60E35
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 15:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7CAE60E35
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8892BA4C00F8
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 17:45:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qtrgQ-0001Kl-2e
 for buildroot@buildroot.org; Fri, 20 Oct 2023 17:45:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 17:45:06 +0200
Message-Id: <20231020154506.30993-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697816707;
 bh=kjcUw5Kn4s1VVWpnw2ti9Td5iUWhkgX77bQ4nFGIIwM=;
 h=From:To:Subject:Date:From;
 b=INTQuXOSvDaRXA3wr56oKtL+Pa+xv6EYHUsXQOuSha365yinKKcG5T9zhps3KKFQx
 kWITFOM/Bbshhxnr6LcAJ8gWJmsLkXN5xUx0E5CJv92sQrKqcVDr2ryuzazjWbx0Wv
 HEpvJ2Xrx0OZj+8GZ2TV4T+6bhuFq9P9icvi4Vnv6BCibdYXtLDbduPsw7WgJ+q5Tg
 SAjirGsIf4edUT7LvWxe114wN+J4uCGsOfXBGWxozuHjVND8hhDev83rl/Z1GLGMWG
 1j03uu3qr5xXEo8GXgUUBxmkhFKA/qNWETIyz2W8KUbBnojTNgIj3qyfo1QasqnHbM
 M/R8iWLc1XudA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=INTQuXOS
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.117
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
https://lists.x.org/archives/xorg-announce/2023-October/003429.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 32b39d6a1b..73f3d29f5a 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-August/003416.html
-sha256  46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  libdrm-2.4.116.tar.xz
-sha512  1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.116.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003429.html
+sha256  a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  libdrm-2.4.117.tar.xz
+sha512  326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d271cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.117.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 70f449037d..b9201e4bd3 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.116
+LIBDRM_VERSION = 2.4.117
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
