Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB8CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E26760726;
	Mon, 18 May 2026 19:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVlDdq7xUBhz; Mon, 18 May 2026 19:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9046068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779132739;
	bh=Uj3G06ZPvcOaMNWcnbTXniJVafILYKbEXnTWY/LJYJw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=swLbkY3NGFpsvMA1xe15vXyqRI6AVLOowslmW2fv9xxlWjmam5kq095PzqAlr7ikR
	 vfnTh2BUvEB+Jwhjl45mCSglGAlRHFQm3H80Uf6ziT1SWtKf2BsAElRON0gFGadGWs
	 UEWFxq5Jut8CYhokU3bdJIgG74YP4uTa44qxb8UiZNP1jbrIgHTEGCjWboJwZ6G7AM
	 efoYFUTT9Eg9id8PWF9appvXdty/KxioX6Aw3IOGgZQf/+ioW5k2Ya1Wu361Y7W9wD
	 IvPyaz/z7usB+qPdeM+bDLRNcNjTgFpv8VenaEKRy8RTHghjVSnbFTjXAuHGNge/sf
	 KNjfwBplI2oiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9046068F;
	Mon, 18 May 2026 19:32:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55FA6282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6F68115C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTUrmo5xIZtp for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 743A98115A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 743A98115A
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A6FF866BE; Mon, 18 May 2026 19:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:31:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b28aeeab1f64c1cdda38f0d2442dd28cb0a28913
X-Git-Newrev: 12a6a7d1c664b8739832b5e8e113048d3f1654bc
X-Patchwork-Hint: ignore
Message-Id: <20260518193210.2A6FF866BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: Add patch to fix
 build failure with newer glib versions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12a6a7d1c664b8739832b5e8e113048d3f1654bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Later versions of glib defines g_free as a macro, causing build
failures. Add patch from upstream pull request to fix the issue.

Fixes: https://autobuild.buildroot.org/results/5c6/5c6407b9f8ac1959717e18d81d629b4a4455b06d
Cc: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...void-GLib-g_free-macro-redefinition-error.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
new file mode 100644
index 0000000000..226fd5a15f
--- /dev/null
+++ b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
@@ -0,0 +1,34 @@
+From bfd12cf73d81919843383598e4a9e64c6e5fd97a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Nov 2025 00:29:10 -0800
+Subject: [PATCH] glib_stubs: avoid GLib g_free macro redefinition error
+
+glib 2.78+ defines g_free as an object-size checking macro.
+open-vm-tools overrides g_free(), leading to preprocessor expansion
+inside the function signature and breaking the build.
+
+Undefine the macro before defining the stub.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/vmware/open-vm-tools/pull/779
+Signed-off-by: John Ernberg <j@j-ernberg.se>
+---
+ open-vm-tools/lib/rpcChannel/glib_stubs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/rpcChannel/glib_stubs.c b/lib/rpcChannel/glib_stubs.c
+index c32deb073..cb89c6a87 100644
+--- a/lib/rpcChannel/glib_stubs.c
++++ b/lib/rpcChannel/glib_stubs.c
+@@ -35,6 +35,9 @@
+ 
+ void *g_malloc0(size_t s) { return Util_SafeCalloc(1, s); }
+ void *g_malloc0_n(size_t n, size_t s) { return Util_SafeCalloc(n, s); }
++/* GLib defines g_free as a macro, so undefine it before providing
++ * our own stub implementation. */
++#undef g_free
+ void g_free(void *p) { free(p); }
+ 
+ void g_mutex_init(GMutex *mutex) { }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
