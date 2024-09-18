Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EACFCDD54D
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD69641220;
	Wed, 18 Sep 2024 17:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EIMdW5z3U0q; Wed, 18 Sep 2024 17:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9057641231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9057641231;
	Wed, 18 Sep 2024 17:10:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C24D11BF5A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD097606A2
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4N4xGUIpg6tq for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB96607AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDB96607AA
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61CFD83B4B; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 19:05:47 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 68e71cde3069d0875e8bf30ebed509b157044de2
X-Git-Newrev: e612ba63c5538de28dcaf53d04596818bcfc9217
X-Patchwork-Hint: ignore
Message-Id: <20240918170947.61CFD83B4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/xserver_xorg-server: security update to 21.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=e612ba63c5538de28dcaf53d04596818bcfc9217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

- CVE-2024-31080: Heap buffer overread/data leakage in ProcXIGetSelectedEvents
- CVE-2024-31081: Heap buffer overread/data leakage in ProcXIPassiveGrabDevice
- CVE-2024-31082: Heap buffer overread/data leakage in ProcAppleDRICreatePixmap
- CVE-2024-31083: User-after-free in ProcRenderAddGlyphs

For more details, see thee security page of Xorg:
https://www.x.org/wiki/Development/Security/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Peter: add actual list of CVEs]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e33db30aab02188c8b3aae6451d26288d06d7a15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index be636936e2..3520de242f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003442.html
-sha256  1aa0ee1adad0b2db7f291f3823a4ab240c7f4aea710e89f5ef4aa232b6833403  xorg-server-21.1.11.tar.gz
-sha512  e41bf71955691e66084a67fc20643632087f0326d5eddc31e6edd118d05005b8ab536738c181f4c352f331ec8fc8f23ae1b45f237592fa5d7eddbffe43638b08  xorg-server-21.1.11.tar.gz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003504.html
+sha256  2864b6a5359ab41c5a6132c69b5d0c9af6eb85ad26d433edb012c914029de752  xorg-server-21.1.13.tar.gz
+sha512  9bf5617d577dd3526a9578daedc1f2e3527da6913841f8fc78a2bda311ebf1560e84e31942cb8133a2a2ac99487c13b9153db6fb2d00859fc24d053f6b91fe34  xorg-server-21.1.13.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 1d0807ffec..05ba938c30 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.11
+XSERVER_XORG_SERVER_VERSION = 21.1.13
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
