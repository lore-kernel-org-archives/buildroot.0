Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C0BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:35:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E9961037
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2E9961037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F3880DCA;
	Sun, 14 Nov 2021 13:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umjoRfwiPsJd; Sun, 14 Nov 2021 13:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203B980DB7;
	Sun, 14 Nov 2021 13:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AADA71BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E2D4030A
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ui4JF71O4mIE for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:35:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0C840307
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AA1348CA65; Sun, 14 Nov 2021 13:31:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:34:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 130a28d446564ce1053ddd977fcd4da9243e24c1
X-Git-Newrev: cc9b5797515b3c8f21c2d70c980dc3e0a93200c9
X-Patchwork-Hint: ignore
Message-Id: <20211114133101.AA1348CA65@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: add zstd
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc9b5797515b3c8f21c2d70c980dc3e0a93200c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

zstd is an optional dependency which is enabled by default since version
5.13.0 and
https://github.com/qt/qtbase/commit/f25bc30d8d9d13fffd34213dfbf5e7373a18222a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9da3de468a..b04d710d78 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -116,6 +116,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-cups
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT5BASE_DEPENDENCIES += zstd
+QT5BASE_CONFIGURE_OPTS += -zstd
+else
+QT5BASE_CONFIGURE_OPTS += -no-zstd
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
