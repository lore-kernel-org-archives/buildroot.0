Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D900AC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803CC405A7;
	Fri, 25 Apr 2025 22:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7fg1T9dkc6J; Fri, 25 Apr 2025 22:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86C740E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86C740E53;
	Fri, 25 Apr 2025 22:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A99231
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317FF6067A
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4LOD4xnilRr for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F18F6060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F18F6060D
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F18F6060D
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8RVQunzi3voVF8RVRumo59; Sat, 26 Apr 2025 00:26:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 26 Apr 2025 00:26:46 +0200
Message-Id: <20250425222647.2340402-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMx+L3GcV6Bx/aLhnC7gV7ADbMSyhjNGEH2dJJ/zFTe5gZsCI6vInZzqkNt1KfS+LqdCzSTLWFzKA8KafZ3eLi4Z1nvMyuSGZ43lSHe4VhvBLfmUY3YC
 SpbkAoKMKDM8/eLIIeGU6Nr9BGJlz3sp4w6DIpfOGfujCc1PBhLRjVkY5FMyEIgcqtjLwVWWGxqVXmegkqZ5AkAMyYc9/qKvBdnoYTNm2XdCc2gJc7ImcNct
 bCwlqwL0vLXy2QIjbaC9w0pdhUMmDB5yGn5hu4I/PWpn//FJscPJscR3trBFIed6eyccQ+aNd7iApLh08Y2+XH6/rxrQHIMKR7by/y4gx0QKe2dZRmZNVYio
 dxKYWoAqioFUSfsRCUWJ36FHfuFYyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745620009; bh=rzuWQpjzw9TpJ/Tw1/ISYqU/M//tWzZzxuYetZyhBjU=;
 h=From:To:Subject:Date:MIME-Version;
 b=gBvEIXUtDPkEnnPBLlO68VHwSLtMltCsMVxaFXW+AXSGqx2XlWd8Ni8YFp5Pq9K5l
 zvPFUAgA+uGb/vKUdcRkOt1YCtVfoJrya3Bm71NL1R+0Owzc/Mnm60pGGhkpi8AoXV
 IgdyghQTQn3byCd+U3bighgwKCPc154zO39WeABeEqTzJYtN56iiTeE8+hsXYOdCxe
 R7vNV/ypRfQZUwolYJBc5HPxOGn9yDMF8Au/eSWokUkzJaKx8Z4/o1cS7Q6j31H+SV
 5IoDzljRx9mfzahmFRK8Tm3m/oJKHeebo4nCPQ7kNRdMiAq2T+X2uV1XpJceHCJqYe
 /8QksnKHgt1oA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gBvEIXUt
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-04-10 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.15. Makefile hase been refactored
and variable USER_EXTRA_CFLAGS has been renamed to USER_ccflags-y so let's
rename it accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index de2c55cf4c..0c6009f05e 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b5568e5a48e99839ec76359e11da29705e80cbfcae210c68eaea4bf433760f6d  rtl8192eu-c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965.tar.gz
+sha256  04cd204046bae15cfd64643d1f2d15d215acc0bd0b6b3da2404f001d5e172557  rtl8192eu-c014d0970c8052e8b2306e24ccc92f6fe738458d.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index de54f03bc9..48c1217300 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965
+RTL8192EU_VERSION = c014d0970c8052e8b2306e24ccc92f6fe738458d
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
@@ -16,7 +16,7 @@ RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 RTL8192EU_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_RTL8192EU=m \
-	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)"
+	USER_ccflags-y="$(RTL8192EU_USER_EXTRA_CFLAGS)"
 
 define RTL8192EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
