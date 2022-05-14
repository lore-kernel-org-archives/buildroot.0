Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0928160E06;
	Sat, 14 May 2022 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTFKPq9iBidT; Sat, 14 May 2022 21:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A0B60D5C;
	Sat, 14 May 2022 21:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93AF91BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF57E60DB2
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5w3hsxvuNxq for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:04:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5FBC60D5C
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:04:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8265984C52; Sat, 14 May 2022 20:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 22:56:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5939475da5f98f110f5eb008681a43ecfe55595
X-Git-Newrev: ecaca2d01e02076ba8f400d180125cc9482cc1fc
X-Patchwork-Hint: ignore
Message-Id: <20220514205359.8265984C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: security bump to version
 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecaca2d01e02076ba8f400d180125cc9482cc1fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-24882: FreeRDP is a free implementation of the Remote
Desktop Protocol (RDP). In versions prior to 2.7.0, NT LAN Manager
(NTLM) authentication does not properly abort when someone provides and
empty password value. This issue affects FreeRDP based RDP Server
implementations. RDP clients are not affected. The vulnerability is
patched in FreeRDP 2.7.0. There are currently no known workarounds.

Fix CVE-2022-24883: FreeRDP is a free implementation of the Remote
Desktop Protocol (RDP). Prior to version 2.7.0, server side
authentication against a `SAM` file might be successful for invalid
credentials if the server has configured an invalid `SAM` file path.
FreeRDP based clients are not affected. RDP server implementations using
FreeRDP to authenticate against a `SAM` file are affected. Version 2.7.0
contains a fix for this issue. As a workaround, use custom
authentication via `HashCallback` and/or ensure the `SAM` database path
configured is valid and the application has file handles left.

https://github.com/FreeRDP/FreeRDP/releases/tag/2.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 28e733aa2f..2b7aa25999 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.6.1.tar.gz.sha256
-sha256  e4b3b93d102bc03164f592d26d7a06d6de648bf78b1e3dcbd8d62941431c1f28  freerdp-2.6.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.7.0.tar.gz.sha256
+sha256  89000728b6e66ac37db018d6dc5f0981b530fd550ab748877ff42892dd0c166b  freerdp-2.7.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a1791b27f0..f4636724d3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.6.1
+FREERDP_VERSION = 2.7.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
