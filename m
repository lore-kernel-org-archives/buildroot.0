Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D175E73164
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B4940A72;
	Mon,  2 Feb 2026 13:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuNkqvqfGAfD; Mon,  2 Feb 2026 13:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED70840AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038341;
	bh=9NNLBrKdchZ5V/WuMrSipk5RbCfASKeC7OxF5v74T3k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DOt5aLgj7yPKW/9j2NfFm9odOiTLoVESNZmLqhtEGKT8KT9kAOh93Qm+wAEmeIJyl
	 uTIOEj5EUPUR6wLaywXbH2zpakSt2OLs/AOi+4I8/1UqG0fP1w7UIeGwYaG5Act0K/
	 za4bwUKX7XNuLjrTXRgVNOvhZSaC1KmhjzIovHO+Vp3VrMtkqAcINhC8bwLZswXoWH
	 gcLflhGJte8IJVfLvwTfBvt4kiGrEdXA7s9KOZQ20jNKC2pLHBe0JRKCpDi7fQXkn7
	 0EZSnTxskI3t2n10tltHElQpvdmqwRAZ3z2ftWYb6yL4H4yPjt2nisT7J2jIPefUzj
	 2iH+hH/3+0Ubw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED70840AB0;
	Mon,  2 Feb 2026 13:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00065149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED82E40ACA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxVrTX9HCFwb for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF9C40A72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AF9C40A72
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1439386330; Mon,  2 Feb 2026 13:18:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 14:06:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d25dd192293f18e81de99a603ff137cc49984a6c
X-Git-Newrev: a4c9aa7b43bbe3bd55e0aa2fc2945ff7c9622bfe
X-Patchwork-Hint: ignore
Message-Id: <20260202131858.1439386330@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picotool, pico-sdk: Bump to 2.2.0,
 add submodules
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4c9aa7b43bbe3bd55e0aa2fc2945ff7c9622bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pico-sdk and picotool 2.x.x adds support for the rp2350 bump package to
latest version.

picotool needs mbedtls for --hash --sign and --offset.
Clone submodules in pico-sdk to provide the nessasaary files for
picotool to build and link mbedtls and other optional libraries.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 6 ++++--
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 5db7e8bdb4..7bb764a266 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  95f5e522be3919e36a47975ffd3b208c38880c14468bd489ac672cfe3cec803c  pico-sdk-1.5.1.tar.gz
+sha256  1a6a0f76cf312d528023d093f132e6c67930fc70c360533cf155998cc9594abd  pico-sdk-2.2.0-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 27930651b9..3f242ab06b 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 1.5.1
-PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
+PICO_SDK_VERSION = 2.2.0
+PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
+PICO_SDK_SITE_METHOD = git
+PICO_SDK_GIT_SUBMODULES = YES
 PICO_SDK_LICENSE = BSD-3-Clause
 PICO_SDK_LICENSE_FILES = LICENSE.TXT
 PICO_SDK_INSTALL_STAGING = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index 26b790d968..048a7f1e0d 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91  picotool-1.1.2.tar.gz
+sha256  42558a239b3b8f99dfcb080300e849a2eacbd0f6571efb6ccc6e259fdfaef22b  picotool-2.2.0-a4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index 42f74fb244..b27f5d8dc3 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 1.1.2
+PICOTOOL_VERSION = 2.2.0-a4
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
