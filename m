Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEBFD3A676
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 17:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A8E406E9;
	Tue, 29 Oct 2024 17:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDoI3vT0kYOM; Tue, 29 Oct 2024 17:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC872406ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC872406ED;
	Tue, 29 Oct 2024 17:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08C6D59BA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03ED3605D4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prDHO9JBW_0W for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 17:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B47E60A49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B47E60A49
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24AFB846AB; Tue, 29 Oct 2024 17:34:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 18:34:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e9261d9b6388dc382e59f44174f1806d326ad15
X-Git-Newrev: a3152a20f64e56a036b3be2eb267a868c65ee2b2
X-Patchwork-Hint: ignore
Message-Id: <20241029173432.24AFB846AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: fix typos in config
 option and help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3152a20f64e56a036b3be2eb267a868c65ee2b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option has been renamed, so add an entry in the
Config.in.legacy file for the old option name.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               | 8 ++++++++
 package/procps-ng/Config.in    | 4 ++--
 package/procps-ng/procps-ng.mk | 2 +-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a041d4da42..30179add23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+	bool "BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
+	help
+	  The option has been renamed to
+	  BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP.
+
 config BR2_PACKAGE_QEMU_TARGET_NIOS2
 	bool "qemu nios2 support has been removed"
 	select BR2_LEGACY
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 4afd01699b..7af0e97fb4 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_PROCPS_NG
 
 if BR2_PACKAGE_PROCPS_NG
 
-config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
 	bool "Use original top layout"
 	help
 	  Disable modern top layout, return to original top with
-	  detail cpu usage.
+	  detailed cpu usage.
 
 endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ac82cf6f9..c5185c2c8a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -56,7 +56,7 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
-ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+ifeq ($(BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP),y)
 PROCPS_NG_CONF_OPTS += --disable-modern-top
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
