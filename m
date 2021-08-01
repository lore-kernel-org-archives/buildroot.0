Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5B5C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 04:56:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9BA61058
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 04:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9BA61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paral.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85CDC402E3;
	Sun,  1 Aug 2021 04:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nF1BN-IyCfoQ; Sun,  1 Aug 2021 04:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61252402E8;
	Sun,  1 Aug 2021 04:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0BF41BF3CD
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 04:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D048606B6
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 04:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XasWHwNQRtER for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 04:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD2D860627
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 04:56:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id j3so796261plx.4
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRF7ifsrE2hy6rNMI7UTqTIernmLuCWBtKveMrsB8Ds=;
 b=I0/fhELJOcztbvqiMBREXYahJQ2+Wxlk5t0M6XSQiVqKHDA+t7wpN0DYjfnyih16ll
 sLd20KSxZ26R/bfwuwzXlqJd4tpOSx2WoV2JBJWCo8wR+GFR3gqbpBwMgnEX7DrLHjyN
 DCKoNCHEB9t/XUa2gikncj5qjorwXlF+6sk3Kwvrtthxx0Xxg/144mRYRGH5cvyk5fxC
 jx2mAN4sE/UEIL1vfW9p4BA+DeN02xalioGNOhfN7BLMI4gIJnoQ4tW8Bm8iYaWtyFTr
 0XxkiP5OI/LHHyVyldTu5hdj+BQ7Oq7XqJhu0oWAyuaVbSKEP0NnWqZYlt/KHlWAIgi1
 2abg==
X-Gm-Message-State: AOAM5304TJO2t34ys4/GtsMFZUKpqeZHChHt4TW393bsNSUpe4ZSxjci
 JkpePjUhs1Ry3LCU9oJt1qaCMlM3drx8NQ==
X-Google-Smtp-Source: ABdhPJzS5VnJdCgaITixhffWZ+2vHRwbS3ZtyqKJEKUJUQLAvA/fzqGe1nZxZCJwx6XJQ59kRdg3fQ==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr11399160pjn.90.1627793799582; 
 Sat, 31 Jul 2021 21:56:39 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-212.sb.sd.cox.net.
 [68.6.75.212])
 by smtp.gmail.com with ESMTPSA id a9sm6757949pjs.32.2021.07.31.21.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 21:56:39 -0700 (PDT)
From: Christian Stewart <christian@paral.in>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 21:56:36 -0700
Message-Id: <20210801045636.2174812-1-christian@paral.in>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/embiggen-disk: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

embiggen-disk is a tool to automatically resize disks to fill available space.

Patch submitted upstream: https://github.com/bradfitz/embiggen-disk/pull/13

Adds support for /dev/mmcblk0pN type paths.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 ...-Fix-resizing-of-dev-mmcblk0pN-paths.patch | 45 +++++++++++++++++++
 package/embiggen-disk/Config.in               | 18 ++++++++
 package/embiggen-disk/embiggen-disk.hash      |  3 ++
 package/embiggen-disk/embiggen-disk.mk        | 12 +++++
 5 files changed, 79 insertions(+)
 create mode 100644 package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
 create mode 100644 package/embiggen-disk/Config.in
 create mode 100644 package/embiggen-disk/embiggen-disk.hash
 create mode 100644 package/embiggen-disk/embiggen-disk.mk

diff --git a/package/Config.in b/package/Config.in
index 5941e35c05..9fa8fb72fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2462,6 +2462,7 @@ menu "System tools"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
+	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
diff --git a/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
new file mode 100644
index 0000000000..31cfea9dde
--- /dev/null
+++ b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
@@ -0,0 +1,45 @@
+From b628e4c561cb4d3ffc92a5d7aac8f4967e44977e Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 27 May 2021 20:07:07 -0700
+Subject: [PATCH] Fix resizing of /dev/mmcblk0pN paths
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ fs.go   | 4 +++-
+ part.go | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/fs.go b/fs.go
+index 0b83e24..8ab3690 100644
+--- a/fs.go
++++ b/fs.go
+@@ -67,7 +67,9 @@ func (e fsResizer) DepResizer() (Resizer, error) {
+ 	if dev == "/dev/root" {
+ 		return nil, errors.New("unexpected device /dev/root from statFS")
+ 	}
+-	if (strings.HasPrefix(dev, "/dev/sd") || strings.HasPrefix(dev, "/dev/nvme")) &&
++	if (strings.HasPrefix(dev, "/dev/sd") ||
++		strings.HasPrefix(dev, "/dev/mmcblk") ||
++		strings.HasPrefix(dev, "/dev/nvme")) &&
+ 		devEndsInNumber(dev) {
+ 		vlogf("fsResizer.DepResizer: returning partitionResizer(%q)", dev)
+ 		return partitionResizer(dev), nil
+diff --git a/part.go b/part.go
+index 0315a6e..f3e280f 100644
+--- a/part.go
++++ b/part.go
+@@ -51,6 +51,11 @@ func diskDev(partDev string) string {
+ 	if strings.HasPrefix(partDev, "/dev/sd") {
+ 		return strings.TrimRight(partDev, "0123456789")
+ 	}
++	if strings.HasPrefix(partDev, "/dev/mmcblk") {
++		v := strings.TrimRight(partDev, "0123456789")
++		v = strings.TrimSuffix(v, "p")
++		return v
++	}
+ 	if strings.HasPrefix(partDev, "/dev/nvme") {
+ 		chopP := regexp.MustCompile(`p\d+$`)
+ 		if !chopP.MatchString(partDev) {
+-- 
+2.31.1
+
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
new file mode 100644
index 0000000000..d409d36af6
--- /dev/null
+++ b/package/embiggen-disk/Config.in
@@ -0,0 +1,18 @@
+# TODO requires sfdisk
+config BR2_PACKAGE_EMBIGGEN_DISK
+	bool "embiggen-disk"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_UTIL_LINUX # sfdisk
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
+	help
+	  embiggen-disk is a tool to resize disk partitions at runtime.
+
+	  https://github.com/bradfitz/embiggen-disk
+
+comment "embiggen-disk needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
new file mode 100644
index 0000000000..6e65dabec2
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cf67e8dea3db7d0743a4a530695e1341ac9c1c9cf773bd157bdb94f069615485  embiggen-disk-c554fc1c93a4004ce0b6a3f69b0dabe0481a2308.tar.gz
+sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
new file mode 100644
index 0000000000..5d5ac15ae8
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# embiggen-disk
+#
+################################################################################
+
+EMBIGGEN_DISK_VERSION = c554fc1c93a4004ce0b6a3f69b0dabe0481a2308
+EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_LICENSE = Apache-2.0
+EMBIGGEN_DISK_LICENSE_FILES = LICENSE
+
+$(eval $(golang-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
