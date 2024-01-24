Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B80FC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E3D43644;
	Wed, 24 Jan 2024 11:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E3D43644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TF5sXH3F2np6; Wed, 24 Jan 2024 11:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B07543632;
	Wed, 24 Jan 2024 11:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B07543632
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3FCF1BF83B
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 11:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 8B9F143632
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 11:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B9F143632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id K_3WybMO-wOT for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 11:23:59 +0000 (UTC)
X-Greylist: delayed 367 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 24 Jan 2024 11:23:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6ACF408E6
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com
 [203.205.221.191])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id B6ACF408E6
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 11:23:57 +0000 (UTC)
Received: from yc-home.taila82bd.ts.net
 ([2409:8a62:e7c:1480:fbfd:a22c:3b87:73af])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id 2D70E03D; Wed, 24 Jan 2024 19:11:23 +0800
X-QQ-mid: xmsmtpt1706094683tgaxbrx5f
Message-ID: <tencent_8FFB06F67FA524B2D90D051931B1F0082405@qq.com>
X-QQ-XMAILINFO: Mm/8i8/T4yne/g3CDzGkSYq/rlTX2MEGF/7KLyXQN2RvDYCgVK/vowKEjRaAvg
 RnRf2qC6+BOA0PtmmNw9VFabDkv52dP98jld1qLXuZkDZehj7q96Bgo4cev4/x9Ut4zdKnyD2O7f
 z+IxVVeOmGVcpKonKyg7BpqB+5q0LR++AcQzvuyJALS4REiugkgFmuZSlbne2UpVhG1AOnvItz0+
 MRgheBa6yhqzgNdibiGiETBy3lM5CIzFGfoKMDCc201ZAWDmYbR1xRUZH6EP1MA8mr5FIg4vjlZW
 C3qh0X5GeRdnVPDEUt5flOSoZN/GhG0RItkyFy6g+r8kDdw+YyrYQS7eRYcUdYLXm6dB2ry6Fvie
 ssFneuFMikK01KWEyqHH1ce5y4qlnNrwPRyTF5I5AlelkAeNG3lxDW+uxtlHq7LH5CUUfv+kyZWz
 JLHpy7/Q/lJBKPe19wH4BYZi5z1ittCBwF+AeMm55THTw5Wjcrl9OagHeM31ARCaGDYgXzOG0wn/
 HCjoErlqIXAkOpjBF8yBYAHT2PDZ00Q2dzXYVuGGLbIN5xHenk92dA7CyxfF4C7TLhd+fQ2Z6LHK
 pzwvhY/Y5BBH0uqPjAA0y2zzijRYbEWuiwsP983ZDgThrKLWvdbXSCqLZvoC2KiHt61DhWgFJmE6
 Sqc83kQK9J/11QhqUla7dA4LJoBy5EftN4PqC1RTIWdGxhdyfsFGBxqA3gTTQaH5RUeaP5dyGN3s
 ipnmSPz5Ifw8eiEZsaoRWlPPkJDVIoXM2gzx0QwSlbX3okDnRvVGjArJUDAI1caikp/zBopyG1QA
 TEq4L7yDxD3rwUil6Lv5qN+B4IrmojztJqEMXcjqV7gwD2EphV/Mpf0pm7lwczzxPvgVRBG5v1tb
 hp3cM9+amXJon+6eBPSA1Lk58cu9Q5GsEi27SfH7lvs8ZdMgZ+U+i1/+H9xMiDwY9mPPffTqgqbN
 Rcx8CVCGpNG1E9RB4tKJXi5A+oCfX1HnutmOhe724I5MHfvGO1Wi7bvpcrIkOX1vQOG6l5ebEm0I
 0AuWQKgoVHQDk+q61jkOkxGRCUcQB/2K+/SmV5GBXtouTCBWMbxfdleBN/+x4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: yangcheng.work@foxmail.com
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 19:10:45 +0800
X-OQ-MSGID: <20240124111044.1534130-1-yangcheng.work@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1706095433;
 bh=/W9MPUyzF4KrPTCHu83Gph0WNUTFY/TTOPHC1rYgTkU=;
 h=From:To:Cc:Subject:Date;
 b=hGAJsCFQ2dqHWiIQtn3xF+rBcCNmLNwP/Whq1khSM2Ot0ckxq5QlMVkJSJlKFBrdh
 YiBRVSyqHA34/QEnsJDyJW2iCHGtfvSwjIUCbBoGUX5Ekz25x/LmI7nVXBytc4DVet
 cPL5uRkNl6KGWJ1KC+vUdWst2xgxsAs+IJBtmMS4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.a=rsa-sha256 header.s=s201512 header.b=hGAJsCFQ
Subject: [Buildroot] [PATCH 1/1] boot/edk2: add support for custom
 configuration.
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
Cc: Cheng Yang <yangcheng.work@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Cheng Yang <yangcheng.work@foxmail.com>

EDK2 currently only supports github, but sometimes
we may need to customize the source of EDK2 to support
applications in some specific scenarios, such as github
access is limited or some repositories that have not
yet been merged into the mainline.

Therefore, this commit adds the possibility to specify custom
EDK2 version, custom version from upstream, custom tarball or
Customizations from Git. Just like OpenSBI, Uboot or Linux.

Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
---
 boot/edk2/Config.in | 50 +++++++++++++++++++++++++++++++++++++++++++++
 boot/edk2/edk2.mk   | 15 +++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 4e6e7d122c..c9f592a9a5 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -17,6 +17,56 @@ config BR2_TARGET_EDK2
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2
+choice 
+	prompt "EDK2 Version"
+	help
+	  Select the specific EDK2 version you want to use
+
+config BR2_TARGET_EDK2_LATEST_VERSION
+	bool "edk2-stable202308"
+
+config BR2_TARGET_EDK2_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official versions
+
+config BR2_TARGET_EDK2_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_EDK2_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+config BR2_TARGET_EDK2_CUSTOM_VERSION_VALUE
+	string "EDK2 version"
+	depends on BR2_TARGET_EDK2_CUSTOM_VERSION
+
+config BR2_TARGET_EDK2_CUSTOM_TARBALL_LOCATION
+	string "URL of custom EDK2 tarball"
+	depends on BR2_TARGET_EDK2_CUSTOM_TARBALL
+
+if BR2_TARGET_EDK2_CUSTOM_GIT
+
+config BR2_TARGET_EDK2_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_EDK2_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git. E.G. a
+	  sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_EDK2_VERSION
+	string
+	default "edk2-stable202308" if BR2_TARGET_EDK2_LATEST_VERSION
+	default BR2_TARGET_EDK2_CUSTOM_VERSION_VALUE \
+		if BR2_TARGET_EDK2_CUSTOM_VERSION
+	default "custom" if BR2_TARGET_EDK2_CUSTOM_TARBALL
+	default BR2_TARGET_EDK2_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_EDK2_CUSTOM_GIT
 
 choice
 	prompt "Platform"
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 87ac80c88f..0f8aed703e 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,9 +4,22 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202308
+EDK2_VERSION = $(call qstrip,$(BR2_TARGET_EDK2_VERSION))
+
+ifeq ($(BR2_TARGET_EDK2_CUSTOM_TARBALL),y)
+# Handle custom EDK2 tarballs as specified by the configuration
+EDK2_TARBALL = $(call qstrip,$(BR2_TARGET_EDK2_CUSTOM_TARBALL_LOCATION))
+EDK2_SITE = $(patsubst %/,%,$(dir $(EDK2_TARBALL)))
+EDK2_SOURCE = $(notdir $(EDK2_TARBALL))
+else ifeq ($(BR2_TARGET_EDK2_CUSTOM_GIT),y)
+EDK2_SITE = $(call qstrip,$(BR2_TARGET_EDK2_CUSTOM_REPO_URL))
+EDK2_SITE_METHOD = git
+else
+# Handle official EDK2 versions
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
+endif
+
 EDK2_LICENSE = BSD-2-Clause-Patent
 EDK2_LICENSE_FILES = License.txt
 EDK2_CPE_ID_VENDOR = tianocore
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
