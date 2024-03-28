Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97A8CD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 19:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811AA4160D;
	Thu, 28 Mar 2024 19:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyetCtFnKpeW; Thu, 28 Mar 2024 19:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D36541625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D36541625;
	Thu, 28 Mar 2024 19:46:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D758C1BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D09E641625
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ji1Rs0uupXYt for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 19:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497134160D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497134160D
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 19:46:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99A7A84406; Thu, 28 Mar 2024 19:46:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 20:45:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f382de2b0f8a528a09bb975cc088a4342b663134
X-Git-Newrev: 409b76aea4e3e6c4795447d1e46cc377bd2a062f
X-Patchwork-Hint: ignore
Message-Id: <20240328194609.99A7A84406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.46.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=409b76aea4e3e6c4795447d1e46cc377bd2a062f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

CONTRIBUTING.md hash changed due to details added:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/5481ba156804f979cb2d585df3dc012ff3002755

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-By: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-make-curl-timeout-callback-non-repeating.patch | 44 ----------------------
 package/network-manager/network-manager.hash       |  6 +--
 package/network-manager/network-manager.mk         |  4 +-
 3 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
deleted file mode 100644
index 8e25805d0c..0000000000
--- a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
-From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
-Date: Fri, 13 Oct 2023 16:46:09 +0000
-Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
-
-This reverts commit 05c31da4d9.
-
-In the linked commit the callback was made repeating on the assumption
-that forward progress would result in the callback getting canceled in
-cb_data_complete. However, this assumption does not hold since a timeout
-callback does not guarantee completion (or error out) of a request.
-
-curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
-a repeating callback is firing back-to-back without making any progress
-in doing so.
-
-Revert the change and make the callback non-repeating again.
-
-Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
-Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
-Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
----
- src/core/nm-connectivity.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
-index 92de44f17d..d8b0004c38 100644
---- a/src/core/nm-connectivity.c
-+++ b/src/core/nm-connectivity.c
-@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
- {
-     NMConnectivityCheckHandle *cb_data = user_data;
- 
-+    cb_data->concheck.curl_timer = 0;
-     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
-     _complete_queued(cb_data->self);
--    return G_SOURCE_CONTINUE;
-+    return G_SOURCE_REMOVE;
- }
- 
- static int
--- 
-GitLab
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 0196d68c55..8a3c3895fe 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
-sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
+sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
+sha256  9f7f0d40116e5a0f1566b9da71e9c95738c99364e4b5437d8115aa614490372b  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index f6ef923d55..09bc6aed02 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.44
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.46
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
