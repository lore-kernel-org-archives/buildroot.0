Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE51C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF1A241BBF;
	Wed, 30 Aug 2023 11:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1A241BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyLVsVf9Fodv; Wed, 30 Aug 2023 11:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F84407D7;
	Wed, 30 Aug 2023 11:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F84407D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1231BF98D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CD941C48
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CD941C48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arIgQRNMUyaz for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F90E41C49
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F90E41C49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E20786587; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:37:49 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bb17fd587c5f73f16a3b5c56b03a767c0f73580d
X-Git-Newrev: f264dc796ca166d23662cdb0e3741dde722a0b38
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.2E20786587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/rtl8189fs:
 en/disable runtime debug according to BR2_ENABLE_RUNTIME_DEBUG
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

commit: https://git.buildroot.net/buildroot/commit/?id=f264dc796ca166d23662cdb0e3741dde722a0b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e798bfb8ff48acd54540e1347ad09c6ebf4ac29e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189fs/rtl8189fs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index ca8ea15c03..c3eef6e071 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -13,6 +13,10 @@ RTL8189FS_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+RTL8189FS_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
+endif
+
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
