Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC31C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 10:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7295D41772;
	Mon, 28 Mar 2022 10:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqqDBJHxLV45; Mon, 28 Mar 2022 10:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C18411C6;
	Mon, 28 Mar 2022 10:18:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1F91BF39E
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 10:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E81B360E35
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 10:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YejcJ5WxiuSJ for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 10:18:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D53160D50
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 10:18:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 25F17CBEB0
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 10:18:09 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 73D49C0009;
 Mon, 28 Mar 2022 10:18:03 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 11:17:51 +0100
Message-Id: <20220328101751.1606988-2-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328101751.1606988-1-foss+buildroot@0leil.net>
References: <20220328101751.1606988-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/qt5/qt5base: update comment
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
v3: rebased on top of master branch
v2: http://lists.busybox.net/pipermail/buildroot/2022-March/638900.html
 - added in v2

 package/qt5/qt5base/qt5base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 5f158bd6f2..972d217ef1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -12,7 +12,9 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
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
