Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9174CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 21:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E4A60832;
	Sun, 16 Nov 2025 21:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QU2bPuBQ_wF9; Sun, 16 Nov 2025 21:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B68760BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B68760BB2;
	Sun, 16 Nov 2025 21:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52CAB223
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455B540273
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h9_WYRGwjtd for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89C704026E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C704026E
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A3BA847F3; Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 21:58:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2479f5ba1e14ca61fe2834d6d834b95980c48344
X-Git-Newrev: 2193b55bac7ee6e2f09d3316d75a157142462a25
X-Patchwork-Hint: ignore
Message-Id: <20251116215159.7A3BA847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: fix merged-bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2193b55bac7ee6e2f09d3316d75a157142462a25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mv: '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/bin/arping'
 and '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/sbin/arping'
 are the same file

Fixes:
https://autobuild.buildroot.net/results/dae/daeebb090f6d11d77840dd61add9bc422c6bc2fa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e00513229..1a5d3e3678 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -32,10 +32,12 @@ IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
 # move some binaries to the same location as where Busybox installs
 # the corresponding applets, so that we have a single version of the
 # tools (from iputils)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 define IPUTILS_MOVE_ARPING_BINARY
 	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
+endif
 
 else
 IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
