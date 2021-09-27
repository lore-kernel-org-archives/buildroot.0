Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E29DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 145D260F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 145D260F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E523E80CEB;
	Mon, 27 Sep 2021 14:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jy7GlEJUqvFR; Mon, 27 Sep 2021 14:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9BA8174C;
	Mon, 27 Sep 2021 14:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04F1D1BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDE88176D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0Z0uuyanjEA for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79231817FD
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2DC418D267; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:20:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edb65b4e6d7ecfec1bf732b6a4a047e155b22dac
X-Git-Newrev: 5e00787fb9c442c61023edd765e657df85b07793
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.2DC418D267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtr: bump to version 0.94
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e00787fb9c442c61023edd765e657df85b07793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add jansson optional dependency:
  https://github.com/traviscross/mtr/commit/c2739eaf139b96f4b4937aee9aa484f0e6d1df55
- Add libgtk3 optional dependency:
  https://github.com/traviscross/mtr/commit/5bd8e6c3ba67fdb9445b1ddc3777aca3b0f7053e
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtr/mtr.hash |  4 ++--
 package/mtr/mtr.mk   | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
index 7771e091e2..d6062ef08f 100644
--- a/package/mtr/mtr.hash
+++ b/package/mtr/mtr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3a1ab330104ddee3135af3cfa567b9608001c5deecbf200c08b545ed6d7a4c8f	mtr-0.93.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  ea036fdd45da488c241603f6ea59a06bbcfe6c26177ebd34fff54336a44494b8  mtr-0.94.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 0400a12021..07c58a1e93 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.93
+MTR_VERSION = 0.94
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
-MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap)
@@ -15,6 +14,20 @@ MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+MTR_CONF_OPTS += --with-jansson
+MTR_DEPENDENCIES += jansson
+else
+MTR_CONF_OPTS += --without-jansson
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+MTR_CONF_OPTS += --with-gtk
+MTR_DEPENDENCIES += libgtk3
+else
+MTR_CONF_OPTS += --without-gtk
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 MTR_CONF_OPTS += --with-ncurses
 MTR_DEPENDENCIES += ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
