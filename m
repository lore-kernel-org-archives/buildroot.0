Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A14B5605D2;
	Sun, 14 Jul 2024 17:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpMaPSOy-916; Sun, 14 Jul 2024 17:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A530E605E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A530E605E3;
	Sun, 14 Jul 2024 17:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 922471BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CDA8605E3
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jip234SNuSCA for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EFC9605D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EFC9605D2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E6A2868BE; Sun, 14 Jul 2024 17:20:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:16:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 522f3dd479e21f59595f85e1367cbcbaacd56775
X-Git-Newrev: f32e64bec304ce91454a2ca59110e309daedf5dc
X-Patchwork-Hint: ignore
Message-Id: <20240714172027.1E6A2868BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chicken: fix references to
 libchicken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4903341821663945879=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4903341821663945879==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f32e64bec304ce91454a2ca59110e309daedf5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While applying, the package was renamed from libchicken to chicken, but
two references remained: in DEVELOPERS, and in the Config.in help text.
Fix both.

While we're at it, extend the help text by copying the first sentence of
the website.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                | 2 +-
 package/chicken/Config.in | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e3804db1cd..ba40388982 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3282,7 +3282,7 @@ N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
 N:	Woodrow Douglass <wdouglass@carnegierobotics.com>
-F:	package/libchicken
+F:	package/chicken
 F:	package/opencv4
 F:	package/opencv4-contrib
 
diff --git a/package/chicken/Config.in b/package/chicken/Config.in
index dce0581951..84e4ca1f3c 100644
--- a/package/chicken/Config.in
+++ b/package/chicken/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_CHICKEN
 	bool "chicken"
 	depends on BR2_USE_MMU
 	help
-	  libchicken is the runtime library for chicken scheme.
+	  CHICKEN is a compiler for the Scheme programming language.
+	  This package contains the runtime, the interpreter, and
+	  the (native for target) compiler.
 
 	  https://call-cc.org

--===============4903341821663945879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4903341821663945879==--
