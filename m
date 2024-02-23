Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3881FC5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 18:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF9740903;
	Fri, 23 Feb 2024 18:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnnLqkkL5QQd; Fri, 23 Feb 2024 18:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C801A40907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C801A40907;
	Fri, 23 Feb 2024 18:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EE201BF409
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 18:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C20640907
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id keN1iruSVhg1 for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 18:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55D4C40903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D4C40903
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55D4C40903
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 18:05:38 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c403dbf3adso47091939f.1
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 10:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708711537; x=1709316337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FhgcO4i03h9MVzOi9FKshtKNa1Ad9N2KOS+xZ86cwhA=;
 b=m5o2TwurOF7WavH3I6X5ZkiUZG83DT8w+BeKWnWhuYbYXCm8kyk7xdoIalzZqyDH+6
 YqhY8K5mtYrSUn4XW/jVgV7oiKjDIAtc+K05cm7+TbmZSEOulzi/9U7UrUxTF7BgOAlm
 oZfzL8jKAM4w8OLdFKLJ5HLDHXxH3dkDsP4r8C4ofD0MtYlS706IcDFEspJ/M2v33rSq
 BbXyU/UST3YZYvqPaqLbxITv9DnZfPZ3Hl2wStgZYIiG77zDFp4HDJ3Rc3iLG86WL9DE
 fJNyN1p01B+2oCQPMocRVa+wKsB6RTdRB1UfHB1f/DO7oizTSDHL/J2CWMKRMOZYoTX9
 pWlQ==
X-Gm-Message-State: AOJu0YwLkLQvpAwfkyN7oVPo+9WggTPMdq+2BGP3pxHcMNX16pm/yqUI
 cbgv61bxkMcf4czMaTvwvBjxwFWQBoBrAyvs/6r/YgscZzexLNRdURGSin1G9eY=
X-Google-Smtp-Source: AGHT+IFop54L2N+Syrwq02hLrRBy1e5c/hLIbSdPSnpRfATtSewRIyIr5R3+9eN5uVGm9D+TmlHh7Q==
X-Received: by 2002:a05:6602:179c:b0:7c7:9239:4d85 with SMTP id
 y28-20020a056602179c00b007c792394d85mr679844iox.6.1708711537121; 
 Fri, 23 Feb 2024 10:05:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 gu2-20020a0566382e0200b00474341aa2bbsm2459935jab.141.2024.02.23.10.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 10:05:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 11:05:32 -0700
Message-Id: <20240223180533.3011424-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708711537; x=1709316337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FhgcO4i03h9MVzOi9FKshtKNa1Ad9N2KOS+xZ86cwhA=;
 b=hWe4GvRSV/f3K4LnsGOq6JEKyzzl8v5xkXfnBAClvCKSHxMx/sLvwD1SB5b3foaFdP
 ej5FI38geBBH1Z8FRPakMp8vNdCNn2wqHYocLOAaYEnDljT8d9qBDF6/SRt10UxjSUkD
 iUdzURBE4pmVBzyNU8L/aFiY8wAeGoYe6CZbF/Uq7yVnyXyNw4BKyJRJMJLRlNkjyFLB
 HlM3Tjf2cVUkCKu2F5BmjXhKFSyQyadnaUc3Tpr3vaUT6vGNTDnOF+v6T/KND3zViei9
 s8xAH80+a4vNm4aaLyMo/3fMKlyj/0uMG7WzWSYGUWK30ZPMmq4Af+fkPqOS2EsGivev
 zbFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hWe4GvRS
Subject: [Buildroot] [PATCH v3 1/2] package/python-grpclib: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add missing h2/multidict runtime dependencies
---
 package/Config.in                          |  1 +
 package/python-grpclib/Config.in           |  8 ++++++++
 package/python-grpclib/python-grpclib.hash |  5 +++++
 package/python-grpclib/python-grpclib.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-grpclib/Config.in
 create mode 100644 package/python-grpclib/python-grpclib.hash
 create mode 100644 package/python-grpclib/python-grpclib.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..2ddaadae69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1114,6 +1114,7 @@ menu "External python modules"
 	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpclib/Config.in b/package/python-grpclib/Config.in
new file mode 100644
index 0000000000..42cc011097
--- /dev/null
+++ b/package/python-grpclib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCLIB
+	bool "python-grpclib"
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	help
+	  Pure-Python gRPC implementation for asyncio.
+
+	  https://github.com/vmagamedov/grpclib
diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
new file mode 100644
index 0000000000..cc65209138
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpclib/json
+md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
+sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
new file mode 100644
index 0000000000..0bec0a1879
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpclib
+#
+################################################################################
+
+PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SETUP_TYPE = setuptools
+PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
+PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
