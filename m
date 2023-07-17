Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F80EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8735580C2A;
	Mon, 17 Jul 2023 11:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8735580C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFddDjiYYZO9; Mon, 17 Jul 2023 11:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD9E080C3F;
	Mon, 17 Jul 2023 11:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9E080C3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE54B1BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DD2660B69
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD2660B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhAPX1UGJg_B for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C734F60B8A
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C734F60B8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B502287141; Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 13:05:45 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 78333aa89a7303a7c69955c0b8c410fed0707901
X-Git-Newrev: 2f9f55b000531d360cf95c4be0cc7ed26dded98a
X-Patchwork-Hint: ignore
Message-Id: <20230717110807.B502287141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sconeserver:
 re-add dependency to pcre
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f9f55b000531d360cf95c4be0cc7ed26dded98a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

While pcre was an optional dependency with autoconf [1] upstream removed
the HAVE_LIBPCRE defines with the introduction of cmake [2] breaking the
build without pcre after buildroot switched to cmake with commit
8b42bbf30a914b0fd40a4518e61ac7bc511a7deb.

Fixes:
http://autobuild.buildroot.net/results/a15/a15db87c8cec195905b6bcc2cbd3da59ad8aa3b9/

[1] https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79
[2] https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8539a2075c268eef7fc1742603ca48ecca14ee5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 3040dddbbb..0e8a995090 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
 	  Sconeserver is a modular, object-orientated and extremely
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index bfbd5dc6ed..89abc8d3b2 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_PCRE),pcre) \
+	pcre \
 	zlib
 # disable image as it fails to build with ImageMagick
 # disable markdown module because its git submodule cmark
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
