Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF8C369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23ED98144F;
	Sat, 19 Apr 2025 15:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYm-g7fJjdgV; Sat, 19 Apr 2025 15:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E2180DBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E2180DBC;
	Sat, 19 Apr 2025 15:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E4FE228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03CAC60764
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xj6gGaNp0yMZ for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D28C606B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D28C606B6
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35AFB85BED; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 17:05:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70bcb7655bc1893c76e682cbb7c750b84c70ca64
X-Git-Newrev: 1e83f01b519911148d5dd6a88ad2ba5b9e8a3123
X-Patchwork-Hint: ignore
Message-Id: <20250419151032.35AFB85BED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: move host variables closer
 together
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e83f01b519911148d5dd6a88ad2ba5b9e8a3123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, one item per line (chrono, container) in the list of libraries.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.mk | 71 +++++++++++++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index c0d17f7670..044dd275b3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,41 +12,6 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
-# keep host variant as minimal as possible
-# regex & system are needed by host-riscv-isa-sim
-HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),\
-	atomic \
-	chrono container \
-	context \
-	contract \
-	coroutine \
-	date_time \
-	exception \
-	fiber \
-	filesystem \
-	graph \
-	graph_parallel \
-	iostreams \
-	json \
-	locale \
-	log \
-	math \
-	mpi \
-	nowide \
-	program_options \
-	python \
-	random \
-	serialization \
-	stacktrace \
-	test \
-	thread \
-	timer \
-	type_erasure \
-	url \
-	wave\
-	)
-
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
@@ -103,6 +68,42 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
+# keep host variant as minimal as possible
+# regex & system are needed by host-riscv-isa-sim
+HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
+	--without-libraries=$(subst $(space),$(comma),\
+	atomic \
+	chrono \
+	container \
+	context \
+	contract \
+	coroutine \
+	date_time \
+	exception \
+	fiber \
+	filesystem \
+	graph \
+	graph_parallel \
+	iostreams \
+	json \
+	locale \
+	log \
+	math \
+	mpi \
+	nowide \
+	program_options \
+	python \
+	random \
+	serialization \
+	stacktrace \
+	test \
+	thread \
+	timer \
+	type_erasure \
+	url \
+	wave\
+	)
+
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
 	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
