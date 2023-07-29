Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A455C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E779381FF7;
	Sat, 29 Jul 2023 22:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E779381FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsmLc7M1Pdos; Sat, 29 Jul 2023 22:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AAF781FE7;
	Sat, 29 Jul 2023 22:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AAF781FE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 734B31BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B767410D8
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B767410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlYLAjBEBkj0 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:12:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9A1410D1
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9A1410D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A0D683B79; Sat, 29 Jul 2023 22:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 00:12:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2284dce40b0ed1cfaebbc9de4056292e3f2d1a3c
X-Git-Newrev: 5d615c17eec5dd22aacd86e3c2bf2dca6ed401bb
X-Patchwork-Hint: ignore
Message-Id: <20230729221229.3A0D683B79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: copy modprobe.d config
 to target
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d615c17eec5dd22aacd86e3c2bf2dca6ed401bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rtl8821cu repository comes with a 8821cu.conf file intended to be installed
in /etc/modprobe.d - the configuration file enables some driver features.

Install the /etc/modprobe.d/8821cu.conf file to the target.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8821cu/rtl8821cu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 2a42a0f28e..5b21b04404 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -29,5 +29,11 @@ RTL8821CU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
 
+define RTL8821CU_INSTALL_MODPROBE_CONF
+	$(INSTALL) -m 0644 -D $(@D)/8821cu.conf \
+		$(TARGET_DIR)/etc/modprobe.d/8821cu.conf
+endef
+RTL8821CU_POST_INSTALL_TARGET_HOOKS += RTL8821CU_INSTALL_MODPROBE_CONF
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
