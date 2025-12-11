Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF0DD43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC99410F5;
	Thu, 11 Dec 2025 19:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssOloOW1DXuy; Thu, 11 Dec 2025 19:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE01410ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481293;
	bh=CPInXfIJVsZ8BzS7cGi3eu27Rw8wF8oF8Hj6I48O5n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H5iRWEQUZUxSvGaCjzU5nTSq5CZxCshUr+kGRwoeN5IDSWlVaxxAf8935JzLPHeyE
	 tbsgdKT9ORtHyD+OFTM0msvpY5OJQIYB7sxnuQAtHKg79XUbuYPsSyFB8k6PGuihmj
	 KNikwmEZbW+HoaHjye+7o7GVKepVHga07Slg1L7pE2PCGSBH8Vi0UvrtfOu/DwJq8S
	 7RcHz8q4SQPFXFhoOydYvcjfgzO2XHIADn6TEUFBR7O5/KKNGnI/OFUxtjrT+DeGuQ
	 IoIeVEyteNBq5HAkEXb4VVkQ+VJNT7BntYyK+QeLL1bPuTUsp5ZGB7i/4nxD4xDp2l
	 tFH9AWHo48Qzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE01410ED;
	Thu, 11 Dec 2025 19:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C26E4E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15B9F400D3
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1c0D_WtPyZO for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1158C400AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1158C400AD
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D51838CC; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8aa28cd0e83effd129c8777b324eef8645207b8c
X-Git-Newrev: 1c44a81679bfce4926b3e3f68bebc9eb0627f912
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.10D51838CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dmraid: switch
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c44a81679bfce4926b3e3f68bebc9eb0627f912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
