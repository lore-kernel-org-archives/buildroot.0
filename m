Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD84CCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A192861519;
	Sat, 12 Oct 2024 15:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORubqyGRXTK2; Sat, 12 Oct 2024 15:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4416154E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4416154E;
	Sat, 12 Oct 2024 15:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1E6E1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58A4C404BC
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SYe-EZJoHuu for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AC6405A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AC6405A9
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9404D80795; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1d66d29acc04fdbd601d98a464685c8fe3e7c2a1
X-Git-Newrev: b09b642dc3c5a590f2b5dafbd64cefbd9ccf3ac2
X-Patchwork-Hint: ignore
Message-Id: <20241012150759.9404D80795@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt5: fix 'paths'
 typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=b09b642dc3c5a590f2b5dafbd64cefbd9ccf3ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 296b54936502a1bfd9e37f65751163be8dd14b0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index a43b36dd51..cbd25fac61 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -12,7 +12,7 @@ include $(sort $(wildcard package/qt5/*/*.mk))
 
 # The file "qt.conf" can be used to override the hard-coded paths that are
 # compiled into the Qt library. We need it to make "qmake" relocatable and
-# tweak the per-package install pathes
+# tweak the per-package install paths
 define QT5_INSTALL_QT_CONF
 	rm -f $(HOST_DIR)/bin/qt.conf
 	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
