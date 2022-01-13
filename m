Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7AFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29DE36FC57;
	Thu, 13 Jan 2022 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 525th6qJ6BsI; Thu, 13 Jan 2022 19:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE5460D91;
	Thu, 13 Jan 2022 19:35:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8141BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02AC160D91
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9_NWdejqKsX for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6636560A91
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2882A8292D; Thu, 13 Jan 2022 19:28:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:34:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b7ea7a67a3b693cb42c5a981b163f6dfa9e24b4
X-Git-Newrev: 9f3a4a5d57bc5e020729de52169765acfb0bea18
X-Patchwork-Hint: ignore
Message-Id: <20220113192846.2882A8292D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: enable regex on host
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f3a4a5d57bc5e020729de52169765acfb0bea18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

regex is needed on host for host-riscv-isa-sim

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6e026f4781..6d1046e9a2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -17,7 +17,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract container coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random regex serialization stacktrace system test thread timer \
+	python random serialization stacktrace system test thread timer \
 	type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
