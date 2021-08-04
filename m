Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EEDC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:53:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1184360F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1184360F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA9CD60AA2;
	Thu,  5 Aug 2021 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgo4XXTQ7_b7; Thu,  5 Aug 2021 19:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3779E60A80;
	Thu,  5 Aug 2021 19:53:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 604131C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5ADA83BB4
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfe2UvIYijm1 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE5183B65
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3CF5387DA7; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:11:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e17946b409c84afd15c7de47df2c8ad4dd648fae
X-Git-Newrev: 506bace2fe1f1236b9888f4cc7bd32d1c81760f0
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.3CF5387DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libodb-mysql: fix
 build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=506bace2fe1f1236b9888f4cc7bd32d1c81760f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/8f0/8f0e3b604ff9809e3b415036b8d99521db33c4db
http://autobuild.buildroot.net/results/d03/d038b79e719c37a93d635c6b61443033094d8716

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libodb-mysql/libodb-mysql.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index a9040c65f8..88b6f4cb31 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,6 +12,8 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
-LIBODB_MYSQL_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
+LIBODB_MYSQL_CONF_ENV = \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+	LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
