Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F2CCDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7404306E;
	Thu, 19 Oct 2023 16:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7404306E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMe87rXmznAX; Thu, 19 Oct 2023 16:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD0742FF8;
	Thu, 19 Oct 2023 16:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD0742FF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43BC01BF4D6
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 16:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BBED83E86
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 16:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BBED83E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7meuHUiheZ7 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 16:51:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 275D983E84
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 16:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275D983E84
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21929A4C015A
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 18:51:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60808)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qtWEp-0005ZA-29
 for buildroot@buildroot.org; Thu, 19 Oct 2023 18:51:11 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 18:51:11 +0200
Message-Id: <20231019165111.95933-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697734273;
 bh=PS4JsI++tyfiqS6PwNBekUUr9jTPuz5i4Xm4ej/3eVM=;
 h=From:To:Subject:Date:From;
 b=ly9PM8I1eacWqmGiU+Tc5F8gkUmHpwyjtne+4Ag4jh42M6TJer9iJ9WdBhz0YxqVK
 MtgfjwdZj0Yli6JT9RqWYe2SyAXhxZ8oSJWQhVJNhUtY7gBLbQ6KbRhrqXomwEII9T
 FP6PQ4iLKSC491ZioEShujbntnJs0DL+5rJBw0tNbAvQsmp7CIvthbKtsBAuz2Onou
 MqLesmT3gJvQgNc36avLb3mUO5aUqCb4FyUVusC8PxHvRNP+DSYLTHdhQRG/7UoQ5n
 FVdROtKYusVnf/WlCYRDobv5uphJhnacpjZyJcD2fxz3tvaNRFrwVi4I6LGC0FHliQ
 EY4WGpLr/u6SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ly9PM8I1
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.58
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

Fixes CVE-2023-31122, CVE-2023-43622 & CVE-2023-45802:
https://httpd.apache.org/security/vulnerabilities_24.html

Release notes:
https://lists.apache.org/thread/1qnr3jpk1mdnqc2c6foyjvg0ch636h1n

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 1f0020f65a..854bc85dcc 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.57.tar.bz2.{sha256,sha512}
-sha256  dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a  httpd-2.4.57.tar.bz2
-sha512  4d1e0a274ee90bdfb5f38d4a7d73a7367ed1c6388e26280e640014e49abc0df03683705b88dcfe2ec2da313dda4c7b4a3b86daffa1911f58e224eba89d82d155  httpd-2.4.57.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.58.tar.bz2.{sha256,sha512}
+sha256  fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5  httpd-2.4.58.tar.bz2
+sha512  d6e73bf413a507ec16b621ff635e178206207a9e9810ce3944b3dc98d39cde8f225307110167fc9da5822175796c8cb66f98be5b9f0d8b76dcd83a401d39b2c1  httpd-2.4.58.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..cac62134ed 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.57
+APACHE_VERSION = 2.4.58
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
