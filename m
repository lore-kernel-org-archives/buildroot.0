Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8A0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2335961175
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2335961175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F158B8101F;
	Wed,  3 Nov 2021 20:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8d9NGCYD8Icu; Wed,  3 Nov 2021 20:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6785780E31;
	Wed,  3 Nov 2021 20:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27A011BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AD24404EF
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPyZFHTJhVw2 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B0C404F6
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F9198A3EB; Wed,  3 Nov 2021 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 20:53:54 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: fe4da39cfb8596cbd06f581bb16ea579ff18c971
X-Git-Newrev: c3fa0f5e37b51c00484e2b6fceb0406c8ec96bf1
X-Patchwork-Hint: ignore
Message-Id: <20211103205257.3F9198A3EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/pango: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3fa0f5e37b51c00484e2b6fceb0406c8ec96bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
