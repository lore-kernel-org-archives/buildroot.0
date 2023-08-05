Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEA5C00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AAF40245;
	Sat,  5 Aug 2023 17:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7AAF40245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3H-Gg2oNF_j; Sat,  5 Aug 2023 17:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705D8410B2;
	Sat,  5 Aug 2023 17:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705D8410B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 289871BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79EF7415F8
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79EF7415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyQUKVPLtYNq for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:41:56 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63062416AB
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63062416AB
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38C1FA4C0C84;
 Sat,  5 Aug 2023 19:39:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55386)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLF3-00023E-3B;
 Sat, 05 Aug 2023 19:39:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:39:04 +0200
Message-Id: <20230805173905.1571097-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257146;
 bh=TMWfIG3fDvIwqMvVRr2fFs/rMMk0PWk3CCDAcPMU0+w=;
 h=From:To:Cc:Subject:Date:From;
 b=UtXCCunCWSt47lSz7F7Ev0eA8vbbrUwhF81Q8s0QcBJGcEQzB7VaZ7AVU1E79YRCr
 1TRGdA3776cFir3+6XYg5vrko2yufuNyjpnHPLGq5fjoq1G+h7gN1kthDibNM39R/E
 /4YA0DQdQNy+usMnn4JvWpZdYjHd6oUAE3EtiaNEJ4w+0AEsQyR9BfiGYrtO1d0Jk7
 cFYmkhMwUUo9X06ZSmLukHB0enBsFQisM4j7V4iVG60JmbQcOeviOcg2xjZ3/RWpRN
 dflFDmMJgdEk3Etcz28H895kc7qKSTSBXCCjGuf6UHQgZIGky2S8tKSdUyyk5z3q/Y
 +JqyALfzMGEeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UtXCCunC
Subject: [Buildroot] [PATCH 1/2] package/python-constantly: bump version
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest release dates back to 2015, update version to latest git HEAD
dating back to 2018, needed for an upcoming patch which makes the
package compatible with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-constantly/python-constantly.hash | 4 +---
 package/python-constantly/python-constantly.mk   | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index 8e646d82ba..7fda632e87 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,3 @@
-# md5 from https://pypi.python.org/pypi/constantly/json
-md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
 # Locally computed
-sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  0cfe2235cd6fcd677ffb0710891ffb839a1d748b98acb32e5df683e6f4a1ea71  python-constantly-39887b6e131a72b04a338919519e972de668c586.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 783d198d06..e6e7096bee 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CONSTANTLY_VERSION = 15.1.0
-PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_VERSION = 39887b6e131a72b04a338919519e972de668c586
+PYTHON_CONSTANTLY_SITE = $(call github,twisted,constantly,$(PYTHON_CONSTANTLY_VERSION))
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
