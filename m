Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07732C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1A4681819;
	Mon, 25 Apr 2022 08:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwqmjNBMYk8D; Mon, 25 Apr 2022 08:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2118133A;
	Mon, 25 Apr 2022 08:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E3A1BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A23A660A89
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (3072-bit key) header.d=samba.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmVDW58342rV for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92FAA60675
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=uK0u2eRW2YWb7VcNFArzivaLzhktCK2Ff0ieSUk2Jo0=; b=cJnPSUdwt3yxgPdAMjUptSjG2X
 VGWEBnqlT+yJoNHTnyMpNhS3lKcpJESsB3cwy+IJFOk8YugE/tfX+vsdmKnclis/8rxV7QURBBW0z
 lj4HZw0YoW1uS91XyoCtIzha6ybwVSS2kdf37V01Mj8LYhe/sVbwHXGFb0g1xYXlckWF10xfVCK9+
 /LHw/3mNgXvacjOSz5mI0m2uHawHuV+yy7u5yJBGUN8+55lsXX488mbYtep2iV2MyA7wlyw6tP0+X
 72g9rwrjqxo3EWT541A9aIdVVU9rw5YAjorNhfP7zIKejyT/hY4jezOLzebm1DzY1S8lNlP0YnNL9
 BsvUZ+yOmAsk83dqFYvcfPVD9EvKuA6Y8WhBq/WtxC5O0Pby2ltA/mGtns4QWj45fRJmLQh2UbpTE
 Yf8RGoeG3K2PsYiKvGaVpe0CF6qBdabfk4yBSVyI2Hc8HOaGdeqrNv7hfU+OSnDJYnqCJGpQgeLBW
 PqbGhlckBH6X+eu4HSTEB2Pm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nittT-002CzX-Le; Mon, 25 Apr 2022 08:16:27 +0000
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 10:16:25 +0200
Message-Id: <20220425081626.80691-1-ambi@samba.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <afc126a1-3afc-44e8-710c-69e9be5dd1ed@mind.be>
References: <afc126a1-3afc-44e8-710c-69e9be5dd1ed@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/openjdk-bin: add support for host
 architecture aarch64
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
From: Christian Ambach via buildroot <buildroot@buildroot.org>
Reply-To: ambi@samba.org
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Ambach <ambi@samba.org>

Signed-off-by: Christian Ambach <ambi@samba.org>
---
 package/openjdk-bin/openjdk-bin.hash |  2 ++
 package/openjdk-bin/openjdk-bin.mk   | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 62691ed6f0..4d3942125f 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,8 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
 sha256  288f34e3ba8a4838605636485d0365ce23e57d5f2f68997ac4c2e4c01967cd48  OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz
+sha256  302caf29f73481b2b914ba2b89705036010c65eb9bc8d7712b27d6e9bedf6200  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
 sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
+sha256  79572f5172c6a040591d34632f98a20ed148702bbce2f57649e8ac01c0d2e3db  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 3d1ebd7429..5cb6e3ba6a 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,8 +11,16 @@ else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
 endif
+
+ifeq ($(HOSTARCH),x86_64)
+HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = x64
+endif
+ifeq ($(HOSTARCH),aarch64)
+HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
+endif
+
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
