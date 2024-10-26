Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB236D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 723AE81568;
	Sat, 26 Oct 2024 16:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSOSQZPFEfkl; Sat, 26 Oct 2024 16:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45CE482035
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CE482035;
	Sat, 26 Oct 2024 16:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF725C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B17400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPAVG-x8qrjV for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE34740198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE34740198
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0F0283E6B; Sat, 26 Oct 2024 16:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 17:59:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2952d5d28a523a907f97df5196f662372b5cc174
X-Git-Newrev: a582ae4f8b85255ea0e3e47073f3778ca5aa56ab
X-Patchwork-Hint: ignore
Message-Id: <20241026160708.A0F0283E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump version to 3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=a582ae4f8b85255ea0e3e47073f3778ca5aa56ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.hash | 2 +-
 package/libselinux/libselinux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 4e0a2ca317..fac9d3cef2 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ba4e0ef34b270e7672a5e5f1b523fe2beab3a40bb33d9389f4ad3a8728f21b52  libselinux-3.6.tar.gz
+sha256  ea03f42d13a4f95757997dba8cf0b26321fac5d2f164418b4cc856a92d2b17bd  libselinux-3.7.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index f07498d739..360ab063ca 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.6
+LIBSELINUX_VERSION = 3.7
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
