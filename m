Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C18C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4816115B
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE4816115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775CF606BB;
	Wed,  6 Oct 2021 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8i-jsfW98EK; Wed,  6 Oct 2021 14:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A3A60600;
	Wed,  6 Oct 2021 14:35:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 638B41BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 602AF606AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csd4Q9R9F9qE for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7112605FB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A2C3F92264; Wed,  6 Oct 2021 14:32:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:19:33 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: acd584eb9019e58c85a5de2a685385e19d8b27c9
X-Git-Newrev: 43088ce478612a8009d737c21130d483df70ab8e
X-Patchwork-Hint: ignore
Message-Id: <20211006143231.A2C3F92264@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mtr: use ncurses
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

commit: https://git.buildroot.net/buildroot/commit/?id=43088ce478612a8009d737c21130d483df70ab8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
