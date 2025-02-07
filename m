Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3B6C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264E784B75;
	Fri,  7 Feb 2025 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDA1_v7h7h1q; Fri,  7 Feb 2025 19:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3371084A72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3371084A72;
	Fri,  7 Feb 2025 19:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB34E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96B2804DC
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3M5f1MpxwaBG for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B59484B75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B59484B75
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 294B18718B; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:49:38 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 5afc6a2610162df3a0f835ef0676eff3c185ba20
X-Git-Newrev: f81379d65f71d89cf91569accc8437f7c235986d
X-Patchwork-Hint: ignore
Message-Id: <20250207195348.294B18718B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/zlog: security
 bump to version 1.2.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81379d65f71d89cf91569accc8437f7c235986d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following security issue:

CVE-2024-22857: Heap based buffer flow in zlog v1.1.0 to v1.2.17 in
zlog_rule_new()

https://github.com/advisories/GHSA-6q5p-rp5c-wmph

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 750dca24e6e8cff7ad1b00b737b2a26d083c3e9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlog/zlog.hash | 2 +-
 package/zlog/zlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 19881183e9..f000b08f37 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fe412130abbb75a0779df89ae407db5d8f594435cc4ff6b068d924e13fd5c68  zlog-1.2.17.tar.gz
+sha256  3977dc8ea0069139816ec4025b320d9a7fc2035398775ea91429e83cb0d1ce4e  zlog-1.2.18.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index e5bbf6ff3b..0d56471559 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.17
+ZLOG_VERSION = 1.2.18
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = Apache-2.0
 ZLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
