Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ACDC27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CA660AF8;
	Sat,  8 Jun 2024 14:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wd8mDmbY72Cv; Sat,  8 Jun 2024 14:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17DD60A43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17DD60A43;
	Sat,  8 Jun 2024 14:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A60091BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BEC640852
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTiMjoHrACek for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E68D42673
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E68D42673
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88B20817DB; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:54:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 70455e092e41d8d4118e27b382278055fd917092
X-Git-Newrev: ea425bf724e74cbc10af2961e61ad91723f0e740
X-Patchwork-Hint: ignore
Message-Id: <20240608140142.88B20817DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/minisign: do not
 strip
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea425bf724e74cbc10af2961e61ad91723f0e740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Set CMAKE_STRIP to an empty value to avoid the following build failure
with BR2_BINFMT_FLAT raised since the addition of the package in commit
d90ac63d9b3448a239bb9aa8030326699a3fdc3d:

/home/buildroot/instance-0/output-1/host/bin/m68k-linux-strip: /home/buildroot/instance-0/output-1/build/minisign-0.11/minisign: file format not recognized

Fixes: d90ac63d9b3448a239bb9aa8030326699a3fdc3d
 - http://autobuild.buildroot.org/results/9cc9fd17c7eb4a741c08f27f69764df4a26295fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d96b3c331cb0e0cf3bec3d3b1496ed9adb426d05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minisign/minisign.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
index 34b3f4046e..7cdce597f7 100644
--- a/package/minisign/minisign.mk
+++ b/package/minisign/minisign.mk
@@ -10,6 +10,7 @@ MINISIGN_LICENSE = ISC
 MINISIGN_LICENSE_FILES = LICENSE
 MINISIGN_DEPENDENCIES = libsodium
 HOST_MINISIGN_DEPENDENCIES = host-libsodium
+MINISIGN_CONF_OPTS = -DCMAKE_STRIP=""
 
 ifeq ($(BR2_STATIC_LIBS),y)
 MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
