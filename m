Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE7C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86DF6608DD;
	Wed,  7 Aug 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kq-J9Zcq-NEG; Wed,  7 Aug 2024 21:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00965608E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00965608E0;
	Wed,  7 Aug 2024 21:07:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 156BB1BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02AFB400FB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GF4DA3HAtzyw for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4C6400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4C6400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:07:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E653A846F5; Wed,  7 Aug 2024 21:07:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:59:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eea735bb6d89d99e8d536b839300e0432a3fcaab
X-Git-Newrev: caa1f6c2d42835254e6cb7db0d893b7c1fd730d8
X-Patchwork-Hint: ignore
Message-Id: <20240807210736.E653A846F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump to version 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=caa1f6c2d42835254e6cb7db0d893b7c1fd730d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- multiple bugfixes, see [0]
- license hash changed as well as cxx-bindings were relicensed to LGPL-2.1+

[0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.1.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpiod2/libgpiod2.hash | 4 ++--
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index b5488496b2..3b498f0eb9 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
+sha256  2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58  libgpiod-2.1.3.tar.xz
 # Hash for license file
-sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
+sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 856eb9bd14..142289cb3a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.1
+LIBGPIOD2_VERSION = 2.1.3
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
