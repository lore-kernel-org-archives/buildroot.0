Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15234ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3276FAEE;
	Fri, 16 Sep 2022 22:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3276FAEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsxGLbSTdv6m; Fri, 16 Sep 2022 22:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A426FAE4;
	Fri, 16 Sep 2022 22:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A426FAE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC4D1BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44C256FAE4
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C256FAE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xp1qUerFkeER for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749BF6FAEB
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749BF6FAEB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6352583E72; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:54:47 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b2fb18e6d058675bb17aa8b9c841b14470d93ba9
X-Git-Newrev: 9d97ac7aa00b4662a2d031451c9d7e65028fe8c7
X-Patchwork-Hint: ignore
Message-Id: <20220916215809.6352583E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/linux-tools/linux-tool-perf.mk.in: Fix disabling of documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d97ac7aa00b4662a2d031451c9d7e65028fe8c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We are trying to not build the perf documentation. However, the hook
being used to do so was named incorrectly. As a result, the build steps
to disable the documentation were never executed.

Rename the hook from
    LINUX_POST_PATCH_HOOKS
to
    LINUX_TOOLS_POST_PATCH_HOOKS
to fix the issue.

Fixes: 20b144666909 ("linux/tools: make it a real, separate package")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 612ae4bd180de764becb48f609ffe836d362a87b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d82d45973c..3ec4dc6fee 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -126,7 +126,7 @@ define PERF_DISABLE_DOCUMENTATION
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
