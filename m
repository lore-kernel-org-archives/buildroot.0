Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D1C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011617008B;
	Tue, 21 Feb 2023 02:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011617008B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7aPwt1fB6TV; Tue, 21 Feb 2023 02:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 476CA70314;
	Tue, 21 Feb 2023 02:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 476CA70314
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89D251BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6191381252
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6191381252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DMja9xldtUG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:33:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8836880F60
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8836880F60
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7886D864C8; Mon, 20 Feb 2023 22:33:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 23:32:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8c4b360fd40e5b266c851588a81aff102afaec7
X-Git-Newrev: f2c1e10b8ac3531ab5a48e23c23b702cd24b3f73
X-Patchwork-Hint: ignore
Message-Id: <20230220223303.7886D864C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tinyalsa: add option
 to enable utility tools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2c1e10b8ac3531ab5a48e23c23b702cd24b3f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add option to enable useful tools,
like tinyplay, tinymix, etc.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyalsa/Config.in   | 9 +++++++++
 package/tinyalsa/tinyalsa.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
index d9ce22c8a7..b4d4aeb276 100644
--- a/package/tinyalsa/Config.in
+++ b/package/tinyalsa/Config.in
@@ -13,5 +13,14 @@ config BR2_PACKAGE_TINYALSA
 
 	  https://github.com/tinyalsa/tinyalsa
 
+if BR2_PACKAGE_TINYALSA
+
+config BR2_PACKAGE_TINYALSA_TOOLS
+	bool "tinyalsa tools"
+	help
+	  Build utility tools (tinyplay, tinycap, tinymix, tinypcminfo)
+
+endif #BR2_PACKAGE_TINYALSA
+
 comment "tinyalsa needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index b5c39e35d6..fe6d373ec8 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -9,6 +9,12 @@ TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
-TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled -Dutils=disabled
+TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled
+
+ifeq ($(BR2_PACKAGE_TINYALSA_TOOLS),y)
+TINYALSA_CONF_OPTS += -Dutils=enabled
+else
+TINYALSA_CONF_OPTS += -Dutils=disabled
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
