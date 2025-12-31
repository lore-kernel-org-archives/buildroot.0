Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86537EE642B
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 11:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4066040386;
	Wed, 31 Dec 2025 11:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbKYCATQq6zS; Wed, 31 Dec 2025 11:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614774039C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767181892;
	bh=0F/2mknpH1aDSKleL1EQyz29T+FdjfvzpIJoTCcbLrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dkoAHLh2uWwgGKTG3PMn+h31lUxqrzKJXaPQ/0K7UDgEBQWe3UBJFqWrv+MkwoIDD
	 x/xJn3EIyN6ivbfyuzKWKJ84x7E9ivIp4qX/15prhGZkHbpNndOa+mM7xDODDFcl/i
	 sTElioi3Y9SA0S/xITuwNfxBwFH+ZS3Z7pyb/PfNnVg8cCOjg+oTuiXfuc4VRxK9Ef
	 ahRo9+HYOKfqV+eMIRxKJT/gucUrfQLANd8qWWE+BpFGjsk8TffMhqdZ6hyfe6dQJp
	 CFbM/O1GxwenrB0AJwDGsPRQvOpTEoyV6Cn4I4r1IUzq9y3smxcxSbt0vCaOkecBsG
	 vrtytjs+9s4Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614774039C;
	Wed, 31 Dec 2025 11:51:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 698EC177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B5D401E0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRs79yyF6M0K for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940564006B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940564006B
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D0CC87DAC; Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:25:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb79eee7fe6f5e8e5e31474dba47dc054fabfa02
X-Git-Newrev: 6131b31fbdd0575b9ac543d7e106ea1a64f9a62a
X-Patchwork-Hint: ignore
Message-Id: <20251231115129.7D0CC87DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: bump to version 0.83
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

commit: https://git.buildroot.net/buildroot/commit/?id=6131b31fbdd0575b9ac543d7e106ea1a64f9a62a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

This commit updates the LICENSE file hash, after a year update.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add commit log comment about LICENSE file hash update]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/putty/putty.hash | 10 +++++-----
 package/putty/putty.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 30b749c47b..33a9666bc2 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.80/{sha1,sha256,sha512}sums
-sha1  8c88d871855d3730a0473bb1cb1006654e73b680  putty-0.81.tar.gz
-sha256  cb8b00a94f453494e345a3df281d7a3ed26bb0dd7e36264f145206f8857639fe  putty-0.81.tar.gz
-sha512  d86f2fd0e126b18275d58cf64334b3b27c450899a1c2be2502de9faa2ef58f7fc8efc5d45f25c8395623f1e21917aa02407343bb2fee44c4c00b9f81267d5ecd  putty-0.81.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.83/{sha1,sha256,sha512}sums
+sha1  f9fd9ab5e3849bf8c22b218cdb7697dcdd1d8c9e  putty-0.83.tar.gz
+sha256  718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6  putty-0.83.tar.gz
+sha512  4781616b7e9c5a779a54e6a8486513e0aa947d4a36e9dbfd4ffc0d32981a5ad4868cddbde0363467236ed67c43f990408a9326d10354954be716a270d587c0a6  putty-0.83.tar.gz
 
 # Locally calculated
-sha256  e0410341c5e45f7479c28d79298edbf615589cdfc115b2d69683d4ccd0425ce0  LICENCE
+sha256  c18aac5045fd30bff639b07884be44cb8c68eef16efe8c5e18deda1f58cacdfb  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index ec65991f41..9071fea208 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.81
+PUTTY_VERSION = 0.83
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
