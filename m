Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12506C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:41:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA1F604DC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AA1F604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A3540291;
	Sun, 17 Oct 2021 07:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrdJ409YfeuL; Sun, 17 Oct 2021 07:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3444024F;
	Sun, 17 Oct 2021 07:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C81D61BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6063401B2
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43eKvLxbDpAE for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:41:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 816D840172
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AE2E695C51; Sun, 17 Oct 2021 07:38:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 09:40:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6
X-Git-Newrev: 72f9aefe68f32d4aeb53a39fe38cfa7ac0677bd1
X-Patchwork-Hint: ignore
Message-Id: <20211017073807.AE2E695C51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=72f9aefe68f32d4aeb53a39fe38cfa7ac0677bd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to version
0.11.0 in commit c3a907a770b88529ea5a93c77cf001096799c556:

../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
The following exception(s) were encountered:
Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-meson.build-make-C-optional.patch         | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/usbredir/0003-meson.build-make-C-optional.patch b/package/usbredir/0003-meson.build-make-C-optional.patch
new file mode 100644
index 0000000000..fe1ed3f698
--- /dev/null
+++ b/package/usbredir/0003-meson.build-make-C-optional.patch
@@ -0,0 +1,39 @@
+From 55fc307d23d657b52433d1c8508467d0589754d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Oct 2021 15:45:57 +0200
+Subject: [PATCH] meson.build: make C++ optional
+
+Remove cpp from meson project statement to make C++ optional and avoid
+the following build failure when the toolchain does not provide a C++
+compiler:
+
+../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
+The following exception(s) were encountered:
+Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
+
+Indeed C++ is only required for fuzzing which is already handled by
+meson through add_languages('cpp', required: true)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/55]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 49dbce4..ca19f22 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('usbredir', 'c', 'cpp',
++project('usbredir', 'c',
+     version: '0.11.0',
+     license: 'LGPLv2.1+',
+     meson_version : '>= 0.53',
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
