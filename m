Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB770C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F9040522;
	Mon,  5 Dec 2022 11:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F9040522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxPrFDdU2Aaa; Mon,  5 Dec 2022 11:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97A8540577;
	Mon,  5 Dec 2022 11:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97A8540577
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D44B1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDCCA40610
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDCCA40610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ol5YBrxtPh3G for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8458C405EF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8458C405EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8232E85BA2; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:05:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96a9097ca814942951a4530ff294efedfed65036
X-Git-Newrev: d23c655958f9f6d6eeaf860cabdd0ba5a65274ed
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.8232E85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websocket-client: bump to
 version 1.4.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d23c655958f9f6d6eeaf860cabdd0ba5a65274ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required six runtime dependency.

Project relicensed as Apache 2.0:
https://github.com/websocket-client/websocket-client/commit/ee5e352ebfcb78dd944d6923ce775ee4fcb5fd7f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-websocket-client/Config.in                    | 1 -
 package/python-websocket-client/python-websocket-client.hash | 6 +++---
 package/python-websocket-client/python-websocket-client.mk   | 8 ++++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
index 519e506615..f915905400 100644
--- a/package/python-websocket-client/Config.in
+++ b/package/python-websocket-client/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
 	bool "python-websocket-client"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  WebSocket client for python. hybi13 is supported.
diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 1e745dc1d5..08a6c260ca 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  8fc86b13dc97dc032855c6257f9168df  websocket_client-0.58.0.tar.gz
-sha256  63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f  websocket_client-0.58.0.tar.gz
+md5  1e8b6daae0cad86f8cd9210b24bdf95b  websocket-client-1.4.1.tar.gz
+sha256  f9611eb65c8241a67fb373bef040b3cf8ad377a9f6546a12b620b6511e8ea9ef  websocket-client-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  7c6699c75f87b52bdc542db26d6b1b92892577cda46e20eceb79e2790a1c291b  LICENSE
+sha256  638eb70dcc4af2e6d8388de0636ced399f7c24716e11b8573a6b06f879e80691  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index d2873e3601..7e21187e22 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 0.58.0
-PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/4a/df/112c278ba1ead96786d24d973429ce1e1a2c86b9843183d9f8ef8c6330d7
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.4.1
+PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket-client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/99/11/01fe7ebcb7545a1990c53c11f31230afe1388b0b34256e3fd20e49482245
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
-PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
+PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
