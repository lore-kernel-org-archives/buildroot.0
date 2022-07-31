Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9225C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201E0416F2;
	Sun, 31 Jul 2022 11:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201E0416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z91bN4ySD7wx; Sun, 31 Jul 2022 11:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84B84175C;
	Sun, 31 Jul 2022 11:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84B84175C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECA161BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BD54175C
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BD54175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idjRuq6LC1Mz for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330CD416F2
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 330CD416F2
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:12:46 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout02.t-online.de (Postfix) with SMTP id 9BA02F1C
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 13:12:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oI6sD-4dwgDJ0; Sun, 31 Jul 2022 13:12:41 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50818)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oI6sC-0001Au-2b
 for buildroot@buildroot.org; Sun, 31 Jul 2022 13:12:40 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 13:12:40 +0200
Message-Id: <20220731111240.12145-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659265961-01447895-5144B689/0/0 CLEAN NORMAL
X-TOI-MSGID: bf334d79-3076-4134-8dd6-ce5c50e5c994
Subject: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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
 package/apache/apache.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 315282baac..e199194e84 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -11,6 +11,33 @@ APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
+# only Windows affected
+APACHE_IGNORE_CVES += CVE-1999-0289
+# only Debian affected
+APACHE_IGNORE_CVES += CVE-1999-0678
+# unrelated to Linux
+APACHE_IGNORE_CVES += CVE-1999-1412
+# disputed CVE
+APACHE_IGNORE_CVES += CVE-2007-0086
+# unrelated to Apache
+APACHE_IGNORE_CVES += CVE-2007-0450
+# fixed in version 2.2.5
+APACHE_IGNORE_CVES += CVE-2007-4465 CVE-2008-2168
+# fixed in version 2.2.7
+APACHE_IGNORE_CVES += CVE-2007-5000 CVE-2007-6420 CVE-2007-6420 \
+	CVE-2007-6421 CVE-2007-6422 CVE-2007-6423 CVE-2008-0455
+# fixed in version 2.2.10
+APACHE_IGNORE_CVES += CVE-2008-2939
+# fixed in version 2.2.12
+APACHE_IGNORE_CVES += CVE-2009-1195 CVE-2009-1890 CVE-2009-1891
+# fixed in version 2.2.14
+APACHE_IGNORE_CVES += CVE-2009-2699
+# fixed in version 2.2.15
+APACHE_IGNORE_CVES += CVE-2010-0408 CVE-2010-0425 CVE-2010-0434
+# fixed in version 2.2.16
+APACHE_IGNORE_CVES += CVE-2010-1452
+# fixed in version 2.4.10
+APACHE_IGNORE_CVES += CVE-2014-0231
 APACHE_SELINUX_MODULES = apache
 # Needed for mod_php
 APACHE_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
