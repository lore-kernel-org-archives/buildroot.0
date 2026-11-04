Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440FF606AB20
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UmS+mCja
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8905E6086D;
	Wed,  4 Nov 2026 22:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MK7vsYVH9ZNV; Wed,  4 Nov 2026 22:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2531660844
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831581;
	b=q6AFfWTl7FshAk/QdPlgFuufEguWbf5zd3+kQ4jxQM5BKMVnbem9jfI4LdzXDosLgguG
	 W913PJyAHG7rE4CiLqDkp/FIeuTs9KsvYAXDJFve+uYeat1sIvXJLqGTsaheBnGUC1AQQ
	 Tw1A6DNd8igyV9SrKNQaBDzEk/nGuziXPrI3k52zvitQrVZl8jSmHapaacIkCAV7lI7Bt
	 o1csCPtCX441pr6EwY+EGG3QOkfv+jEEhi40qizj50oUKcMEDRDSX50YqcliAg9lqIxvt
	 5oUhUwdwwjtkQ8S+S9V1qQFltpbVl9lGf9TOs5zcQVA4n5bUKstX07vEsB/wN2RmjKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MA9lXE+MFDm84IseLQ0EriJZb3/w9gOO/Es97EEyZaI=;
	b=Iy811EdSYPGJbTTsVZy2Zy4wR14r5u04o62aqKaLRLy3Zlp+ryIRJCfWk+I229KJ45ny
	 QK2X72AvLny8ZATer/uBCQvsTEHF547VRx0S46cr8i7dbiw2shaZLzGsDZKNV6MUBverR
	 CPDo7WfInbvGqy/r4kLIXyuQWbw7/KN2Ibemyq/ITArESc3ALjyRnYZgJtq3Kp8iWUWLC
	 FSUTWgYTUQetuA090WSvpRgkbQYHCl41uakx1sJvbnNqLIM/Ve/Q10RXYwU5mSwZbcASE
	 IgARlSjRRjPVifICdj18dw4jZF/Ba2L8CFQVZAkuc0a6PYRRj88ya1FDTHMl0Tdou/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831581;
	bh=MA9lXE+MFDm84IseLQ0EriJZb3/w9gOO/Es97EEyZaI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UmS+mCjagp+ygZv3pCpCnBZ4Nvr85CBB+f1BV/nhoyz7F4Ffnnm8Iud7P2DFpx5eb
	 3FY8EwMXWBlFQNNYqggVZNN3GiNTff6LB2q0J2MiSe3VI3RhpUxXzWPQCrv5fv539D
	 hduUJal7Azsbjt9Jy8OkEc4KQNKJWBfOTFSfKZ8zRX9i3rmg4jNhd+RbVlCHLW8c5b
	 MSNQ/SnUW2Ccq6ZQTl0obNryJQdWCQo2dMN3mWqZI79/kdNoIF/G0TYa/kom8sf4oP
	 N8TJoR06RPHhN6t0ey+K+nDg8as8jO0I30hNxTDBBA4uHFn8jyu0Bqx95YSV+qJvHR
	 c/eCHM3x8yDyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2531660844;
	Wed,  4 Nov 2026 22:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C19177E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8950840211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySnzaNjpSxkF for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BC5204008E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC5204008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24069DE48; Wed,  4 Nov 2026 22:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:30:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d923d33f7dcc933ab39e30eb26ef8e0d870e4210
X-Git-Newrev: 5536ea54c0cf3726efcb0e83fef846546fee9bba
X-Patchwork-Hint: ignore
Message-Id: <20261104223126.D24069DE48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6coap: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5536ea54c0cf3726efcb0e83fef846546fee9bba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Qt CoAP implements the client side of the Constrained Application
Protocol (CoAP), already available for Qt5 as qt5coap.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6coap/Config.in    | 10 ++++++++++
 package/qt6/qt6coap/qt6coap.hash |  9 +++++++++
 package/qt6/qt6coap/qt6coap.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index d6ee9f3ea3..f3a540e9f8 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
+source "package/qt6/qt6coap/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
diff --git a/package/qt6/qt6coap/Config.in b/package/qt6/qt6coap/Config.in
new file mode 100644
index 0000000000..81ab7e9ab5
--- /dev/null
+++ b/package/qt6/qt6coap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6COAP
+	bool "qt6coap"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6coap module.
+
+	  https://doc.qt.io/qt-6/qtcoap-index.html
diff --git a/package/qt6/qt6coap/qt6coap.hash b/package/qt6/qt6coap/qt6coap.hash
new file mode 100644
index 0000000000..edbd2bc7b7
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.hash
@@ -0,0 +1,9 @@
+# Locally computed
+sha256  909e9820b08c77ae5a1d68f1325914f931ea3e25e9c6855493925b1ecd8d4fd5  qt6coap-6.11.3-git4.tar.gz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6coap/qt6coap.mk b/package/qt6/qt6coap/qt6coap.mk
new file mode 100644
index 0000000000..af565ed5fa
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# qt6coap
+#
+################################################################################
+
+QT6COAP_VERSION = $(QT6_VERSION)
+QT6COAP_SITE = $(QT6_GIT)/qt/qtcoap.git
+
+QT6COAP_INSTALL_STAGING = YES
+
+QT6COAP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6COAP_CMAKE_BACKEND = ninja
+
+QT6COAP_LICENSE = \
+	BSD-3-Clause (examples), \
+	GFDL-1.3-invariants-only (docs), \
+	GPL-3.0
+
+QT6COAP_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt
+
+QT6COAP_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6COAP_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
