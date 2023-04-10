Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CDBC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217E060615;
	Mon, 10 Apr 2023 19:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217E060615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfTSC8Cw3WDB; Mon, 10 Apr 2023 19:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64B686FE99;
	Mon, 10 Apr 2023 19:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B686FE99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12CFE1C3BA3
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD84613E2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD84613E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35WswV4RNu1Z for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA8261401
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA8261401
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EA8483DBB; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:23:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9d215d42b9dad6bc73530942de1bd983fbadc7e0
X-Git-Newrev: 61acdc604784cabc32130f8a48edb2aa187b9c6e
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.1EA8483DBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/linux-tools:
 perf: ditch redundant -f 'rm' flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=61acdc604784cabc32130f8a48edb2aa187b9c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The value of the RM variable in make is 'rm -f' [0], thus the additional
-f is redundant.

[0] https://www.gnu.org/software/make/manual/make.html#index-RM

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 37e63bb2c98052939de9b4e6cb30002016055c05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index dda63cccec..5431c78152 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -166,8 +166,8 @@ endef
 # target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
 ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
 define PERF_INSTALL_REMOVE_SCRIPTS
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
