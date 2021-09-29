Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD15C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:02:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C89361504
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C89361504
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 165FF4075B;
	Wed, 29 Sep 2021 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uz4fE_KjOaFe; Wed, 29 Sep 2021 20:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EAD940759;
	Wed, 29 Sep 2021 20:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 972D61BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94EB983F22
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wt4iMpJH5IJK for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 20:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F000183E7B
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 20:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D2898D6A9; Wed, 29 Sep 2021 19:58:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:59:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c21428ce8e20909d412255d171cea17331316a31
X-Git-Newrev: cdec745cb9b67c481962df8a1843fd0e1181c5fd
X-Patchwork-Hint: ignore
Message-Id: <20210929195849.8D2898D6A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/minicom: drop
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdec745cb9b67c481962df8a1843fd0e1181c5fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

autoreconf (and so AM_ICONV) is not needed since commit
2df32e0d4437b422175089edf1917219656fccef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5d25d5cb66e2d36680e405e406db6d0f4b31e3ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minicom/minicom.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index b81ee52120..5cd1d6b8b8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -11,12 +11,9 @@ MINICOM_SITE = \
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_CPE_ID_VENDOR = minicom_project
-MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
-# add host-gettext for AM_ICONV macro
-MINICOM_DEPENDENCIES += host-gettext
 
 MINICOM_CONF_OPTS = \
 	--enable-dfl-port=/dev/ttyS1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
