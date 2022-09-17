Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DA8ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7321A842E0;
	Sat, 17 Sep 2022 14:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7321A842E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIX_HD9ie4kv; Sat, 17 Sep 2022 14:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8DB784049;
	Sat, 17 Sep 2022 14:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8DB784049
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9AC51BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F39B405B1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F39B405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A78HYAcXHTSc for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:06:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7931D4049C
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7931D4049C
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:06:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C7F5CCA0EC
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:56:38 +0000 (UTC)
Received: from booty.. (unknown [37.163.14.31])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 49BC0FF802;
 Sat, 17 Sep 2022 13:56:32 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:56:26 +0200
Message-Id: <20220917135626.971371-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663422993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=03dhYeeuQd1xtRlW1pny1QUBsjrk6VguvZZJkZKja5U=;
 b=U2GwsN7DHgu03gJ5BBANBk7F2BGzz0fRhcUOL23nLn/4uuzBNU+krM14M4KpgGevtiyBd4
 ZrIspVX1D4p3lkQZRh7Va+WvlmLJRgK6G0sbR2macmXwjoe53dl5kwKepk0td8i0pkJCKn
 hIA7ycORS4IbWNg8bzdzkWtXhoTzSp+7WaEtW0ysln3miUm1VDcKkthY6760tATaO25jm2
 AzjumlRTS8r8YRtbGJoeAbmG+/ysyiu1/u1STgbzIr9MsQEhAs8XNhInrFqbaTOgiWbPyb
 p/Ub4u3pwVF3q1z7p0DgsGvK8rxLGVPp8KyJYIk5KQXOWXoKCLr6jpMFECAcGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U2GwsN7D
Subject: [Buildroot] [PATCH] package/unzip: update security patches from
 Debian
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Fixes CVE-2022-0529 and CVE-2022-0530.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/unzip/unzip.hash |  2 +-
 package/unzip/unzip.mk   | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index 8b3f275533a1..bbf4f7d71f01 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,6 +1,6 @@
 # From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
 sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
-sha256  88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599  unzip_6.0-26.debian.tar.xz
+sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
 
 # Locally computed:
 sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index e8c9366a1b83..44cc2013fbcb 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -6,13 +6,13 @@
 
 UNZIP_VERSION = 6.0
 UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
-UNZIP_PATCH = unzip_$(UNZIP_VERSION)-26.debian.tar.xz
-UNZIP_SITE = https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VENDOR = unzip_project
 
-# unzip_$(UNZIP_VERSION)-26.debian.tar.xz has patches to fix:
+# unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
 	CVE-2014-8139 \
 	CVE-2014-8140 \
@@ -24,6 +24,8 @@ UNZIP_IGNORE_CVES = \
 	CVE-2016-9844 \
 	CVE-2018-18384 \
 	CVE-2018-1000035 \
-	CVE-2019-13232
+	CVE-2019-13232 \
+	CVE-2022-0529 \
+	CVE-2022-0530
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
