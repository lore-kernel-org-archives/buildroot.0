Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC5B84743;
	Wed, 23 Mar 2022 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ubh4etzZcZV; Wed, 23 Mar 2022 20:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B784784356;
	Wed, 23 Mar 2022 20:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 347CC1BF9C8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB4A40FD7
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zod9Dso2XT-w for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F258400C4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 439FD854E7; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:09:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39c3ad67401fadf8ebcb7d591649d821dc02411a
X-Git-Newrev: 386b0d6c5e9c6c9ece230ad63b25f126e249a37f
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.439FD854E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: use poco component names in
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=386b0d6c5e9c6c9ece230ad63b25f126e249a37f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For clarity, use the same names used in documentation, and component
selection in configure. Valid poco component names are defined in:
https://github.com/pocoproject/poco/blob/poco-1.11.1-release/components

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
