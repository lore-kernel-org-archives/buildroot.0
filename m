Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8057DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C73C81419;
	Sat, 23 Apr 2022 15:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlO0uIxhPYsg; Sat, 23 Apr 2022 15:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79EB6813C2;
	Sat, 23 Apr 2022 15:14:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2C461BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB093606E7
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxZixiG3w_N6 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AC44606F5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E720283FF5; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:03:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a9e9146447df86bf1fffe6352bdc9dc5e056c5f
X-Git-Newrev: fc440e46396bf7942b539a5542a71e5232708379
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.E720283FF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.21.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc440e46396bf7942b539a5542a71e5232708379
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 50e6b1fef0..aff8e95bb5 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  02ff892f4bfc060a8a37f4a5c3e659bf34ba5f1f1c5eb07d60dc2642c5cf0476  janet-1.19.2.tar.gz
+sha256  52db8d18f93351256d0731810e8bea95516db8142f51eeb31664f7884bf63088  janet-1.21.2.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 5b6a9a182d..24a0f86032 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.19.2
+JANET_VERSION = 1.21.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
