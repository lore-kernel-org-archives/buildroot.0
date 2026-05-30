Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92546CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 11:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 912C680F4D;
	Sat, 30 May 2026 11:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohd_TFdhayUN; Sat, 30 May 2026 11:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CA9880F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780139084;
	bh=kuiU5d/dzuYdS4NAI9aB5pFIgpz4m5VkH/xRzf0yCPE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NYGhT6ugA7UXdLXpzRvYtxcVwFUVoyxuDlm57JN+wVy619YjmsT4IF3rdvbeBl4zw
	 iTD2XGGjhs0j+tolKc+2Zee26bUpOOqdsWr+0zo0pdHAw+7ONoRYRKzVRg2gCE/ecq
	 +5r0MUQK/fBDdYCSe2Of1RwFuM2VpLVmMuiJwS8Gpku52PKRP2Jv9qrjulEHJNp7r1
	 tTutrZlsatq40au4CiRL+AUU/SxSrhh9I3YyeG+B947GnGPtipZx783ZFXJW+SU20w
	 znpufbTbRfqQOnw+4nRil9RV9Oe6msPq8OMY5zfHKbX9HtxGfQlOW/fWv1f5/fZrsM
	 2c49DrdhXiAlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CA9880F35;
	Sat, 30 May 2026 11:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE49BF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC3E4081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8J_hBalqh7U for <buildroot@buildroot.org>;
 Sat, 30 May 2026 11:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF1D407DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EF1D407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 175408747E; Sat, 30 May 2026 11:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 13:04:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fed1a6c754245977fa828a281d5d7cd977c8c8d
X-Git-Newrev: b45e479b9658fdcc6b8ee5e6ea4034d5f452c37f
X-Patchwork-Hint: ignore
Message-Id: <20260530110429.175408747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux/util-linux-libs: add
 AUTORECONF
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b45e479b9658fdcc6b8ee5e6ea4034d5f452c37f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit dd4161c39d97c7a651625dca18fa2aaab9298fa6 ("package/util-linux:
optionally add libpthread to uuid.pc") added patches to util-linux and
util-linux-libs that require autoreconf, but forgot to add autoreconf
for util-linux-libs, which this new commit fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 9340d5ae4f..6716a656d2 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -21,6 +21,9 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
+# 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
+UTIL_LINUX_LIBS_AUTORECONF = YES
+
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
