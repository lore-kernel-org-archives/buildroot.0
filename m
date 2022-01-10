Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF050C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDA7409A9;
	Mon, 10 Jan 2022 22:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vNfZSpWjjfl; Mon, 10 Jan 2022 22:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A9C40208;
	Mon, 10 Jan 2022 22:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 287A81BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1731D40208
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lXSrg91MVTj for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:54:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6ED7401F8
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:54:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o3so29573171wrh.10
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzFClCs/6lRVMILobWD50WkFv7OAvyUBBl6U/jSv5DQ=;
 b=InpF9R//OGxy/rcp2FUj7ktn+UTBh88mJA+wUzI/ob2tXI3Ibyth51rH2QwkuiBF5E
 FGb3eD0E7JpRB2yMPsm3edyWKWsUSVRSNl0oQFk9uMg/7JQMhjYb5KMZ6w2zbqSxnYdx
 9YpP5ywWRx2H2SHG3Lb6vmzD3ipDpUFYrBYdIvgBl0szCDaEjNYgvDVSmddKByh1LzuT
 0htKwv+sUG9TDeO9fNdckBiv7cRMXbPOpZRJ6dctCF18z0tQlpMwMeKSY0qv6UWYLF9P
 //6ky6SdT2P0q6TffYns3+fYwHFMHcvb6+Ph48+TDS4aIJ3X1Hn8gJBn970uOUNEHhpJ
 1YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzFClCs/6lRVMILobWD50WkFv7OAvyUBBl6U/jSv5DQ=;
 b=K7XsF7J0mT90xzRgGIDICwGQBtdgGCgEzlm6l1R3ji+s4itl/oN3cH90JX9FYH5siL
 mS8PcswXtJo/njilRm8XkRUzJEtIDFSCjB05NohQLatVpJvbqiOFGXOkM28Qd41H2PRI
 LZTVoanM5LUPAafZSlKCWlSDRJsB2nCBPhTv4rwUWazx3r8kBibBn9q3BDOlM8boMZl4
 XjdgBFFOi2QFI6sh1i+PaFlHKDlHN2LreyilQd6l82+fIw9VFrg9lyeJEmC0GhfDpi06
 MHUCXx4OlNmBKgRkxaTdawkKgchXdT7hLgvoyh59b8TLR5+Q3UU50CZksejMX5kZjQSY
 2F5w==
X-Gm-Message-State: AOAM531UyIC5YtYDk+WgC+a/DxmN5X5N6kNfw0NjoE7EZZwSBXSmaL1t
 etOAhjJQALkJhU2jokYUj3UbEhOQG0w=
X-Google-Smtp-Source: ABdhPJx0HkFvzAY08zYgsvwiOFXjaf2FeidXFAsZdVMbGPz+aj1Vs/miK6ggUPok0XrO+xCyThYRPg==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr1401903wrs.620.1641855272756; 
 Mon, 10 Jan 2022 14:54:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m6sm8803662wrp.34.2022.01.10.14.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 14:54:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 23:52:00 +0100
Message-Id: <20220110225200.2000095-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 5.15.1
in commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:

In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
                 from ./kerncompat.h:31,
                 from common/utils.c:42:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
    7 | struct sysinfo {
      |        ^~~~~~~
In file included from common/utils.c:27:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
   10 | struct sysinfo {
      |        ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nst-h-to-fix-build-with-5-12-headers.patch | 43 ++++++++++++++++
 ...-sys-sysinfo-h-conditionally-on-musl.patch | 49 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
 create mode 100644 package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch

diff --git a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
new file mode 100644
index 0000000000..b6c1a42456
--- /dev/null
+++ b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
@@ -0,0 +1,43 @@
+From b28f7bd9bba6f65258da48955154794f466b4104 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 30 Dec 2021 15:23:59 +0200
+Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
+ headers
+
+btrfs-tools compile fails with mips, musl and 5.12+ headers.
+
+The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
+add an explicit include of const.h to pickup the macro:
+
+  | make: *** [Makefile:595: mkfs.btrfs] Error 1
+  | make: *** Waiting for unfinished jobs....
+  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
+  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
+  | collect2: error: ld returned 1 exit status
+
+This is safe for older kernel's as well, since the header still
+exists, and is valid to include.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+[remove invalid OE Upstream-status]
+Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/b28f7bd9bba6f65258da48955154794f466b4104]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kerncompat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index df167fe6c..2503d1afa 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -29,6 +29,7 @@
+ #include <stddef.h>
+ #include <linux/types.h>
+ #include <linux/kernel.h>
++#include <linux/const.h>
+ #include <stdint.h>
+ 
+ #include <features.h>
diff --git a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
new file mode 100644
index 0000000000..7473fe67cb
--- /dev/null
+++ b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
@@ -0,0 +1,49 @@
+From a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 Jan 2022 22:44:44 +0100
+Subject: [PATCH] btrfs-progs: include sys/sysinfo.h conditionally on musl
+
+Make inclusion of sys/sysinfo.h conditional to avoid the following build
+failure on musl:
+
+In file included from .../i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
+                 from ./kerncompat.h:31,
+                 from common/utils.c:42:
+.../i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
+    7 | struct sysinfo {
+      |        ^~~~~~~
+In file included from common/utils.c:27:
+.../i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+   10 | struct sysinfo {
+      |        ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
+
+The 'struct sysinfo' is defined in linux/sysinfo.h and sys/sysinfo.h,
+while both must not be included at the same time. Stop including
+linux/kernel.h that sometimes unconditionally includes sys/sysinfo.h and
+causes the double definition for some reason. As we now include
+linux/const.h directly, there's no other effective change.
+
+Pull-request: #433
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5]
+---
+ kerncompat.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 2503d1afa..6ca1526e2 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -28,7 +28,6 @@
+ #include <assert.h>
+ #include <stddef.h>
+ #include <linux/types.h>
+-#include <linux/kernel.h>
+ #include <linux/const.h>
+ #include <stdint.h>
+ 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
