Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6FDC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25750605CE;
	Mon, 25 Mar 2024 22:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK0J7uequEaz; Mon, 25 Mar 2024 22:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4950D608C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4950D608C1;
	Mon, 25 Mar 2024 22:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D27291BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF6484071C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqwN3S6QbbdK for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B1640714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B1640714
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:22:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 506C8840BB; Mon, 25 Mar 2024 22:22:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:18:25 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0c81c1e7fa6d1323f70c38416ec34cf61e6a4e23
X-Git-Newrev: b22928f7d5ad7ece27da92d1ba5b8e15d71dbd08
X-Patchwork-Hint: ignore
Message-Id: <20240325222211.506C8840BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/xvisor: use
 BR2_PYTHON3_HOST_DEPENDENCY to ensure python3 is available
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

commit: https://git.buildroot.net/buildroot/commit/?id=b22928f7d5ad7ece27da92d1ba5b8e15d71dbd08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 24e996d14d28d (package/xvisor: fix build without python interpreter)
added a dependency on host-python3 for the d2c.py script, but this script
does not use any non-standard python modules so we can instead use
BR2_PYTHON3_HOST_DEPENDENCY to only build host-python3 if the build host
does not have python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f08dc612c2a52a297c50bc047d5fabd7ef7317c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/xvisor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 2a51706b55..c1b61270f1 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 XVISOR_MAKE_TARGETS = all
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
