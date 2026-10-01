Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC7CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE2340D92;
	Thu,  1 Oct 2026 12:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k68bax-iBwMf; Thu,  1 Oct 2026 12:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC3ED40D8D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790859392;
	b=dCwDDtScdTO2UQGkCCxawJ7emFa1XOFaS27Tn4eKt5dVm+XDiYWtxwGA5wIW6ZePvejB
	 N8LiFfmh/s28OIilVyyJivkGnQ3yZstH5lRQ060I5fsvhHlkDUmXu1kN2clw4TnVs26YD
	 +WrAOd1/oEkXHsYQyUdSypmLGS+wrJH6HDn27JZRnncwZFrlb2o01zAWWX80wY9h2S7nK
	 it2eGxLG2AURhooMvEff9EB5QRnfrngOAlogTlCLI7Gx9UFEpYEP3UmF/LnmfDhWV7JQt
	 XwgGQLrV4QQQZeBZVFgMTog/LGPGSaCPPh8ZqM1L2P98aGapB9kYPBMBvy4uJ70iwVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790859392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ta29gdqCp+zyy/1vUev5BszMq+EBkq5qM9d8RsAB+KM=;
	b=TW7f/eD3PjCt7rRynMODijRTDEY3B15KcO3ohSn1UMQkcvx/Ww3mMFq/RW2IEGVuk302
	 2JzD+KE9e248fUCuoYSssx17mm3pV+7NmkLN4/8dVzbhOCwnJcghwz7xLu+1zEfE8KlvQ
	 xKgP0GaGPsMzj06epFRL7zJGB8SJ7bs90qYCkBfsANfkhpikFKkqpXvsscdNlj0Byb1a6
	 oZAjtL2Y78bL5LvJTBhWDr+IJ6MXuYBp84JU/VEhXiCqfyKcu6tzPshjG1B1yiMACA+ke
	 gMDbZpN1h33RDRU7VP1H1DiKK6L1cSXBgvMksziU3MtkCHr+skn6u2SDDP6zGwa7xXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790859392;
	bh=ta29gdqCp+zyy/1vUev5BszMq+EBkq5qM9d8RsAB+KM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TXStEiz1dcLQXrQMYT8DtV6yGz+d+HcM2U/XFv9AfvXI/zPLlX+0abyH8V9i2mWfP
	 qiqzUIhDgq1rDWQ09aTb/zfk3yBKr6cq2RLhCef3y7aiEWnvtPe9mBIrZANtJrT6CK
	 Krs7wLxmHDFctSq34SnlPsmgUED87yn8/iFh3Q/ugBFptp3ouKyaOLjaOqztENRODk
	 NNxiv5dCZlicFuuzNveGAC9oyMGc0MyuGiFLcii5Osvcj5zDm3hsuRQgELEWpDolZH
	 zT+ofwlZnoTpVZ1l6lVROxrsnIiJ0j8r9p19D+V9oarKIKHx2cT1QxYsxjy9lTBL2V
	 meYHdTSZ2PaUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3ED40D8D;
	Thu,  1 Oct 2026 12:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D144263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22C3181317
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoUysTzdK8o4 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5924781235
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790859388;
 b=W2oOqi6U8uICStttXivmdPjcyGUujBwlxo3DrL8V6Mj+IcQCaNeZRLXslRybgYrVmq8l
 u6rxWyczGudZWE7UDLhojmS+aBHMI3w/Nlfm/QsoGxu3EimbSg15XYYqheGbp+tgirHNI
 nYw5LFECDFWja3Gig71GROoSQZ4Dt1gsc4NpGUyRNgkbQIoPu0ndor12bJ6IdJ0aAjgYW
 2u4inTcdsdHhUMKmnKDgQBIYscEtQ9U3aWc2A3DXpbC0JlsOQKSbULdEqfQp14hvdpWuu
 hDqYgIJNOb6WduDsixvNQVoa46drd0bj1M5X6yO+MYBTs+WrxoowHaqesmVUWe0eYgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790859388;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ikpKyo9Zbpml7hmLLrfELyP+IwKO1zp8IkVlNV6P5oE=;
 b=dJvKHuiV4FrNozNNysRLcfNjaRKswazO8Ke0JdxEg7kmNG2oveIvw6SkKNmxkflU6RDD
 CMhCqtsBIoXBGASXOV+7FdbEJ8q+ueP23qeTBUHBU4I1CSV3bMKTLPUNQJwJTZy0nifL9
 Z0dg6d7aZs2qbY4Dv1SFxiCCkpI1QNqkfEGYizyy2dJQa012oNpo0UmS+CTgXRnLMWNGe
 B3S2FTDrPcc/HTqzaLep1YkS/qcymWwQljQZ6eQXXNL5ATMeD//gFySI9unrGrGRAXByn
 GEUA9LLWiCeGicDlLNmUMR02zU3zOU/xq8bsY4Xy4uWDL9PY5S/ujgT6knhzRxJmgjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=q5BkrjlA; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5924781235
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B09A01814C1; Thu, 01 Oct 2026 14:56:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 14:56:05 +0200
Message-ID: <20261001125613.2347873-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001125613.2347873-1-buildroot@heine.tech>
References: <20261001125613.2347873-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 3/4] package/sqlitecpp: needs threads
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SQLiteCpp has an unconditional dependency on threads.

fixes:
br-test-pkg/br-arm-full-nothread
https://gitlab.com/heinemml/buildroot/-/jobs/16865965420

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 31de9a3904..614c46cb54 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
