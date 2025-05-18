Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAE1C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C4484181;
	Mon, 19 May 2025 10:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3VPvvx9NruS; Mon, 19 May 2025 10:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0452984185
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0452984185;
	Mon, 19 May 2025 10:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB14193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3CC54192D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSnuqIUskDRQ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFED41935
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EFED41935
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9884F873D4; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a3eab8341311b08dd3508d1e2ec4e01055a9cac
X-Git-Newrev: 381ff2bf69bb069cd6192594979e3131f090a9d6
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.9884F873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: drop
 stale ignore CVE entries, add CPE version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=381ff2bf69bb069cd6192594979e3131f090a9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The qt5base was reported to have 2 stale ignore CVE entries, one not
stale. Turns out that because the version is a Git commit hash, the
version comparaison did not make a lot of sense.

This commit adds QT5BASE_CPE_ID_VERSION, assigned to the closest
upstream version that we package (the Git repo we fetch is 5.15.14
plus a number of fixes). With this done, all 3 ignore CVE entries are
stale because the vulnerabilities have been fixed prior to 5.15.14.

In addition, setting QT5BASE_CPE_ID_VERSION allows to reduce the
number of CVEs affecting qt5base from 20 to 8.

Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt5/qt5base/qt5base.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index add460c257..3ad2bdfc04 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -9,20 +9,13 @@ QT5BASE_SITE = $(QT5_SITE)/qtbase
 QT5BASE_SITE_METHOD = git
 QT5BASE_CPE_ID_VENDOR = qt
 QT5BASE_CPE_ID_PRODUCT = qt
+# Closest upstream version
+QT5BASE_CPE_ID_VERSION = 5.15.14
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# From commits:
-# 4ce7053a59 "Avoid processing-intensive painting of high number of tiny dashes"
-# e7ea2ed27c "Improve fix for avoiding huge number of tiny dashes"
-QT5BASE_IGNORE_CVES += CVE-2021-38593
-# From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
-QT5BASE_IGNORE_CVES += CVE-2022-25255
-# From commit e68ca8e51375d963b2391715f70b42707992dbd8 "Windows: use QSystemLibrary instead of LoadLibrary directly"
-QT5BASE_IGNORE_CVES += CVE-2022-25634
-
 # A few comments:
 #  * -no-pch to workaround the issue described at
 #     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
