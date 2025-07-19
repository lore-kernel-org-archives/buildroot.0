Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5ACC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 15:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD6A845A3;
	Sat, 19 Jul 2025 15:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6y04TAqQBJiQ; Sat, 19 Jul 2025 15:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05E48845D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E48845D1;
	Sat, 19 Jul 2025 15:17:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B561D222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 985D840BA0
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lguFmRjy2xqi for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E0B40B9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2E0B40B9D
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0D998649E; Sat, 19 Jul 2025 15:17:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 16:45:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c7d6b9dbe2ce91ca68434d4ef1798e41752bbf3
X-Git-Newrev: 5e3114cd2f8380ae1fbd15eec78b182efe382303
X-Patchwork-Hint: ignore
Message-Id: <20250719151750.D0D998649E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump version to
 1.52.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e3114cd2f8380ae1fbd15eec78b182efe382303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.1/NEWS?ref_type=tags

Not mentioned in the changelog is a new build option to set the path
of ip6tables [1], add it next to the existing iptables path setting.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/57321f78c9aaad23099e80f7945ef996acbaa7cc

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index a0963e010f..780d1205cb 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.0/downloads/NetworkManager-1.52.0.tar.xz.sha256sum
-sha256  356f21a15da51e4218fd4d0fd78cea61e067b1116a25cddee4af9df05062e92d  NetworkManager-1.52.0.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.1/downloads/NetworkManager-1.52.1.tar.xz.sha256sum
+sha256  8b122c73493a72f2bae527c125cebd87711671b90352dbe2b1788aba9575ac6f  NetworkManager-1.52.1.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ab3a437838..8c517c49e6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.52
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -30,6 +30,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dtests=no \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
+	-Dip6tables=/usr/sbin/ip6tables \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
