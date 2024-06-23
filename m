Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CBC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 09:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA31A60629;
	Sun, 23 Jun 2024 09:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2QXpUG-SjeK; Sun, 23 Jun 2024 09:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D13BB60751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D13BB60751;
	Sun, 23 Jun 2024 09:01:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCF411BF59D
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 09:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA3CC40232
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 09:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsbjrocQJgft for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 09:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8FD54011A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8FD54011A
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 09:01:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D724482842; Sun, 23 Jun 2024 09:01:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 10:56:46 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 9b2c10bc06d37aca151e8443ccbc236184eec5b0
X-Git-Newrev: 65c66c2ba170d75bf0a00ff832232c523e62de91
X-Patchwork-Hint: ignore
Message-Id: <20240623090123.D724482842@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/sentry-cli: needs
 pkgconf and openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=65c66c2ba170d75bf0a00ff832232c523e62de91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2bf45fa99c09302c4d313b79ae7b165a958e354e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sentry-cli/sentry-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index df419f81e1..3ddf5e44fc 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,6 +9,6 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
+HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-openssl host-zlib
 
 $(eval $(host-cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
