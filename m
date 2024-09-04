Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E60CD37AE
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 05:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111F360857;
	Wed,  4 Sep 2024 05:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewgGj26bFoYu; Wed,  4 Sep 2024 05:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2B860848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2B860848;
	Wed,  4 Sep 2024 05:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D70141BF3D5
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2A3D80571
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2oD-UjnDZ5S for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 05:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A1F580566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1F580566
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1F580566
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 05:37:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73713A4C0336
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 07:37:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54032)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1slihR-000000008Sx-0Prk
 for buildroot@buildroot.org; Wed, 04 Sep 2024 05:37:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 07:37:01 +0200
Message-Id: <20240904053701.53995-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725428221;
 bh=gbmK0s9B5qVVhy69Wd3bP8W0SnoYipDbSg3wLzrjhyY=;
 h=From:To:Subject:Date:From;
 b=M7coopTJ4jeZ102sSytxngo0O2iHc2/hyv2fSHqtFNYis3K9QsEqLun1804/0AKbO
 9zNIPAa3Dpl781UDFWQamlSi60FjCGrVDFl8WHvFKQGdQ1jdXBVzrfTM8/GE21gKdz
 GziQ6iLANwZUcB8JHT4/1GHERsuVp+YjSOauB69GgPmNXCPisx8wcizw26kragQJgL
 mh/46ODefI1G0h6FwvMZHEj2LQ8cGhdjs3FWnqoki5cDb680S+EAtJuu/p4KUCT8lO
 CHy4ncqcaJyuTSpgwx1EHTPZftK+J7WRwcVD2hIweVFzEHlg2ziYCJjfxTaRA6amVU
 GSl8jfxKFummA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=M7coopTJ
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump version
 to 3.3.2
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

Fixes CVE-2024-6119 & CVE-2024-5535:
https://openssl-library.org/news/openssl-3.3-notes/index.html

Updated _SITE and project URL according to
https://openssl-library.org/post/2024-04-30-releases-distribution-changes/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 4 ++--
 package/openssl/Config.in          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index dd1c99f7a7..52fce1eb3a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.3.1.tar.gz.sha256
-sha256  777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e  openssl-3.3.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.3.2/openssl-3.3.2.tar.gz.sha256
+sha256  2e8a40b01979afe8be0bbfb3de5dc1c6709fedb46d6c89c10da114ab5fc3d281  openssl-3.3.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 89a9189bb8..82b924c557 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.3.1
-LIBOPENSSL_SITE = https://www.openssl.org/source
+LIBOPENSSL_VERSION = 3.3.2
+LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
 LIBOPENSSL_LICENSE_FILES = LICENSE.txt
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 30db152fad..d255a05596 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_LIBOPENSSL
 	  (TLS v1) as well as a full-strength general-purpose
 	  cryptography library.
 
-	  http://www.openssl.org/
+	  https://openssl-library.org/
 
 	  Note: Some helper scripts need perl.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
