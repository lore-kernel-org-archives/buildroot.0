Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA39FC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BCE4032A;
	Sun,  9 Apr 2023 14:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BCE4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhK9Th2Im7ZL; Sun,  9 Apr 2023 14:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BB0440528;
	Sun,  9 Apr 2023 14:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB0440528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 181F31BF41F
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C1F8215E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C1F8215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9gdnJUCtL3d for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2684F82158
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2684F82158
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13DEE83B53; Sun,  9 Apr 2023 14:09:58 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 16:08:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c3fe141f028d06b32945f07cec7d2ecd60438c
X-Git-Newrev: 853c1d053c96525ab401a51e140a479537bba3af
X-Patchwork-Hint: ignore
Message-Id: <20230409140958.13DEE83B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodbus: bump to version 3.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=853c1d053c96525ab401a51e140a479537bba3af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/stephane/libmodbus/releases/tag/v3.1.10

Also update URL in Config.in to use https instead of http.

Also remove --without-documentation configure option, which already
didn't exist in 3.1.8.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libmodbus/Config.in      | 2 +-
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
index 642b57cd8c..2e93fa4bee 100644
--- a/package/libmodbus/Config.in
+++ b/package/libmodbus/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBMODBUS
 	  according to the Modbus protocol. This library is written in C
 	  and supports RTU (serial) and TCP (Ethernet) communications.
 
-	  http://libmodbus.org
+	  https://libmodbus.org
diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 83b0c3a012..a7b7e583a8 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b122f2bc29f749702a22c0a760a7ca2182d541f5fa26bf25e3431f907b606f3c  libmodbus-3.1.8.tar.gz
+sha256  899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253  libmodbus-3.1.10.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 2f8c1735da..2fffa1e0e9 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.8
+LIBMODBUS_VERSION = 3.1.10
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_CPE_ID_VENDOR = libmodbus
 LIBMODBUS_INSTALL_STAGING = YES
-LIBMODBUS_CONF_OPTS = --without-documentation --disable-tests
+LIBMODBUS_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
