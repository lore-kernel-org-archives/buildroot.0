Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C0E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E1860D69;
	Mon,  2 Feb 2026 17:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d_VSzyrINB3; Mon,  2 Feb 2026 17:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC1260DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054260;
	bh=lTw+AbyeFij5h9K7YuoudI0gdI4VMetfKLVrP9spgHU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VIYl6mWwibw7vMqQVvHsDRhqlZR/Ul68ayKPCwLzwcEioAGpYrrWJ9mfRSZ0fpGPD
	 8zelgSPZNVxUmJQXIgl/i8S2DLj2R/ObBqG1f8tJJMptclz6UE25y7T1/8orpj6wxl
	 wRmb6s3MxMieisLclJmxokCAxSLHPDM4hZSMVyrTGJNWDPeJ/H+PTm8+LC534s27jd
	 A/CTFGBhu6CrmQMDCtoUQpJZ10HwAXHXKIf6Jx29OESJCRWYr9Bc2nxl9LCy8XcXys
	 NAHSzCFuc5eabzgqGObPHGZNGkAWy6pN8GW7IyEjbKJTEXbB/lNTKZE2DyydaIRhk5
	 lQyp049PEa8XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC1260DDF;
	Mon,  2 Feb 2026 17:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 490FF34E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29304034E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDBsTY5ad7op for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC8D04036E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC8D04036E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E53BD8645B; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d94762640e7234ef60dbc5a8ed7380fa3549b24e
X-Git-Newrev: 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.E53BD8645B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: split hash file in before and from 6.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In linux 6.17, the license file LICENSES/preferred/GPL-2.0 was modified.
As a result, also its hash changed, and the hash was duly updated in
commit d6c0f0015b4d469cb8e4e590e44e221d8660424c. Of course, this is only
valid for kernel versions from 6.17 - but at the time, we only set
LINUX_LICENSE_FILES for the latest kernel version, not for any other
kernel versions.

Since commit 305a2d91731fade45f35c259cb012bdf17e8dbeb, we also set
LINUX_LICENSE_FILES for all other versions, including e.g. the CIP
versions. Similarly, we now set LICENSE_FILES for all linux-headers
versions. Thus, the hash check of the license file fails for all older
kernel versions.

Fix this by splitting the hash file in two hash files: before-6.17 and
from-6.17. We keep just two hash file rather than a separate one for
each version to limit the number of files that need to be updated when
bumping kernel versions. Create symlinks for all the CIP version in
linux and for all supported versions in linux-headers.

Include the CIP versions as well for linux-headers. They are used when
the kernel is set to the CIP version and linux-headers to
same-as-kernel.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 linux/5.10.246-cip66                      | 1 +
 linux/5.10.246-cip66-rt29/linux.hash      | 1 +
 linux/6.18.8                              | 1 +
 linux/before-6.17/linux-headers.hash      | 1 +
 linux/{ => before-6.17}/linux.hash        | 3 +--
 linux/from-6.17/linux-headers.hash        | 1 +
 linux/from-6.17/linux.hash                | 7 +++++++
 package/linux-headers/5.10.246-cip66      | 1 +
 package/linux-headers/5.10.246-cip66-rt29 | 1 +
 package/linux-headers/5.10.248            | 1 +
 package/linux-headers/5.15.198            | 1 +
 package/linux-headers/6.1.161             | 1 +
 package/linux-headers/6.12.68             | 1 +
 package/linux-headers/6.18.8              | 1 +
 package/linux-headers/6.6.112             | 1 +
 package/linux-headers/linux-headers.hash  | 1 -
 16 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/linux/5.10.246-cip66 b/linux/5.10.246-cip66
new file mode 120000
index 0000000000..16c27bbff3
--- /dev/null
+++ b/linux/5.10.246-cip66
@@ -0,0 +1 @@
+before-6.17/
\ No newline at end of file
diff --git a/linux/5.10.246-cip66-rt29/linux.hash b/linux/5.10.246-cip66-rt29/linux.hash
new file mode 120000
index 0000000000..cde5626c0a
--- /dev/null
+++ b/linux/5.10.246-cip66-rt29/linux.hash
@@ -0,0 +1 @@
+../before-6.17/linux.hash
\ No newline at end of file
diff --git a/linux/6.18.8 b/linux/6.18.8
new file mode 120000
index 0000000000..74e2b2d5b6
--- /dev/null
+++ b/linux/6.18.8
@@ -0,0 +1 @@
+from-6.17
\ No newline at end of file
diff --git a/linux/before-6.17/linux-headers.hash b/linux/before-6.17/linux-headers.hash
new file mode 120000
index 0000000000..7c10ad0986
--- /dev/null
+++ b/linux/before-6.17/linux-headers.hash
@@ -0,0 +1 @@
+linux.hash
\ No newline at end of file
diff --git a/linux/linux.hash b/linux/before-6.17/linux.hash
similarity index 84%
rename from linux/linux.hash
rename to linux/before-6.17/linux.hash
index 2ba90714d3..4d5850641f 100644
--- a/linux/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,4 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
 sha256  d367c7504bd4da520dd01eb08125d2d0ac088bc8af4cd56d236f2074dd4225b7  linux-6.12.68.tar.xz
 sha256  d48e0d9de04bef2fb9740bdb0124548bcab8867cdca00ff9712c110282b299d6  linux-6.6.122.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
@@ -12,5 +11,5 @@ sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/linux/from-6.17/linux-headers.hash b/linux/from-6.17/linux-headers.hash
new file mode 120000
index 0000000000..7c10ad0986
--- /dev/null
+++ b/linux/from-6.17/linux-headers.hash
@@ -0,0 +1 @@
+linux.hash
\ No newline at end of file
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
new file mode 100644
index 0000000000..4d7f67daeb
--- /dev/null
+++ b/linux/from-6.17/linux.hash
@@ -0,0 +1,7 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+
+# Licenses hashes
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/package/linux-headers/5.10.246-cip66 b/package/linux-headers/5.10.246-cip66
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/5.10.246-cip66
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/5.10.246-cip66-rt29 b/package/linux-headers/5.10.246-cip66-rt29
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/5.10.246-cip66-rt29
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/5.10.248 b/package/linux-headers/5.10.248
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/5.10.248
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/5.15.198 b/package/linux-headers/5.15.198
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/5.15.198
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/6.1.161 b/package/linux-headers/6.1.161
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/6.1.161
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/6.12.68 b/package/linux-headers/6.12.68
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/6.12.68
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/6.18.8 b/package/linux-headers/6.18.8
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/6.18.8
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/6.6.112 b/package/linux-headers/6.6.112
new file mode 120000
index 0000000000..6bdea03c2e
--- /dev/null
+++ b/package/linux-headers/6.6.112
@@ -0,0 +1 @@
+../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/linux-headers.hash b/package/linux-headers/linux-headers.hash
deleted file mode 120000
index 04970e97c1..0000000000
--- a/package/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/linux.hash
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
