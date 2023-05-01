Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43492C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF4F4400CC;
	Mon,  1 May 2023 11:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF4F4400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AW78-Lx-Tmof; Mon,  1 May 2023 11:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5330409A6;
	Mon,  1 May 2023 11:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5330409A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2E161BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAAB8417CE
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAAB8417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nwu4zBxxaJiz for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA35C40965
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA35C40965
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B770E84F32; Mon,  1 May 2023 11:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 13:31:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cccb966963142d2849c38ba80f17aba511f7bea
X-Git-Newrev: 7c30ba90ce581b3cb8ac9b0ba304fddab20d4ba6
X-Patchwork-Hint: ignore
Message-Id: <20230501114025.B770E84F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: fix typo CLAGS renaming
 with CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c30ba90ce581b3cb8ac9b0ba304fddab20d4ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723ds/rtl8723ds.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 1bb164fa86..f62ce2bf6c 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -9,7 +9,7 @@ RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
 
-RTL8723DS_USER_EXTRA_CLAGS = \
+RTL8723DS_USER_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
@@ -20,7 +20,7 @@ RTL8723DS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR) \
-	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CLAGS)"
+	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CFLAGS)"
 
 define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
