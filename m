Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA50C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27138271A;
	Tue, 19 Jul 2022 15:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27138271A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7_zk65wG7NR; Tue, 19 Jul 2022 15:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7903826C2;
	Tue, 19 Jul 2022 15:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7903826C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5DE1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46280402AF
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46280402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQXJUbpO8nkf for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 596924090C
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596924090C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 53B2A83D04; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:18:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 40037b32f6ce29a6119f6f3c5a290dc5a8fc564e
X-Git-Newrev: 3678ad62f0f4392b063932d9786d87b3d165c47e
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.53B2A83D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/php: simplify icu
 configure options
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

commit: https://git.buildroot.net/buildroot/commit/?id=3678ad62f0f4392b063932d9786d87b3d165c47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Since php-7.4 upstream switched to pkg-config to detect icu:
https://github.com/php/php-src/commit/20fa2e7b58c519cc148d9658456b695884b1ecf4

Remove all unneeded code from php.mk.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f939cf7c8cb1f08f0fa43aa20c8d98b01f32ac7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 39db9d3a7c..d9c2edd839 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -176,13 +176,8 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
-PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
-PHP_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
+PHP_CONF_OPTS += --enable-intl
 PHP_DEPENDENCIES += icu
-# The intl module is implemented in C++, but PHP fails to use
-# g++ as the compiler for the final link. As a workaround,
-# tell it to link libstdc++.
-PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
