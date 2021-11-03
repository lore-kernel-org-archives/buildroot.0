Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C497C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A223961058
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A223961058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BF560B02;
	Wed,  3 Nov 2021 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pG4ojU0prti; Wed,  3 Nov 2021 20:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1E560AF5;
	Wed,  3 Nov 2021 20:56:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71D431BF9C8
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61E6D404F6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccvVouiQOtRs for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B17CB403C3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1ED1E8A3BA; Wed,  3 Nov 2021 20:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 20:53:47 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8250c713f06b4597cece176b69bf63aca28ffb47
X-Git-Newrev: 4ff3acf45d55b3a5fd1bbc937108a869cc4b2883
X-Patchwork-Hint: ignore
Message-Id: <20211103205252.1ED1E8A3BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pango: fix
 fontconfig meson option
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ff3acf45d55b3a5fd1bbc937108a869cc4b2883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
output/build/pango-1.48.10/meson.build:1:0: ERROR: Unknown options: "use_fontconfig"

(WARNING for now, but will be an error in meson 0.60.0).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 15a7be2c121c73f99dd699b108d817593dc86f7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 104551a1fa..7d3d6626d9 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -13,8 +13,8 @@ PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 PANGO_CPE_ID_VENDOR = pango
 
-PANGO_CONF_OPTS = -Duse_fontconfig=true
-HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
+PANGO_CONF_OPTS = -Dfontconfig=enabled
+HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
 
 PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
