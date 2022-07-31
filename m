Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64036C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098DA60EC2;
	Sun, 31 Jul 2022 11:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098DA60EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uBCbyYVZWuY; Sun, 31 Jul 2022 11:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A7D460A99;
	Sun, 31 Jul 2022 11:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A7D460A99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F03DB1BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBB682AED
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBB682AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKRYf9W_Eosy for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC8482ACD
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAC8482ACD
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:42:41 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout12.t-online.de (Postfix) with SMTP id 442E318173
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 13:42:39 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oI7L9-4HCIMr0; Sun, 31 Jul 2022 13:42:35 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:58330)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oI7L9-0006Pe-12
 for buildroot@buildroot.org; Sun, 31 Jul 2022 13:42:35 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 13:42:35 +0200
Message-Id: <20220731114235.93784-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659267755-01447F1E-17FBD786/0/0 CLEAN NORMAL
X-TOI-MSGID: deee05b1-415a-44d6-b69d-df1d6c7b4fc5
Subject: [Buildroot] [PATCH 1/1] package/php: ignore various CVEs
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index cb7a8d71d4..8e362ba144 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -14,6 +14,12 @@ PHP_DEPENDENCIES = host-pkgconf pcre2
 PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
+# fixed with version 5.x: https://ubuntu.com/security/notices/USN-485-1
+PHP_IGNORE_CVES += CVE-2007-2728
+# not a security vulnerability according to Red Hat
+PHP_IGNORE_CVES += CVE-2007-3205
+# not a security vulnerability according to Mandriva
+PHP_IGNORE_CVES += CVE-2007-4596
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
