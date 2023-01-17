Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F305C677F1
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AADAE60BFD;
	Tue, 17 Jan 2023 21:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AADAE60BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inI33Wy3JBEI; Tue, 17 Jan 2023 21:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98C260BC7;
	Tue, 17 Jan 2023 21:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D98C260BC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74E831BF5DB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A5CF81C0A
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5CF81C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7__bxz7oFINP for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 21:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6503B81BF4
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6503B81BF4
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 21:42:28 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout09.t-online.de (Postfix) with SMTP id 640AEA94D
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 22:42:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.179]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pHtio-2dL3A10; Tue, 17 Jan 2023 22:42:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:47480)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pHtin-0000LA-2h
 for buildroot@buildroot.org; Tue, 17 Jan 2023 22:42:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 22:42:21 +0100
Message-Id: <20230117214221.3098939-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673991742-B639BDF7-4CD55A64/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a16841f-182a-40f8-83a9-78b2e66b41d0
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.55
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

Release notes:
https://lists.apache.org/thread/xlp3od60fjl8nl44z4f56y0lhs7pglos

Fixes CVE-2006-20001, CVE-2022-36760, CVE-2022-37436:
https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 2c21a5bab8..a1185c5618 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
 # From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
-sha256  eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340  httpd-2.4.54.tar.bz2
-sha512  228493b2ff32c4142c6e484d304f2ea12e467498605fe12adce2b61388d8efe7b2e96ae2fd0abd1dc88a5f12d625e007d8da0ae5628cff2a5272806754f41e18  httpd-2.4.54.tar.bz2
+sha256  11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac  httpd-2.4.55.tar.bz2
+sha512  94982f7a1fedac8961fc17b5a22cf763ac28cb27ee6facab2e6a15b249b927773667493fd3f7354fb13fcb34a6f1afc1bdd5cf4b7be030cba1dfb523e40d43fb  httpd-2.4.55.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 315282baac..13018a9b1f 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.54
+APACHE_VERSION = 2.4.55
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
