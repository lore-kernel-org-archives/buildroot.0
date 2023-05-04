Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2597AC77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 17:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA92D40C19;
	Thu,  4 May 2023 17:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA92D40C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbuCdn00fm_w; Thu,  4 May 2023 17:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB5FC429E1;
	Thu,  4 May 2023 17:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5FC429E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 937651BF3BC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7C342731
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7C342731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlMfUTfKuswr for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 17:36:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988C4427A5
 for <buildroot@buildroot.org>; Thu,  4 May 2023 17:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988C4427A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A56D85D35; Thu,  4 May 2023 17:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 19:31:39 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a07e9f253d9f5a771b236a735d711379404f4ade
X-Git-Newrev: b25cfba01e5bd3d46a725c3f8955963a428951d6
X-Patchwork-Hint: ignore
Message-Id: <20230504173637.7A56D85D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rtl8723ds: fix
 typo CLAGS renaming with CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=b25cfba01e5bd3d46a725c3f8955963a428951d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7c30ba90ce581b3cb8ac9b0ba304fddab20d4ba6)
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
