Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C00C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94EA40CC9;
	Sun, 27 Sep 2026 10:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKLps41zZbTW; Sun, 27 Sep 2026 10:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D1A7C40C9B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506618;
	b=DN9YsC91WJaXpNC54/RXqowWS7v1rtNGUhFXC6JKR31VHWwJWRGQVuherhV1XnHgWMM1
	 oKeOuaNU04J3mmXN/VEvHog1bpQDslMcUPsJY9Z11S1TuPgOT3Mn6wu/Dw9PjQekSveCw
	 DZ6uxn1rObu6lNjfsMC3WvzD081BrwN+yyhKU48BDI5QYeYAhMNCfZFOXQrbACvGqIQY4
	 /cReYfchYLWtLi6AIu58whmZptPuhHnK6MOy8bOmLYp6IItHxuXy7DuMWDfUtJboM7zXC
	 qapPOeA4spGRte4IQtYr2v13JmfF75hyjEJu4rnuRZrpyC/Xa944qveM5VNVD6U1f3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506618;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=Yxe1Urg/VvTcMHNpWceRWKxfmPduZ780gYsDmbFPYIA/7gzfGROIAs6e2hB4HS/t5OiT
	 1/jigQHXwzxYcztayBH/u3ZbhAtmWO4ixq+bVUd7Ks967hBfxXdh4Dt9N37VR3wFDPczL
	 U67geOaSklR81InfkyhbAPDsGaXF6IaSXRQvQNG33L9RkOxYDsBH8ui09LCTpCI7CwMq3
	 KfPG8Pmsu1+EPTujqaw6P/jv4kNem69t15xPOPvBxcfbE7XipaYol/1qiduTua+jf5ntx
	 lGF6ETejlkQytgezkdiEsTeDkDXTjIJCohVw+W9JVT+9xKqyoo8PvZnOuubpvtj7w9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506617;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z/+wl63vBu3BhTGcaifSxK6RQmV5noa02B5Snljk5CuYcec2liUIeSlmbVJ+FSevg
	 JVOBzmfAbrZRqzmll0CVB6DoNvY/YR3eXHpKGPYIMwaKM6awuB55mIvNb8807LBJac
	 +Ips2M0sW1Ho7vQyC9Y379L3X6MnU6BCW7bsc0ToXHj4q3AndZbdwgzI0mmMerK1RD
	 Cdyd7CsL5PW6FoSYaBe/8khxwWNxZ7qz8IP1Ieb6iGYKAeJQ1q1+/LTa+BrDNid8Uc
	 1vLv2RYqONJzhKPssYVi9/7U2gHuPZaoo3w+fORmG4liJU/FvL4JQhaXcLPYc9ngGG
	 X3wwBJaDmZ5WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A7C40C9B;
	Sun, 27 Sep 2026 10:56:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F27C7D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E481140068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cs31rhz_2OdA for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 07EC240059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506615;
 b=Yu0yI96L/Gwh9CZzxRvznCAu/u+E86aSwY8X46KjK5kfkXGd6wtvWNGyOhhuuqbQuWuZ
 O1HWAcy+SOlhRMtMDoL9QiWJZvDptm8aEHx4sdC7t2CtGZtvPisDy+U/kbO/PeO46cn+q
 e+merj5J3B4QAWqUZz9i+b6Xk+/KTVS7P1FsP8i8ynflU/ZpI/rpwBNA4HRpvjC3SvFJL
 I6cn7Vm36JwyiKC77QL437QkMyWZi4tuB0I65VhR0koixrgNkjYc8A8CpW86D6tOarcge
 ps9MSU0irYhRL9IV3GF6M0/v3bvTRsG2D5mzTABpMsEZwxsrv0Qdn6qAK2zHCHMDF9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506615;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=CnJFISizVvCJZgu1kzZYO6LxkKKWRKg9Damc+GNcZm+/gCh84oJhEpB5cMlkC/4MQhkJ
 Zxg2l9lFsjqSkDSCKx5GAWwCOSlnGpaJMV4OQpxDCJYPFTZELug8yH4YD0OjgQj4gjCpI
 HCtmXada23pKtAO0wfez4OtdUn0FxSyQyBZC9vYPrA+keCMRzsjne4zNP17Pbsa0Vv1DT
 jBvg3hy5U1+PY4rANmnjUcYHtV+74AzjkanfgxXqGa2pjqbWMiE1Yg1W4lxP8SXPXm3Ig
 zAwy0Eo0nitRTmN+3CHGGE9vAGzCKB87cwn/JhyiHfzNSJitYA+W71AdG32UJq+Ei2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dPzj7GRd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dPzj7GRd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07EC240059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505862;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dPzj7GRdJFVd8FM/WyXRbIsbMsjQte879rKoJVPRqr6fwczG/cT0IV0HWt6U9nleq
 Cz2gTlQZsW9GEL/oVBvmF0Ek4fmPYDWWeQR1zfmjYQD96xMo0ag7RnFYXVKqapUvu7
 O6PyqMJQRuz4CJZOsXLUBlaLS/t47du57+ImplCSVTpXwMKp35QBT1Ce9pX1LQ18EB
 lSCu4ImgEIB/iUwNu3+Zf6APODIpssVfXfRXM69j1gzusG623K5MDLPUd9nvoVwQwl
 CHMtYyZEijyJ9yzlk9RdnpJ+lUEbW57DX6ooz3C44bixwWatcrd/Knxw4N/NRrnlHE
 nLzFKTV2bm9XQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 ULg0trcWIRL/yNhB6sCpNqghUeD4Zo9HroeGCPm7i0coNvFxSJV8e92ldXvQzShaITejhsFjh5b
 NE6jI+O/Y0NY8LBvABOyPBV4bIdDxKQaZXHIETtc8Pga19+DJfyJuUczlZUp2ESyTt5xpxb9gQS
 WBgo/hqOP0Ir+lkTx70PFv+As70n9S4FLudxrP5dHH9nlclcYKJtQUEbp5r6CHuVMxn5OO/GgQ8
 KENrLUl+mSioH4C/xJarvr30rHBaVnI1KZHBuanD19HBHQHdRCwl4/Gh/c9zFtIocfWPqyjBtrh
 rcjhsWscj5UFb0y2a9ZFz5WVAHnoRzlj/F9NSvLZMU8y0yM54D1HZWT/Q2MW8HLDyCdQzt325sZ
 oJZZ1SxWB9RWWQcq2yER74JJJ6JQQE6du6Xt9CR0TE1k7/hmUNuFPHrKo+tcYZ4e81m3QknTID5
 Q62mBYLoKvIL0qtS4nxd8X/TBF3o8qhLDMfNfsXL1j+YPQzVrcDYR+AOXx26Vr6vlQYgEIyt/kl
 d+LhCIgwGASjMtU5b+sphMZs6UCgfLiybRV6s8Guxgn675QxNfb3Q2ibk18bT+TKXkLufkWVMPx
 pVgnKcTY+ErOs36TTQdytBdqX4mbOBDkV6cJFDWaXeC2S7rSgZknZywnooJ72z7gFUyS/515QH2
 v4sC+GT3TzC7bK4qaFj6a
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD1BBA4C5071;
 Sun, 27 Sep 2026 12:44:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-2z9w;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:17 +0200
Message-ID: <20260927104301.1801638-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 39/82] package/boinc: Fix build with OpenSSL
 4.0.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
