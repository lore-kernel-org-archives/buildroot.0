Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7270D6B6DF
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A765380BFC;
	Thu, 31 Oct 2024 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqSvj6490O3Z; Thu, 31 Oct 2024 12:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5CAE80C56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CAE80C56;
	Thu, 31 Oct 2024 12:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 376165E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32BAE60A89
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_euRhoavWaN for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E4E60A7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E4E60A7A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7018F84F10; Thu, 31 Oct 2024 12:49:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 13:48:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 334062f4f1bb8073b41b7ca0bb4732cb6ff4a440
X-Git-Newrev: 967ba5386d4e15102db88a9faae1845b3e69dc6f
X-Patchwork-Hint: ignore
Message-Id: <20241031124929.7018F84F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: bump version to 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=967ba5386d4e15102db88a9faae1845b3e69dc6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps to the latest `libspdm 3.5.0` release, this release introduces the
optional SPDM 1.3 `GET/SET_KEY_PAIR` support. Which requires an integrator
to support additional functionality implemented at link time. Leave this
disabled by default as it is optional and so that it does not break build
compatibility with integrators.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 93a8d933cc..e29c5994a3 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44f967aeb0c481676affe59069615252854bc0c072368ce4b26b6809a54daff5  libspdm-3.4.0.tar.gz
+sha256  7b8a556be64120bab9c321964e67b90f5e6adb59abf3992c5c7937f37a4e7c8f  libspdm-3.5.0.tar.gz
 sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index e86a79ed67..081bffb9c1 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.4.0
+LIBSPDM_VERSION = 3.5.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
@@ -20,7 +20,9 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 LIBSPDM_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP= \
+	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0
 
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
