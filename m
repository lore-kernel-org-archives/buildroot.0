Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53D7D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BCE81E25;
	Sat, 26 Oct 2024 15:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b2C_SYZkGeh; Sat, 26 Oct 2024 15:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 889C581E1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 889C581E1F;
	Sat, 26 Oct 2024 15:58:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5A465C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACE204035B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGr6kG2EGoYb for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF60C40355
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF60C40355
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7F8C83D54; Sat, 26 Oct 2024 15:58:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 17:58:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a4e71a5f8f49c0fb75c8f1aa6057be64c22666e
X-Git-Newrev: 6d07647cc6e48a05b5a18e8527bd52140dea89ec
X-Patchwork-Hint: ignore
Message-Id: <20241026155835.A7F8C83D54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: bump package to
 3.24.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d07647cc6e48a05b5a18e8527bd52140dea89ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-engine/0001-disable-pre-canned-sysroot.patch | 2 +-
 package/flutter-engine/flutter-engine.mk                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
index 953705e33b..a9776d7388 100644
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -18,7 +18,7 @@ diff --git a/build/config/sysroot.gni b/build/config/sysroot.gni
 index 7987e519d..1de694263 100644
 --- a/build/config/sysroot.gni
 +++ b/build/config/sysroot.gni
-@@ -14,7 +14,7 @@ declare_args() {
+@@ -12,7 +12,7 @@ declare_args() {
  
    # Whether to use the default sysroot when building for Linux, if an explicit
    # sysroot isn't set.
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index a8158d3559..f0c734146a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.2
+FLUTTER_ENGINE_VERSION = 3.24.3
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
