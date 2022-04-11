Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A20C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A24660E2F;
	Mon, 11 Apr 2022 07:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwIHWbcrng85; Mon, 11 Apr 2022 07:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A75B60E5B;
	Mon, 11 Apr 2022 07:05:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A76941BF2B9
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A559B82B94
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (3072-bit key) header.d=samba.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVg6L8w9eD2P for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EB1E82B49
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=FWIcOMtQExVVSV/czhGaeC556bYwn/4CIpDH069s+3A=; b=b84oHW0y0QXJPUJciGB9oytNFZ
 hT3WdZliE4w3mJTRrlO1Ywg5yKmumyWoPXjdijmti5rDjmkgeGRLd1cRMuHqDbxLBLbi+h1+rbyYR
 FjvEpfgwbZyB+vwe2PvTOKkpVuXhDwzBkWD/bpW9ic013seXDl90YlwmEgbJwI155/DpJUAINSgYk
 Ja2Q5+uc8lvxcJ/X2lNccB++wBhOc0wOmi+iXN5/Ub/GkzhZ/Px3qWNmbk5BRL1DZFxRVyGcRTT8y
 TgCXtZW42///tU2pzSoX8eXA0Fuu70jMQjBNIFjsRhAaWPZuXzH2Z4aGXJ9KboVH4YAV8KzHeUV/v
 eQoHncWHT2BQAp8frJhkW4jB7/z2gqcqeaP68wTRIj0Dm37G6AKl0FYE98CCk6rtYTAjtE3E6q1zn
 fVtTOex1J7ikE/I3BuvDqf4yoRvDtI6+yPIi+H0OMwj4pzmhc/DY8wCtCPf/nbnF9OwUhMUbDOdun
 nZ8K5c05UgtLXqO5t8buypZV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ndo6Z-006OH7-3J; Mon, 11 Apr 2022 07:04:55 +0000
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:04:54 +0200
Message-Id: <20220411070454.77482-1-ambi@samba.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411070125.77424-1-ambi@samba.org>
References: <20220411070125.77424-1-ambi@samba.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/openjdk-bin: add support for host
 architecture aarc64
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

New version with removed duplicate Signed-off-by.

 package/openjdk-bin/openjdk-bin.hash |  2 ++
 package/openjdk-bin/openjdk-bin.mk   | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index bbc939d4e8..58bb646b45 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,8 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
 sha256  6ea18c276dcbb8522feeebcfc3a4b5cb7c7e7368ba8590d3326c6c3efc5448b6  OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
+sha256  f23d482b2b4ada08166201d1a0e299e3e371fdca5cd7288dcbd81ae82f3a75e3  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
 sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
+sha256  a77013bff10a5e9c59159231dd5c4bd071fc4c24beed42bd49b82803ba9506ef  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.13_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 266c93d363..b731058ca1 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,8 +11,16 @@ else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
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
