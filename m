Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830E9C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3232340137;
	Mon, 25 Mar 2024 13:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDobQtcM9QH1; Mon, 25 Mar 2024 13:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B5C40B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39B5C40B7B;
	Mon, 25 Mar 2024 13:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31AD71BF358
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D4BB4059B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO1Dr3jcSAJn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 13:06:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AC6340569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC6340569
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC6340569
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:06:40 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4F7EF2C80C87;
 Mon, 25 Mar 2024 14:06:37 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 14:06:35 +0100
Message-Id: <20240325130636.156426-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711371997; bh=Z/CVAb+C76wt6a1xpIiih0qFlagLp0x+crIVajzsFVA=;
 h=From:To:Cc:Subject:Date;
 b=icvPdkVLi2/RxmsjKCb5Eg3s4POjOk+sIvW0jj87MBk9nDR5kyhWZhomwWcFk1ib9
 ZbjKpNJz/V5/Kqfp1yg7NDSKIiyC5oc4+ba1IQGsTKfuj9IgTDG1nC3K6yBpQ9WoUn
 MkwjZ8kK3ZbsuFSg0eXbRHBfM01fSzYArYzfaPIBJbmGVZtiEYRUSB5bnz4z0STpeO
 feLeNd83yAuFFatz1uSkHRP5uj3wX4+JZmgndwMvcTaZrdNkogwLS/zfyAn2Ct8fKF
 1TfL1MH1g/6XI2mIHwnjvk9FhexC6HXvtsOY7AXx5irvuCy/6eVPsCggruloAbtX3M
 Y9Vw5B40kaxHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=icvPdkVL
Subject: [Buildroot] [PATCH 1/2] package/python-pytest: bump to 8.1.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove no longer used attrs dependency (already since 7.3.0[1]).

Changelog:
https://docs.pytest.org/en/stable/changelog.html#pytest-8-1-1-2024-03-08

[1] https://docs.pytest.org/en/stable/changelog.html#pytest-7-3-0-2023-04-08

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pytest/Config.in          | 1 -
 package/python-pytest/python-pytest.hash | 6 +++---
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index b42457e67d..912dc4949b 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYTEST
 	bool "python-pytest"
-	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index e710003535..1d5a874238 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  e2ac4c70861f26d735b64e5687bb218e  pytest-7.4.4.tar.gz
-sha256  2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280  pytest-7.4.4.tar.gz
-# Locally computer sha256
+md5  6a85eccffeb0fa15c104f408d82ce7fa  pytest-8.1.1.tar.gz
+sha256  ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044  pytest-8.1.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 3170a1a9db..90dc91b654 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.4.4
+PYTHON_PYTEST_VERSION = 8.1.1
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/80/1f/9d8e98e4133ffb16c90f3b405c43e38d3abb715bb5d7a63a5a684f7e46a3
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/30/b7/7d44bbc04c531dcc753056920e0988032e5871ac674b5a84cb979de6e7af
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
