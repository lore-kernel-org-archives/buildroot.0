Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717F606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i1AtlHrF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB15403EB;
	Wed,  4 Nov 2026 17:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVlmPf-SbXmU; Wed,  4 Nov 2026 17:15:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFB0A403AE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812555;
	b=rqAVYhAckTnJAakG9LDIQzv0/LUFghsEOjz9swY0ALi6IrUTqZahyPkxDkHewsTL1yqF
	 iYF+D97E+IOchVRNZRw11oWBnlRXS5ToW1g9TKFi39eXox5lYIWPReIgzP2VArt5Cdht2
	 ke5BSdiF+Vi3QuWDznv3tvP4MkF6UHeblAjymeF/3HiupSSPbkshLReGpIltArBCUsDYg
	 qaSQPZOabBWsFwrXfKC61kepENyZ5U5A41gUECvfL8tA29ssnKqWLmYDPg7PF/m3sD9yC
	 XIhGvs3vWxLgUrk2wveKAUa50RFFSDzZC1mGydsZqDvYizkmb3HyNH61GAHTf2Ru1sQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Uwvew+X3UhZg4trn6kMUPzbwWc6KssyKWSV3aU81YkY=;
	b=PH+2E6hzvQb9aJaxD6o9BG/rtH+Y0aWfmq1RhOedA4IgDSdDco7fWpoh9w25E4/9o93J
	 ay/FSbvgVjFhtef1SUGhs+M+bOHB0lcFscKlypuX5BxDYFlHLAyR0J2xWZ/a7/Sir4rnZ
	 nTl8nSjJBN38vdxkOs+KGMiDEA0C+wdhG6LNbKzLVhWom95r68L3xo0O3H3tBkXONEiR9
	 NGuSfldAUdHwyShJUaT0ruogzIgx+BRQP2QnGa4Y10rcTjZcNrZDR3VYjFbdZxZh3ChUz
	 tDcx65uJ3NJhuyy7cSgghTtT58zZirpLMqARt9IE4eWClMP6UCVIq6kuLSIDA3KRBzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812555;
	bh=Uwvew+X3UhZg4trn6kMUPzbwWc6KssyKWSV3aU81YkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i1AtlHrFS39LaghRxwfBPmgmaUxwe59Fy7cHrQ7K+dGkV/hUyRoDLrIxbMMg1FhLT
	 yGIwMqTBWY0svlzS3VIDqHB5ofVh3rGupNKR9EzECDaykV81UC00DJ+gbzb+TQ64Lu
	 B3aiq6dvkvx1grjPl5gIpRrlwFNO0Y9c/atX0N7lRlR3W4c+NCE9hFUjCd6eL/kHWL
	 8PL1RJyGED0miw2G8YQDXw799xhht8xOq+24LR+T1phf3vO80sifDHHkKdtWVRgqPb
	 LLtjU43dnkkVsKUkVXp0hrMUkl66dBmADc55CoiYpfuktXHZwgV9YUsJaiAueYx3Yq
	 Ttc8ae9vJmwBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB0A403AE;
	Wed,  4 Nov 2026 17:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4309FB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28DFD80A55
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVzJF_4qRJBl for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 76226809C4
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76226809C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:15:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACA8C9DCF7; Wed,  4 Nov 2026 17:14:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:13:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f03de2f6565bee2d53442d1a5358ec0fc400cf38
X-Git-Newrev: 3ddce4821102aba53c6cd214f38a8afbd131cff2
X-Patchwork-Hint: ignore
Message-Id: <20261104171421.ACA8C9DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: security bump version to
 6.11.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ddce4821102aba53c6cd214f38a8afbd131cff2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

- CVE-2026-82292: issue in qtbase
- CVE-2026-95620: Use-after-free in QNetworkAccessManager HTTP/2
  support (qtbase)
- CVE-2026-96432: Null pointer dereference in QNetworkAccessManager
  (qtbase)
- CVE-2026-97845: issue in qt5compat
- CVE-2026-100140: Integer overflow in XML parsing (qt5compat)
- CVE-2026-101201: Out-of-bounds read in JSON document parsing (qtbase,
  qt5compat)
- CVE-2026-103645: issue in qt5compat
- CVE-2026-103653: issue in qtcoap
- CVE-2026-105923: Null pointer dereference in QTriangulator reachable
  through VectorImage (qtbase)
- CVE-2026-105924: NULL pointer dereference in QCborValue to JSON
  conversion (qtbase)
- CVE-2026-105925: issue in qt5compat
- CVE-2026-105939: issue in qtwebsockets
- CVE-2026-107457: Memory corruption in QMqttClient (qtmqtt)
- CVE-2026-107472: Out-of-bounds read in QTextCodec TSCII encoding
  (qt5compat)
- CVE-2026-107479: issue in qt5compat
- CVE-2026-107590: Out-of-bounds write in QTextCodec iconv-based
  encoding (qt5compat)
- CVE-2026-108081: issue in qtbase
- CVE-2026-110944: issue in qthttpserver
- CVE-2026-111487: Out-of-bounds write in the assimp scene import plugin
  (qt3d)
- CVE-2026-114366: issue in qtwebsockets

Release notes:
https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.3/release-note.md

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6.mk                                     | 2 +-
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6grpc/qt6grpc.hash                       | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6positioning/qt6positioning.hash         | 4 ++--
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 23 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index f039ccef30..94ef6df360 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.11
-QT6_VERSION = $(QT6_VERSION_MAJOR).2
+QT6_VERSION = $(QT6_VERSION_MAJOR).3
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index d7d0d536a3..5600cb9937 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtbase-everywhere-src-6.11.2.tar.xz.sha256
-sha256  5b2e00eccaf5a4d8c14134ffa0ea8dfd0a35ae1ffc7f8d87fa4305a1ed23cf22  qtbase-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtbase-everywhere-src-6.11.3.tar.xz.sha256
+sha256  46de0710b594945a5d446ae44354daa386141c6903c53781b2ca547bc62f8f8f  qtbase-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index b5b9eac42d..016e6d297a 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtcharts-everywhere-src-6.11.2.tar.xz.sha256
-sha256  5069e53b81d125509e937c6379cba6d664c562d5a1e5ed28dd383690d4b6fb29  qtcharts-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtcharts-everywhere-src-6.11.3.tar.xz.sha256
+sha256  1d51d18e6f36e8b0dbbcd1a59f3ce9452ca5bf9b2d2fc8465be18cd0d06d6700  qtcharts-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ae2c040d94..db6adc896c 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qt5compat-everywhere-src-6.11.2.tar.xz.sha256
-sha256  68c320fe3391096a9f2d870170edf1b67dac8af1d0e51c0c9e5343807f114287  qt5compat-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qt5compat-everywhere-src-6.11.3.tar.xz.sha256
+sha256  2e998067417de46355b6750c3709aaa6032fb27e4b16edb5f73fba79fe436516  qt5compat-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 0d4f8d3a78..32aa367fa1 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtdeclarative-everywhere-src-6.11.2.tar.xz.sha256
-sha256  215b7b70517e380123eabc6b92243f3c47b6f016a91d126057dbe53551c6b430  qtdeclarative-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtdeclarative-everywhere-src-6.11.3.tar.xz.sha256
+sha256  6d6db328a02ae3bb0b1e6944aeef8dfe44cd6b55ab59b1708bbf0400f5759cb5  qtdeclarative-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 9cf6314aeb..3a18a1e7a3 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtgraphs-everywhere-src-6.11.2.tar.xz.sha256
-sha256  9f2109854afa45dd144116c11461989c411a17065c63da5068441a1200fb8b21  qtgraphs-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtgraphs-everywhere-src-6.11.3.tar.xz.sha256
+sha256  4e74b45c64930022a3c0127a6ea5d406ae973e1af130a9fe22158ab1d784bb6a  qtgraphs-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
index 196e4b70ce..2ecda8548f 100644
--- a/package/qt6/qt6grpc/qt6grpc.hash
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtgrpc-everywhere-src-6.11.2.tar.xz.sha256
-sha256  44414617f0058ff34965fa852027bfcc7e4f71eefca8cd4406c96af22c64ad93  qtgrpc-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtgrpc-everywhere-src-6.11.3.tar.xz.sha256
+sha256  17984706311571d329cead7aff9cc9d744c10fb3004af24a82591baf758485f6  qtgrpc-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 1ac5820a51..cb91c6fea5 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtlanguageserver-everywhere-src-6.11.2.tar.xz.sha256
-sha256  38bc4272ecf4ca0eb1927227053e52be6b2e05733f46d03422306aace511fc5e  qtlanguageserver-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtlanguageserver-everywhere-src-6.11.3.tar.xz.sha256
+sha256  64f4310b5403157eb7652bbd57bdd09b0ed080c9cd9e98b5bf84883ecaa8d60f  qtlanguageserver-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 521b4339d4..50e63c7d51 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  39551cf7452bc8df60c6d0fd6f0101351c286b9754030f290b258077e7852d83  qt6mqtt-6.11.2-git4.tar.gz
+sha256  f4b9f412c6e85363fc0009c8a9333b35390bb47f1c4da44e6914fd7143bd7cc5  qt6mqtt-6.11.3-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 5aa64bbf6a..557530a4ef 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtmultimedia-everywhere-src-6.11.2.tar.xz.sha256
-sha256  967b5e02ec6b793cdb360622cd6e703132836af983208d678dae4b50f109cd9f  qtmultimedia-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtmultimedia-everywhere-src-6.11.3.tar.xz.sha256
+sha256  3d172de9bdd137686c3871762a4adff988a1ec0faec15df0c4560cfc417288e6  qtmultimedia-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index e05212eaa8..1c141c162f 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  41982d99b93bfde68f9ee5997376cd64f62d0e7cdca1a08e582a034840528ca1  qt6opcua-6.11.2-git4.tar.gz
+sha256  4d6dd7d8352597143e69bd7ec9e0cf092508a652fe3421357c0d890f1289d924  qt6opcua-6.11.3-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
index 84e727052c..7d9352b998 100644
--- a/package/qt6/qt6positioning/qt6positioning.hash
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -1,5 +1,5 @@
-# From https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtpositioning-everywhere-src-6.11.2.tar.xz.sha256
-sha256  d8cf15ad43a3b1520adac64cec5900028525cf75f01a4c82a0002e7ac1ae7499  qtpositioning-everywhere-src-6.11.2.tar.xz
+# From https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtpositioning-everywhere-src-6.11.3.tar.xz.sha256
+sha256  a38695bc412b7261476e8e96178460ec9319e61c34ecc6a14eb2e76e5c73eca1  qtpositioning-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 01f49f2458..beb7b11345 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtquick3d-everywhere-src-6.11.2.tar.xz.sha256
-sha256  3ab8e1f08edb26373a37cf9d42c23e7d092c1334566b953fbb51cb1b936737b4  qtquick3d-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtquick3d-everywhere-src-6.11.3.tar.xz.sha256
+sha256  c05d2491ead3ee22d2c8e9b7c9cc8e5874e7c05c1fc3329bc6a0ece70eaccc96  qtquick3d-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index d239f95eb8..60717a3e52 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtquicktimeline-everywhere-src-6.11.2.tar.xz.sha256
-sha256  250af10500a0c4045dde74e107448a69a44d58af8b7e9a91704a808d5f881d17  qtquicktimeline-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtquicktimeline-everywhere-src-6.11.3.tar.xz.sha256
+sha256  e0e52453a4d13f6378fc4dff4cac8ef874fea35ddb9a72c1604e124ee941c692  qtquicktimeline-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index 823f8d2618..62b1da2cbc 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtscxml-everywhere-src-6.11.2.tar.xz.sha256
-sha256  f594c4bba7f8bffb20857973c72895669d6e54df08c8d897f50d15251cec35ff  qtscxml-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtscxml-everywhere-src-6.11.3.tar.xz.sha256
+sha256  d89d7782d24d9609695c99ffbe8775c74348dc7e742af2b153e357d0ded2081f  qtscxml-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 0e2e9ea5ab..843ba8b548 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtserialbus-everywhere-src-6.11.2.tar.xz.sha256
-sha256  8f06c9ba95f6b045ec43f011094e35a4116047310aa24280966541b720df36c1  qtserialbus-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtserialbus-everywhere-src-6.11.3.tar.xz.sha256
+sha256  934aa90721b17a7f2d7c59a9afcee2526030bfcf3a8caf95278d2690b284569e  qtserialbus-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 2c90412cdf..4f573a924a 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtserialport-everywhere-src-6.11.2.tar.xz.sha256
-sha256  df3a733616444f31b2ecb689218ea1444be91d8628aa3ab8e464c5eb1b17ad8e  qtserialport-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtserialport-everywhere-src-6.11.3.tar.xz.sha256
+sha256  b09bfb0eace070ce1b980f7f2c9ba9fb885c2cc29a4cd0416061496426601722  qtserialport-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 29d5aa7756..c88f40bbdb 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtshadertools-everywhere-src-6.11.2.tar.xz.sha256
-sha256  805046b8b7757665586890b375940047e874ae3ab00adb6d3f2b38fc6b200b1c  qtshadertools-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtshadertools-everywhere-src-6.11.3.tar.xz.sha256
+sha256  d86079425ec71eecbb05f4d20623b0a403a7d21a5cfa7efb9734ea3d538d801b  qtshadertools-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index aefc24cc62..a520d8d79f 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtsvg-everywhere-src-6.11.2.tar.xz.sha256
-sha256  d594337feca84c26fb67fe87b85e6a5c12fda404b611d905f9d138210c311876  qtsvg-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtsvg-everywhere-src-6.11.3.tar.xz.sha256
+sha256  9bdf6fa4b5a2d91c3eaa2edd12263fdff0ae19d0ac25d3c99946cd4189a07123  qtsvg-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index fb4e655e59..3a9a1e4fbe 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qttools-everywhere-src-6.11.2.tar.xz.sha256
-sha256  9ea75af35c512f7e09e61c8c3af3997f13b4d43bb099cf43fcec470126b4041e  qttools-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qttools-everywhere-src-6.11.3.tar.xz.sha256
+sha256  524ca79ee653fa36d4644ce66a5c0825930ee2550ff1d0987e703a66fd6c61ec  qttools-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index af4477bab4..def4ff4b76 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtvirtualkeyboard-everywhere-src-6.11.2.tar.xz.sha256
-sha256  4c6a26734a5c4e4acd5ff9ae5f192a5b883bc4514118f9df2fcf12064e647c2f  qtvirtualkeyboard-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtvirtualkeyboard-everywhere-src-6.11.3.tar.xz.sha256
+sha256  7c0ea4c6e05cc4d8225c862781efc78284d5f61809eedc405f37ea31acbb7478  qtvirtualkeyboard-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 767e35c80f..37ee1b7375 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtwayland-everywhere-src-6.11.2.tar.xz.sha256
-sha256  8eb7615e39332a10f506e8dd70f02d5954bb5949ff54f6dcbf8bd6168222f9df  qtwayland-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtwayland-everywhere-src-6.11.3.tar.xz.sha256
+sha256  7f6185eb6e7d75202c42dfaf18dc54ae96f2d9a7a265358d061a6f85366f6c97  qtwayland-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index d20f18f8bd..57c0301c7f 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtwebsockets-everywhere-src-6.11.2.tar.xz.sha256
-sha256  2bfe25c383c37f7690e3c59b02c9907d2744cf8527b1f3f1fc2c785b2ff3c9a3  qtwebsockets-everywhere-src-6.11.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtwebsockets-everywhere-src-6.11.3.tar.xz.sha256
+sha256  19b39acc37ec67a344fe0f080201c2c64d04d2a3d0c7dfa84955033f1016983b  qtwebsockets-everywhere-src-6.11.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
