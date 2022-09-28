Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B7C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE2F60ECD;
	Wed, 28 Sep 2022 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE2F60ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s698rjmuuyIv; Wed, 28 Sep 2022 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A17760EA1;
	Wed, 28 Sep 2022 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A17760EA1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A223A1C113E
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E17580D8C
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E17580D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsJFnCy8fZvJ for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E7B80D2A
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E7B80D2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 866D28643D; Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:56:48 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 95ea81d644d21cce5a75f6fa1b40c9fff5f0a19c
X-Git-Newrev: 8d4a082225698d5d7dcb744eab60da1e20e56533
X-Patchwork-Hint: ignore
Message-Id: <20220928212328.866D28643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/botan: fix build
 with sh4{a, eb, aeb}
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d4a082225698d5d7dcb744eab60da1e20e56533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with sh4{a,eb,aeb} probably raised since
the addition of the package in commit
e43da7bb32285bbd41b38a379aef77132d149df7:

  ERROR: Unknown or unidentifiable processor "sh4a"

Fixes:
 - http://autobuild.buildroot.org/results/fb6885a8a299f20ed77e4c10b330d2a2a7853931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dbff193c74bfda9cee96e3f6975f7430dd5acbd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Add-superh-alias-needed-by-Debian.patch   | 22 ++++++++++++++++
 ...build-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
new file mode 100644
index 0000000000..c6236849e9
--- /dev/null
+++ b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
@@ -0,0 +1,22 @@
+From 454c7c04385a47d511cf8999ccff2746afbab06b Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sat, 21 Nov 2020 12:37:06 -0500
+Subject: [PATCH] Add superh alias needed by Debian
+
+[Retrieved from:
+https://github.com/randombit/botan/commit/454c7c04385a47d511cf8999ccff2746afbab06b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/build-data/arch/superh.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
+index 6af6dbe682..8e2833a914 100644
+--- a/src/build-data/arch/superh.txt
++++ b/src/build-data/arch/superh.txt
+@@ -1,4 +1,5 @@
+ 
+ <aliases>
+ sh4
++sh4a
+ </aliases>
diff --git a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
new file mode 100644
index 0000000000..aa9f3ad5ba
--- /dev/null
+++ b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
@@ -0,0 +1,30 @@
+From c88897ebaf173b97068811b520a4741039f09dcd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Aug 2022 15:16:22 +0200
+Subject: [PATCH] src/build-data/arch/superh.txt: add sh4{eb,aeb}
+
+Fix the following build failure with sh4{eb,aeb}:
+
+  ERROR: Unknown or unidentifiable processor "sh4aeb"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d7750b734736a66e10bc5a8ee06708041b36443a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/randombit/botan/commit/c88897ebaf173b97068811b520a4741039f09dcd]
+---
+ src/build-data/arch/superh.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
+index 8e2833a914..e17edb097a 100644
+--- a/src/build-data/arch/superh.txt
++++ b/src/build-data/arch/superh.txt
+@@ -2,4 +2,6 @@
+ <aliases>
+ sh4
+ sh4a
++sh4eb
++sh4aeb
+ </aliases>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
