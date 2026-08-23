Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53319C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 13:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C536F40555;
	Sun, 23 Aug 2026 13:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpgiBE7vDSsX; Sun, 23 Aug 2026 13:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787493287;
	bh=2epfZAXTT164f7wbt0nDyH0IamVzx6/X3hc2+XDDx9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LP/QQ67gl6w9NZIbwxP2WzvQfMFqA9N4TD6BxXfwo2nwBjthyFt0IKq1RcKSLm4Iu
	 AvyKXxoMDzVk7wbVwrotYr2d1J2MtmGty4g1IJOrWzOaVJtE1YrRpCXH8OBYWidD6A
	 gGUDCOZuhT2Jq6gqFeU02mpRBIPzw/LEjVdF63hAmp3go6Sf5DpcT8Ap6zzekRI7wc
	 uAGYKwglVdaqCZAlHU/qDC6KRtOzm7OdZyhQ6dsl3GXqUJhNs8yNWCRnzuCEp3AdXn
	 so5QNBZxDw4Uw8jKB/jwnZ470yfX3IYViQo/j+9+/ZBdU1gMr1+X5DDfY+e0FKz61M
	 0SXwsr0ztvpWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72C940565;
	Sun, 23 Aug 2026 13:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8754E336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D72640565
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwmHC3BZx3iN for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 13:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA3340555
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 13:54:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5A688EBEA; Sun, 23 Aug 2026 13:53:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 15:53:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edffc0bc50b329928f556b008c96bf57b583c510
X-Git-Newrev: c3f3705a2fd27206cf2e79fd802b681e77be2cfe
X-Patchwork-Hint: ignore
Message-Id: <20260823135350.E5A688EBEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: fix build failure on
 missing C++ compiler
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3f3705a2fd27206cf2e79fd802b681e77be2cfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The meson build configuration of libgpiod2 unconditionally requires a
C++ compiler, although it is only useful if building the C++ bindings.
This is causing autobuild failures with an obscure error message:
"ERROR: Unable to get gcc pre-processor defines".

Fix the failures by only requiring a C++ compiler when we want the C++
bindings.

Fixes:
 - https://autobuild.buildroot.org/results/d1c19ffa0c599bd2ba9be965a98fc8f778d6e366
 - https://autobuild.buildroot.org/results/c6b3c9311d628bdb4ea103431767493fab9a3668
 - https://autobuild.buildroot.org/results/8e799050c5779c680ff5e5136571f57d29239f2f
 - https://autobuild.buildroot.org/results/d6d8833acfe00559579defbbf3ca34c0edbe7869

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-require-a-C-compiler-if-it-is-not-neede.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
new file mode 100644
index 0000000000..ccc4430a8c
--- /dev/null
+++ b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
@@ -0,0 +1,46 @@
+From fce6b611e2530602c44fd914222529028173c509 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Wed, 19 Aug 2026 18:15:25 +0200
+Subject: [PATCH] build: do not require a C++ compiler if it is not needed
+
+Languages specified in the meson project() function are considered hard
+dependencies. When trying to build libgpiod in an environment lacking a
+C++ compiler, the build fails with an obscure error message ("ERROR:
+Unable to get gcc pre-processor defines").
+
+As the C++ compiler is only needed for building the C++ bindings, do not
+require it unless the option bindings-cxx is enabled.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://lore.kernel.org/linux-gpio/0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr/
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c030b50..fed612f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
+ # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ 
+-project('libgpiod', ['c', 'cpp'],
++project('libgpiod', 'c',
+   version: '2.3.1',
+   license: 'LGPL-2.1-or-later',
+   default_options: [
+@@ -56,6 +56,10 @@ opt_dbus                = get_option('dbus')
+ opt_introspection       = get_option('introspection')
+ opt_systemd             = get_option('systemd')
+ 
++if opt_bindings_cxx.allowed()
++  add_languages('cpp')
++endif
++
+ if get_option('profiling')
+   profiling_c_args    = ['-fprofile-arcs', '-ftest-coverage']
+   profiling_link_args = ['-lgcov']
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
