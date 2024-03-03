Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93CAC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D6C81F3A;
	Sun,  3 Mar 2024 08:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9_OZq4MewXH; Sun,  3 Mar 2024 08:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F5E81F3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F5E81F3B;
	Sun,  3 Mar 2024 08:41:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853941BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF654089E
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFTVlIMEdgXV for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 448DF4089C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448DF4089C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 448DF4089C
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:41:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D9B13FF802;
 Sun,  3 Mar 2024 08:41:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:41:21 +0100
Message-ID: <20240303084122.157151-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709455284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Cw3GyIF6jPmBE4gB6O10fh627ysXo4KL9wERy8OfOTM=;
 b=oDE0nXWWsCUY+Qc0jISOZWInYVA5wOjQo3m77BO2jzjPY02OSWEKBVW3f6si4Yz1ejA2DQ
 ECLoChP6Auq5JZmI/cDE6YEmX2W1llJz/XNnr3V1P+vVg8m78n/5snf7/73FLpkpCiTUoE
 LXEt/qKnHu0fJxQoQ0w1oNoDaoab3h3MsE+NPZVNneZpO3sisfNC+6m2BfvhiB/QEs87xM
 A3NuVUvRIyZKg+GMR4uCjgF/T+Uq3sCnRscAfAkBpu/o18dvJYRHzTBe5fHxzQOgVjkJaN
 dB6zXz5uRq3UP3HchOE4JTm0z0DhdrvjUFOlwlyP0ndODkQ/k6P8oUCasBi/cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oDE0nXWW
Subject: [Buildroot] [PATCH next] package/musl: bump to version 1.2.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release adds two new ports: loongarch64 and riscv32. The former
is not supported in Buildroot, but the latter is, so it gets enabled
in this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/Config.in | 2 +-
 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 89f41d2ff1..7fba85bcd9 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
-	default y if BR2_RISCV_64
+	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_x86_64
 	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 3b5fccc9e2..b105320bac 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://musl.libc.org/releases/musl-1.2.4.tar.gz.asc
-sha256  7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039  musl-1.2.4.tar.gz
+# http://musl.libc.org/releases/musl-1.2.5.tar.gz.asc
+sha256  a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4  musl-1.2.5.tar.gz
 sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 08706c139f..783a103fcd 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.4
+MUSL_VERSION = 1.2.5
 MUSL_SITE = http://musl.libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
