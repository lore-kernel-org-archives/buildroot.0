Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C1BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD09D4034C;
	Sat, 27 Nov 2021 11:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la72kbp9o5nL; Sat, 27 Nov 2021 11:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C2940162;
	Sat, 27 Nov 2021 11:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 028451BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62A640415
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MyjWaVyA45K for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10AA84039E
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:42 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id m5so11646599ilh.11
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QOlD+MPwq2UaOBlGpRAzvZ8MT+43DZUCAMIzHLsjNIs=;
 b=lDDA/K6r7UZqyhyWJA0ImFSyFpBP8BMEqZA2UL47ZonADL/LqKJWi45r8KE0/lzmxE
 TwzaVDaeMExnS55rhylUDxeSnexDjGlMxYo8eK6UMfnpB0a1o0tD6gkKnCrUri5itDtg
 M8kH1kzPgCr4MDRARWL7tCyfGFPIFlrAqw7mUgj5FfNytFo6jzIwL5eHuW7L2bllWwR7
 gaEUNbazIuLaFaFYCFIN20ALiUOGjjKGne5KEJ4gJH76NnLdBxtJh4P3s6YXQNxJwACI
 KlmgHSR38d6cmC1pXlGI7MdTxg6r+bp1qreHqExrXRbHBDKX6KhC6uoXy5O5WSzjk9VJ
 wElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QOlD+MPwq2UaOBlGpRAzvZ8MT+43DZUCAMIzHLsjNIs=;
 b=M+Nl+uOgWrYwLdH9i+xVWg6RRt+h0dZgsRNSonaoeEbGM504wsaae+31Pe8ZNZknJx
 u/gAkmz1p1/jW94Ggu50smP/iu3Yp/ilE2Vf+1jPA8roc/XGtO4tRKgmFU9arO19gMtl
 gTWVdpBy8Ug+Jga+S6c9X23Y2dmzDdXuULZSK7tJslUnjwD8f//GaO8T7pWmgASX1NCu
 ebNnoWMQX7MMh2FU7nlwU5B2UrGkool5we6dwOnqtSx2jt630jKEcMMVTw2iNrVSsYWi
 DGnPXr8Ca3u4FZCvqeRtWEkBi4KOpYiJJFXhMaxylluKXIoUIQY625Q6SOT0bZfHTCQD
 tm2g==
X-Gm-Message-State: AOAM532yF1gzKU42i66OKvSUroNUfKPMI8xDL26P7fKjjI8Rt5yEFfZr
 J+hFqDrT820PUFHBxNduVOmbNInocLs=
X-Google-Smtp-Source: ABdhPJxwNjbqKAAkR1+c0uwqBHpReCjnH7PBYoq2nnWio8thMDyxHX/YzIRIjEtORPtVJQbeCJH0PA==
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr40785431ilv.114.1638013061964; 
 Sat, 27 Nov 2021 03:37:41 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:29 -0700
Message-Id: <20211127113735.2178776-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/7] package/python-tinycss2: new package
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
 package/python-tinycss2/Config.in            |  6 ++++++
 package/python-tinycss2/python-tinycss2.hash |  5 +++++
 package/python-tinycss2/python-tinycss2.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-tinycss2/Config.in
 create mode 100644 package/python-tinycss2/python-tinycss2.hash
 create mode 100644 package/python-tinycss2/python-tinycss2.mk

diff --git a/package/Config.in b/package/Config.in
index cb94e30be3..8efcecc90f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1240,6 +1240,7 @@ menu "External python modules"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
+	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
new file mode 100644
index 0000000000..e6c992b8c5
--- /dev/null
+++ b/package/python-tinycss2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TINYCSS2
+	bool "python-tinycss2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  A tiny CSS parser.
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
new file mode 100644
index 0000000000..eeb3754752
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinycss2/json
+md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
+sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
new file mode 100644
index 0000000000..4bf5b97766
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinycss2
+#
+################################################################################
+
+PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
+PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
+PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
