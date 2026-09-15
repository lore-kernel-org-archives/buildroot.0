Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7DC88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 11:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1540280CF0;
	Tue, 15 Sep 2026 11:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Is-PIT9v1zK; Tue, 15 Sep 2026 11:12:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92D9E80CC3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789470745;
	b=Me9sk15B65d6H7VfzAFzHLf0xaCWi5BltGDNtLPqQxc2VTWyF2BKGuHDsIPxEuC3zjEx
	 1QvnUcOnxmUayYKr/dDyVZzLpXYXdWVpkq9MvRrQKahv1bOuTUb89eFj1f4u9jl0P1TIe
	 SwhhDOx0tBscbjoMtf+BdCuTNecDDOL7elKtIgXqJaYH46V/DphbxhkocUXemE7AzgVam
	 OQma/F+F0ZetQ5olXB3mE8YSPQlfgLmk/XxXnjyKN3m6tfJ8QMdB2V4JQ52+BtKnI6Xuy
	 CHqCMoGlnBK8WjX+QP+yUEGVZg6jp23wSh2s0g5lXTk2iFnjlMASJaab4NCSMmo0Spg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789470745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=vv29stOIZ81O0vduidn2WnpQPmq/DiksM0ZpGSOv2+A=;
	b=RDBg0vugfOigBnbOchTkH9TypC8nUYSXAOQjmUOYODvVA8yFqt39Os2ANmAmyigdhR6z
	 IDMad5xjer3+GsH9wZV8FUVSE+Z5piH9fwTqk+678EB+CvQ6uiC241h8Y4ly+WpV84Q7u
	 S2x36KYVhqeaKU3P8d6QOH2XabR5bwAKb8OZ2ljE0Pxhai+0PAh+FoFzu8Iox2zRaoNvo
	 9ScxQZyEGHYLH2UgVJ4Jxh+Jhqfx6gdoloRW3MyiwTiWPTyIE9nvJLbAhhJv+NFGcP87E
	 p78rItBOqkwaSSCoLwVT4GvVDsiLE0OcQrf25qlhpvDy8/1WnZwokEmDu9SS2c3Kimg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789470745;
	bh=vv29stOIZ81O0vduidn2WnpQPmq/DiksM0ZpGSOv2+A=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OPOzn8rcKISbDIj7PtysDMBtb88dZJdyvHWEdiC6L3laq23FndoBULuCuywDGqoKH
	 xr0OMOc5QuumnVBJCQOPit2kkqXI6LbNvuYDOLCDnyLjxDxohU7DyVhPZ5Vyfkwwjx
	 orpm2reVfo8/0FWtHICSbGE0vL7IeqJWXHND6Ryx7ac855M26kOTnmW52Beu0BJ0tN
	 l+8p8B6XuQWzjuJmpdr+BZLjkppSCnN9onmi2W+eBtS+tRTWPiR7K7qyyhSXrkR3bW
	 PJaLyiI34Rjfd9PqOi8h4hORhW4MdeaYqqoJsOOXwgXEbb9rcbnIRxsIHydLIjcs8P
	 TY1CEn8Se4z4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D9E80CC3;
	Tue, 15 Sep 2026 11:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FABD2E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3414005E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0mWopgx38WG for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 11:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2BF914002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789470743;
 b=mJqZJTDwjb+WiJu1wB1ZrQehlUzRKUbEfYKIrPAe0kM2JQt568ObllI1DhR2TuHGxuZu
 UEZyacn9+V7eE9JC6wqFquhMpX39dqdfmKrUyiqm4hM7DGo2p7EtkOc1aNDIoe1v5ql2M
 pY8Z+fHKgKBme6S1M3maNTOOUtOiYfvXON/U24FnIc5wzhTampoWWx4nK5X7qQP8l6lc9
 6j/iFO1h47mx4xMwcuZK7pSSIYIBV/bf5Ym+JCmYLMUdyty/QNivSU4SH1pCBWhgLrgWz
 owHAItkhGCbZoV9Z5Cxj2nfxTp/pKk+FmQL/c2h04Q4CbYbV/KNs4Qxg3opx50IyoCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789470743;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=lcW3ZAJh85CV0xzfsyDedEzac1hLhmiUWKbxV2pdKCE=;
 b=EfU8nNyElKTHqFFLWCIJkDxz0vtEaPiZsuZkGQvXci4PzCvg5ZJaPD7+iHJy5gqApqah
 5XSZU6Eg3G4Ssf+IqSP8mZlB7ZUI9fZtUxIPeRSK6cVvxk+287v2N2xosCU4323pfhYM5
 YwdSDHT6KQc0jGdj2eVDNuzVLtFnpFACrEBuCQCzgOSTYcPk/cal889oP8gb0YmIrI5Wt
 YLVbun1fZPdmZpdlTndVQIGwiTNQ8Fvq2iPa0e12lhd7L4CTMF/gSugfc0MKWF4L6ZZDG
 60oh8NHMaHCAXGbE2Dg0ZxOeEPKvUl9ODCnuetBAHyBypCMKVXMJ9duoh+tJDNhH4lw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=liCb5vbw; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF914002B
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:12:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BBADD4E4063B;
 Tue, 15 Sep 2026 11:12:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90C9360498;
 Tue, 15 Sep 2026 11:12:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A0A011C7AFBF; 
 Tue, 15 Sep 2026 13:12:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Sep 2026 13:12:17 +0200
Message-ID: <20260915111218.1918981-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/gerbera: propagate icu's dependency on
 !BR2_BINFMT_FLAT
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

gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
but this dependency was not propagated to gerbera. In practice this is
not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
let's propagate this dependency.

Note: in the Config.in comment, we handle it like an architecture
dependency, like is done in package/icu/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gerbera/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3078d2017f..0219216276 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_CXXOPTS
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_ICU
@@ -32,6 +33,7 @@ config BR2_PACKAGE_GERBERA
 
 comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
 	depends on BR2_USE_MMU
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
