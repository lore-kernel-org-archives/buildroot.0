Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF56C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077BE61100
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 077BE61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9615E40677;
	Fri, 10 Sep 2021 20:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xx_07mFarlRn; Fri, 10 Sep 2021 20:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B085540659;
	Fri, 10 Sep 2021 20:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A752F1BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3F7B605CA
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnB18M7wOncC for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AA28605C6
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:18:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 38D7688E6B; Fri, 10 Sep 2021 20:17:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6ff11fd9db0732bf3ba4ccb8cc0f14811f992ae
X-Git-Newrev: 62b4fa2d7b543cfbacbc8fa112a88fa575b23eb3
X-Patchwork-Hint: ignore
Message-Id: <20210910201714.38D7688E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: needs xserver
 SELinux module
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62b4fa2d7b543cfbacbc8fa112a88fa575b23eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xserver is needed to fix the following build failure raised since commit
613827c5b0a2bf71320047954639dc9003524db0:

Compiling targeted policy.33
env LD_LIBRARY_PATH="/data/buildroot-autobuilder/instance-0/output-1/host/lib:/data/buildroot-autobuilder/instance-0/output-1/host/usr/lib" /data/buildroot-autobuilder/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
policy.conf:3071:ERROR 'attribute input_xevent_type is not declared' at token ';' on line 3071:
type xscreensaver_helper_t;
type xscreensaver_input_xevent_t, input_xevent_type, xevent_type;
checkpolicy:  error(s) encountered while parsing configuration
make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/2b5/2b546153ff8b9a11a5bb8475b918f220dd5b1787/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xscreensaver/xscreensaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index d2c34679cd..79062e49ba 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -11,7 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
-XSCREENSAVER_SELINUX_MODULES = xscreensaver
+XSCREENSAVER_SELINUX_MODULES = xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
