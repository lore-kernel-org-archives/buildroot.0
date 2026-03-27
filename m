Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CBE10F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 21:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB7D80DF7;
	Fri, 27 Mar 2026 21:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTK7XnbPfWvD; Fri, 27 Mar 2026 21:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D6880DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774646307;
	bh=YXzsjVtlyyGJelDpIW9krihEHpYnzEn4hNwwSd9CrIw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GcR6UhWgf4ak8TAor8ymrfVWnS2ei8U5Lq03gHCHf6Hg5dOhkQLZQB6DKDqNdYQ4w
	 nEXmGL15U9aObL/0os50+UW3cPDZ1UBzW0AMp5/jPnZkhFX901yjDxe8JtkgRPbir4
	 8Wimzp2aO8+9994pyHlpTYuUO2J/sQ/JYkYEmFZgFD290hCQGMsY1uak1RnJbFRevI
	 zs+ia0bEe7KVu+AZ+/1jwRbbF9VBX0zGmji/OUd2ZKpH32+AppiY1JAmgLfta3iquP
	 8Mad2laQ2xKWqmryqB1qCyO8d32Lg091fqUfgQe9NyGqLc5Q+CKJWSpsTkK2d3qwDN
	 2ysymnt+Ta+Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D6880DF9;
	Fri, 27 Mar 2026 21:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 522D11D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4409380DF0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJswEJ7rrwam for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 21:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A49280DE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A49280DE8
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B13177FC0E; Fri, 27 Mar 2026 21:18:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 22:01:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 394753456628a7121218946d41d8593959c25d6b
X-Git-Newrev: bcbae423d36e92503056682b40b815d51462e782
X-Patchwork-Hint: ignore
Message-Id: <20260327211824.B13177FC0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rwmem: bump to version 2.0
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
Content-Type: multipart/mixed; boundary="===============1048948894199185446=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1048948894199185446==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcbae423d36e92503056682b40b815d51462e782
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more details, see:
https://github.com/tomba/rwmem/compare/c89bc9ad9...2.0

Signed-off-by: Vincent Cruz <mooz@blockos.org>
[Julien: add info in patch "Upstream:" tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-failure-with-musl-libc.patch    | 50 ++++++++++++++++++++++
 package/rwmem/rwmem.hash                           |  3 +-
 package/rwmem/rwmem.mk                             |  3 +-
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch b/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch
new file mode 100644
index 0000000000..502f1d9118
--- /dev/null
+++ b/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch
@@ -0,0 +1,50 @@
+From 3730c3028a494536571c30d4d44df347e0886651 Mon Sep 17 00:00:00 2001
+From: Vincent Cruz <mooz@blockos.org>
+Date: Fri, 27 Mar 2026 11:16:36 +0100
+Subject: [PATCH] Fix build failure with musl libc.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following build failure when using musl libc:
+
+../tests/test_data_generator.cpp: In lambda function:
+../tests/test_data_generator.cpp:104:27: error: ‘htobe32’ was not declared in this scope; did you mean ‘htobe’?
+  104 |         uint32_t be_val = htobe32(val);
+      |                           ^~~~~~~
+      |                           htobe
+../tests/test_data_generator.cpp: In lambda function:
+../tests/test_data_generator.cpp:109:27: error: ‘htobe64’ was not declared in this scope; did you mean ‘htobe’?
+  109 |         uint64_t be_val = htobe64(val);
+      |                           ^~~~~~~
+      |                           htobe
+
+Upstream: N/A. The impacted file removed upstream in https://github.com/tomba/rwmem/commit/f9e0bffacd7520ee8975c4a36a9d47292d145ae9
+
+Signed-off-by: Vincent Cruz <mooz@blockos.org>
+---
+ tests/test_data_generator.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_data_generator.cpp b/tests/test_data_generator.cpp
+index 39e1322..3676f19 100644
+--- a/tests/test_data_generator.cpp
++++ b/tests/test_data_generator.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <algorithm>
+ #include <cstring>
++#include <endian.h>
+ 
+ // Constants from regfiledata.h
+ static const uint32_t RWMEM_MAGIC = 0x00e11554;
+@@ -169,4 +170,4 @@ std::vector<uint8_t> TestRegisterFileBuilder::build() {
+     }
+ 
+     return data;
+-}
+\ No newline at end of file
++}
+-- 
+2.51.0
+
diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
index da74002cb4..8b73f662ea 100644
--- a/package/rwmem/rwmem.hash
+++ b/package/rwmem/rwmem.hash
@@ -1,2 +1,3 @@
-sha256  e6cb76b77869aef9ec4a2c31d0d80af0182a5f9c9c3ae06225c8fb2f8266379f  rwmem-c89bc9ad9a8f2359f358c510db57b7678eb156d1.tar.gz
+# Locally calculated
+sha256  d10639f563100c819202337c4d4df57db11c2fcd59a19b0c68e34b8eb9aa1d01  rwmem-2.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
index d6ef05193b..1259b5503f 100644
--- a/package/rwmem/rwmem.mk
+++ b/package/rwmem/rwmem.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
+RWMEM_VERSION = 2.0
 RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
 RWMEM_LICENSE = GPL-2.0
 RWMEM_LICENSE_FILES = LICENSE
-RWMEM_CONF_OPTS = -Dpyrwmem=disabled
 RWMEM_DEPENDENCIES = host-pkgconf fmt inih
 
 $(eval $(meson-package))

--===============1048948894199185446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1048948894199185446==--
