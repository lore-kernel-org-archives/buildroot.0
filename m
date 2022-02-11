Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D48C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 08:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC618137E;
	Fri, 11 Feb 2022 08:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPFecsaBCS3H; Fri, 11 Feb 2022 08:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4840F80D74;
	Fri, 11 Feb 2022 08:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A12D1C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79457405CE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myHiZaLizaxR for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 08:17:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3107D405AA
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 08:17:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29123240002;
 Fri, 11 Feb 2022 08:17:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIR7Y-00061M-Nh; Fri, 11 Feb 2022 09:17:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 09:17:29 +0100
Message-Id: <20220211081730.23068-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220211081730.23068-1-peter@korsgaard.com>
References: <20220211081730.23068-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/python3-six: drop host package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk         |  2 +-
 package/python-six/python-six.mk     |  1 -
 package/python3-six/python3-six.hash |  1 -
 package/python3-six/python3-six.mk   | 17 -----------------
 4 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 120000 package/python3-six/python3-six.hash
 delete mode 100644 package/python3-six/python3-six.mk

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 417a51e067..49e3b95191 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -15,7 +15,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
 	host-python-mako \
-	host-python3-six \
+	host-python-six \
 	host-swig \
 	boost \
 	log4cpp \
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 41ef41d0ba..9e3e5fcf50 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-six/python3-six.mk
 PYTHON_SIX_VERSION = 1.16.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
 PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
deleted file mode 120000
index ed8cb89a6b..0000000000
--- a/package/python3-six/python3-six.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-six/python-six.hash
\ No newline at end of file
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
deleted file mode 100644
index ee9dc818ee..0000000000
--- a/package/python3-six/python3-six.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python3-six
-#
-################################################################################
-
-# Please keep in sync with package/python-six/python-six.mk
-PYTHON3_SIX_VERSION = 1.16.0
-PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
-PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
-PYTHON3_SIX_SETUP_TYPE = setuptools
-PYTHON3_SIX_LICENSE = MIT
-PYTHON3_SIX_LICENSE_FILES = LICENSE
-HOST_PYTHON3_SIX_DL_SUBDIR = python-six
-HOST_PYTHON3_SIX_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
