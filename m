Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16B9610A3
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E16B9610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B395E40593;
	Wed, 27 Oct 2021 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6ReFCdEa0_N; Wed, 27 Oct 2021 20:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5D740594;
	Wed, 27 Oct 2021 20:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAA381BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB378607AF
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oijl24HAaFDH for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 271D360B27
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C9E3689047; Wed, 27 Oct 2021 20:27:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:30:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31269b211bf31e69f5751d3e486ab7dcb80a9490
X-Git-Newrev: bcde80febd2f0455ba5c34f8aa870fc8133749ae
X-Patchwork-Hint: ignore
Message-Id: <20211027202730.C9E3689047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpsl: remove docs config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcde80febd2f0455ba5c34f8aa870fc8133749ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is only available in master and not any release.

Fixes:
output/build/libpsl-0.21.1/meson.build:1:0: ERROR: Unknown options: "docs"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libpsl/libpsl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index 69e5da4ca4..5dc03a7c24 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -10,7 +10,6 @@ LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
-LIBPSL_CONF_OPTS = -Ddocs=false
 
 # The order of checks is the same as done by libpsl when configured.
 ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
