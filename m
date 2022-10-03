Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8C2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 06:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D461540231;
	Mon,  3 Oct 2022 06:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D461540231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNdyh7Biydji; Mon,  3 Oct 2022 06:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBBF40200;
	Mon,  3 Oct 2022 06:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBBF40200
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DA7D1BF275
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4268D60AB2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4268D60AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiqhymuVKMBt for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F5CC608B7
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5CC608B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59A258680D; Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Oct 2022 08:49:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2572faace9cf6b2081777068f085d577af350b3d
X-Git-Newrev: 1648c2ec369b00c3beae353a1053961fe7d0e42d
X-Patchwork-Hint: ignore
Message-Id: <20221003065325.59A258680D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1648c2ec369b00c3beae353a1053961fe7d0e42d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25d865996d1d9753fe7d4dfe39cf18c7e9f91224)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 357375c2de..ef58d17d89 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2022.08.1, released October 2nd, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: botan, busybox, docker-cli,
+	docker-engine, expat, git, haproxy, heirloom-mailx, icu,
+	imx-gpu-viv, libconfuse, libmdbx, libupnp, libxml2,
+	ltp-testsuite, m4, makedevs, mariadb, mesa3d, meson,
+	mosquitto, ncurses, openssh, pango, python3, qlibc,
+	qt5xmlpatterns, rtl8189es, rtl8723bu, rt8723ds,
+	rtl8812au-aircrack-ng, runc, sox, tinyproxy, uacme, unbound,
+	unzip, vim, xtables-addons
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14796: 64 bit time and seccomp conflict (OpenSSH server crash)
+	#14921: wpewebkit build fails because of internal build order
+
 2022.08, released September 10th, 2022
 
 	Fixes all over the tree.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index fb0f48215c..f558e52ca6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.08'
+RELEASE='2022.08.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
