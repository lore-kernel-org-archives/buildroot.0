Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D720CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC32812EB;
	Sun,  9 Nov 2025 17:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1GxwJPFPzcZ; Sun,  9 Nov 2025 17:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5245812D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5245812D4;
	Sun,  9 Nov 2025 17:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFD6FA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED5F46084F
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMgE5aW7UacX for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4240E6059C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4240E6059C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FFEE80FDC; Sun,  9 Nov 2025 17:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 18:39:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b53649bfadbdc42cfa659965056105af987e6e3
X-Git-Newrev: 2eded963ee54173867914fee05785122e0f34ee8
X-Patchwork-Hint: ignore
Message-Id: <20251109174801.2FFEE80FDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conntrack-tools: bump to version
 1.4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2eded963ee54173867914fee05785122e0f34ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now ships the source archive as .tar.xz instead of .tar.bz2.

Release notes:
https://netfilter.org/pub/conntrack-tools/changes-conntrack-tools-1.4.8.txt

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/conntrack-tools/conntrack-tools.hash | 2 +-
 package/conntrack-tools/conntrack-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index 371ede3432..122208b809 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256  099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d  conntrack-tools-1.4.7.tar.bz2
+sha256  067677f4c5f6564819e78ed3a9d4a8980935ea9273f3abb22a420ea30ab5ded6  conntrack-tools-1.4.8.tar.xz
 # Locally calculated
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index ec633f0d54..426bc20914 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.7
-CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
+CONNTRACK_TOOLS_VERSION = 1.4.8
+CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.xz
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
