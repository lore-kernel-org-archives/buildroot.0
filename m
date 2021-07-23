Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE38C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D8A060EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D8A060EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079DC42376;
	Wed,  4 Aug 2021 00:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U96mvXjLQ2gu; Wed,  4 Aug 2021 00:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF85423E3;
	Wed,  4 Aug 2021 00:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 728A41BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CA6D4149E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfzJlkccWbgj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 654CD40F27
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A62B8878D7; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 00:06:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f
X-Git-Newrev: 99eb1a7019a4333f99e93b844962db301a8c3f98
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.A62B8878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apg: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=99eb1a7019a4333f99e93b844962db301a8c3f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/apg/Config.in |  6 ++++++
 package/apg/apg.hash  |  3 +++
 package/apg/apg.mk    | 21 +++++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 72d76b1f44..596670993a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -311,6 +311,7 @@ N:	Bernd Kuhls <bernd.kuhls@t-online.de>
 F:	package/alsa-lib/
 F:	package/alsa-utils/
 F:	package/apache/
+F:	package/apg/
 F:	package/apr/
 F:	package/apr-util/
 F:	package/bcg729/
diff --git a/package/Config.in b/package/Config.in
index d4150f3cd6..be70150764 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2399,6 +2399,7 @@ comment "Shells"
 	source "package/mksh/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
+	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
 	source "package/ccrypt/Config.in"
diff --git a/package/apg/Config.in b/package/apg/Config.in
new file mode 100644
index 0000000000..94c286a178
--- /dev/null
+++ b/package/apg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_APG
+	bool "apg"
+	help
+	  Automated Password Generator (APG).
+
+	  https://github.com/wilx/apg
diff --git a/package/apg/apg.hash b/package/apg/apg.hash
new file mode 100644
index 0000000000..5532289a68
--- /dev/null
+++ b/package/apg/apg.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  89539aa734a47d68124fca5ba7acbe559edc5003b6791f5200ef9e706dd00fe9  apg-2.3.0b.tar.gz
+sha256  5d0c892ea452c3828f1e311637cde4e3a04eb6431554308b3fcdac8c1b330168  COPYING
diff --git a/package/apg/apg.mk b/package/apg/apg.mk
new file mode 100644
index 0000000000..ac4dce77f9
--- /dev/null
+++ b/package/apg/apg.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# apg
+#
+################################################################################
+
+APG_VERSION = 2.3.0b
+APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
+APG_LICENSE = BSD-3-Clause
+APG_LICENSE_FILES = COPYING
+
+define APG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(APG_CFLAGS)" \
+		-C $(@D)
+endef
+
+define APG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/apg $(TARGET_DIR)/usr/bin/apg
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
