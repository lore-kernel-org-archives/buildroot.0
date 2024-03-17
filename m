Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46F7C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EE781D19;
	Sun, 17 Mar 2024 14:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKRotViqnUTh; Sun, 17 Mar 2024 14:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E4F081CE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E4F081CE1;
	Sun, 17 Mar 2024 14:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E500A1BF868
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A108B81767
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgqMWSc3S8Y9 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E2181765
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0E2181765
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B64E8275A; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 13:55:02 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3eaa6570108da522cdff77f0f382190045bbb549
X-Git-Newrev: 38e800efad61165ac0ad4510fba1f39d374a9458
X-Patchwork-Hint: ignore
Message-Id: <20240317143626.8B64E8275A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/{libuv,
 uvw}: bump to versions 1.46.0, 3.2.0_libuv_v1.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=38e800efad61165ac0ad4510fba1f39d374a9458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Changelog: https://github.com/libuv/libuv/blob/v1.x/ChangeLog

Switched libuv to tarball provided by upstream. removed autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 6 +++---
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 3ca184feaf..1fd286d9e9 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  458e34d5ef7f3c0394a2bfd8c39d757cb1553baa5959b9b4b45df63aa027a228  libuv-1.45.0.tar.gz
+sha256  94f101111ef3209340d7f09c2aa150ddb4feabd2f9d87d47d9f5bded835b8094  libuv-v1.46.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 640c5bb1ce..75590ad8f2 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,11 +6,11 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.45.0
-LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
+LIBUV_VERSION = 1.46.0
+LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
+LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-LIBUV_AUTORECONF = YES
 LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE LICENSE-extra
 LIBUV_CPE_ID_VENDOR = libuv
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 8e54ea7d60..2dc6e879e1 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a612bd243150fbbe1365cdaf48203d32061c1d14f93825a31876b183922f93b  uvw-3.1.0_libuv_v1.45.tar.gz
+sha256  bd5aed741765950074b1ea2507291dce81e528abdf56c406991ad4a27d8d1714  uvw-3.2.0_libuv_v1.46.tar.gz
 sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 364a2eded4..12149d43ca 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 3.1.0_libuv_v1.45
+UVW_VERSION = 3.2.0_libuv_v1.46
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
