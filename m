Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF6C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3799A41737;
	Sun, 25 Sep 2022 20:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3799A41737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKcky6XtlybL; Sun, 25 Sep 2022 20:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14366416D1;
	Sun, 25 Sep 2022 20:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14366416D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912461BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D3EF60C29
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3EF60C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3rPd0dAj0GO for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:46:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA7F9605F6
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7F9605F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99F3386012; Sun, 25 Sep 2022 20:46:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 22:45:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d915f70f743099d8a61f59aa237a1391ea5f57c1
X-Git-Newrev: c1d360044c29d22b4a307e05d3fb3b83bbc7a215
X-Patchwork-Hint: ignore
Message-Id: <20220925204635.99F3386012@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189es: fix
 build failure due to missing Linux options
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1d360044c29d22b4a307e05d3fb3b83bbc7a215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This driver requires:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_MMC
to build so let's add them to RTL8189ES_LINUX_CONFIG_FIXUPS.

Fixes:
http://autobuild.buildroot.net/results/4b7/4b7b5bbf5b3839d99397eb2597dd7be79f403233/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39ef6a1ebb9b5451c62acde5ffd0125386d22054)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189es/rtl8189es.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 51477ccc97..2fa6a3a483 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -13,5 +13,12 @@ RTL8189ES_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8189ES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
