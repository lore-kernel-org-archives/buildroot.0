Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA334C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 877B7403AC;
	Sat,  5 Feb 2022 22:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYZmVTz7bLXd; Sat,  5 Feb 2022 22:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAEC408B3;
	Sat,  5 Feb 2022 22:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA011BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28EA460BDA
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhsgJezchStg for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93BCC60806
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 82A4282AA7; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:30:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec7fd50d08690a383fec40748ac9b78c3f764316
X-Git-Newrev: 25457ba3458b932507424a9a55298282128059c8
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.82A4282AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: bump to version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=25457ba3458b932507424a9a55298282128059c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added LGPL-2.1 license specifier: libseccomp is statically-linked.

https://github.com/opencontainers/runc/releases/tag/v1.1.0

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 4ef04132bf..38d9f52510 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0eaf2f6606d72f166a5e7138a8a8d4d8f85d84e43448c08c66a1c93ead17a574  runc-1.0.3.tar.gz
+sha256  a8de57edbf0ff741ea798ccdd99ac0e1b79914f552871bd7cd92b0569f200964  runc-1.1.0.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c4e45a00a9..a40075544e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.3
+RUNC_VERSION = 1.1.0
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
-RUNC_LICENSE = Apache-2.0
+RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
