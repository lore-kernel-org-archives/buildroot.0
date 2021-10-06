Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E77C433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A7161151
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43A7161151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 212A34078C;
	Wed,  6 Oct 2021 06:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chbUXe07LGtB; Wed,  6 Oct 2021 06:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71DB340751;
	Wed,  6 Oct 2021 06:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D45251BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C91B6403FB
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYsyaL7SS4D3 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:04:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08F92403F9
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:04:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B509C918E6; Wed,  6 Oct 2021 06:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 08:02:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a52b46e00ecb4a54147fe792202ce30b8d3dc524
X-Git-Newrev: 3f942b0c1566201fcb31336d9186ba3dab02a1eb
X-Patchwork-Hint: ignore
Message-Id: <20211006060126.B509C918E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mtr: add libcap
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f942b0c1566201fcb31336d9186ba3dab02a1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
