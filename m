Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C3BC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 23:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB5C41619;
	Sun,  7 Jan 2024 23:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB5C41619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNFlf_ydZwgk; Sun,  7 Jan 2024 23:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DBE40948;
	Sun,  7 Jan 2024 23:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DBE40948
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBADD1BF869
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A516382F76
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A516382F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DspcnvTKwjq0 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 23:22:46 +0000 (UTC)
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA5C82A56
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 23:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA5C82A56
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id McTarVOj11f5IMcTbrANbb; Mon, 08 Jan 2024 00:22:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:22:40 +0100
Message-Id: <20240107232241.666769-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
References: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJF5yGA/U8pcHh8uzbtdH5sfecyG/e7GcOqwlVO3/vBIUay62BeMhHLjWpzT3fI8aeFggvzfspfKVxI20KAkZz05UKpvDEXJUZdwVKUosZPSUeUJjvw7
 SRjEz4B6JKS7pe3X/78aN46/ihoeC42SFSnWKWfED9hD4H1vKcjOC/hIjbYDGpkdThchzb+D2c4NsFXU8ZD1WnkqFvaa6MgsFEbjpcDob6CWz1laIPbz1LsB
 ymWnPaX+shSFNikL7jcSKh2IUeYoYZ88OvpJM9Hf5MaZ/3Vwdl+H2bzotpa3+J84XbF4HiYe6NiiMfr04VCHPlH+8s38fYrv+6JjKCuCJq3B22kdqwiPHx06
 WnQOC0E6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704669763; bh=dCgK59JVhy8zL+7uDsiuV0DVPIPIFGgyBvmRpTFy0rc=;
 h=From:To:Subject:Date:MIME-Version;
 b=WZ6x9di34+T4ipc1VBl2qRSN+V2VvWj+u2DnUsuRgUQTXB6qpnVu1KK7YBPfJTZ1H
 TW0c2L9PoBM6HNQgbnQNT3NUH5ClbMkAy30XjJNxO+xCbBW0kcpzngzaJ8agm0T9Ic
 Irb88j6hBnwRXJ7XjBAhmsDypbYfUAre53jK5unDE/q9QtLMJLLycgbIzF5QyJVAgX
 ompqY035B0gjq6kOFvdaqTxJq0KR/b9UvUc1Y7h6HWhLOqhSts156nYdqvssp8LZ0/
 PNFImq3rLIfBJLwNM8U68bOpjzAJPJ0/024pH/bzgJiHUK2VOJhGe745zhbIEgC7/c
 0TGwdbEcb8PBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WZ6x9di3
Subject: [Buildroot] [PATCH 3/4] package/libtracefs: disable samples
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libtracefs samples require pthread, but we don't need samples to be built,
so let's add local patch pending upstream that allow us to disable samples
building by adding 'samples' variable and let's set it to false in
LIBTRACEFS_CONF_OPTS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...racefs-add-option-to-disable-samples.patch | 45 +++++++++++++++++++
 package/libtracefs/libtracefs.mk              |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 package/libtracefs/0002-libtracefs-add-option-to-disable-samples.patch

diff --git a/package/libtracefs/0002-libtracefs-add-option-to-disable-samples.patch b/package/libtracefs/0002-libtracefs-add-option-to-disable-samples.patch
new file mode 100644
index 0000000000..186cea581d
--- /dev/null
+++ b/package/libtracefs/0002-libtracefs-add-option-to-disable-samples.patch
@@ -0,0 +1,45 @@
+From 7c7d467431b949e3265c3d499f491880d6284c3a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Jan 2024 00:01:38 +0100
+Subject: [PATCH] libtracefs: add option to disable samples
+
+On some Linux environment builder(i.e. Buildroot) we don't want to produce
+sample to reduce size usage and dependencies count. So let's add samples
+option set to true by default to let the user to override it and not
+build samples.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20240107230733.456099-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 2 ++
+ meson_options.txt | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 57ffe20..f7d3da6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -38,7 +38,9 @@ subdir('include')
+ if cunit_dep.found()
+     subdir('utest')
+ endif
++if get_option('samples')
+ subdir('samples')
++endif
+ 
+ if get_option('doc')
+ subdir('Documentation')
+diff --git a/meson_options.txt b/meson_options.txt
+index 5533a88..8450992 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -16,3 +16,5 @@ option('docbook-suppress-sp', type : 'boolean', value : false,
+        description : 'docbook suppress sp')
+ option('doc', type : 'boolean', value: true,
+        description : 'produce documentation')
++option('samples', type : 'boolean', value: true,
++       description : 'build samples')
+-- 
+2.34.1
+
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index 1e6e19a234..18222f5931 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -13,6 +13,7 @@ LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
-	-Ddoc=false
+	-Ddoc=false \
+	-Dsamples=false
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
