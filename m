Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE00C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 08:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E851C400FB;
	Fri, 11 Feb 2022 08:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szqhOgFsjaPF; Fri, 11 Feb 2022 08:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D015F402F3;
	Fri, 11 Feb 2022 08:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078A81C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5993607F0
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYJMTlnX2ij9 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 08:17:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 659F5607BC
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 08:17:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3811810000A;
 Fri, 11 Feb 2022 08:17:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIR7Y-00061G-6B; Fri, 11 Feb 2022 09:17:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 09:17:28 +0100
Message-Id: <20220211081730.23068-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220211081730.23068-1-peter@korsgaard.com>
References: <20220211081730.23068-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/python3-regex: drop host package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that host-python2 is gone, the custom python3 variant can be dropped and
instead host support added to python-regex.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk               |  2 +-
 package/python-regex/python-regex.mk     |  1 +
 package/python3-regex/python3-regex.hash |  1 -
 package/python3-regex/python3-regex.mk   | 16 ----------------
 4 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 120000 package/python3-regex/python3-regex.hash
 delete mode 100644 package/python3-regex/python3-regex.mk

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index e2a58a5f4e..9f6c7d31b8 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -19,7 +19,7 @@ MONGODB_DEPENDENCIES = \
 	host-python-cheetah \
 	host-python-psutil \
 	host-python-pyyaml \
-	host-python3-regex \
+	host-python-regex \
 	host-python-requests \
 	host-scons \
 	pcre \
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index c46c4d1614..a90fd579ac 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -12,3 +12,4 @@ PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = CNRI-Python
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python3-regex/python3-regex.hash b/package/python3-regex/python3-regex.hash
deleted file mode 120000
index 274f4dc277..0000000000
--- a/package/python3-regex/python3-regex.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-regex/python-regex.hash
\ No newline at end of file
diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
deleted file mode 100644
index 0b71768e9d..0000000000
--- a/package/python3-regex/python3-regex.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-regex
-#
-################################################################################
-
-# Please keep in sync with package/python-regex/python-regex.mk
-PYTHON3_REGEX_VERSION = 2021.4.4
-PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
-PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
-PYTHON3_REGEX_SETUP_TYPE = setuptools
-PYTHON3_REGEX_LICENSE = CNRI-Python
-HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
-HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
