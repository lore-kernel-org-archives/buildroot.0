Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB7BC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 16:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 529DD400B8;
	Sat, 13 Jan 2024 16:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529DD400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbAQfq9RXoMG; Sat, 13 Jan 2024 16:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 399C740462;
	Sat, 13 Jan 2024 16:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399C740462
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 670831BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 16:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B6D60AE4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 16:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B6D60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gCWxn2EkR7Z for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 16:44:35 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4909060A99
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 16:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4909060A99
Received: from fli4l.lan.fli4l (p5b3a0534.dip0.t-ipconnect.de [91.58.5.52])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC899A4C0538
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 17:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43448)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rOh7W-000000003XW-1hoh
 for buildroot@buildroot.org; Sat, 13 Jan 2024 17:44:30 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 17:44:30 +0100
Message-Id: <20240113164430.3329758-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705164270;
 bh=iXUao+buRP6EWIeMEuF9sAIQWnEkj/2UERZLQnFM/UU=;
 h=From:To:Subject:Date:From;
 b=XarIwRYO/61x//1QPFDve7rPjfnzri8SKmHqEHZGv5X67Mus/fZ2uOYyCfGNUZSy0
 N9o0wBb3Xz3rsVdEMG8n88GMNWnRP7eEEaCj1qfs/aj4YjZ1ZMTawNBLFdv/+GEY0E
 fxIiiU0gEWZpkenFoEZnhInrC0vsG8hwXHJvqZyWPWXeg8+mHuAgWHsVzmVhszu0Bw
 z2xszxO8OykQRZvMzJTFywMlAdSGnRNj+am/eC3Ei8oDaYg7GguZcztD4Y3yq4apIb
 G0G4I7Alu14RYvlSipzS4KLJ6n4zBZnARirz/FCFUPrYjG21yRZqkcnfKMKiFQRhDz
 rmO8YS+GnaznQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=XarIwRYO
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.120
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
https://lists.x.org/archives/xorg-announce/2024-January/003441.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 219c2c0712..dd43a89d68 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-December/003438.html
-sha256  0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291  libdrm-2.4.119.tar.xz
-sha512  c8dd7665e85c01a67fcce1c1c614bc05a3ec311f31cae7de5fb1cd27d0f11f1801be63de3fa3e33b2f505544fd4b1bc292965c5e8de46a3beaaedb10334945ca  libdrm-2.4.119.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-January/003441.html
+sha256  3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a  libdrm-2.4.120.tar.xz
+sha512  6dc16e5134a669eeb59debb1dc2d15b857483ab7476dc2b94bd05a32d8953f046f5656f6cf9e1a63e97e7156fb65ebb58b6a29fe45cb6326058baaf820626e70  libdrm-2.4.120.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fd50f4f22e..61d1c24377 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.119
+LIBDRM_VERSION = 2.4.120
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
