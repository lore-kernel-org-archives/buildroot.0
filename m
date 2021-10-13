Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CC7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398F4610A2
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 398F4610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B1181045;
	Wed, 13 Oct 2021 18:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMCFR37eogu9; Wed, 13 Oct 2021 18:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6942580F30;
	Wed, 13 Oct 2021 18:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92C1D1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F78960D50
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHPUydQ8UlIl for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B47560D5D
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 18514958EB; Wed, 13 Oct 2021 18:24:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1868145c55345b5bc923f027abc7c8bb985e2a14
X-Git-Newrev: 7633915abb0e86599cbadbf88caef9b9884bb8fa
X-Patchwork-Hint: ignore
Message-Id: <20211013182445.18514958EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: fix build with autoconf
 >= 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=7633915abb0e86599cbadbf88caef9b9884bb8fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:

>>> openocd 0.11.0 Autoreconfiguring
autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?

Fixes:
 - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...gure.ac-fix-autoreconf-with-autoconf-2.70.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..ecb716b6fa
--- /dev/null
+++ b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
@@ -0,0 +1,32 @@
+From 3106d16bbc45de52bc0a8b638a84aa9d7c9abc46 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Oct 2021 17:43:16 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
+
+Fix the following build failure raised with openocd and autoconf >= 2.70
+due to
+http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:
+
+>>> openocd 0.11.0 Autoreconfiguring
+autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/msteveb/jimtcl/pull/209]
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/jimtcl/configure.ac b/jimtcl/configure.ac
+index b70b5d8..8c45114 100644
+--- a/jimtcl/configure.ac
++++ b/jimtcl/configure.ac
+@@ -1 +1,3 @@
+ # Dummy configure.ac to make automake happy
++AC_INIT([jimtcl], [0.80])
++AC_OUTPUT
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
