Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1C7E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 08:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F1B80422;
	Thu,  2 Jan 2025 08:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFOg4E7vlqEK; Thu,  2 Jan 2025 08:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B898042F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4B898042F;
	Thu,  2 Jan 2025 08:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 816F8F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62A938041F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mks5XdYbw9Gi for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 08:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C72E3803D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C72E3803D3
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B100A82BDB; Thu,  2 Jan 2025 08:17:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 09:16:48 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: da6c5f74347a39d18a192af5d58606b37dabeada
X-Git-Newrev: 8157e14da6cdf369a5e36621c53363aa7369cd80
X-Patchwork-Hint: ignore
Message-Id: <20250102081721.B100A82BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/samba4: bump
 version to 4.19.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=8157e14da6cdf369a5e36621c53363aa7369cd80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Various bugfixes. For details, see the release notes:

https://www.samba.org/samba/history/samba-4.19.7.html
https://www.samba.org/samba/history/samba-4.19.8.html
https://www.samba.org/samba/history/samba-4.19.9.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 49ce47705d..f8f0713ddc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.6.tar.asc
-sha256  653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1  samba-4.19.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.9.tar.asc
+sha256  71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549  samba-4.19.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 994037c84b..453a5ade3f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.6
+SAMBA4_VERSION = 4.19.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
