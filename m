Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94D9C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 08:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFD581346;
	Mon,  3 Oct 2022 08:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFD581346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LtOvku50pAC; Mon,  3 Oct 2022 08:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F731812CC;
	Mon,  3 Oct 2022 08:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F731812CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 514141BF271
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C62B40441
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C62B40441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmWYH1xk6lhw for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 08:51:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C61F4010E
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C61F4010E
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 08:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 630D039856;
 Mon,  3 Oct 2022 10:16:04 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 10:16:03 +0200
Message-Id: <1664784963-61534-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH] package/python-remi: add license file and
 license hash
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since the release 2021.3.2, a LICENSE file is shipped with the archive from
pypi.org.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-remi/python-remi.hash | 2 ++
 package/python-remi/python-remi.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 82234bbe98..e7937c3914 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,4 @@
 # sha256 from https://pypi.org/pypi/remi/json
 sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
+# Locally computed sha256
+sha256  3df7d3ad8904d7e99fc0810366483a7cbe5a43c13f7f913f1d7e5023f2ff7657  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 7e43c09b00..419a3441a7 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -9,6 +9,7 @@ PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
 PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
 
 PYTHON_REMI_LICENSE = Apache-2.0
+PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
