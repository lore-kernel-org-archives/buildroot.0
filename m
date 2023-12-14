Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBBC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FDF860BB6;
	Thu, 14 Dec 2023 10:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDF860BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LEVD0VJ28kg; Thu, 14 Dec 2023 10:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7753B61B11;
	Thu, 14 Dec 2023 10:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7753B61B11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1401BF36B
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448C383C77
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448C383C77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLpCct3kMuyU for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 10:08:39 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5F7282EA1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 10:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F7282EA1
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35da85e543eso29541005ab.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 02:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702548517; x=1703153317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zqdn+Nq4kDT1ejFIRBKLujz3RE/nH03DHYRKQWdqsh0=;
 b=bhGWNwwYYNmzY6lIgHQAw7ZfGMmoXtczEFxZVM5DZY8G+XSLYPYeuDxqizx0hLIj0z
 VOdi6iowBOT9XYXvYWmBw/RmbhEBVXo8vJu4VdgBx7e9DkDlOOVwhqK8luaxNaBx10xh
 nnRPGD4nq3Fwg15jR4/9NM0bLt6iG3/S+Vok1DcXqCycUPnxgJmI6q/guctnVxgzgbc9
 VC6+wNdxP5W+2PNeoa5q7KBQaG+s6ZmbODn7Tf/55WNAixf9DaY92xPSxsU5+Z2Yxhhi
 37juyEP9gQmnS+OHoIB8QS9CxxYc9UIVXVQHSE+aH9Zg/eGT2w/pPdbildwnhOtDi5wo
 r/DQ==
X-Gm-Message-State: AOJu0YyAjEhIr7QRcPtyJz2zYDdCITg86oV/omdWuPWgn1naI3MtBHRs
 sHNUfFqqmJkx+7H4fYOfDUN29S/8UQb61w==
X-Google-Smtp-Source: AGHT+IGqXbK6upzn+xOkZxFKI+o5W/T6dd5IJpoOG/kTphZ6NCiE5BMV0PVMgfUcj/Ietk9LmhLVvg==
X-Received: by 2002:a05:6e02:174a:b0:35d:7054:3dd6 with SMTP id
 y10-20020a056e02174a00b0035d70543dd6mr13650219ill.6.1702548517232; 
 Thu, 14 Dec 2023 02:08:37 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 bz4-20020a056e02268400b0035d2245ba9dsm4226046ilb.12.2023.12.14.02.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:08:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 03:08:33 -0700
Message-Id: <20231214100833.123688-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702548517; x=1703153317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zqdn+Nq4kDT1ejFIRBKLujz3RE/nH03DHYRKQWdqsh0=;
 b=H64Pf2G3BHGHaKvXh1+4eEs2YkZFuyR0165cs2aoxcnjdiMyS02O69xweYlkjaCYLM
 bxiJCVX58c0LCfchxIbNFlaFLi9WArMO7ah0d9u3xlo7BDtINIkkVD/zzPZirZjDEHa6
 wWAB4iVAiFjjI7GObS9wsBDWZC4UNKA6BV3QBin2Qv/9j1+xhaayUTVdFLFO6nIFIuP5
 NPPSet8v2uDplwu8HAb3jeQbwDVXOAfIVWCTo72QA+tgKbmgMIMjpognFiMtwI9m0dMY
 cOihztyvQLguwlos4wuXsFECCiRQQHV/sneOkwAbT7hFthz+KjRw3Pie/8D5ojJ5aEEq
 Hv5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H64Pf2G3
Subject: [Buildroot] [PATCH 1/1] package/python-decouple: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-decouple/Config.in            |  6 ++++++
 package/python-decouple/python-decouple.hash |  5 +++++
 package/python-decouple/python-decouple.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-decouple/Config.in
 create mode 100644 package/python-decouple/python-decouple.hash
 create mode 100644 package/python-decouple/python-decouple.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..2c574e6b29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,6 +1049,7 @@ menu "External python modules"
 	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
+	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-decouple/Config.in b/package/python-decouple/Config.in
new file mode 100644
index 0000000000..528f43d0cb
--- /dev/null
+++ b/package/python-decouple/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DECOUPLE
+	bool "python-decouple"
+	help
+	  Strict separation of settings from code.
+
+	  http://github.com/henriquebastos/python-decouple/
diff --git a/package/python-decouple/python-decouple.hash b/package/python-decouple/python-decouple.hash
new file mode 100644
index 0000000000..cf1290c90e
--- /dev/null
+++ b/package/python-decouple/python-decouple.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-decouple/json
+md5  21b174a381d6bff5f4814018a4fd44cd  python-decouple-3.8.tar.gz
+sha256  ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe57289bfb7cce680f  python-decouple-3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  4d6e3c2ef229ec3c1a486f52c9d76235e9eb7c94db8ec71a8bff0af60e4f0aa4  LICENSE
diff --git a/package/python-decouple/python-decouple.mk b/package/python-decouple/python-decouple.mk
new file mode 100644
index 0000000000..c0d0cdb909
--- /dev/null
+++ b/package/python-decouple/python-decouple.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-decouple
+#
+################################################################################
+
+PYTHON_DECOUPLE_VERSION = 3.8
+PYTHON_DECOUPLE_SITE = https://files.pythonhosted.org/packages/e1/97/373dcd5844ec0ea5893e13c39a2c67e7537987ad8de3842fe078db4582fa
+PYTHON_DECOUPLE_SETUP_TYPE = setuptools
+PYTHON_DECOUPLE_LICENSE = MIT
+PYTHON_DECOUPLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
