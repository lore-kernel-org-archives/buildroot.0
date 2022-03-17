Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA2460E4F;
	Thu, 17 Mar 2022 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1ltW4W6ar9t; Thu, 17 Mar 2022 16:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8516060B9F;
	Thu, 17 Mar 2022 16:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3AE1BF350
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE34284739
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvpqRE51RklI for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 16:55:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0D084732
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:55:47 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 16D03C60F2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:38:51 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id E9A2D240008;
 Thu, 17 Mar 2022 16:38:45 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 17:38:23 +0100
Message-Id: <20220317163823.2913753-3-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317163823.2913753-1-foss+buildroot@0leil.net>
References: <20220317163823.2913753-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/qt5/qt5base: update comment
 pointing to patches fixing CVE-2021-38593
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The patches aren't in Buildroot anymore but in the qt5base sources
directly, so let's give the commit hash of the fixes instead.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 8fd5800822..972d217ef1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -12,8 +12,9 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
-# 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+# From commits:
+# 4ce7053a59 "Avoid processing-intensive painting of high number of tiny dashes"
+# e7ea2ed27c "Improve fix for avoiding huge number of tiny dashes"
 QT5BASE_IGNORE_CVES += CVE-2021-38593
 # From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
 QT5BASE_IGNORE_CVES += CVE-2022-25255
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
