Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D77C61DDA
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB3360808;
	Fri, 28 Aug 2026 14:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGeYYN_Q3zG3; Fri, 28 Aug 2026 14:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927045;
	bh=It6TGTEBIkBCF48SrgFfe6UlEHjnVxMJ4w535qC9Nng=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GUZU7ld32BzT64NERlomk47yOHHWricskWZ8OYTBPh149BmSyeWuGpCd7CXDiDjG+
	 JBQ4erGtIVxnQGe6ruY07eC6m+y1e7B9DV/0LRIAhpMEDOBbm+tAcWa8hNQZvqjuRV
	 UT65MnsywmGqC7vXSYHyAa7Qgv+Y2smVamNS2B2quaEZ5PvApM+nFJYskp12kYudC7
	 /Ut+P7MBWUR/6yNFRaHkzNtfU71WitMuwdN5loLgAnFwX8K3yOuWPR7sXcOM+KPcMs
	 98ZeEaKxal8uhE8vN+wWGfcv/qQkf6Do8vPNh/WdLilBft8DtOo1ZINEAKPVW5Ar1u
	 oc3FKeKI3HnTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1C160831;
	Fri, 28 Aug 2026 14:24:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A69D127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00E0540861
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MREK9AYBxmjQ for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37338407BA
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28D1C921FA; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc5042f1d1085bb9e9f8ca87a02c093ecd20857e
X-Git-Newrev: db5ee9b746207e62af7bda4814b6c5caf552d807
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.28D1C921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: remove
 TestGdbArc
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db5ee9b746207e62af7bda4814b6c5caf552d807
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Arc specific gdb version was removed by commit [1]
but we still have the TestGdbArc that was testing this
version of gdb.

We can now safely remove TestGdbArc.

[1] 0b3d526226662af8b16525aecec7da5ff0e5fa1d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2f6b34f8519ad7f47814edbf3c49869213aef423)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/testing/tests/package/test_gdb.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 324052efdb..78395b1847 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -89,19 +89,3 @@ class TestGdbFullTarget(BaseGdb):
     def test_run(self):
         self.boot()
         self.verify_gdb()
-
-
-class TestGdbArc(BaseGdb):
-    config = \
-        """
-        BR2_arcle=y
-        BR2_archs38=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_SERVER=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb("arc-linux")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
