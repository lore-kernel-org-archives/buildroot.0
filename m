Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D42AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:03:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB5560F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EB5560F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CDE60AEA;
	Tue, 26 Oct 2021 20:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji93X3YT4zPG; Tue, 26 Oct 2021 20:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF6E60AD9;
	Tue, 26 Oct 2021 20:03:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5261BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4275C40275
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9cN_NiH0hyc for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABCB440400
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C49A388F3D; Tue, 26 Oct 2021 19:58:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:52:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d352ae712198799012acd2176214fbe62e2383a1
X-Git-Newrev: 15a7be2c121c73f99dd699b108d817593dc86f7e
X-Patchwork-Hint: ignore
Message-Id: <20211026195844.C49A388F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: fix fontconfig meson option
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

commit: https://git.buildroot.net/buildroot/commit/?id=15a7be2c121c73f99dd699b108d817593dc86f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
output/build/pango-1.48.10/meson.build:1:0: ERROR: Unknown options: "use_fontconfig"

(WARNING for now, but will be an error in meson 0.60.0).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
