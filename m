Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D580CD1297
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A30D8179A;
	Mon, 10 Nov 2025 19:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcFf_c43Ekbk; Mon, 10 Nov 2025 19:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 085BD81498
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 085BD81498;
	Mon, 10 Nov 2025 19:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1038B2CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA52360AB4
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNyvqTGeqMBg for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B4C60A9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B4C60A9D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32E88843A6; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Nov 2025 19:25:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b032843bb49755d7534c94dc4770a10199da4209
X-Git-Newrev: be0de7f087887034450f69737fc36d6df48a2ecf
X-Patchwork-Hint: ignore
Message-Id: <20251110190753.32E88843A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: bump to version 7.98
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

commit: https://git.buildroot.net/buildroot/commit/?id=be0de7f087887034450f69737fc36d6df48a2ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://nmap.org/changelog.html#7.98

Note: It includes a fix for CVE-2025-43715, which impacts Windows-based systems.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index e9bce1a01f..9303ff613e 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.97.tar.bz2.digest.txt (lowercase)
-sha256  af98f27925c670c257dd96a9ddf2724e06cb79b2fd1e0d08c9206316be1645c0  nmap-7.97.tar.bz2
-sha512  050241744c311f5fc16297e1698aded2a9fdc78eb7a0954d1c70f7713ef6e1b07f3fcbf28a6a53f43785b1ae710aadf10237d1d0bd8855c6b3c423da4d35961c  nmap-7.97.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.98.tar.bz2.digest.txt (lowercase)
+sha256  ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6  nmap-7.98.tar.bz2
+sha512  14e13689d1276f70efc8c905e8eb0a15970f4312c2ef86d8d97e9df11319735e7f7cd73f728f69cf43d27a078ef5ac1e0f39cd119d8cb9262060c42606c6cab3  nmap-7.98.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index a944627b38..629a00f30e 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.97
+NMAP_VERSION = 7.98
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
