Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE58E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 16:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B7740566;
	Fri, 26 Dec 2025 16:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ztrTNksSxHR; Fri, 26 Dec 2025 16:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02047404F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766765553;
	bh=UyHjesZ9b7OFvLwtqYDvVpLEjDSPeZisALCyArGU3dQ=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=opqJX6ESAeCDM0mLsZTKNHCb0X8p09fgAnXCQWLb8CpkYzu3HJD8cy7QMBJnG0FZ2
	 THRIvYQZwKoLpOsKsiyo1kTGeA3MwJ1t5qXUTrT2f6eqLIgTgZg+ylaMdAsGax1vIj
	 ufzTFCLOs3hpNXd0EoQvSB8rIgEzaKynSabjJipy9WRtdUThkB2Pl7fDEUu9IGbC86
	 AmUw5MAZmmVFHD9uAx2egZPe2RWo/w0OQrLa6nkDXOvUaIbUjMp384P68EoE2r4CDl
	 rv6nZAyEHnThQyYMPxkY06orww6CX2na8PHme8nDLW/ROPzKWHkDSyVx8w0e08xFs0
	 EvCyNHW/s5BsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02047404F2;
	Fri, 26 Dec 2025 16:12:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAABD119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C6181189
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV-z0nu2HR39 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 16:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 512F481188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512F481188
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 512F481188
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:12:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.100.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UUy-1vYc7C1Ceg-005yFo; Fri, 26
 Dec 2025 17:07:16 +0100
Date: Fri, 26 Dec 2025 17:07:10 +0100
MIME-Version: 1.0
Message-Id: <20251226-rgbmatrix-bump-v1-1-69c2aa62beaa@gmx.net>
References: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
In-Reply-To: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766765235; l=1374;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=9cdBa2hrmp/X7zZF+dMZGZIxi2NbYiHbPJXdJj0bs6w=;
 b=jHuRSp8WUMOvdqCXaUvgnUgFCyeFwxrBxBKlnl1H6wzMg15+SuCBbSUoFF6MIHklaCi7mp3Ji
 aPRmQCap6GBDHoMSvEMOPa/QU4ugFH/CxjkxnGV7BLM6pbfcIgSvFS4
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:pzuRCYC0XqXOT4VMjXEtfRefTmulZMIt5N2cLwyBzOk82mt0LEV
 74lDcIDeSreCzIzmjL0WyhGhLN+3s2yGYa+toejk785tcWVoJ7rpfrftdHLGPVNG2o3Smi0
 OeZZ/uRArx23Ms/p2LCJdrZaUrXwEx8j2P2mAHCH9lrLcg5NqrFldkph/gXdyW0+aFhYIlR
 drsxLS7VUIon5Sdfx8vIg==
UI-OutboundReport: notjunk:1;M01:P0:CsjMwSqgf2Q=;INj4mDODuWwdNIvYkk9EMDR/ywQ
 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
 wKgsC371AUNKmnftA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766765548; x=1767370348; i=j.neuschaefer@gmx.net;
 bh=J7r5TjTlJS2bix8OflM2B8+nNRFSGO436jBAK1RKtDU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MGMXxjZPt+tiGEQe3f7W4Cq+4hVIErT9ii6oaYS7jRqgikD744Ig+u1Oko0OKLH5
 tTPXjq+BscbuMqeQF570pwmhLOrkYPriAxcbVKLf4JzWwx00UDSXLHrkYbLc3RVnQ
 ygQ1YK/vIh9domp7UYs9BrqGUWTwQHkIHClRlDfjEzxtKEXRJcCeTwJURT8RlpTZH
 ZVfeh/iyKQeL01xBHrkuQVnuUgaJ2Dm13RjwTEnzfQv00gHdq/0fP5+fu7rnTlZ85
 12MO6h8EN/IgoVrqxdBes2rLhfy01wcQsKsN680bbDKDvSdQ2Fc6hJp2raTqmKRqX
 QaBh0GK1djvfArqjTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MGMXxjZP
Subject: [Buildroot] [PATCH RFC 1/2] package/python-pillow: install
 libImaging headers
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-rgbmatrix depends[1] on Imaging.h since commit bf45676 ("Refactor
broken unsafe SetImagePillow()").

Debian only installs four headers[2], but this seems insufficient,
because Imaging.h includes at least one header that is not on this list
(Arrow.h).

[1]: https://github.com/hzeller/rpi-rgb-led-matrix/pull/1818
[2]: https://sources.debian.org/src/pillow/12.0.0-1/debian/rules#L106
---
 package/python-pillow/python-pillow.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 80961b92a5..3ae4938dc5 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -12,6 +12,7 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
+PYTHON_PILLOW_INSTALL_STAGING = YES
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
 PYTHON_PILLOW_BUILD_OPTS = \
@@ -75,4 +76,9 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Czlib=disable
 endif
 
+define PYTHON_PILLOW_INSTALL_LIBIMAGING_HEADERS_STAGING
+	$(INSTALL) -D -m 0644 -t $(STAGING_DIR)/usr/include $(@D)/src/libImaging/*.h
+endef
+PYTHON_PILLOW_POST_INSTALL_STAGING_HOOKS += PYTHON_PILLOW_INSTALL_LIBIMAGING_HEADERS_STAGING
+
 $(eval $(python-package))

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
