Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896CC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A3080C2D;
	Sun, 20 Sep 2026 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrgaYpbNENCM; Sun, 20 Sep 2026 21:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0775280CD4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789940420;
	b=G44D5zrd77ctbJ0fE0P9UQ5Kr8YPUKda67Zq5a3qvMmBfqJ+nu2xF34b61JUAEwbDguC
	 zliYJfJlZvj+ygUeT1XkCtUcXS4Ceq65SbUkPiQCIWPSKzQY72ijvTgHvSL+30q3WqxUC
	 VMdtrZg/+E5HjikqBbVt/7tILgZdKAfG8Z5Vn/XfDaOL0dzmgzDU8omxjL10kwQiReHFI
	 ORxI11WUcthkCALdm79QuCj6N5ifqwOQEeLWqzztFocxPy8wndjDe9+tvpzPLgQ1L4dKA
	 nDYhY8EQpSCpZgEvgZ+foY/C8BFk6w0y4+53InydCQ3uQ4JCZVPY770xp4FQ7w7tAsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789940420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TlEs9MwA6yMyH4PRiiY4pYT79Q2T7bqiqGZqavNBjqc=;
	b=IHLmEvYccirXWJZ/Dt+frV/VjBRZ/kDYjEdiVIa2AbGktbcxgoSpKv288dIwwya0vwYA
	 sXdXuChjK5kasAgv22Ix+4ogL18OVh5TAfZIHRcyl5qbNR5DgLv33ly2SygKA/KpWGUTu
	 rux4beU+VGgcFVIU0WRzPEC/9EgrkIyExT8CpESN3SecHGijvgIyDkqMQ8oKqQ50qz25e
	 5iei0NfYMiG00rDSPj+zJ+G8QsswMpSkFktkzS/9H4Wlj0p+7yahZuXE8BtgW1Q8ZdJfL
	 fZ2JRKNjNXYFeC1UYumDb9F7Z2bu1XW0fcSSblsAiFwtK/MzqeICb6q3nhtyNFgEiSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789940420;
	bh=TlEs9MwA6yMyH4PRiiY4pYT79Q2T7bqiqGZqavNBjqc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ndvzrZS6obZ5y6ioWi4YQraDI3osO4WSzkmx2Lt5v/8i7MoRA4midTA0Nrg7gzKNq
	 4cOK615Tz590RKQiQ9e/HjoxkleeZh2O9cxSFbp8vbaDwzUCB5L0B0hrNJW/FkOgSH
	 /3ojdyY8AeH3rLOpTAy9OJsYki7VlngHM4TPjZISF++ndb6i9puQTGAyqicUZAvQ0d
	 vOwgFqEu/TgEP79+s9qtWMe4cR6KwGSX+kztHUl+U3zVUBSSRdVfwJEco9zJJT5XrC
	 StTu2pMihyFXdLTUT2QU40cB0D8Ja9OXKMCds0zuKn729cRlfEVVnP0PCC09ouD/Kr
	 gc/ddXsqSxgGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0775280CD4;
	Sun, 20 Sep 2026 21:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC51380
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91BAE60679
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG8vEPS57KbK for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 21:40:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 443D2605FD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789940416;
 b=grLgPIx0zrZt/2RYuBHR4F2pocZinDXlpBaHjtaV/0TN9eYQyhT8ADWX73y3EkRHRpfh
 7vPra+pnW7K2D1BmJfRWOLfT2PN5u/TuqbnzxgoT5e6HBNBUc1YBqbCPplmzYKTHHFJlV
 /FXcsi2vuCt24VeT0SrN8jmBP2TEgBSY1dsGVOMsB+AC6gY02LQOOJrRWjHhmRRCX2sqU
 7B6EDOrDkSaIyrjZEI0jFx/DlgZaLkLi9kt8rokdyDbO6RPmbT6mO8CnEqVqxnSCssZkg
 Y4P+MzzLQZeWFqesksXkKuDCUOS4SaiAHPSFkKck4TC6N6DKFeap3PGKv4q4/w44Ftw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789940416;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+kAuLz76/j4r6iCTGzDoj4NBhUWgFIvH0ts9rMYES9Y=;
 b=PrXnR/3T9rL1eLkp5mCTmTpSVYkklAadfInB7WEQ82us7kw9RUlsmD+ryQP8qybkdt0F
 oFNa1gotpaAbAMchESQqtBE9o5jW0DA9PF/pYRDzVWWk3hJz2MUzlPFJ1Z6zsnsWS9rBT
 qysYcmwK497BFZU78V9rQ1ieuG5AReeyIpHhvUMq1hxWL65ERSW8doH1WLiQ2/y4L+OEV
 nTvcNm1MkRoM4csKhKkUeYWemJ1UyAnGTbyT8/aOfH6BYh554onEAJGtvRFD2nGqrf59b
 9Xih5BoUxigR+tnkYV4jT/qoBXYxt2cqQhssgx+5+Y/rQjGx3rWtF7HpsV7miEiQdZg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C7LR5cjY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C7LR5cjY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 443D2605FD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789940401;
 bh=+kAuLz76/j4r6iCTGzDoj4NBhUWgFIvH0ts9rMYES9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=C7LR5cjY3PKxHUekevK3DQWp/oCpbDvO2LhgGNNRAhlbsZB0ROXTwTUmbKZIbWYuY
 czQnsKQRpklOsAJvtjCPlaVPV0ZqkC3cTgE9FHUep8f1aCLCb6ouBUjUiPAmqsB8x4
 uSqbsesP4JL882r8+EhwhBdcm/uGQbzB5q4fDUPDuwGGWfNce6iFfuHmsfxgBf7HNq
 cPiYysNVIJUCkAwE+SbnOKcEOBGSPUjJtXQnm/HZP/DheDkN6QjeA/JZvfGkoG8aTr
 ArswFBToFmoQmf2+ZSAwdafL4kdNq6o213I97d5+lSTrIVl4SDgh7TDndvz2mKRVuC
 WWDe3McH7OV/w==
X-KAS-Sym: v3:f51bdf72230551df:lCKheS9ndnLLT4/f2BHXUkrfR+y86dFsCTmS5bBz4x+JxkFu26PKvBlGIxwbEoZV3EMtFST4Z+Yjco2VyPNCjf0K8YyV44TotU/s/6m7e1dzv1CrNQChbFzHpDFdaeqGlBULAx9L2hDMv6zhejJatdiQkneMrRZCElAm+doYIZfcFv82xVKiwh2EFYcJruuwMTZ//04bitbQcwuVLYhcHaglvfFOiNIzWpATDgyKjpjljYZba0Uo0N3Q0vvY7XTPULpWdgcdx470NDL3BFM9B4gIJYdB8o3O84alnrDZCCb7SZ1DLtA/fQ2cMvAFIRaKFu0NhBkZgIKqCW65wor1bg==:qEvDI2yBSvwpBuTDNFluEFwlTBw0RK5iRGe5ne0qpo1ZKXYs9w9d/Q4/5BJkH5/7iSyhMT68UWnHD4sgCftccms742AjnZWPPVPlPqmi8H24//pjan4ohB5Zi3+gyEfVJeTs0K5wqGdZWiWSopbl8TrMAhn7fRRS32UR23+Pby9kWLFfRN4z1Gflr3B+rhP0DCTIlUsnbaAN3bYXHpjLNoszOTK47675fKbAJMqD2lEFrf0Cts7N1vGNlPDOlmuZsOCzjUjUzfqDyRNLl2qEyK1NJlGEFKQofJ532gAkiqsyjKx24Yx16xZGcTESX4oCh/XTneA7q8XV+rgJzhltD7HEP0GbusO55eZJt6LHhW/Y3W8IJe+p5fjopiter9hs/SWwA+kwdfmDdPEi/P+7rOABIStM3QnQ/MP4jDXCMkFJodzdZZ2U7DDAUsPk8HaJIGMZHauaw5tSpNp8xiLOhOrKh2W+6Lct1MyQ8BJec4fYdNTxxD8d2F9sFD1c3YGF4BmgdDoZ/B1ibNLtKFFNly9gChqiEMiaGXkZY/ImCA3pUQ/zyca7EiLQuvpyb+BFCkxeKloS8eeX0lsfU1brT7V0L7i5YJ6iYwypibFN2noUQU
 NOoXdCTvZKZWfn3K8buKIroI1nDQ8bLoJBGhCRXwlaeOOkAZiVeUNqWFstWEZWKJQvQcI=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0D58A4C4886;
 Sun, 20 Sep 2026 23:40:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8PFc-000000006Yg-07c1;
 Sun, 20 Sep 2026 21:39:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 20 Sep 2026 23:39:06 +0200
Message-ID: <20260920213906.905956-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920213906.905956-1-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 6/6] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.3
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

https://lists.freedesktop.org/archives/mesa-announce/2026-September/000869.html
https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000867.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html

Removed patch which was applied to fix a build error with gcc < 13 seen
with mesa 26.1.x.

Upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3f9451b54c42a37b41246de3ceea991111389c37
added rusticl to the variable with_driver_using_cl which creates a new
dependency to the precomp-compiler:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.2.2/meson.build?ref_type=tags#L973

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: bumped to 26.2.3

 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 41 -------------------
 package/mesa3d/Config.in                      |  1 +
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      |  2 +-
 5 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fd715b5f84..42c34f08d9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.8
+MESA3D_HEADERS_VERSION = 26.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
deleted file mode 100644
index af066287e2..0000000000
--- a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 345ccf93e9d00dfd0f71085832a7df0170b74f74 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 14 Jun 2026 17:42:19 +0200
-Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
-
-This is a C23 feature and not supported by gcc < 13, which
-many host distros still have (e.g. Debian 12).
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Upstream: N/A, code completely changed upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/intel/compiler/jay/jay_ir.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 8307044ef8a..abf175a71bf 100644
---- a/src/intel/compiler/jay/jay_ir.h
-+++ b/src/intel/compiler/jay/jay_ir.h
-@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
-    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
- }
- 
--enum jay_predication : uint8_t {
-+enum jay_predication {
-    /** No predication. */
-    JAY_NOT_PREDICATED = 0,
- 
-@@ -634,7 +634,7 @@ typedef struct jay_inst {
-    bool decrement_dep:1;
-    unsigned padding  :12;
- 
--   enum jay_predication predication;
-+   uint8_t predication;
-    enum jay_conditional_mod conditional_mod;
- 
-    jay_def cond_flag; /**< conditional flag */
--- 
-2.55.0
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f45a675445..d1b6a38858 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -64,6 +64,7 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dc7776488a..fc79ced55c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
-sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
-sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-September/000869.html
+sha256  1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456ff423ea034a81f  mesa-26.2.3.tar.xz
+sha512  ec621735ae4679762ea27b979a5314c7aecfdd4165afea19c8c55f933d79b40f01fa041a95874fc4347e732ac565786d9b616a9aa8856a422204d9ecc9a12ec4  mesa-26.2.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 04112eea8e..d68988ff22 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.8
+MESA3D_VERSION = 26.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
