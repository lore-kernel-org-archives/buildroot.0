Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB44CC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97136400CF;
	Tue,  5 Mar 2024 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AEGSsHSf7V7; Tue,  5 Mar 2024 20:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7449B417FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7449B417FF;
	Tue,  5 Mar 2024 20:45:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0099B1BF3FD
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1F8860600
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgEGoLlP5pqC for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD5B760777
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD5B760777
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 20:44:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E3F8812D; Tue,  5 Mar 2024 20:44:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 11:24:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae910aac6298fb1d39c40ae8aa5a5b5fc52c97c4
X-Git-Newrev: e88225ed8820881970ec33de7a15a1e0d50443da
X-Patchwork-Hint: ignore
Message-Id: <20240305204439.D6E3F8812D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: make 2.41 the default
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=e88225ed8820881970ec33de7a15a1e0d50443da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 2.42 has been introduced, let's make 2.41 the latest version,
following the traditional Buildroot policy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index cc8dfa31d8..b6a2a2cd6c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_40_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_41_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6846933646..5209da0252 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2023.09-release
 else
-BINUTILS_VERSION = 2.40
+BINUTILS_VERSION = 2.41
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
