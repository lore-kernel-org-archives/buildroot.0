Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A17C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 23:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B12D24091E;
	Wed, 15 Jun 2022 23:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Mu1b5PFpjpw; Wed, 15 Jun 2022 23:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8609404B2;
	Wed, 15 Jun 2022 23:17:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24F331BF3BA
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13999419A6
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyx_odtB18Si for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 23:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD54041999
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 23:17:34 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id u2so9868998iln.2
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2B25gutEDddwPqT6k7TdbzEyO7Zn9sCuwRmwphqEbYg=;
 b=XXBY8SBKEDrWemKUaV1BkXIkIOsZe8DoRq56cbV517fIUD56VlCI6W23ya0viC/kF7
 OkWojIi3AFY3PLgWkpS7qJw+sIKfPzCUTIaAVj8VlMkmf4yZ9khGLRFoRl+Dopdn12EZ
 mcrMWu/+ZLECAmzpS7rL1WbSu1yp+V1/aWpa30TiQttDhGxnisNLf4JkbJqlwnR2Te6c
 gonK7kjz5/j028TTeb4tk9ttvChctC4z0L/6UOEVvf+yeVaDAltyKyRi5lWbRSu0uHSf
 qJKdNrsM3K78aqf8BqUOdS2ZeVIgs06px96XTOYn86BZzJble8b4GLhPQaggX6EcAJCz
 np7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2B25gutEDddwPqT6k7TdbzEyO7Zn9sCuwRmwphqEbYg=;
 b=LWDueveHiU5smn275UeGhdkMMhH+5cuEj8jqRCkSC8FT60cWqnf69iIcGZxNCyhpTZ
 JjFiZQdmjRhBJOau9NuM0h3aRacRr1JnCkU5r2dlc8BE1EOx6T2qVV9xh3iFNO0383tA
 wSrLJfnzf76q0CGrWUawC2mQ1BAeNpPXbsOlNjwAIpG8bDGImPoOhqC3kiTAlRPTZUj9
 v4AxYZ61Ub0EMKpGyw5hVNLBEr5PP2/PidhRbqZ+DpHnu/vbjYc9VDPzicp3nacPTaUX
 NGluD1wqduHT80pL/8pSSLHycEgbyrA3hyEuRBRF0uMb1RIosWZ6sRc2iiWPUPUmyb5l
 q81w==
X-Gm-Message-State: AJIora8QvrXCWGGmaMwUxj3zjd05Yw6olhGUbDwTsvMQcec+zTIEtVpI
 jkPXU3EDd3KpLjENBHXPF/XNqj/rgjI=
X-Google-Smtp-Source: AGRyM1sIuBXGVaoCDpqAHhHn7Dj/rG1Niv6v10hETJJ9k4L9YERN7PKxdWlYg1mGEg65Un5W6VS7Hw==
X-Received: by 2002:a05:6e02:1563:b0:2d3:c749:841e with SMTP id
 k3-20020a056e02156300b002d3c749841emr1317445ilu.59.1655335053702; 
 Wed, 15 Jun 2022 16:17:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 q13-20020a02c8cd000000b0033167aa9be5sm160802jao.114.2022.06.15.16.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 16:17:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 17:17:29 -0600
Message-Id: <20220615231730.2900335-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pyrsistent: new package
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
 package/Config.in                                |  1 +
 package/python-pyrsistent/Config.in              |  6 ++++++
 package/python-pyrsistent/python-pyrsistent.hash |  5 +++++
 package/python-pyrsistent/python-pyrsistent.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pyrsistent/Config.in
 create mode 100644 package/python-pyrsistent/python-pyrsistent.hash
 create mode 100644 package/python-pyrsistent/python-pyrsistent.mk

diff --git a/package/Config.in b/package/Config.in
index 3b089166da..0752ea1faf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1178,6 +1178,7 @@ menu "External python modules"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
+	source "package/python-pyrsistent/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysftp/Config.in"
 	source "package/python-pysmb/Config.in"
diff --git a/package/python-pyrsistent/Config.in b/package/python-pyrsistent/Config.in
new file mode 100644
index 0000000000..49f97a00d9
--- /dev/null
+++ b/package/python-pyrsistent/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYRSISTENT
+	bool "python-pyrsistent"
+	help
+	  Persistent/Functional/Immutable data structures.
+
+	  http://github.com/tobgu/pyrsistent/
diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
new file mode 100644
index 0000000000..70d1cc6fa2
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyrsistent/json
+md5  cef3da08455664bf917dcf8cd00d49a4  pyrsistent-0.18.1.tar.gz
+sha256  d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96  pyrsistent-0.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
new file mode 100644
index 0000000000..27ec41028f
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyrsistent
+#
+################################################################################
+
+PYTHON_PYRSISTENT_VERSION = 0.18.1
+PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/42/ac/455fdc7294acc4d4154b904e80d964cc9aae75b087bbf486be04df9f2abd
+PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
+PYTHON_PYRSISTENT_LICENSE = MIT
+PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
