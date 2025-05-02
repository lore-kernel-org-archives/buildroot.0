Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76684C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BC560B9F;
	Fri,  2 May 2025 11:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S_QfvOu_3_j; Fri,  2 May 2025 11:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BECD360C0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECD360C0D;
	Fri,  2 May 2025 11:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AACEEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06BD961543
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahk3JKtximXQ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7B961273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7B961273
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89BFB864AE; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c4445f33d43c90cb3cd56f59844b9a8cf98ccb2a
X-Git-Newrev: cc5b7c833749a99a3a9238a90fd3af7b0f24e8c7
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.89BFB864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/boost: move host
 variables closer together
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc5b7c833749a99a3a9238a90fd3af7b0f24e8c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Also, one item per line (chrono, container) in the list of libraries.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e83f01b519911148d5dd6a88ad2ba5b9e8a3123)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
