Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADF4D3B7E2
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02CF44021D;
	Sun,  7 Dec 2025 17:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzN-hReRsaR7; Sun,  7 Dec 2025 17:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4C940437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127620;
	bh=bhMLrjG+8fc49DJtFI9+1gHPijx3xyJBcio0kl6ts0s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MzSYxlPE8dZsWGUTLyXAtl7KEeaFMmGK/V+X0kjLhLurf6KIgWwqkxhJxJdmtLEK3
	 h5d40i/EGIjoI7Xy0fJBszH6wulNduBL1ws3pcAi27HCE3p+3QYFbKsCTWitA+hQMU
	 Hh73Oc7ZjQV8uDnfU05L4t72JXXytbDaP/rB633/1IhLrsUwnMgxT0a4aQ4A3vaSAJ
	 WCiV1AAlzwF403kdirN6MqGw9rhJKCuaErB8Av6ixENnW/bdsRt9qIoa9FxB7FCmB8
	 +pE8+JfYekWsV7LmySLZO9sceRDSVeX+MC4oF4E85N/Ix2jbeTlx+xxFrqNbOwqVGQ
	 cW56HxoTdPneA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4C940437;
	Sun,  7 Dec 2025 17:13:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF18D2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95DB6821F2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M872bZUrEya for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E49AD821EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E49AD821EE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B8B867F9; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80f8be48b65cd445b9a30b69235581fc5f437052
X-Git-Newrev: 3b04688e7f7283d0f8c88987ff0819c1a0bb1650
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.E1B8B867F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmraid: switch SITE to https
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b04688e7f7283d0f8c88987ff0819c1a0bb1650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The http link is broken:

Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 failed: No route to host.

No autobuilder error recorded.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/Config.in   | 2 +-
 package/dmraid/dmraid.hash | 2 +-
 package/dmraid/dmraid.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 3c375f4c67..ad86334f1e 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-	  http://people.redhat.com/~heinzm/sw/dmraid/
+	  https://people.redhat.com/~heinzm/sw/dmraid/
 
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/dmraid/dmraid.hash b/package/dmraid/dmraid.hash
index 7c1bb9a56b..0f30864254 100644
--- a/package/dmraid/dmraid.hash
+++ b/package/dmraid/dmraid.hash
@@ -1,4 +1,4 @@
-# From http://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
+# From https://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
 md5  819338fcef98e8e25819f0516722beeb  dmraid-1.0.0.rc16-3.tar.bz2
 # locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  1.0.0.rc16-3/dmraid/LICENSE_GPL
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 97c729aa70..dca9195ef6 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -6,7 +6,7 @@
 
 DMRAID_VERSION = 1.0.0.rc16-3
 DMRAID_SOURCE = dmraid-$(DMRAID_VERSION).tar.bz2
-DMRAID_SITE = http://people.redhat.com/~heinzm/sw/dmraid/src
+DMRAID_SITE = https://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
