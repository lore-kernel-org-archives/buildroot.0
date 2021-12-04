Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7075FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CE240245;
	Sat,  4 Dec 2021 22:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sg3DPniYcbus; Sat,  4 Dec 2021 22:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5340A401AF;
	Sat,  4 Dec 2021 22:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 318951BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2105D606CA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hEt9HFMpz5y for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:12:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658666064C
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:12:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 32754935F5; Sat,  4 Dec 2021 22:07:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:12:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 500bc8bde085ab1cbbe091ea60ac79554262ce85
X-Git-Newrev: e53e43da1277dfdd7bef564c179b918320757e51
X-Patchwork-Hint: ignore
Message-Id: <20211204220759.32754935F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/inadyn: bump to
 version 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e53e43da1277dfdd7bef564c179b918320757e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream changing to .tar.gz, prepare by dropping INADYN_SOURCE,
as suggested by utils/check-package.

See the ChangeLog, or release notes at GitHub, for full details:
https://github.com/troglobit/inadyn/releases/tag/v2.9.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/inadyn/inadyn.hash | 4 ++--
 package/inadyn/inadyn.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 638f92d119..801400b2f5 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.8.1/inadyn-2.8.1.tar.xz.sha256
-sha256  1185a9fb165bfc5f5b5f66f0dd8a695c9bd78d4b20cd162273eeea77f2d2e685  inadyn-2.8.1.tar.xz
+# Upstream .sha256 from GitHub
+sha256  b90c02a4f1964d8c1f3e178b6ef22eb29c689cd9e09669af17a8fd998c87dab5  inadyn-2.9.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index c115e8926d..fc04fd5f25 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.8.1
+INADYN_VERSION = 2.9.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
 INADYN_DEPENDENCIES = host-pkgconf libconfuse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
