Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3055CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E32561392;
	Thu,  9 Oct 2025 10:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlWIegO66vR2; Thu,  9 Oct 2025 10:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829A061355
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829A061355;
	Thu,  9 Oct 2025 10:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06819119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10D260F22
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L01DC1Q4uf5c for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854CE611F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 854CE611F0
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83AC486E16; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:44:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e82b9fa2674b10201f897a5a2cd747b44e045dd
X-Git-Newrev: 3182e7e05b27c99d0fb78925d78c1c280dd00368
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.83AC486E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fastd: security
 bump to version 23
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3182e7e05b27c99d0fb78925d78c1c280dd00368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This bump includes the security fix for CVE-2025-24356.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-24356.

The COPYRIGHT file was renamed to LICENSE [1]. The hash file was updated
because a date was removed [2] and the libmnl version was updated [3].

Release notes:
https://fastd.readthedocs.io/en/stable/releases/v23.html

[1] https://github.com/neocturne/fastd/commit/fa88c739b9afe053905bddc7fbb9c252e290c35d
[2] https://github.com/neocturne/fastd/commit/318c944f40c90e048e370b2f75598bfcd79a1790
[3] https://github.com/neocturne/fastd/commit/c08a3d59debddf5f99e442d9529a142f04549b50
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Peter: update FASTD_LICENSE_FILES]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b5bcfd626b3d861887518ab5fb99f96d62db7ac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fastd/fastd.hash | 4 ++--
 package/fastd/fastd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index 5f7f966533..a02b506c98 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  19750b88705d66811b7c21b672537909c19ae6b21350688cbd1a3a54d08a8951  fastd-22.tar.xz
-sha256  adf08b42f1b890b89e998360a864cb4f8441a0a57c9e95e2ce1bfdfc24c49976  COPYRIGHT
+sha256  dcab54485c79dda22ce6308a2a48764d53977a518952facd1204ba21af1c86e0  fastd-23.tar.xz
+sha256  f229ee6df84971355f7d54d60b0302ca8a3b883d2dc41176e58e9da4aa7c1b05  LICENSE
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 6c496cf9ef..4df0ce8210 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-FASTD_VERSION = 22
+FASTD_VERSION = 23
 FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
-FASTD_LICENSE_FILES = COPYRIGHT
+FASTD_LICENSE_FILES = LICENSE
 FASTD_CPE_ID_VERSION = $(FASTD_VERSION).0
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
