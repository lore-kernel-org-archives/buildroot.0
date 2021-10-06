Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0955C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7798E611CC
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7798E611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4726B403FE;
	Wed,  6 Oct 2021 06:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u1tE1c827lK; Wed,  6 Oct 2021 06:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C03C40443;
	Wed,  6 Oct 2021 06:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4146E1BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3767340762
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHmcYwAdtDky for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48DA140445
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0031B91AE0; Wed,  6 Oct 2021 06:01:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 07:59:42 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 87a49efa962240cd8af856e3dcaf52bea0cfe0bf
X-Git-Newrev: d13ad855181d573885ea127ef42f0b84e187539d
X-Patchwork-Hint: ignore
Message-Id: <20211006060141.0031B91AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/mtr: add libcap
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d13ad855181d573885ea127ef42f0b84e187539d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

libcap is an optional dependency which is enabled by default since
version 0.88 and
https://github.com/traviscross/mtr/commit/2ff8de310222d26d10b13a104a1a82f2b86a84c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit 3d99699f82eeb4d7c3eec00aba547556969a85ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtr/mtr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 263482534e..7198cbcc1c 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -8,7 +8,10 @@ MTR_VERSION = 0.93
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
-MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
+MTR_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
