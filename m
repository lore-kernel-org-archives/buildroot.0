Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304B8CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3BA76151D;
	Tue, 17 Sep 2024 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUtym9l23ahI; Tue, 17 Sep 2024 21:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F01661520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F01661520;
	Tue, 17 Sep 2024 21:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11ADE1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FE66070F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rm85m_YNdRe4 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C55DC61149
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C55DC61149
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B955782572; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 23:06:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d1ee111aa4909c7c3b9fc98fdbccca339a056293
X-Git-Newrev: 3e6d7c9c890818d139872dd2017da05d614c6fee
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.B955782572@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/asterisk: update
 to 20.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e6d7c9c890818d139872dd2017da05d614c6fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

See here for a ChangeLog:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md

20.8.1 contains a fix for CVE-2024-35190. However, the vulnerability
was introduced in commit 68a49128253f677f9e1b235c70d2316342372f7d
between 20.7.0 and 20.8.0, and Buildroot was using 20.7.0, so we were
not affected by this vulnerability.

Patch 0005 is applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 622957a2adb224b8a666472c3a58bc1ade8a2040)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...005-res-stasis-control.c-include-signal.h.patch | 43 ----------------------
 package/asterisk/asterisk.hash                     |  2 +-
 package/asterisk/asterisk.mk                       |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
deleted file mode 100644
index fc615c4a19..0000000000
--- a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8391dc3891337ecff8becefe1927a30d3922b848 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 1 May 2024 16:50:50 +0200
-Subject: [PATCH] res/stasis/control.c: include signal.h
-
-Include signal.h to avoid the following build failure with uclibc-ng
-raised since
-https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:
-
-stasis/control.c: In function 'exec_command_on_condition':
-stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
-  313 |   pthread_kill(control->control_thread, SIGURG);
-      |   ^~~~~~~~~~~~
-      |   pthread_yield
-stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
-  313 |   pthread_kill(control->control_thread, SIGURG);
-      |                                         ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/asterisk/asterisk/pull/728
----
- res/stasis/control.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/res/stasis/control.c b/res/stasis/control.c
-index 360f20790..4ed0e2af1 100644
---- a/res/stasis/control.c
-+++ b/res/stasis/control.c
-@@ -41,6 +41,8 @@
- #include "asterisk/musiconhold.h"
- #include "asterisk/app.h"
- 
-+#include <signal.h>
-+
- AST_LIST_HEAD(app_control_rules, stasis_app_control_rule);
- 
- /*!
--- 
-2.43.0
-
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 8cb5468249..bff34b37bb 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  62adff44f5bc415627e16957e6bd528e1782a892e116ff261c46f96ca87c342b  asterisk-20.7.0.tar.gz
+sha256  bea2978c41d0f69f7197536c35c2d80cbfdf7db826f48c0741b6f66462981d2f  asterisk-20.8.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index c37aa5ec9d..bfabc92fe1 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.7.0
+ASTERISK_VERSION = 20.8.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
