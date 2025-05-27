Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866A0C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDD040D3D;
	Wed,  4 Jun 2025 18:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goqKV3cUMo54; Wed,  4 Jun 2025 18:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D3AE40C75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D3AE40C75;
	Wed,  4 Jun 2025 18:28:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C61522B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E216B4007B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iOmpHZfLaeh for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDAFA40084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDAFA40084
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC04D876CD; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:27:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ef8c1d0dbe9d5a5f6e4e2fc04e88d7bc793c19f
X-Git-Newrev: 74d422ea626902e8c3b69d7cd371445a00267007
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.EC04D876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt5base: drop
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74d422ea626902e8c3b69d7cd371445a00267007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 381ff2bf69bb069cd6192594979e3131f090a9d6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
