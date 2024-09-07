Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D63ECE567
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EE46404EC;
	Sat,  7 Sep 2024 20:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9RlgSGhQn98; Sat,  7 Sep 2024 20:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF662405CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF662405CC;
	Sat,  7 Sep 2024 20:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE261BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A0D74044C
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZMZZCOLWYpj for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D7A4044E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D7A4044E
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27BCD86F3C; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 21:50:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdabacb266fddbe4ff8727eff50ef85be9bc53c5
X-Git-Newrev: 8ba362bf9493583889e355817e2edc8e915154a8
X-Patchwork-Hint: ignore
Message-Id: <20240907200357.27BCD86F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lxml: bump to version 5.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ba362bf9493583889e355817e2edc8e915154a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace deprecated --xslt-config build option with --with-xslt-config.

Replace deprecated --xml2-config build option with --with-xml2-config.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-lxml/python-lxml.hash |  2 +-
 package/python-lxml/python-lxml.mk   | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 3eb427a80d..059238ffab 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/lxml/
-sha256  bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87  lxml-5.2.2.tar.gz
+sha256  4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f  lxml-5.3.0.tar.gz
 # Locally computed
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 2a26c132a7..8604b5783a 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 5.2.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/63/f7/ffbb6d2eb67b80a45b8a0834baa5557a14a5ffce0979439e7cd7f0c4055b
+PYTHON_LXML_VERSION = 5.3.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e7/6b/20c3a4b24751377aaa6307eb230b66701024012c29dd374999cc92983269
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
@@ -29,12 +29,12 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
 	--skip-dependency-check \
-	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
-	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+	-C--build-option=--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	-C--build-option=--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
 	--skip-dependency-check \
-	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
-	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
+	-C--build-option=--with-xslt-config=$(HOST_DIR)/bin/xslt-config \
+	-C--build-option=--with-xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
