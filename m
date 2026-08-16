Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C3C5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC6A80E23;
	Sun, 16 Aug 2026 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3nHp-xeBENs; Sun, 16 Aug 2026 14:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F9380E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786891633;
	bh=JOkgKTUUaqCji8wWGg9iaapkjG1hfkm9uy7U13eaUnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j8yy0Vr6DrYVgugNsHsbICFsNSRv3PQLEqb2/v9M2tH6CKv42x+Cpuj7W8BIvwRaZ
	 H6MEON2yNxeD0ay42Yk6QikpFkchPps4ZAqf9pK8tn3IWZ2WGjRtl+hLfx1A3Oz8JL
	 G1XXM29LNHzAg4V/0xttn2HnXzrqsPDG9FSCDu6CB7gKL9/eGj4utVc1E5Wb7k4GQg
	 2eFEf/CXNeWyke50smWlEFT6puT49VquwCTTwayDspX1/St1XxEnvIv02XMjc+xvak
	 I5xrvlzfFUvb4qSa5CTHVm4J/Nr/k1i+OamxLkYB7I+dEhLbLdEGlSGw8s2fNw4ijp
	 TfdFuNMwIo4gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F9380E48;
	Sun, 16 Aug 2026 14:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07235147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20084005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxg0PXD3X7gw for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 311A84004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 311A84004E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 288B58DA99; Sun, 16 Aug 2026 14:46:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 16:46:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f48599867d9fe45433c14d9f23eb3bd8fe07a7f
X-Git-Newrev: 380dd8a348dc7c5edf2b187245b8d4e70a3d96c2
X-Patchwork-Hint: ignore
Message-Id: <20260816144620.288B58DA99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: bump to v2.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/380dd8a348dc7c5edf2b187245b8d4e70a3d96c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Switch to release tarball using GitHub generated checksum
- Drop backported patch

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-functions-don-t-use-deprecated-pipes.quo.patch | 42 ----------------------
 package/firewalld/firewalld.hash                   |  3 +-
 package/firewalld/firewalld.mk                     |  6 ++--
 3 files changed, 5 insertions(+), 46 deletions(-)

diff --git a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
deleted file mode 100644
index 0deacbcca0..0000000000
--- a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0bfa4eb3e15d8df8a68a8c3429505905afae112e Mon Sep 17 00:00:00 2001
-From: Thomas Haller <thaller@redhat.com>
-Date: Fri, 7 Jul 2023 18:13:10 +0200
-Subject: [PATCH] improvement(functions): don't use deprecated pipes.quote()
-
-Since Python 3.3, shlex.quote() replaces it. This avoids a deprecation
-warning.
-
-Upstream: f7f5613b76c044c62c876ae87c6b85f5a41acb2a
-[Romain: backport to 2.0.2]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/firewall/functions.py | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/src/firewall/functions.py b/src/firewall/functions.py
-index f7133d71..6213e778 100644
---- a/src/firewall/functions.py
-+++ b/src/firewall/functions.py
-@@ -34,7 +34,6 @@ import socket
- import os
- import os.path
- import shlex
--import pipes
- import string
- import tempfile
- from firewall.core.logger import log
-@@ -607,10 +606,7 @@ def checkContext(context):
-     return True
- 
- def joinArgs(args):
--    if "quote" in dir(shlex):
--        return " ".join(shlex.quote(a) for a in args)
--    else:
--        return " ".join(pipes.quote(a) for a in args)
-+    return " ".join(shlex.quote(a) for a in args)
- 
- def splitArgs(_string):
-     return shlex.split(_string)
--- 
-2.51.0
-
diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index cbd4c7685b..48d80b1b87 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,4 @@
+# Hash generated by GitHub https://github.com/firewalld/firewalld/releases
+sha256  d441705746cf3d0a5efaad58b1b1193a23c58114162d81a9a0f4fe0c58ee43cf  firewalld-2.4.3.tar.bz2
 # Locally computed
-sha256  1433247299367f707279d50e0759ed27fbcc9bb973b7b2131e8cee96e006d96e  firewalld-2.0.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index eae8afc27f..c443ab3db4 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.0.2
-FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
+FIREWALLD_VERSION = 2.4.3
+FIREWALLD_SITE = https://github.com/firewalld/firewalld/releases/download/v$(FIREWALLD_VERSION)
+FIREWALLD_SOURCE = firewalld-$(FIREWALLD_VERSION).tar.bz2
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
 FIREWALLD_CPE_ID_VENDOR = firewalld
-FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \
 	host-intltool \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
