Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650B0D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24198607A9;
	Mon, 28 Oct 2024 01:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzKbgddlT0eM; Mon, 28 Oct 2024 01:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C94607B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C94607B4;
	Mon, 28 Oct 2024 01:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA3F4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E57E404BE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtGxnpPomlDN for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67A92404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A92404B6
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67A92404B6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:41 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83b1d545c04so73340339f.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730079340; x=1730684140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CF9PS3gXg7ks6pqAsAtm1XHRHIeKjJBg9dDZApugZy8=;
 b=eQmd370GZouDfllfyUt4I9rEz18ROQ0tbbYf2K4tPlwFmgWllCU7fK3yODb03C8a4Z
 NnbQaIbw2A1Wh+lUCZE3j2jyrAXiV4g+CfhSb/4WeyWILQmp+ARF2rIcxmCPGx7GoUCS
 MY31xrDcQC7LVPiTWVD4mdY3C7TkXwnXbPDpn9xmbtjAwgtOBnrei3RYwjjtqlLejccF
 RW4dxnbvakv5sIgjsu1+YxRmUzOxyMNccahI6uOmZPngC+Ytb09YH5miTju8gj5jddSC
 S68yfrOy0GpcUE2iCh50fR6Whijd0pSaiPZ2czXvWWsAxAIis4AWi+6rUISVmaMu/gJ1
 6ktA==
X-Gm-Message-State: AOJu0YxGK/SLoTKoBxBMxYiYT9nGU+XQ4tjnxd1ZyodDCg8WFP0AMZ7D
 pJQyBiCKocgon2M5BnuTk8CyuEHsZMlIj3syr1zNlhtFBAPMcQjClfImPA==
X-Google-Smtp-Source: AGHT+IF25fIP/K8s0XBPaDz5Or3u0vtDGlihKTNJHCnBFkYwHJ4rCJfmvpSTH4FFxPcrS3be1HyaZQ==
X-Received: by 2002:a05:6e02:17cc:b0:39f:53b3:ca63 with SMTP id
 e9e14a558f8ab-3a4ed28237emr45845985ab.3.1730079340128; 
 Sun, 27 Oct 2024 18:35:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb58esm1409721173.27.2024.10.27.18.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:35:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:35:36 -0600
Message-Id: <20241028013537.4137391-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730079340; x=1730684140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CF9PS3gXg7ks6pqAsAtm1XHRHIeKjJBg9dDZApugZy8=;
 b=XgBzB2mMSjgWt3R3D3AI+MBeonmjBXs2k1G+g0oJcJkdqqbgSsu/Ax/kyZePDn4N6M
 ciNZ+Nkhw39jxemV24EicpObyzWCBJOpWfvqlUdclSEF0VMsPcvp3MwRVqc437NoQecV
 HG/Sz875+LaSWyj2phfXlhVvOZzzSA6LA4/EcQo5jZmFPCilHI93I6o3tAH6GR4APGbb
 zc2IvYrx0FRuMaq9Frh+Z7CdrmYljdc8Tp2/i76lhW0+mRuynhzXluzsfFIy/31FVwoE
 Us2jOv580ETABqJHTD/iDj+oZJISew/wDjhigEuV5JlKxB1C5QIcLpHIOND1Vd1M9ImE
 t3pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XgBzB2mM
Subject: [Buildroot] [PATCH 1/2] package/python-propcache: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-propcache/Config.in             |  6 ++++++
 package/python-propcache/python-propcache.hash |  5 +++++
 package/python-propcache/python-propcache.mk   | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-propcache/Config.in
 create mode 100644 package/python-propcache/python-propcache.hash
 create mode 100644 package/python-propcache/python-propcache.mk

diff --git a/package/Config.in b/package/Config.in
index 0e311ad55c..62b9f47886 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1268,6 +1268,7 @@ menu "External python modules"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
+	source "package/python-propcache/Config.in"
 	source "package/python-proto-plus/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-propcache/Config.in b/package/python-propcache/Config.in
new file mode 100644
index 0000000000..a387d6520c
--- /dev/null
+++ b/package/python-propcache/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PROPCACHE
+	bool "python-propcache"
+	help
+	  Accelerated property cache.
+
+	  https://github.com/aio-libs/propcache
diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
new file mode 100644
index 0000000000..56a491433f
--- /dev/null
+++ b/package/python-propcache/python-propcache.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/propcache/json
+md5  70b121a9845a0da06eccfbc42ff74335  propcache-0.2.0.tar.gz
+sha256  df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70  propcache-0.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
new file mode 100644
index 0000000000..37ceec731d
--- /dev/null
+++ b/package/python-propcache/python-propcache.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-propcache
+#
+################################################################################
+
+PYTHON_PROPCACHE_VERSION = 0.2.0
+PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a9/4d/5e5a60b78dbc1d464f8a7bbaeb30957257afdc8512cbb9dfd5659304f5cd
+PYTHON_PROPCACHE_SETUP_TYPE = setuptools
+PYTHON_PROPCACHE_LICENSE = Apache-2.0
+PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
+PYTHON_PROPCACHE_DEPENDENCIES = \
+	host-python-cython \
+	host-python-expandvars
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
