Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572D3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2564A6121D
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2564A6121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5B1606DE;
	Mon, 13 Sep 2021 13:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ickBuqjpCDri; Mon, 13 Sep 2021 13:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F88606C6;
	Mon, 13 Sep 2021 13:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF321BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA8F400F0
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMwggXDGTBfJ for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A24400C3
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1AAE38A56C; Mon, 13 Sep 2021 13:41:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 11:45:59 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1189d1d2153ba3664754c17e326f0c3a925e315f
X-Git-Newrev: 2ada33739e2275554107ab93cda3a4d277f512d8
X-Patchwork-Hint: ignore
Message-Id: <20210913134145.1AAE38A56C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/swupdate:
 enable/disable systemd support automatically
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ada33739e2275554107ab93cda3a4d277f512d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This needs to be set properly so that services work correctly.

Enable disable automatically based on BR2_PACKAGE_SYSTEMD state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 85062dcefc352f96b309cb232bc931374e8ca077)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 12dafcc1a2..144587d11c 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -112,6 +112,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
+endef
+else
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
@@ -165,6 +172,7 @@ SWUPDATE_MAKE_OPTS = \
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_PREFER_STATIC)
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_SYSTEMD)
 endef
 
 define SWUPDATE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
