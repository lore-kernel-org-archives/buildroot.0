Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD11ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A87794049D;
	Sun, 28 Aug 2022 10:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87794049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wU9jKHAY-2C3; Sun, 28 Aug 2022 10:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C12A440420;
	Sun, 28 Aug 2022 10:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C12A440420
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ECD01BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C114046B
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C114046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ekIin8E8363r for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 695A740465
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 695A740465
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BAB8587EA5; Sun, 28 Aug 2022 10:00:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 12:14:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ac054b45ebf6669206c8bf2cb26f83cc229aa00
X-Git-Newrev: 7cb17577d42aad959a65702074061eeaf54447d7
X-Patchwork-Hint: ignore
Message-Id: <20220828100020.BAB8587EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/poco: add the new
 Prometheus component
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cb17577d42aad959a65702074061eeaf54447d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Poco Prometheus component was added in 1.12.0. See:
https://github.com/pocoproject/poco/blob/poco-1.12.0-release/CHANGELOG#L6

For Prometheus information, see: https://prometheus.io/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/Config.in | 4 ++++
 package/poco/poco.mk   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index cb447960f1..820e631966 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -92,6 +92,10 @@ config BR2_PACKAGE_POCO_PDF
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
 
+config BR2_PACKAGE_POCO_PROMETHEUS
+	bool "Prometheus"
+	select BR2_PACKAGE_POCO_NET
+
 config BR2_PACKAGE_POCO_REDIS
 	bool "Redis"
 	select BR2_PACKAGE_POCO_NET
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index bf18126a82..d078faa8e5 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -37,6 +37,7 @@ POCO_OMIT = \
 	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
 	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
+	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
 	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
