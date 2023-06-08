Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D8C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3646341554;
	Thu,  8 Jun 2023 20:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3646341554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhYteZK83seP; Thu,  8 Jun 2023 20:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6553E41564;
	Thu,  8 Jun 2023 20:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6553E41564
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 106801BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD83183FE7
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD83183FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-ciGctNQ6Tz for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E115F83FBC
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E115F83FBC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA42A8219F; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 22:41:25 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 33127e67f1d5ac0e704ddb5406fc9f0de83bdae4
X-Git-Newrev: e3fd9ccde9d89282ec4eddb480a001dec7521d88
X-Patchwork-Hint: ignore
Message-Id: <20230608204543.CA42A8219F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cairomm1_14: use
 official website
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3fd9ccde9d89282ec4eddb480a001dec7521d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash, but only
provides xz archives (no gz).

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9d392f43437e0ee0332cac66c9d0477230ed019f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairomm1_14/Config.in        | 2 +-
 package/cairomm1_14/cairomm1_14.hash | 5 ++++-
 package/cairomm1_14/cairomm1_14.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
index 6e767d2428..e369aa6f4a 100644
--- a/package/cairomm1_14/Config.in
+++ b/package/cairomm1_14/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CAIROMM1_14
 	  This is the last version before the API and ABI change
 	  introduced in 1.16.0 which requires C++17.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
index 521e7cc546..6d58de360a 100644
--- a/package/cairomm1_14/cairomm1_14.hash
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
+sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
+
 # Locally computed
-sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
+sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
index 5d076ddf0a..6502d34c5a 100644
--- a/package/cairomm1_14/cairomm1_14.mk
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -7,8 +7,8 @@
 CAIROMM1_14_VERSION = 1.14.4
 CAIROMM1_14_LICENSE = LGPL-2.0+
 CAIROMM1_14_LICENSE_FILES = COPYING
-CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
-CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
+CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
+CAIROMM1_14_SITE = https://cairographics.org/releases
 CAIROMM1_14_INSTALL_STAGING = YES
 CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
 CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
