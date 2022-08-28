Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFB3ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0669360B60;
	Sun, 28 Aug 2022 10:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0669360B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id of16OomixIl0; Sun, 28 Aug 2022 10:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AEC660585;
	Sun, 28 Aug 2022 10:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AEC660585
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9661BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29E3B4049D
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E3B4049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWchsexpaJ9z for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EECA40420
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EECA40420
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AF7BD87EA4; Sun, 28 Aug 2022 10:00:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 12:13:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8fe5de96f700bc93b64c61e6e4075555f025fa1f
X-Git-Newrev: 5ac054b45ebf6669206c8bf2cb26f83cc229aa00
X-Patchwork-Hint: ignore
Message-Id: <20220828100020.AF7BD87EA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/poco: reflow
 multi-line assignments
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ac054b45ebf6669206c8bf2cb26f83cc229aa00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rule is one-item per line in multi-line assignments, starting with
the first item on its own line too?

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/poco.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3bcc42c455..bf18126a82 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,7 +11,9 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
-POCO_DEPENDENCIES = pcre2 zlib \
+POCO_DEPENDENCIES = \
+	pcre2 \
+	zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
@@ -19,7 +21,9 @@ POCO_DEPENDENCIES = pcre2 zlib \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
-POCO_OMIT = Data/ODBC PageCompiler \
+POCO_OMIT = \
+	Data/ODBC \
+	PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
 	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
