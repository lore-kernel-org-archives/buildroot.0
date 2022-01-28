Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A90C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E052561149;
	Fri, 28 Jan 2022 18:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxpozOpovrSS; Fri, 28 Jan 2022 18:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0FD61145;
	Fri, 28 Jan 2022 18:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1FFB1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF14A40580
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zq1EsYPkrguT for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6F16400D3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5F1D482B2E; Fri, 28 Jan 2022 18:30:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 19:35:11 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 681fc3e74c2cdacad5f02682bf4314dad7112472
X-Git-Newrev: e4390ab28726ee48226a48ed112100239427ae2e
X-Patchwork-Hint: ignore
Message-Id: <20220128183025.5F1D482B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/enlightenment:
 change download URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4390ab28726ee48226a48ed112100239427ae2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: also change in Config.in]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f6297befe176a2f33b8c598139f73d7e0b9f91c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/Config.in        | 2 +-
 package/enlightenment/enlightenment.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 91cdd896f6..e4affc1eec 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	  KDE. Enlightenment can be used as a substitute for a full
 	  desktop environment.
 
-	  http://www.enlightenment.org/
+	  https://www.enlightenment.org/
 
 comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.8"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 969b391cdc..7684009996 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -6,7 +6,7 @@
 
 ENLIGHTENMENT_VERSION = 0.24.2
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
+ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
 ENLIGHTENMENT_LICENSE_FILES = COPYING \
 	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
