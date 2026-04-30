Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36307CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D70661501;
	Mon,  4 May 2026 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aN8rJ1YC7VIj; Mon,  4 May 2026 14:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0810B61523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906030;
	bh=G0GmFDN6skFButLcEVtj3z+JOoc3HCyXJlwN+zAkmJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=faOdjXlbidcIHpKMnC8XsOyXkyoh3s+d3Kn4VfUUPWenXvOjxlbxhDFgn5eJoK0TK
	 igm/NpR8JknsBhyXzCBuOLqgQPtvw2WufKoFnYRwm+lMQWSDGhUkM+8ZZ94qTv+LH1
	 ZKZE1f0KoTZ3faZ1wbgb6v+VPLXQSTV2YFFiZbKUwR3d7FrXYZTjGeJ4WO4H69+4EL
	 XG3RLvlwqfhdmQq8ZXXA9LC/9QvD7yZ5PfbBp335FLzQVVT7MfmRvkGxdllHC/bYGn
	 21rqBIheHOUnCW/y7dj/c+piDPubteMom4XWT3Gl2YaguRmpJlr2RuU+wI52sXTIYj
	 krhLAR0p9nKaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0810B61523;
	Mon,  4 May 2026 14:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12BC130A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 343A7844AE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbwqyNBgUOFK for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E05E4844A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E05E4844A2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6CF984272; Mon,  4 May 2026 14:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:42:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dabbb7caa4c057505cf0f6f15a61b0aaa46bb7dc
X-Git-Newrev: eeb65cf0f6753da6bc53197b971aec12ba647026
X-Patchwork-Hint: ignore
Message-Id: <20260504144642.A6CF984272@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: add
 patch for CVE-2026-27456
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eeb65cf0f6753da6bc53197b971aec12ba647026
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-27456: mount(8) TOCTOU symlink attack via loop device. The SUID
    mount follows symlinks when resolving loop backing file paths. On
    systems where non-root users are permitted to mount loop devices (via
    'user' option in fstab), this allows access to arbitrary files.

For more information, see:

- https://nvd.nist.gov/vuln/detail/CVE-2026-27456
- https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit cd52acda141d621b6c5774defe1427be29fe6ac1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../util-linux/0006-add-loopdev-fl-nofollow.patch  | 111 +++++++++++++++++++++
 package/util-linux/util-linux.mk                   |   3 +
 2 files changed, 114 insertions(+)

diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
new file mode 100644
index 0000000000..21b1e2596c
--- /dev/null
+++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
@@ -0,0 +1,111 @@
+From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 13:59:46 +0100
+Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
+
+Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
+prevents symlink following in both path canonicalization and file open.
+
+When set:
+- loopcxt_set_backing_file() uses strdup() instead of
+  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
+
+The flag is set for non-root (restricted) mount operations in
+libmount's loop device hook. This prevents a TOCTOU race condition
+where an attacker could replace the backing file (specified in
+/etc/fstab) with a symlink to an arbitrary root-owned file between
+path resolution and open().
+
+Vulnerable Code Flow:
+
+  mount /mnt/point (non-root, SUID)
+    mount.c: sanitize_paths() on user args (mountpoint only)
+    mnt_context_mount()
+      mnt_context_prepare_mount()
+        mnt_context_apply_fstab()           <-- source path from fstab
+        hooks run at MNT_STAGE_PREP_SOURCE
+          hook_loopdev.c: setup_loopdev()
+            backing_file = fstab source path ("/home/user/disk.img")
+            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
+              ul_canonicalize_path()         <-- follows symlinks!
+            loopcxt_setup_device()
+              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
+
+Two vulnerabilities in the path:
+
+1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+   realpath() -- this follows symlinks as euid=0. If the attacker swaps
+   the file to a symlink before this call, lc->filename becomes the
+   resolved target path (e.g., /root/secret.img).
+
+2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
+   if canonicalization happened correctly, the file can be swapped to a
+   symlink between canonicalize and open.
+
+Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2026-27456
+Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
+[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ include/loopdev.h           | 3 ++-
+ lib/loopdev.c               | 7 ++++++-
+ libmount/src/hook_loopdev.c | 3 ++-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/include/loopdev.h b/include/loopdev.h
+index d10bf7f37..0f85dd254 100644
+--- a/include/loopdev.h
++++ b/include/loopdev.h
+@@ -139,7 +139,8 @@ enum {
+ 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
+ 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
+ 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
+-	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
++	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
++	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
+ };
+ 
+ /*
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index c72fb2c40..3d2274693 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
+ 	if (!lc)
+ 		return -EINVAL;
+ 
+-	lc->filename = canonicalize_path(filename);
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		lc->filename = strdup(filename);
++	else
++		lc->filename = ul_canonicalize_path(filename);
+ 	if (!lc->filename)
+ 		return -errno;
+ 
+@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		flags |= O_NOFOLLOW;
+ 
+ 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+ 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 597b9339a..4df1915a6 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
+ 	}
+ 
+ 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
+-	rc = loopcxt_init(&lc, 0);
++	rc = loopcxt_init(&lc,
++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
+ 	if (rc)
+ 		goto done_no_deinit;
+ 	if (mnt_opt_has_value(loopopt)) {
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5d761e01c9..d30c26deb5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -36,6 +36,9 @@ UTIL_LINUX_CPE_ID_VENDOR = kernel
 # 0001-libmount-ifdef-statx-call.patch
 UTIL_LINUX_AUTORECONF = YES
 
+# 0006-add-loopdev-fl-nofollow.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
