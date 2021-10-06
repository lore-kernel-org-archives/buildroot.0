Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD17C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98BF61130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A98BF61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88418407AD;
	Wed,  6 Oct 2021 14:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2SRoxeajOYa; Wed,  6 Oct 2021 14:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE3040779;
	Wed,  6 Oct 2021 14:37:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D131BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 697D74041A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUj9-RVodGWK for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7E4740100
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9494C92319; Wed,  6 Oct 2021 14:32:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:19:03 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 31bd9057685d202a0ce2b15f4aeafa0916f2c9c2
X-Git-Newrev: 568487262dbb439944e3daa1310872e9bd69b0d5
X-Patchwork-Hint: ignore
Message-Id: <20211006143256.9494C92319@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/mtr: use ncurses
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

commit: https://git.buildroot.net/buildroot/commit/?id=568487262dbb439944e3daa1310872e9bd69b0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
