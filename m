Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEAFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0175860E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0175860E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D011760692;
	Tue, 26 Oct 2021 18:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXfFX-2gSrSw; Tue, 26 Oct 2021 18:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E1F606A0;
	Tue, 26 Oct 2021 18:35:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2671BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A4C060692
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4TmOVreVLqk for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7243606CF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D677188E6D; Tue, 26 Oct 2021 18:30:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:30:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5aa853dfb852a1ab5373373f1afdd02fd3827b5b
X-Git-Newrev: 490955a476f9cc88ee29c85ce223a3f15058eea4
X-Patchwork-Hint: ignore
Message-Id: <20211026183005.D677188E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/smcroute: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=490955a476f9cc88ee29c85ce223a3f15058eea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override SMCROUTE_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5c9764be06ff772dfa4bfbf860b936dbcd859640)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..45f4d6c1f0 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -16,7 +16,7 @@ SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
 SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-SMCROUTE_DEPENDENCIES = libcap
+SMCROUTE_DEPENDENCIES += libcap
 SMCROUTE_CONF_OPTS += --with-libcap
 else
 SMCROUTE_CONF_OPTS += --without-libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
