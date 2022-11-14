Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07FEC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1888C4009D;
	Mon, 14 Nov 2022 22:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1888C4009D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXGFqDwxX9WK; Mon, 14 Nov 2022 22:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF5D3400A6;
	Mon, 14 Nov 2022 22:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF5D3400A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 764251BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EDD7401A2
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EDD7401A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGvG77JY1XEE for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:43:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6889740120
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6889740120
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 550B483BD3; Mon, 14 Nov 2022 22:43:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:22:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12c430f880f9255529d8c53cdb59f4178d2cd8f4
X-Git-Newrev: 5f94d91ed8e486e43b7fcf58b040d26960589eb2
X-Patchwork-Hint: ignore
Message-Id: <20221114224335.550B483BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stb: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f94d91ed8e486e43b7fcf58b040d26960589eb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a header only library which is required by the latest version
of zxing-cpp.

Include paths and pc file are based off of debian libstb package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/stb/Config.in |  6 ++++++
 package/stb/stb.hash  |  3 +++
 package/stb/stb.mk    | 21 +++++++++++++++++++++
 package/stb/stb.pc    |  8 ++++++++
 6 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d27936992..bc026da4aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1418,6 +1418,7 @@ F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
+F:	package/stb/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index 238d7813f0..52004de075 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1600,6 +1600,7 @@ menu "Graphics"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
+	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
 	source "package/waffle/Config.in"
diff --git a/package/stb/Config.in b/package/stb/Config.in
new file mode 100644
index 0000000000..41014d242b
--- /dev/null
+++ b/package/stb/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_STB
+	bool "stb"
+	help
+	  Single-file image and audio processing libraries for C/C++.
+
+	  https://github.com/nothings/stb
diff --git a/package/stb/stb.hash b/package/stb/stb.hash
new file mode 100644
index 0000000000..097ad3424f
--- /dev/null
+++ b/package/stb/stb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c47cf5abe21e1d620afccd159c23fe71dfa86eb270015a7646a4f79e9bfd5503  stb-8b5f1f37b5b75829fc72d38e7b5d4bcbf8a26d55.tar.gz
+sha256  bebfe904b14301657e4e5d655c811d51fd31b97c455b9cc2d8600d6bac6cff63  LICENSE
diff --git a/package/stb/stb.mk b/package/stb/stb.mk
new file mode 100644
index 0000000000..59358aec26
--- /dev/null
+++ b/package/stb/stb.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# stb
+#
+################################################################################
+
+STB_VERSION = 8b5f1f37b5b75829fc72d38e7b5d4bcbf8a26d55
+STB_SITE = $(call github,nothings,stb,$(STB_VERSION))
+STB_LICENSE = Public Domain or MIT
+STB_LICENSE_FILES = LICENSE
+STB_INSTALL_STAGING = YES
+STB_INSTALL_TARGET = NO
+
+define STB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/stb
+	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/stb
+	$(INSTALL) -D -m 0644 $(STB_PKGDIR)/stb.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/stb.pc
+endef
+
+$(eval $(generic-package))
diff --git a/package/stb/stb.pc b/package/stb/stb.pc
new file mode 100644
index 0000000000..165b6da94a
--- /dev/null
+++ b/package/stb/stb.pc
@@ -0,0 +1,8 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+Name: stb
+Description: single-file image and audio processing libraries for C/C++
+Version: 0.0
+Cflags: -I${includedir}/stb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
