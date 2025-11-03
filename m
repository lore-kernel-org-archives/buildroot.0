Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F8CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 07:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA6D83F02;
	Mon,  3 Nov 2025 07:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_6UWlBevtTl; Mon,  3 Nov 2025 07:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7598083E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7598083E52;
	Mon,  3 Nov 2025 07:34:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E30222
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 07:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF5B60E42
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 07:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtCmdbk3H4pk for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 07:34:30 +0000 (UTC)
X-Greylist: delayed 434 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Nov 2025 07:34:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AC0660E40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC0660E40
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com;
 envelope-from=vladimir.kondratiev@mobileye.com; receiver=<UNKNOWN> 
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC0660E40
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 07:34:28 +0000 (UTC)
X-CSE-ConnectionGUID: C9rcYIXzTqyu0oE6bOOsoA==
X-CSE-MsgGUID: W1XP+u57QQChTgL6bOpAnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:27:12 +0200
X-CSE-ConnectionGUID: S9ER0t1jRT2Si5RDfJ7xKw==
X-CSE-MsgGUID: 0RDgphKzTzuI2mJ+QIiHIg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
 by ces02_data.me-corp.lan with SMTP; 03 Nov 2025 09:27:27 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation);
 Mon, 03 Nov 2025 09:27:11 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon,  3 Nov 2025 09:27:00 +0200
Message-ID: <20251103072700.968500-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1762155269; x=1793691269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DhClWTPDaXuPZtQCnKYyFNHZ/4uKuh7Fo+Zmui8KhFo=;
 b=OSippAN1Jd3ytfIhzXbhqQcLJ7q05oY2FsykZFDy40sVWml/KBj7JE/P
 ASn/OGOloLPk0wXbUbIHuezmB59B3SKsB3F3iOgQ7lpPnZ8kbATz4GB9X
 GIA9uIAzLlmNoqVQKyehADA1Ll6OKxurGqCe2Xx2Tesg4jZRTRMHw1uBP
 3Jn9JeLBe122TOthXkRYLT77VvFpuy2wG0zR15CTL4i0+PQDmLSJuWPCl
 nJwOxWyl9c3sZ/SJVKY1lk3VdYBGCcPfVv2hwpfPHJYqPy0D768Q9NDG7
 3AJ69hWyIzKwCvg2uAqvDzoqTh6noElDkLGGF6dhL29E86tjgWm/gul3l
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 1/1] package/kexec: enable on risc-v
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
From: Vladimir Kondratiev via buildroot <buildroot@buildroot.org>
Reply-To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from version 2.0.32, kexec has support for the
risc-v architecture

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 package/kexec/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 2e3efb5a2acc..dce0831bf2e4 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 		BR2_loongarch64 || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
+		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k || \
+		BR2_riscv
 
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
