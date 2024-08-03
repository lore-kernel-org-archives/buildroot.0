Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0197BC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB96C605BE;
	Sat,  3 Aug 2024 21:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_4IZdluAK3Z; Sat,  3 Aug 2024 21:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F22605C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F22605C0;
	Sat,  3 Aug 2024 21:09:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5464A1BF3E3
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4267A605C0
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvWJJFzJY7bP for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2BA605BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D2BA605BE
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:09:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1954583E3B; Sat,  3 Aug 2024 21:09:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 23:01:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb280a47ad9bc48b40b98019a595857102275375
X-Git-Newrev: 6395fc6e6575d487c4a4404516cc3cb440271e95
X-Patchwork-Hint: ignore
Message-Id: <20240803210938.1954583E3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: update to 3.23.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6395fc6e6575d487c4a4404516cc3cb440271e95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for Changes:
https://valgrind.org/docs/manual/dist.news.html

Enable for S/390X as it is supported. (Only compile time
tested).

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/Config.in     | 1 +
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 700849130f..56fda07d09 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 	depends on !BR2_MIPS_SOFT_FLOAT
 
 comment "valgrind needs a toolchain w/ dynamic library, threads"
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index d236c7b4a0..9cb66b583a 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  60894cbf59d480c1794674da24a8406518a8df59  valgrind-3.22.0.tar.bz2
+sha1  ec410c75d3920d4f9249a5cfa2cac31e1bf6d586  valgrind-3.23.0.tar.bz2
 # locally computed
-sha256  c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c  valgrind-3.22.0.tar.bz2
+sha256  c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d  valgrind-3.23.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 97a955bd3b..a5cb4b1c03 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.22.0
+VALGRIND_VERSION = 3.23.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
