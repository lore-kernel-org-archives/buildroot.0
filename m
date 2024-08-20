Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5136AC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5BF4029B;
	Tue, 20 Aug 2024 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MORH9RATaEXO; Tue, 20 Aug 2024 20:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA0F4403A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0F4403A6;
	Tue, 20 Aug 2024 20:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82C5E1BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70C0560887
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjlucPMqWg8e for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 828F560729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 828F560729
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:08:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71822861A9; Tue, 20 Aug 2024 20:08:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 20:47:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 145e8e74068207a89088d716de4dac9264ed62ca
X-Git-Newrev: 0e2daaad3e5512bfc28fbe80351e4ed6ad8c6a92
X-Patchwork-Hint: ignore
Message-Id: <20240820200822.71822861A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/boost: cleanup
 HOST_BOOST_FLAGS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e2daaad3e5512bfc28fbe80351e4ed6ad8c6a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

- fix alphabetical ordering
- put one module per line
- add comment explaining why options are enabled

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5c20804afa42cb2efd57a4a333841290d35d9df6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9b1baec5bf..bb73edfda6 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -13,12 +13,39 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
 # keep host variant as minimal as possible
+# regex & system are needed by host-riscv-isa-sim
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	contract container coroutine date_time exception fiber filesystem graph \
-	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace test thread timer \
-	type_erasure url wave)
+	--without-libraries=$(subst $(space),$(comma),\
+	atomic \
+	chrono container \
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
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
