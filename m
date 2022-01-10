Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F5AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 15:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BC340234;
	Mon, 10 Jan 2022 15:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNqoca8-PsQi; Mon, 10 Jan 2022 15:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7232B4022A;
	Mon, 10 Jan 2022 15:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6431BF317
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA7F4018B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCqU1FlFXgpQ for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 15:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 730B0400B9
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 15:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 68A7682B46; Mon, 10 Jan 2022 15:40:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 16:40:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31fd98c6ae7c39d779e7f9729e55ec65a7f847ff
X-Git-Newrev: bb104bc0777926528e1e3a29bea7d32320ef2173
X-Patchwork-Hint: ignore
Message-Id: <20220110154005.68A7682B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: enable as host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb104bc0777926528e1e3a29bea7d32320ef2173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While currently there is no in-tree Buildroot package which depends on
host-python-greenlet, we (Adder Technology) have some proprietary
modules that use it as part of their builds.

I've tested python-greenlet as host package and confirmed that it builds
and works correctly. Someone else might require it, so I'm proposing its
inclusion.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host                     | 1 +
 package/python-greenlet/Config.in.host     | 7 +++++++
 package/python-greenlet/python-greenlet.mk | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index b3e00bb482..6e027d96c2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -69,6 +69,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-greenlet/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-greenlet/Config.in.host b/package/python-greenlet/Config.in.host
new file mode 100644
index 0000000000..673fee8cc5
--- /dev/null
+++ b/package/python-greenlet/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_GREENLET
+	bool "host python-greenlet"
+	help
+	  Greenlets are lightweight coroutines for in-process concurrent
+	  programming.
+
+	  https://greenlet.readthedocs.io/
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 7b983ff0ef..3b1ef7e314 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
