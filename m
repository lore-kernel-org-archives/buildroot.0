Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A57C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4161A60BBF;
	Sat, 15 Jan 2022 09:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfq64vKn6j7R; Sat, 15 Jan 2022 09:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA41F607F2;
	Sat, 15 Jan 2022 09:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26D471BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14DCF828BA
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8HjXj5oEAaM for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:40:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 536CE828A5
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:40:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 87FDF8258B; Sat, 15 Jan 2022 09:34:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:39:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67af1b5ba50f387f6fb6ec7cc67283e1c9813fc0
X-Git-Newrev: 9b32c37a260b0fec70fd9c16bca6632d8be19e7f
X-Patchwork-Hint: ignore
Message-Id: <20220115093409.87FDF8258B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: enable system on host
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b32c37a260b0fec70fd9c16bca6632d8be19e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boost system (which provides boost asio) is needed by host-riscv-isa-sim
since its addition in commit ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure: error: Could not find a version of the Boost::Asio library!

Fixes:
 - http://autobuild.buildroot.org/results/6c33a66386ab2171454d8ea8c1bd17a5582e21dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6d1046e9a2..2d2a8fb311 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -17,7 +17,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract container coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace system test thread timer \
+	python random serialization stacktrace test thread timer \
 	type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
