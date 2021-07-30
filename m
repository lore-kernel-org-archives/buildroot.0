Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598F2C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2290960F3A
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2290960F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F185E4067C;
	Fri, 30 Jul 2021 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4BaoH0-TBbl; Fri, 30 Jul 2021 21:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A32640653;
	Fri, 30 Jul 2021 21:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C51531BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C80F560603
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_0SmUeutklM for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B38606E8
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 78E868A272; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da5a3878cf999d7780d5b74e28b216259914a78a
X-Git-Newrev: dd1ed4e366e2ff76c37c31e8a2af0129d10fbb63
X-Patchwork-Hint: ignore
Message-Id: <20210730213535.78E868A272@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix build with minidlna
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dd1ed4e366e2ff76c37c31e8a2af0129d10fbb63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure with minidlna raised since commit
e3c31814adaa3e773c310cd97e28ffea9b980a10

Fixes:
 - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...les-services-minidlna.te-make-xdg-optiona.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
new file mode 100644
index 0000000000..c4e98ad141
--- /dev/null
+++ b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
@@ -0,0 +1,52 @@
+From 65c87bdfb1c895934582988f03f1c9c452c1426b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Jul 2021 17:59:15 +0200
+Subject: [PATCH] policy/modules/services/minidlna.te: make xdg optional
+
+Make xdg optional to avoid the following build failure:
+
+ Compiling targeted policy.28
+ env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-1/output-1/host/lib:/home/buildroot/autobuild/instance-1/output-1/host/usr/lib" /home/buildroot/autobuild/instance-1/output-1/host/usr/bin/checkpolicy -c 28 -U deny -S -O -E policy.conf -o policy.28
+ policy/modules/services/minidlna.te:85:ERROR 'unknown type xdg_music_t' at token ';' on line 146109:
+ #line 85
+	allow minidlna_t xdg_music_t:dir { getattr search open };
+ checkpolicy:  error(s) encountered while parsing configuration
+ Rules.monolithic:78: recipe for target 'policy.28' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa/build-end.log
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/396]
+---
+ policy/modules/services/minidlna.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/minidlna.te b/policy/modules/services/minidlna.te
+index b980d2707..4d87e8ee7 100644
+--- a/policy/modules/services/minidlna.te
++++ b/policy/modules/services/minidlna.te
+@@ -82,10 +82,6 @@ logging_search_logs(minidlna_t)
+ miscfiles_read_localization(minidlna_t)
+ miscfiles_read_public_files(minidlna_t)
+ 
+-xdg_read_music(minidlna_t)
+-xdg_read_pictures(minidlna_t)
+-xdg_read_videos(minidlna_t)
+-
+ tunable_policy(`minidlna_read_generic_user_content',`
+ 	userdom_list_user_tmp(minidlna_t)
+ 	userdom_read_user_home_content_files(minidlna_t)
+@@ -101,3 +97,9 @@ tunable_policy(`minidlna_read_generic_user_content',`
+ 	userdom_dontaudit_read_user_home_content_files(minidlna_t)
+ 	userdom_dontaudit_read_user_tmp_files(minidlna_t)
+ ')
++
++optional_policy(`
++	xdg_read_music(minidlna_t)
++	xdg_read_pictures(minidlna_t)
++	xdg_read_videos(minidlna_t)
++')
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
