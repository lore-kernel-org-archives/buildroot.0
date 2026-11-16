Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83555606A33F
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jByfqoYC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F6E4080A;
	Mon, 16 Nov 2026 17:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvZCKhfcHSTV; Mon, 16 Nov 2026 17:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 46E1C40810
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794851602;
	b=h0a/S4uhwcTbIFa3wd+rRijmm57Djo+ep+HnrNAiRce5+O1wjqgSlJ/wrMzM6Odzj78u
	 fnTWvbIiBUKVymlXsgEX3JYJirXkL5rltuVSGB6qGCBfOQNQ5LJOXq2LiuNCtEGwSWXFz
	 NHGdPqypyYu7YO+yqhc8Aj/fIS4ErBM1XnSz++KFsgJ3ITW6YtXQM1TTeWJBMYdHrCQTO
	 o4aLwIZXiKl/Ryly+5+QTeFe3y0EMb09DvXTYnyQbiknT21mwqPjQmGvk8XxdEc+H5DFj
	 /Waifg2jqxTNXgv9L0dDGEjSi9LgHnTP6oiI/4+7lcgEdiX1G7mqAnBMXyM8EsL8zYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794851602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mkGI8YqTkgOAeoYjg4k3ybzUchesHp/UFAanm7GMkJw=;
	b=tNxyLBHN79Z8ain3T9wBYN2FYzKjeICOY12Gayh0CMUvMcxSqbRLDkkD8wIgk0uMRYnP
	 DmrbE4VvK6V8eIrobPKKioS1v7Jhh09xgKLOYHN5ZeXj5XCJE0JGx5bhVzTW//Rgq4WFM
	 fz4LbvkbGttaG7cQwrjVE07BMcwtamS+2uVyOoi0Zakytb24MZZ4hl//0pmn2/FgX2MW+
	 J/JK0KOeSnYiIaEDgYw+nQ+SJKaNSHz3V8gRW36tZIEdaRb3fyC/kEvFTcGmbXREu6/np
	 SyUQwLAJ3HfRNZMiIO6tag4Mpf8LHs3yjQRhGFwBxUFukmrgIP6ArAIW+WPz6tdfZHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794851602;
	bh=mkGI8YqTkgOAeoYjg4k3ybzUchesHp/UFAanm7GMkJw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jByfqoYChmNpfWeo2i07AKG295OieIgf7GZZ8FaZq/eW7lL6w0hq5/wAWd40koXei
	 0rPAsdNuwjimBwX7/wrygeGh4SAN5fWBj+QTQGaxQDJ0Po+QAbzK7fwuk5VLJ7wMYr
	 vZIXzjQ68oTtZb/IigrB4+yyLGNIcuXfMd/zwng5XaZChuJEx9SRvrTyGeINqT6iCO
	 DZyq5qgMxZtfmdAtosWc0JKjr/ObZjglptI4oMc3/1ZWep/iNed/UwGLyAQEorgZvA
	 qewFVjvj88Km6COqrhS9LMhvd4ylKw6O07WQ3aJRv1ThpOa4DlwC7pFGuF95HF7EAY
	 9JiI+Cl+JXZtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E1C40810;
	Mon, 16 Nov 2026 17:53:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38696169
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A80C40819
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paXfAhePcfur for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 17:53:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D11E94080A
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D11E94080A
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:53:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so1671403f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794851597; x=1795456397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eT2LcC+PkrYgOdSPBO197/jrpyIlHsmuQ2XiLmpOm9U=;
 b=vh54kBnK57exGnNcVLPVqfUVkU2rLA6PFlOcDZcEJUSERF0fRp9kNMIjV8+56+fgzt
 VZfB1jLL4N8tPYH0vek8IrAh3xDIIuDAEXLo+BrSuzDCofNjOZMUdEXXhGCPfPdwXmIM
 37jKlSSnbIBau2wfEulQZKXplIOE55NP4SIVgQq880xu1SZ+xHgV5k0gtQTDy2ROdS3k
 fxJhuMGL70zPD6ZpgykVF/jCyGYSvouCXIVfG1z3y7IYoKolyYLy0QiONaY1eei8OWfn
 lYi4VifQXeIxm7ReJowQrMCQxSMP/wRHRvhkK0vgcKzPV+dviygGVJwEXKIjZ1/bdVfE
 6a9Q==
X-Gm-Message-State: APuU4Z/ANpujWljshJL9eCQFpkUt5VL2drvuPKqf4rKpIxQyyFkFvhx5
 KDlBPiomUav2jSJ5oGubWeaMyvaNdPlr9V0JSF7xO5MSMisAFlpwLAkIu9eMjbPwFzm3egPzRF5
 BWMZR
X-Gm-Gg: AYBFou0EoFQAm8VckhOG8KpbguPyJISZt31nqbfmYz8s0OuExr8WYO564pDLEDL95VG
 niL114gZ28B5I7zSDnL0ReKarBf2ZfUcLpkUNNNBOvgc0ps9F2x9FGnPo1aWuXPjb9FYdqNGshQ
 X55ImaCZqTt9/bVnPstQAZMSxa25edkfrd3ztPEc3hLCCkqICeQ+9xUMPPygiKZ1QxRRCIdfR3Z
 A2kh6B4fe65JSRe6Daxvuqti/nYdsaaK1Y6QX5Bh9R2X1QeeCMi7ujyFmHuJwWjRzTQIwSRmeYJ
 TDkEv4JmS9QEXH5wUUTc8ORgu/jy1xgUtCZSPm2N/ewegXBaGQYSonRKAAEK+1WiiCyEfVsvTNO
 /r+vvaPkua0QcFOJswHoM3vP9mLgNkbvzAlakTtTU36nLCs03GwidA1EqNavg0/ZoNKUdUx0Ptz
 yRydKPD9Di6fsYRkbVqBMQ3rKx6cF7OkJGBzfjuU+1GT12WfBFfQJiVeS9txbFgO+T+gzWf1OFn
 XAWdKJ/amVZrkkNSQGH8iaLVPhFDX0nW78VYKNsqU3j1I/vrZ5CPqkTNE3dzteKTbNmDBvSUaT0
 i8+XlObmil0WF6FkdJPXeQ==
X-Received: by 2002:a05:600c:1912:b0:4bb:6375:aa41 with SMTP id
 5b1f17b1804b1-4bb6375ab25mr165142925e9.27.1794851597288; 
 Mon, 16 Nov 2026 09:53:17 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783c255asm4407215e9.13.2026.11.16.09.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 09:53:17 -0800 (PST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 16 Nov 2026 18:53:16 +0100
Message-ID: <20261116175316.1131644-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/libblockdev: patch
 CVE-2026-111581
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes the following vulnerability:

- CVE-2026-111581:
    A flaw was found in libblockdev. The bd_fs_ntfs_set_label() and
    bd_fs_vfat_set_label() functions pass caller-supplied label values as
    bare positional arguments to the ntfslabel and fatlabel utilities
    without end-of-options separators or input validation for values
    beginning with a dash. This allows a label starting with '-' to be
    interpreted as a command-line flag by the spawned tool, potentially
    bypassing safety checks or causing unintended operations. This is
    reachable by unprivileged local users through the udisks2
    Filesystem.SetLabel() D-Bus method without administrator
    authentication.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-111581
 - https://github.com/storaged-project/libblockdev/commit/4ef6b2b4798a46566fe8815eaabd163205be20bd
 - https://github.com/storaged-project/libblockdev/commit/bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ect-NTFS-labels-starting-with-a-dash.patch | 49 ++++++++++++
 ...ls-from-being-interpreted-as-options.patch | 78 +++++++++++++++++++
 package/libblockdev/libblockdev.mk            |  4 +
 3 files changed, 131 insertions(+)
 create mode 100644 package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
 create mode 100644 package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch

diff --git a/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch b/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
new file mode 100644
index 0000000000..9a4613f421
--- /dev/null
+++ b/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
@@ -0,0 +1,49 @@
+From 4ef6b2b4798a46566fe8815eaabd163205be20bd Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Tue, 3 Nov 2026 15:39:58 +0100
+Subject: [PATCH] fs: Reject NTFS labels starting with a dash
+
+Fixes CVE-2026-111581.
+
+CVE: CVE-2026-111581
+Upstream: https://github.com/storaged-project/libblockdev/commit/4ef6b2b4798a46566fe8815eaabd163205be20bd
+[thomas: drop tests and backport context]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/plugins/fs/ntfs.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/plugins/fs/ntfs.c b/src/plugins/fs/ntfs.c
+index 424f606..78b56d0 100644
+--- a/src/plugins/fs/ntfs.c
++++ b/src/plugins/fs/ntfs.c
+@@ -221,6 +221,9 @@ gboolean bd_fs_ntfs_set_label (const gchar *device, const gchar *label, GError *
+     if (!check_deps (&avail_deps, DEPS_NTFSLABEL_MASK, deps, DEPS_LAST, &deps_check_lock, error))
+         return FALSE;
+ 
++    if (!bd_fs_ntfs_check_label (label, error))
++        return FALSE;
++
+     return bd_utils_exec_and_report_error (args, NULL, error);
+ }
+ 
+@@ -235,6 +238,19 @@ gboolean bd_fs_ntfs_set_label (const gchar *device, const gchar *label, GError *
+  * Tech category: always available
+  */
+ gboolean bd_fs_ntfs_check_label (const gchar *label, GError **error) {
++    if (!label) {
++        g_set_error_literal (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
++                             "Label cannot be NULL.");
++        return FALSE;
++    }
++
++    /* ntfslabel does not reliably support '--' to terminate option parsing. */
++    if (label[0] == '-') {
++        g_set_error_literal (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
++                             "Label for NTFS filesystem cannot start with '-'.");
++        return FALSE;
++    }
++
+     if (strlen (label) > 128) {
+         g_set_error (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
+                      "Label for NTFS filesystem must be at most 128 characters long.");
diff --git a/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch b/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
new file mode 100644
index 0000000000..9594d16ad3
--- /dev/null
+++ b/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
@@ -0,0 +1,78 @@
+From bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Tue, 3 Nov 2026 16:07:59 +0100
+Subject: [PATCH] fs: Prevent VFAT labels from being interpreted as options
+
+Fixes CVE-2026-111581.
+
+This also requires dosfstools >= 4.2 for setting label from now
+because the "--" option doesn't work with older versions. 4.2 was
+released in 2021 and is now available in all major distributions
+including Debian 11 (oldoldstable) and CentOS/RHEL 9 so it's not
+a problem.
+
+CVE: CVE-2026-111581
+Upstream: https://github.com/storaged-project/libblockdev/commit/bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c
+[thomas: drop tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/plugins/fs/vfat.c | 31 +++++++++---------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/src/plugins/fs/vfat.c b/src/plugins/fs/vfat.c
+index 744bc9f..7866964 100644
+--- a/src/plugins/fs/vfat.c
++++ b/src/plugins/fs/vfat.c
+@@ -46,7 +46,7 @@ static GMutex deps_check_lock;
+ 
+ static const UtilDep deps[DEPS_LAST] = {
+     {"mkfs.vfat", NULL, NULL, NULL},
+-    {"fatlabel", NULL, NULL, NULL},
++    {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"},
+     {"fsck.vfat", NULL, NULL, NULL},
+     {"vfat-resize", NULL, NULL, NULL},
+     {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"},
+@@ -281,33 +281,24 @@ gboolean bd_fs_vfat_repair (const gchar *device, const BDExtraArg **extra, GErro
+  * Tech category: %BD_FS_TECH_VFAT-%BD_FS_TECH_MODE_SET_LABEL
+  */
+ gboolean bd_fs_vfat_set_label (const gchar *device, const gchar *label, GError **error) {
+-    const gchar *args[4] = {"fatlabel", device, NULL, NULL};
+-    UtilDep dep = {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"};
+-    gchar *label_up = NULL;
+-    gboolean new_vfat = FALSE;
+-    gboolean ret;
++    const gchar *args[5] = {"fatlabel", "--", device, label, NULL};
++    g_autofree gchar *label_up = NULL;
+ 
+     if (!check_deps (&avail_deps, DEPS_FATLABEL_MASK, deps, DEPS_LAST, &deps_check_lock, error))
+         return FALSE;
+ 
+     if (!label || g_strcmp0 (label, "") == 0) {
+-        /* fatlabel >= 4.2 refuses to set empty label */
+-        new_vfat = bd_utils_check_util_version (dep.name, dep.version,
+-                                                dep.ver_arg, dep.ver_regexp,
+-                                                NULL);
+-        if (new_vfat)
+-            args[2] = "--reset";
+-    }
+-
+-    /* forcefully convert the label uppercase in case no reset was requested */
+-    if (label && args[2] == NULL) {
++        /* fatlabel >= 4.2 refuses to set an empty label, use --reset instead */
++        args[1] = "--reset";
++        args[2] = "--";
++        args[3] = device;
++    } else {
++        /* forcefully convert a non-empty label uppercase */
+         label_up = g_ascii_strup (label, -1);
+-        args[2] = label_up;
++        args[3] = label_up;
+     }
+-    ret = bd_utils_exec_and_report_error (args, NULL, error);
+-    g_free (label_up);
+ 
+-    return ret;
++    return bd_utils_exec_and_report_error (args, NULL, error);
+ }
+ 
+ /**
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index ecee8dee24..d1bd9a0f08 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -13,6 +13,10 @@ LIBBLOCKDEV_DEPENDENCIES = host-pkgconf libglib2 kmod udev
 # 0001-Provide-replacement-function-for-strerror_l.patch
 LIBBLOCKDEV_AUTORECONF = YES
 
+# 0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
+# 0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
+LIBBLOCKDEV_IGNORE_CVES += CVE-2026-111581
+
 LIBBLOCKDEV_CONF_OPTS = \
 	--disable-introspection \
 	--with-loop \
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
