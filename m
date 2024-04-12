Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D56C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 18:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F46608B7;
	Fri, 12 Apr 2024 18:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T8ezpcHCj5F; Fri, 12 Apr 2024 18:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC06E608CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC06E608CE;
	Fri, 12 Apr 2024 18:42:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 963CE1BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F61340530
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_Oe6COmDPyo for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE12405D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE12405D1
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 538FB8609A; Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 20:41:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d4ba7eaf9ef352edbb120e256a270bbe0e2115d
X-Git-Newrev: 87943b75310190db05342232046790db0f8e4232
X-Patchwork-Hint: ignore
Message-Id: <20240412184150.538FB8609A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ttyd: bump to version 1.7.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=87943b75310190db05342232046790db0f8e4232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notable changes:

- The web terminal is readonly by default now, to make it writable, use
  -W option.

Also set TTYD_CPE_ID_VALID.

cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: move CPE_ID_VALID to its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index b11327c465..9a407a68fd 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b  ttyd-1.7.4.tar.gz
+sha256  039dd995229377caee919898b7bd54484accec3bba49c118e2d5cd6ec51e3650  ttyd-1.7.7.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 4353251b30..e6cf791988 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.4
+TTYD_VERSION = 1.7.7
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
