Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980E3C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CFB611EE;
	Mon,  6 Jun 2022 12:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lg7TcIuryj-A; Mon,  6 Jun 2022 12:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DBF61110;
	Mon,  6 Jun 2022 12:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB3E1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC6F418F8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaXKEuz-fo4I for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84CB41949
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95DA486CE1; Mon,  6 Jun 2022 12:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:21:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bb84b5b42ce7b0f12c0a8486065c13c1392b7553
X-Git-Newrev: dc2cf9ace555b1f4447e5a3abb34ea891805b753
X-Patchwork-Hint: ignore
Message-Id: <20220606121131.95DA486CE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/janet: security
 bump to version 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc2cf9ace555b1f4447e5a3abb34ea891805b753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-30763: Janet before 1.22.0 mishandles arrays.

https://github.com/janet-lang/janet/releases/tag/v1.22.0
https://blog.convisoappsec.com/en/bug-hunting-in-the-janet-language-interpreter

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 228a92f6bd90552424a3b7cf6b105e0ffdd1af3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index aff8e95bb5..a93129cfa5 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  52db8d18f93351256d0731810e8bea95516db8142f51eeb31664f7884bf63088  janet-1.21.2.tar.gz
+sha256  7c6969f8e82badc7afa28aa1054555c1c91d2858f9f45c41a82557f5c5ce85bd  janet-1.22.0.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 24a0f86032..ad09d47c6a 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.21.2
+JANET_VERSION = 1.22.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
