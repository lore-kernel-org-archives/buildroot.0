Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AFDC0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C96883542;
	Sat, 22 Jul 2023 21:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C96883542
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkTOPjhdUjzm; Sat, 22 Jul 2023 21:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B748338B;
	Sat, 22 Jul 2023 21:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B748338B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D05E31BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB2182141
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB2182141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlCQoD1JedrP for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1FC8223B
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1FC8223B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15BD9821B2; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:22:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca3c4d0007e0a6c19c34a40642fd0fe597968b68
X-Git-Newrev: 89260833ed9483284c9e349c43a71be0df8ea20d
X-Patchwork-Hint: ignore
Message-Id: <20230722212401.15BD9821B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpthread-stubs: bump version to
 0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=89260833ed9483284c9e349c43a71be0df8ea20d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use xz tarball.

Release notes:
https://lists.x.org/archives/xorg-announce/2023-July/003410.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpthread-stubs/libpthread-stubs.hash | 4 +++-
 package/libpthread-stubs/libpthread-stubs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libpthread-stubs/libpthread-stubs.hash b/package/libpthread-stubs/libpthread-stubs.hash
index 3f82bb23e9..63393b014d 100644
--- a/package/libpthread-stubs/libpthread-stubs.hash
+++ b/package/libpthread-stubs/libpthread-stubs.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2023-July/003410.html
+sha256  59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d2442bc  libpthread-stubs-0.5.tar.xz
+sha512  a24f7c40dcaf5f6ca0085972117fed5ad0851f6fc1972fdab799d27236afaaa4f7baa93e40532f93984d313d94456819aaf4ec8f8d1bbb2e5c4fc76c31891d82  libpthread-stubs-0.5.tar.xz
 # Locally computed
-sha256  e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733  libpthread-stubs-0.4.tar.bz2
 sha256  78c20706e799f2b8f445e71d3d2ade6ba23b3388fd6cbeed7d71796623febde8  COPYING
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index 9cf697075e..151e6eada8 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPTHREAD_STUBS_VERSION = 0.4
-LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
+LIBPTHREAD_STUBS_VERSION = 0.5
+LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.xz
 LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
 LIBPTHREAD_STUBS_LICENSE = MIT
 LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
