Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C46ED116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4A884842;
	Fri, 28 Nov 2025 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXrLMcJEEXab; Fri, 28 Nov 2025 21:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 641308487B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641308487B;
	Fri, 28 Nov 2025 21:08:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8424708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE44860D9C
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T64OYO5FfXsg for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 073B1606E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 073B1606E2
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9F3586144; Fri, 28 Nov 2025 21:08:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 22:02:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 865b690517d72c6619496448961531a206961e66
X-Git-Newrev: f536fd4a2e883309ab2fe97532fc94f608e31de1
X-Patchwork-Hint: ignore
Message-Id: <20251128210857.E9F3586144@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: security bump to version
 7.20
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f536fd4a2e883309ab2fe97532fc94f608e31de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.20

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-65502

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add "security" in commit log title and ref to CVE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index b2375309d9..07c0fc68c1 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7ae38c9d673559d1d9c1bd72c0bdd4a98a2cae995e87cae98b4604d5951762b8  mongoose-7.19.tar.gz
+sha256  ede2371ff4e41e95fd7b2de83a7df727388307a64d3706046ead320defe35e7e  mongoose-7.20.tar.gz
 sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index abc95dd311..44de3fa1e0 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.19
+MONGOOSE_VERSION = 7.20
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
