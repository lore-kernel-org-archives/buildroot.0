Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDAF606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PDwMWB82;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=auSPhFfA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FABA40744;
	Wed, 28 Oct 2026 17:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CssAxW5Wj7Ni; Wed, 28 Oct 2026 17:31:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B3C5040733
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793208715;
	b=dsx4j7upi7Ye3kRHWvOVFrzP6eijQqcquSr9LBUzKUwgANzAvpiYh8sHYqL2Hzx2ivvp
	 drPTP5o310pyISS3UkpX/fhL2OmOOyw91zAmRbzRabZRqeylbSynHLyzpkO8sdCKwasow
	 5WyfwCjcGAoMYbe81Z7QO2BGXnB1Drk5oLIJqTE2gdUXAaH7KMLvhCMz4ikXbFSNpAlhY
	 jW7psWGxP7OiVzlHNhnTmHwYSoTjTxbeXn+c3NCf3RK8yD1NmEMFhEbV5g8m0o9G323V7
	 uLDlxMq9ik7OPkL6uEuzyuzL1YhSCEvFPLFeSmYz1acKm092VjD9HmoFImHjjwMkwwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793208715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=15gnDrmusg6gs0CvYDvLvOyVYKQkfgd2nmHtVg46ie8=;
	b=PHFVWhuVTZFdDZ2PnFsZZ0m9190qENaqWcGWo3uAabt0Ymb+Ro+eukZwzG+lh691KGAD
	 xYbIVdM0gHin3clNPNWS47aZsUPPKMIfBqS9RsCPdx9F3tgLaBQs8xx+T1juIHfx5CmfJ
	 NSbygnElNASVCwWjsj9GyuHrOUXt352hAnL45I/YQnDI/b8Zt5La9bZfTwFMiZ9CvmxiY
	 6UdHXWFrXnWR7gsFpP6THiueNJRxe7w3oe1UdgS4zR6eKI61IxFuB1pUM8DD7Ybr5yL53
	 WXtV8Cbl0GuZ3JfhUqw5kPBfXlmZGOUEkJpElaa55qBRl9DHpGtvkPOiph+4p6ptbhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793208715;
	bh=15gnDrmusg6gs0CvYDvLvOyVYKQkfgd2nmHtVg46ie8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PDwMWB82AYaOkVpBzBAbLlNe9BNmtf1qD5QXC6B13tOXm6h5rpROQyesQURdonmZI
	 I/JxYqfkUKMmN3wb4m2bJl7QRSCahkKdVzydsg+MjqwZnCKaFky8Nrg4oxzoQihXQc
	 1s+xHUH85fzq8rOgiKP4f86DmeLMqtEDci2lMPZGIlObv0m9DO6yPIP7CRd6pR4xgZ
	 4fYLJxkyfXj2MQheV6LBGnQDnZ4nj4BFq5b2rZuJ2s5NPmP9RGzwgS7o8E0mLK8kvQ
	 7YVCqxiGb5oDN3JXIatHA77v7lE2At2U6H2pmMNtFPp/t8irtRigOvndPTKemM8RjG
	 3AjgzneVj8aEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C5040733;
	Wed, 28 Oct 2026 17:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 833F94D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 697504021D
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1HeFfpMdhS6 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 17:31:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DB1F6401DB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.116
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793208711;
 b=RpN5uoaGcnHUJJD0zp299NFn6NJaAY4q0pOse50xMW3SBIF/OPzHyN2YlQXHgD8TWuv5
 ujnISnY1/TCsNaFTbROIBjgzzQVjai0aukGAYEW3MBN3//v8HDJTp9iBThO9OS3XZan4v
 ivtjLg8lQ4tnaSxAMCOiZaaRv6LE9M+pe2FvxiwIBDVMKJx9wuWP03yWTyZeowtysboMh
 pvaZ6t0VcKfIHrOINRnggQCFD0ZIa6CwExhAZjsiSarf5P5KflQTaX/GTZ9c6t3uWlL9F
 oNLIkDxsikvxI2aL+V1m3RHlJvxgGleLAW9Gvbwxmm/4GQVJTi182iesgqdbKInO+Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793208711;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=Qh/MJ7FNQ4a0yfzjd+F1JDjk/kG+C59leaNKyMaN2lc=;
 b=TXcrdRHi4JiSHVz3mlFHUza6NGa/qeN7WokUtdBzdNTanfGrPtvQx/8hrO4eR1I/FAqM
 SX28ngap3uLSSTOg33vguwt73dbsqj6KfdkHN8k2C2YqcUuo/VLaAAQ0/hh1l4K80FL1O
 zQdNhK/XWk9V422IYXI0pisQk/NavGrDdugQYT5wD9kHgirzjDqww7s9jgkhz2oNuVj7L
 DDoG7BLkJyfKSqe0uIOw2CKxwtyWBml5IpJ4si4VN6H5MJBD1nnyJmA2b6EDswQ9SfL0k
 0FzjiBc5NMzzT66ZZyBdWSOguFVZQ7WYayknRIYclvfKeaF2GFwKJigcrYXNwOGqW3Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=auSPhFfA; 
 arc=none smtp.remote-ip=62.149.158.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=auSPhFfA
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB1F6401DB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:31:49 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id M7V4xK9jr07TYM7V4xXgrO; Wed, 28 Oct 2026 18:31:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793208706; bh=+mQmRTKTACddkWuRAcmLVsUZyeYtFkiIZH8cyDZKm7M=;
 h=From:To:Subject:Date:MIME-Version;
 b=auSPhFfAv9Ck3RX/sLBqGSmltX6r4bU/er8n567ZiMmq5D4GN5InhguGph4qYlzHs
 rHsbwGjwtwF2gqFD9S78ywiaqzboCWLYvpSWa1wsry9FSzkjq55Ss3LlnaEKm1TlZ1
 phP5O9jOV2FPsfAVnCshBlyM5CXqVoTwst5ncgiNwd0PQRbpbWtHmdpLiPOPWSsT+K
 Q7xzjbns1ULzrwAPGjZ7soxptGUqPPIafJMFoGRSFASNYgi8sto+R1OVMl9MWkNIxj
 POSdBzm0W2NfdFbqS2jeambPKiVTJE0XDYk480cHoXMSZH4e7teJIlXTTuYqrjzt8O
 gXWz36caas3bQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 28 Oct 2026 18:31:45 +0100
Message-ID: <20261028173145.767705-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMIwRUnWImqczV3lu8NL8FsnAm/MdfP9yyyK+FqItAD3C/NIqvN/iQyGo29eh+5Rn8fNjBFyWrV81zreUQ9ici3vsExduLHfersZAxf9KRobphRYQx//
 9XUpWQnus1tbav2aNIsEeQhTBTWad+Mc+TBVeYipoC1zzYz06GNiaTvTILtbnFwfN2PEyYFuYGx7ppRzaJQx/93QyuZkXIjjDAaEB4/srC0nXoeRBnys1Q4/
 IXQjBQXpeaiQzDgQJ3vXOll1ujXR39Lp2XKwgikK01E=
Subject: [Buildroot] [PATCH] package/swugenerator: bump to version 0.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For release notes, see:
https://github.com/sbabic/swugenerator/releases/tag/0.7
https://github.com/sbabic/swugenerator/releases/tag/0.8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 75a902f2c4..a9f9fbe8a3 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
+sha256  91f1b1cfee110775ab5a9e99ef20f5576f7a33bb1ed3bc467e111502355935e8  swugenerator-0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index a892002369..3fbdc1bc99 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.6
+SWUGENERATOR_VERSION = 0.8
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
