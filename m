Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7E0CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506D7406FB;
	Wed, 14 Oct 2026 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGPHvs1U-h-K; Wed, 14 Oct 2026 21:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B99F40674
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792014132;
	b=h7CUdidDZ0sPYLMhOCOYiberM5p0i+OhilxAZF1IWQtF23JHHSZaPushIJTeQ72q5/DE
	 Z32jP+rYwewHe7ofjGyVFWaD6Me1hn5ObRQhtLrFKLl/q4bamtw7eouDHofWK4DbvZM+I
	 91wJZCFExB5/AkdFaaKhHb9FB9S49HE21BsKQgl6e/zWCsi8N/JJ1SCJ3zeUDZCqkupyD
	 /T1sbKQhqay/0GFb7oTScmGXcWWELgOwBvfQn5Y4JKcPlBzYZHfWjfh/tkEYYhtIlu3r0
	 hnaufHue/Qf+UNLVm5hNHDXoaPINmbXoFU3k2QbhAb465JiL2uM0J1+NjMBoo5JW7Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792014132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=SYp7CA2wdT/zN67oAiJzUnhR2odCn0kQmG/l3BHytgo=;
	b=aZlrZVP/j+CKjd51xIQhTl1+PKrrVF9FwtG4TS9WKFJV6NGT5wbQwb06gCWRASphTWhk
	 q702+DVDxNRtujTKQLEW6gu+Jx5kAf61+25xEUGVrZ+c5pKRhst9JiFb5nS5VCHw2oJX1
	 s4BamGvRUVs2Q2l+wUuEei+c4FdHcxQROr4DVhFdRIiKxcW6EmLmNtyoCKeaaa1lGiS8/
	 801HvEahp3L+ynT2BRV2nhl8qf4rnyIQATejZcaJp38CeSFTI2VPLJi7xYD/lHmxwWteo
	 YrSDhfBuKRDNSA8/h1ZtKusW6199Nwu+EkNVL6O17pafkVMM9mwUs63JUqSlEM9jDcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792014132;
	bh=SYp7CA2wdT/zN67oAiJzUnhR2odCn0kQmG/l3BHytgo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZVzC/3vwSyN94eyA1jgsulCJUMBTwdZ+2MZFrtsGeIwzjtKFyTrwYJpLf1NOUdqSr
	 j1yxJCRk1quONxtvRVngrjgc/PQc1Ml9zPDP8VvW1lU2shA4yAmgOXdb5EnqeVyO0l
	 VefQeh4Ewr+VgX71Dol6vmO7oOHSRTOsBmMhDqFkwtKF8q0i+3uFwazUWibTqlU96T
	 MMOHkcLuK9+z4zHlBP9Bwtjx9wQFnWtHgayNKCxr2GZCR+E9nDL1Ff3YAEMDVD0x5e
	 /osUkV3U5Q2Y3oa/AoNNS0cCr9VnB6czdNTiiJIwunhmGIO4fjx2a/Mvfr+FA872O6
	 V8jvLoYNKLddw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B99F40674;
	Wed, 14 Oct 2026 21:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 809D8A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7278D40674
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zArQfyvK-X3S for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:42:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03F1740647
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792014130;
 b=SzMVwhGWs2iBYzsM7vdEBvhx5ufNkS1oWGTuOtP/bs5WApds0B7NzELGbiO0jeGJhwiJ
 /LH5kyXOuXRph9dl7tHSw1dJZvRxANn/3/pr8g1IIPhpx63Xd39sKuPNk1lSePTe45xMn
 +lRA7f0FMQWrl4TnPzG49+Xif3UnSsZOFh5VuasQnGxIDa0I2rqkpYyFp4GhfitTq48gr
 aiTdVOL6p1GeYKv4Hjj+1qU2WeZ7JbWFVGeC8KyOydKNp0Qr+aZ9BJAOOeG2hCS+bozCN
 8jw13HhJyAxpadT436jHT3Fc0UYfIaaVyyEN2NqCyMe6t+riHP+HLHoV/VOgYtRIgrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792014130;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=4DgIJqR55GHnWKengNejYOK7elKIj7sEpPFLdzXUTYY=;
 b=kve/GXdHRt0O6D9aYK98D1AOZztioeilQfkTR8gwGiBnLWjrgOn5Svu4YUoA8jBnI9PD
 M3x28njVTyvIXR9BVpRpzbGVoCnWR1Uq0To8oTEJufB3nB8OlR0nCNpDGSQFFDtxdmg7J
 TsxewrwDTj/pbnZmRKmlw8jhdXmFKNJPAZ5bM88zynE2U94DSmA7oRMXTSwhMaFQq4egL
 b2AXtq5yAeZ7ae+bKKa4dHjAZhj60QAQe/wxka+f0ZmbyUiddBRPz95lHHJ1dvfdvY2T8
 Kpimvus9ZedXRc3y9MveXPBWmmSam0koTtmBLrx1ANFUdHIaY2078myQLjxN9syVhiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NvZLQVUY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03F1740647
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3F9DC4E41239
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B1FE360368;
 Wed, 14 Oct 2026 21:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4808910328B00; 
 Wed, 14 Oct 2026 23:42:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Oct 2026 23:41:55 +0200
Message-ID: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/podman: propagate missing
 dependency inherited from runc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_PODMAN has:

	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN

but forgot to propagate the
BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS dependency from
BR2_PACKAGE_RUNC.

Propagating this dependency requires a bit more care than usual, due
to the ability to use crun as an alternative to runc.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in | 2 ++
 package/podman/Config.in                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 88e0805976..cf2929dc69 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -129,6 +129,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # podman
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
@@ -153,6 +154,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
diff --git a/package/podman/Config.in b/package/podman/Config.in
index bbcb15691d..a8c625c5b1 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # runc
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
@@ -91,6 +92,7 @@ endif
 comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
