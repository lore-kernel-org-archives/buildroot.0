Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893DBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:25:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F65860F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F65860F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C94D60673;
	Tue,  3 Aug 2021 21:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXEsdEsdO1zB; Tue,  3 Aug 2021 21:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646176068B;
	Tue,  3 Aug 2021 21:25:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFBD1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F3160641
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTMOovl3Mx7I for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8256060838
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CD1838652B; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 09:08:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dc579e498b6820893b0671a740b9261f40166ad9
X-Git-Newrev: 808fbb17fc721a4fd3e28ad12582ae267a486ac3
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.CD1838652B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bullet: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=808fbb17fc721a4fd3e28ad12582ae267a486ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build without threads fails because demo apps are not disabled since
commit 5f154799b6ed772a0c028072996e110fac131508

Fixes:
 - http://autobuild.buildroot.org/results/9db945ce0709f4116d2c1c7544322144b6e473bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bullet/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index 1f632b8931..0c420e8212 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
@@ -9,6 +10,6 @@ config BR2_PACKAGE_BULLET
 
 	  http://bulletphysics.org
 
-comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
+comment "bullet needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
