Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDE8C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B1160637;
	Wed, 14 Aug 2024 21:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1850oO3kQIZm; Wed, 14 Aug 2024 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23471608E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23471608E3;
	Wed, 14 Aug 2024 21:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C68C31BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B42BA60637
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Dm7LvJ3zuHh for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722CE608E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 722CE608E3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:02:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C4D481EE7; Wed, 14 Aug 2024 21:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:01:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a57fab586cdfc3b991384b65cb46b941de46a20
X-Git-Newrev: f31e860ae4cd29fd3d23871797d91b4f3667c806
X-Patchwork-Hint: ignore
Message-Id: <20240814210238.5C4D481EE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: fix uClibc-ng compile
 error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f31e860ae4cd29fd3d23871797d91b4f3667c806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately upstream does not use any SCM.
See here for the Changelog:
https://invisible-island.net/ncurses/NEWS.html#index-t20231014

"+ updated configure script macro CF_XOPEN_SOURCE, for uClibc-ng"

Fixes:
 - http://autobuild.buildroot.net/results/01c/01cbc188c70f53fe492128100b430857f1cd98f2
 - http://autobuild.buildroot.net/results/e2b/e2ba6a5554bfa0bf9b4c2eaf9222d041204f00e9

And many more.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch b/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
new file mode 100644
index 0000000000..130ef524b4
--- /dev/null
+++ b/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
@@ -0,0 +1,17 @@
+Fix detection of XOPEN_SOURCE
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: fixed in latest release, no git/svn/hg
+
+diff -Nur ncurses-snapshots-6_4_20230603.orig/configure ncurses-snapshots-6_4_20230603/configure
+--- ncurses-snapshots-6_4_20230603.orig/configure	2023-06-04 00:07:40.000000000 +0200
++++ ncurses-snapshots-6_4_20230603/configure	2024-08-14 20:38:03.426905460 +0200
+@@ -10411,7 +10411,7 @@
+ 	cf_xopen_source="-D_SGI_SOURCE"
+ 	cf_XOPEN_SOURCE=
+ 	;;
+-(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*)
++(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
+ 
+ cf_gnu_xopen_source=$cf_XOPEN_SOURCE
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
