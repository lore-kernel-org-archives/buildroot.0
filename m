Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9189C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78F0E81F37;
	Tue, 20 Dec 2022 20:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78F0E81F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1chjV5qM1_oz; Tue, 20 Dec 2022 20:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB37181F10;
	Tue, 20 Dec 2022 20:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB37181F10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4A951BF2C9
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED67417B4
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED67417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLRyJriNzUfc for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 20:20:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4F6417B3
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F4F6417B3
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 20:20:59 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout05.t-online.de (Postfix) with SMTP id 67E1E16E9B;
 Tue, 20 Dec 2022 21:20:51 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p7j6X-1SXUOX0; Tue, 20 Dec 2022 21:20:49 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:54580)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p7j6X-0004zF-1F;
 Tue, 20 Dec 2022 21:20:49 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 21:20:48 +0100
Message-Id: <20221220202049.3292021-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671567649-F2FF5ECF-F56B65BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 0c09703a-a32c-4a63-b3b6-da6b1d1de214
Subject: [Buildroot] [PATCH 1/2] package/python-glslang: add new host package
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
Cc: Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for mesa3d 22.3.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                 |  1 +
 package/python-glslang/python-glslang.hash |  3 +++
 package/python-glslang/python-glslang.mk   | 13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/python-glslang/python-glslang.hash
 create mode 100644 package/python-glslang/python-glslang.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f5e13d99cc..05bc773cca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -448,6 +448,7 @@ F:	package/pound/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
+F:	package/python-glslang/
 F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
new file mode 100644
index 0000000000..df9127939e
--- /dev/null
+++ b/package/python-glslang/python-glslang.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  592c98aeb03b3e81597ddaf83633c4e63068d14b18a766fd11033bad73127162  python-glslang-11.13.0.tar.gz
+sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
new file mode 100644
index 0000000000..94f480e30a
--- /dev/null
+++ b/package/python-glslang/python-glslang.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-glslang
+#
+################################################################################
+
+PYTHON_GLSLANG_VERSION = 11.13.0
+PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
+PYTHON_GLSLANG_LICENSE = BSD-3-Clause
+PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
+PYTHON_GLSLANG_DEPENDENCIES = host-python3
+
+$(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
