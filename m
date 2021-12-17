Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F47C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C1E84DA6;
	Fri, 17 Dec 2021 21:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2doIHaRHCKbq; Fri, 17 Dec 2021 21:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 398BE84DAF;
	Fri, 17 Dec 2021 21:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D51D1C1162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD4361147
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHaBLCz1BQ-O for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD2A605A9
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AFA2E810D8; Fri, 17 Dec 2021 21:45:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:50:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 773743a007cc05139366635744d2d59abc2c641f
X-Git-Newrev: 458617f635a3ccb20023baf018d7fd9079ddb41c
X-Patchwork-Hint: ignore
Message-Id: <20211217214512.AFA2E810D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: security bump to
 version 2.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=458617f635a3ccb20023baf018d7fd9079ddb41c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-42717: ModSecurity 3.x through 3.0.5 mishandles
  excessively nested JSON objects. Crafted JSON objects with nesting
  tens-of-thousands deep could result in the web server being unable to
  service legitimate requests. Even a moderately large (e.g., 300KB)
  HTTP request can occupy one of the limited NGINX worker processes for
  minutes and consume almost all of the available CPU on the machine.
  Modsecurity 2 is similarly vulnerable: the affected versions include
  2.8.0 through 2.9.4.
- Use official tarball and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modsecurity2/modsecurity2.hash | 4 +++-
 package/modsecurity2/modsecurity2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index 1501b5642e..a19f4823a8 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,3 +1,5 @@
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.5/modsecurity-2.9.5.tar.gz.sha256
+sha256  e2bfc8cd8b8de1e21f054d310543373ea5d89adbd96784e832be0da3e4dc149e  modsecurity-2.9.5.tar.gz
+
 # Locally computed
-sha256  686695c650449a338757711254ea78c67dedb1d258e03e5c8686f869388fff8c  modsecurity2-2.9.4.tar.gz
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 5d91818ade..a1ad8fe5bc 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.4
-MODSECURITY2_SITE = $(call github,SpiderLabs,ModSecurity,v$(MODSECURITY2_VERSION))
+MODSECURITY2_VERSION = 2.9.5
+MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
+MODSECURITY2_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
 MODSECURITY2_CPE_ID_VENDOR = trustwave
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
-MODSECURITY2_AUTORECONF = YES
 
 MODSECURITY2_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
