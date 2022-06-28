Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3BDC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0595F41928;
	Tue, 28 Jun 2022 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0595F41928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhlEs6N9pdjk; Tue, 28 Jun 2022 17:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89BA417A7;
	Tue, 28 Jun 2022 17:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89BA417A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF4FB1BF263
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91F1E61117
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F1E61117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqzknKsZCcfv for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 17:42:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8186111A
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A8186111A
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 17:42:06 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout07.t-online.de (Postfix) with SMTP id 5D2F6A68E
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 19:42:03 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.186.7]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o6FDu-1qTZLd0; Tue, 28 Jun 2022 19:42:02 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49584)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o6FDu-0001hh-GT
 for buildroot@buildroot.org; Tue, 28 Jun 2022 19:42:02 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 19:42:02 +0200
Message-Id: <20220628174202.221302-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656438122-0143E336-97B1AD79/0/0 CLEAN NORMAL
X-TOI-MSGID: 042f9c44-5729-4871-a60a-4d3cf5fd1e60
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: bump version to 2.3.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed unsecure md5 hash, upstream does not provide other hashes so we
keep our sha256 hash. Switched _SITE to http.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/unixodbc/unixodbc.hash | 4 +---
 package/unixodbc/unixodbc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index ba094f7627..9e5401c2b3 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,6 +1,4 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.9.tar.gz.md5
-md5  06f76e034bb41df5233554abe961a16f  unixODBC-2.3.9.tar.gz
 # Locally computed
-sha256  52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207  unixODBC-2.3.9.tar.gz
+sha256  d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c  unixODBC-2.3.11.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index b447cf5ff0..650e3b3b36 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.9
+UNIXODBC_VERSION = 2.3.11
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
-UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
+UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
 UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
