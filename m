Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF1C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCCC81DE5;
	Mon,  9 Jun 2025 14:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF6Y3qAsvsRK; Mon,  9 Jun 2025 14:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2218150F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2218150F;
	Mon,  9 Jun 2025 14:25:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 406C11F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E18641945
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFVz4OpTcNYn for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DF7417AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86DF7417AA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF6387AD2; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 16:06:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa45c47fcb022445114fe4ff70018e634076d109
X-Git-Newrev: 8b736d1bde464e5bf5960cadaae89817f20114d7
X-Patchwork-Hint: ignore
Message-Id: <20250609142501.7BF6387AD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/lm-sensors: update
 LM_SENSORS_VERSION"
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b736d1bde464e5bf5960cadaae89817f20114d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert back to the hyphen version schema (as actual returned by
https://release-monitoring.org, see [1], [2]).

Fixes pkg-stats output.

This reverts commit 521afeab9b7c0b07a849355e8b1c1fde0965c84f.

[1] https://release-monitoring.org/projects/search/?pattern=lm-sensors
[2] https://release-monitoring.org/project/1831/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lm-sensors/lm-sensors.hash | 2 +-
 package/lm-sensors/lm-sensors.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index c941043343..0ca07b7e69 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3.6.0.tar.gz
+sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1bf27fc25a..8975efaffa 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3.6.0
-LM_SENSORS_SITE = \
-	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
+LM_SENSORS_VERSION = 3-6-0
+LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
