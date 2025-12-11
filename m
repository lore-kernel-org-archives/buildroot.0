Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6982CD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC4D80DF4;
	Thu, 11 Dec 2025 19:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TptfVW7wk8x; Thu, 11 Dec 2025 19:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5751B80DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481402;
	bh=o4gmobE2Am9IVuFAHDm33PKUKgJWnXqgIYVCrG48rcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DR4NoWmIXC70/q5j2k/8cA+H9fVddz7CB2LBZ3PoKeO10+tOLAinDnKSLO6lmikVb
	 xghbgrwx77ZcNmFyEZHGxKOvpNuckpesoWw6lv57mt9Kg2g6U32iJBjbeMFFwaua5Q
	 BDS6ed8BMtRcsa1gbkAIps3dxvlQ1GLS8voVm6BTV/jYIvqJCIsUVH4D/Kv4cxUdlg
	 rL2fG0D3mCHLIy/jtSfgx4tukKVvlw8Ftj531C8nlA0W3hoZHVlSrWJpx5i1oB51sZ
	 qrRDBD4rSx9TiAljG4LJ1oW+TY2Sz6EN4QcQCnkna+XYX72WCt/c2BYwn72TfaPEjZ
	 KJTgHm5vd0zLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5751B80DFB;
	Thu, 11 Dec 2025 19:30:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22DF02C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FD8040012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51MSUXclYyVj for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833414005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 833414005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82C3F86BEE; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:51 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 263adc0ac713a91dd6288a73ea855edf7b5581fc
X-Git-Newrev: f3df43e746ede5688c5bbd58cdd5ba17487ebc39
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.82C3F86BEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/dmraid: switch
 SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3df43e746ede5688c5bbd58cdd5ba17487ebc39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The http link is broken:

Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 failed: No route to host.

No autobuilder error recorded.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b04688e7f7283d0f8c88987ff0819c1a0bb1650)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
