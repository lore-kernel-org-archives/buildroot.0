Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07310C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 11:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80002606D7;
	Tue,  4 Mar 2025 11:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VR0BQCn8dGx; Tue,  4 Mar 2025 11:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA82606E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA82606E9;
	Tue,  4 Mar 2025 11:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E23EFC5
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 11:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6114812E9
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 11:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh94oXwfAcM6 for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 11:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E0FF8132F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0FF8132F
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E0FF8132F
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 11:17:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (5)
Received: from zm.int.grinn-global.com (pub-236.183.29.194.multiplay.pl
 [194.29.183.236])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2A7CB1BEABA;
 Tue,  4 Mar 2025 12:17:02 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Tue,  4 Mar 2025 12:16:58 +0100
Message-ID: <20250304111659.4763-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] bump python-pytest to version 8.3.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See [1] for changelog.

[1] https://github.com/pytest-dev/pytest/releases/tag/8.3.5

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 31983da0b5..c59666a854 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  542c4e802eeac1d196482e90a36533ed  pytest-8.3.4.tar.gz
-sha256  965370d062bce11e73868e0335abac31b4d3de0e82f4007408d242b4f8610761  pytest-8.3.4.tar.gz
+md5  f22d0f0e12aee3b97225a89504d657cb  pytest-8.3.5.tar.gz
+sha256  f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845  pytest-8.3.5.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index be40fdb0fd..fcb064b35d 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 8.3.4
+PYTHON_PYTEST_VERSION = 8.3.5
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/05/35/30e0d83068951d90a01852cb1cef56e5d8a09d20c7f511634cc2f7e0372a
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/ae/3c/c9d525a414d506893f0cd8a8d0de7706446213181570cdbd766691164e40
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
