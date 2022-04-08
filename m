Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B371BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 07:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756D683F93;
	Fri,  8 Apr 2022 07:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDao4E-YKkty; Fri,  8 Apr 2022 07:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2416B83F56;
	Fri,  8 Apr 2022 07:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A42A1BF2F8
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 07:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1959E60AEE
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 07:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (3072-bit key) header.d=samba.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QS2qKQtQVUxN for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 07:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C99F360ABB
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=FysaRDWBckasDyJH2yN0G684v2f7uXU49pOuwxATltM=; b=2AA8LKhktmJNRdkH63Gpof/SBZ
 rVmmdPeZFpIMQtB552Ja4i1P2MXYHgs2Ii+aevVkMSwzDdArI4Roxdz/fVtvyCoWMFANOw46emOif
 rwcDLp+ZgacaXBPo6/IXx60ehLfUIBEQRMPPp8NHGP80oMlaeXfS2ONQVKQjifXnESwVvthPNPFG9
 FkQm5EHwoPfxAU3I5ywuE5nvpmP1vfsGhVr8MO69WQPzCOf/4e7ppqQBjhAqBaZOHBKIV/e1QyQgy
 pO6q0NVaYl6x9msdafiHXGn7AYrmkYCF2yaHtdglLZ2W1cWgiwDbNdQswolhR8/rsenVOOYzmLdrR
 5FgOMAky++bLLztkD/hoS3e0saEBL06sahHQnqSbdCGNLaD3G0p/PMovhjDfZhIUbj4Yxon/bF0H9
 NxAPAvBtuxqFXmdfPgZb/FbpEUi0jj/h6b9zYytlEfQQrzPDKt7OHlVJ2+b/FV3hzhiAbkAPMcDn5
 ktJ9I1gdtwpBImCbm6/sN/eW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncikM-005zFp-Jm; Fri, 08 Apr 2022 07:09:32 +0000
To: buildroot@buildroot.org
Date: Fri,  8 Apr 2022 09:09:20 +0200
Message-Id: <20220408070921.1786-1-ambi@samba.org>
X-Mailer: git-send-email 2.27.0.windows.1
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
 package/openjdk-bin/openjdk-bin.hash |  2 ++
 package/openjdk-bin/openjdk-bin.mk   | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 266c93d363..efe90f6e97 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,8 +11,17 @@ else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
 endif
+
+HOST_OPENJDK_BIN_HOST_ARCH := $(shell uname -m)
+ifeq ($(HOST_OPENJDK_BIN_HOST_ARCH),x86_64)
+HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = x64
+endif
+ifeq ($(HOST_OPENJDK_BIN_HOST_ARCH),aarch64)
+HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
+endif
+
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
-- 
2.27.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
