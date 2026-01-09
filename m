Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FE3D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E690860DAD;
	Tue, 13 Jan 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMDLOpf3xs0N; Tue, 13 Jan 2026 19:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FF960DB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333039;
	bh=TNre7k/k0ffaToAfExzRNm4yYSimqhR7abWom7p8nIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pa0GTEpqtvHcwjGdU5ZeB7GFw9ms7qK4ixtiELudyMf0/oIiTopHjXCtKhIXPMkOq
	 H069PnJMy6OV1q74wPJU8+XRFj7AXgqQtO3nVlKlYQCpEun2GPzSbpVtCtibLFfOA6
	 6d2uxu6YhP1M/LbtGiTmQi0l/N/YcnRhlRwBbFK1hUgX7vb3scDhyIajpjKtltL7Nl
	 7ffyNqiIKMqcFfvopBqCyjzM8le1qaD8XhcKnlupnn320KyKNEBIzuUm7yfQx6vs3w
	 vCwefjWAkkw55OOulX33vochD0ucV6hIW6vj6VJlD718mRpE3mJAnKpZRDLJ+L2HgY
	 7UtQZNS+ZVh5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05FF960DB5;
	Tue, 13 Jan 2026 19:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0581C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5306982BF4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9lsx69fRlmC for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D3282B97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44D3282B97
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43B8886E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:55:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 611e3fe80d691ab2da9927af4a367144169f9b1c
X-Git-Newrev: 8d47bca9a5a06e5b524eb29cd0e3fcddf01de4cc
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.43B8886E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt6/qt6base: use
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d47bca9a5a06e5b524eb29cd0e3fcddf01de4cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
