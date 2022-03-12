Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69BDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5879D4048C;
	Sat, 12 Mar 2022 20:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyEIq37tJ7T1; Sat, 12 Mar 2022 20:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF3640488;
	Sat, 12 Mar 2022 20:17:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3D3F1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B133240488
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfFAQ-IO5zlO for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC3140486
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:16:54 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9CEE5B0051E;
 Sat, 12 Mar 2022 21:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647116212;
 bh=Epgosy90UXStMt+//kGS3Alw+oRsXKk+D0Ge2FdYp3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NgfkQOFgVhQrzDWESCFzrSukFHvpFCfaMLBnyEBdeOJHJx4jA9Hhiv2FrTUOukq++
 AgoHaXVQ2vvPgbiLYpx8NzvSDgWQnPB+/AJphDpucDpOx9j8whN+7iZ9JoNB9cEOF7
 eDeZ06nV1JKv/nD56byDMZUqIUat7bZijcSCOHp8OTVw3GpOfYofhmFEIE80vC7//7
 t7BFkVVCcDZ3Ngrb2spn/6GG73K7eXztlOoJ9vufFSTUscnfN4MiH2QgPC4WGH8++a
 eZ9/avCnXRfHBVILDlAdKCcsGUkGpHeq5lVOBRq8HUeaj+zBl1NBdPyDgCBTg5xCMz
 a5ttajOjYqHYw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 21:16:25 +0100
Message-Id: <20220312201627.690544-2-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312201627.690544-1-ju.o@free.fr>
References: <20220312201627.690544-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/poco: use poco component names in
 kconfig variables
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For clarity, use the same names used in documentation, and component
selection in configure. Valid poco component names are defined in:
https://github.com/pocoproject/poco/blob/poco-1.11.1-release/components

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/poco/Config.in | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index df3d3cbc66..79ffac741d 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -29,10 +29,10 @@ if BR2_PACKAGE_POCO
 comment "poco components"
 
 config BR2_PACKAGE_POCO_CPP_PARSER
-	bool "cpp_parser"
+	bool "CppParser"
 
 config BR2_PACKAGE_POCO_CRYPTO
-	bool "crypto"
+	bool "Crypto"
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 
@@ -40,58 +40,58 @@ config BR2_PACKAGE_POCO_DATA
 	bool
 
 config BR2_PACKAGE_POCO_DATA_MYSQL
-	bool "mysql"
+	bool "Data/MySQL"
 	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_POCO_DATA
 
 config BR2_PACKAGE_POCO_DATA_SQLITE
-	bool "sqlite"
+	bool "Data/SQLite"
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_SQLITE
 
 config BR2_PACKAGE_POCO_JSON
-	bool "json"
+	bool "JSON"
 
 config BR2_PACKAGE_POCO_JWT
-	bool "jwt"
+	bool "JWT"
 	select BR2_PACKAGE_POCO_CRYPTO
 	select BR2_PACKAGE_POCO_JSON
 
 config BR2_PACKAGE_POCO_MONGODB
-	bool "mongodb"
+	bool "MongoDB"
 	select BR2_PACKAGE_POCO_NET
 
 config BR2_PACKAGE_POCO_NET
-	bool "net"
+	bool "Net"
 
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
-	bool "netssl_openssl"
+	bool "NetSSL_OpenSSL"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POCO_CRYPTO
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_UTIL
 
 config BR2_PACKAGE_POCO_PDF
-	bool "pdf"
+	bool "PDF"
 	select BR2_PACKAGE_POCO_JSON
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
 
 config BR2_PACKAGE_POCO_REDIS
-	bool "redis"
+	bool "Redis"
 	select BR2_PACKAGE_POCO_NET
 
 config BR2_PACKAGE_POCO_UTIL
-	bool "util"
+	bool "Util"
 	select BR2_PACKAGE_POCO_XML
 
 config BR2_PACKAGE_POCO_XML
-	bool "xml"
+	bool "XML"
 	select BR2_PACKAGE_EXPAT
 
 config BR2_PACKAGE_POCO_ZIP
-	bool "zip"
+	bool "Zip"
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
