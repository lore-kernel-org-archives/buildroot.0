Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90799C43217
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9E4610C8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D9E4610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9D883FAB;
	Wed,  6 Oct 2021 14:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBirP008NxmO; Wed,  6 Oct 2021 14:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790C183FAA;
	Wed,  6 Oct 2021 14:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 686721BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5784040494
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYMD8etUq9Qm for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE4E40100
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 676919229A; Wed,  6 Oct 2021 14:32:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:19:17 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f240c0b30d204a73e169eeceacff731904426d9b
X-Git-Newrev: e94767fe46366e67c4334704c0c4dbf4f8bb01e2
X-Patchwork-Hint: ignore
Message-Id: <20211006143248.676919229A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mtr: use ncurses
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=e94767fe46366e67c4334704c0c4dbf4f8bb01e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Use --with-ncurses and --without-ncurses options which are available
since version 0.88 and
https://github.com/traviscross/mtr/commit/4e2a948a167d9b8a0a63b46a423d4ae1519ad759

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit edb65b4e6d7ecfec1bf732b6a4a047e155b22dac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtr/mtr.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 7198cbcc1c..0400a12021 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -10,10 +10,16 @@ MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
-	$(if $(BR2_PACKAGE_NCURSES),ncurses)
+	$(if $(BR2_PACKAGE_LIBCAP),libcap)
 MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+MTR_CONF_OPTS += --with-ncurses
+MTR_DEPENDENCIES += ncurses
+else
+MTR_CONF_OPTS += --without-ncurses
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
