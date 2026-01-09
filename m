Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FA8D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B0940CAE;
	Tue, 13 Jan 2026 19:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khyzhZfxsBgP; Tue, 13 Jan 2026 19:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D63C408D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333319;
	bh=z+DQZOH3Lgk+vgfcaSMuSB3itj9xORf5X9zJAuaU46o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mv6MQeO9jOTCqNoNwg/vqlvzQy7Fcrq5LrEnX4HhVnTq/1293X7Vq5ZTmaCcuahVx
	 +cPUs2NASsu3ofgTJZ1YwgGzmZwM5CrjI3n/xNCLlWnV5qi8HQNPPehcUkewydI6/C
	 I17eqVAmnStRejzSxLph4qqXHa5T3P9i6pN0F66i0qt5uHen4dohyOhBnxdAfORstj
	 3Eqgs5gg7dgg/k95jvxPpIVBkOdXXVyNNdbAnH7tPhOc6mBYKMduho/Y8QZM8HY9CW
	 w7Gq+0sC5Tf/klwiGckgpQkJjWiQYOI7Tn0a5WQJFXDSjqq3Hs06xLra2YR1ZL/cT4
	 9Cwi78oy08k0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D63C408D0;
	Tue, 13 Jan 2026 19:41:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 226C02CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D551406DB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv0A6_JYBjch for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E5BF406E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E5BF406E2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CC4380840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:55:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 82c003dbee1de23468edf38e796725bd52d04165
X-Git-Newrev: 0475b9df92b16658b2d8bd1319ac05627765dc7e
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.1CC4380840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qt6/qt6base: use
 correct QT6BASE_CONF_OPTS variable for Vulkan
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0475b9df92b16658b2d8bd1319ac05627765dc7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The Vulkan option was appended to QT6BASE_CONFIGURE_OPTS instead of
QT6BASE_CONF_OPTS, which is the variable actually used during CMake
configuration. This prevented the feature from being enabled/disabled
as expected.

Fixes: 1c27f3a12d77b ("package/qt6base: add vulkan option")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 451e735aa06b2bd986418118923ea7590a5b83a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 51a4f1b5be..3bf4a1221b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -183,9 +183,9 @@ QT6BASE_DEPENDENCIES += freetype
 
 ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
 QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=ON
 else
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
