Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B5C52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A0460AD9;
	Thu, 15 Aug 2024 20:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmpRpjrzQXlc; Thu, 15 Aug 2024 20:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D587760727
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D587760727;
	Thu, 15 Aug 2024 20:24:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 411FA1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F09160A80
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIJdWF5QMquS for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDDAC60727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDAC60727
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDDAC60727
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:24:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 61626E0003;
 Thu, 15 Aug 2024 20:23:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 22:23:54 +0200
Message-ID: <20240815202356.535066-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723753438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qyv+2pak0/Oy+hyV5lo2220MCKindU6qyzzqWfLnoh8=;
 b=H0DSWAgSMUrECYUsvgSh3VZjVWE8Wr36ibTICwaja6IxZQX4Y4VlLPlUuzvFW3qBcV2fE0
 f5cYvsc9neXFbd+earpfEf5bfFAkvT2IzwikSUlCEtzCr1cy4/Z/k0+NAxULVdStox+yjU
 e/LEYeDHbXZz6hic4GiGHLUnCh9xzdxi/c2dnEvW+JJ6ph0Gx9YxxS5dcfS/+4wCtqegLX
 5qX0xqXyELCdX7qe0hEMaI/uS7ddeGKsBkRWk9Mj2qEUyWobxf5Td+DqKcXFMjT/0uuXmT
 3gntAFh+m1NSn9TM2WVovZGalw3HRCMno7ENlG7GKSw4WvBaEWXM3qc6ucRWlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H0DSWAgS
Subject: [Buildroot] [PATCH] package/python-tpm2-pytss: add missing 'depends
 on'
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
c72c6f26ed706474f6607f97be2925834c8baa03 ("package/python-tpm2-pytss:
new package"), when the package was introduced, a dependency of a
package being selected was not properly propagated:
BR2_PACKAGE_PYTHON_CRYPTOGRAPHY depends on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS, so we should replicate
this dependency.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_TPM2_PYTSS [=y] && BR2_PACKAGE_PYTHON3 [=y] && !BR2_STATIC_LIBS [=n]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tpm2-pytss/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
index 60d9e8b9d3..dec9a311d4 100644
--- a/package/python-tpm2-pytss/Config.in
+++ b/package/python-tpm2-pytss/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	bool "python-tpm2-pytss"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
@@ -11,4 +12,5 @@ config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	  https://github.com/tpm2-software/tpm2-pytss
 
 comment "python-tpm2-pytss needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
