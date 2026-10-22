Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA1606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CZ6Fn7aW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC6D40967;
	Thu, 22 Oct 2026 21:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZdNtHOerKQq; Thu, 22 Oct 2026 21:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81DB44096D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704215;
	b=UW9aC6Iw9JLOwL79VqZQnTrCrvqySjEJiW2OgCw02HniXZL+xUNWrF/8KrXncW2oFM4u
	 2FoCa/GvizlOYydehZpTeFkP5FHBhb+f7nJ6PdGGWmfpC0di2KizgkZvfYeRgVtKuJOCo
	 FgIKIn6rPV23XBL4KkULBFutTDPAfDdOgtcGsiWzxqorVSh5jqHwHWdAPCd7559EK7Xlf
	 LLxuD4i8UmpwozMmee2p8OjUNiNBMpp4DOsFIGSSLRjlQpQP8ZuiUcBovXCiY369cvG+M
	 3jcuPcpWmv9loNGQin14S/hmuNPcF09E/J22UNJ+58qj4fCotYTl5qwoFw09dyGJOjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wveWCeKpj3TWQ5kUVcf3F+SpIsKXBhA/zAx+y/VzbB8=;
	b=UD7jlGnc9H4QiHCQ1mL2a8RbrupY5YyBdl0OrAWJYhrhyNg71FPDxd3d5wnmpTO5B8Zd
	 GAs2NDsIT1UFWTtewALC5YECJbJ8n3pfOKB+VLKzJDaCJF9jxoMAkPKJDLO15DCJAPmcZ
	 /QwKfMoMoEbdzqB2qroxzVXc3fu1M6kW76kDP9KnIgrXeCIlOZcXI97TMduZ70Zyl6Sa/
	 Ob44qH/hek7bWAwbr7jfn2RXGtKyb3bkE68KwGNA65vnaQZMIQn8XTRNKwhAe2CPoXjDp
	 aFN6B28HGuGX5ZhXSi4A0HDPf3xzFVv0qPFVS0fhbFPclocWGgwD9auWezs2U4JmCNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704215;
	bh=wveWCeKpj3TWQ5kUVcf3F+SpIsKXBhA/zAx+y/VzbB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CZ6Fn7aWFMBk5YRttpBKhEnUE0+kJjONHKuSnSaLiPGT810HnM0BsDk2/Zv+YdrTs
	 l47X5jGrhdlrIZWvJ96oJyrvQuQ0/Oo064gtdjJxrvMDoBerOLbrq8xIJa35nQBRbC
	 jSesJvW+KkeN2iVEY1VfTiYJaiuoJAfWzcbY+BsO1T4kkqwyAQoxlY2IMxvWBcvz6R
	 BW5gZ3i5Vlbpgx7LQyYG/n4s3br4QrDiet/Pch0/qPkJ4epk423hKooH293aIVxYJJ
	 Zm7VTXkcmS7EZp58Tq0I/OrQcVCWUyOCgDYZkmbvTpCr6okNichpu034Xn7vybv8bL
	 gI5kfUzpDHihw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DB44096D;
	Thu, 22 Oct 2026 21:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8E53AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D58D40270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fkoZHtFHljR for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C5B0C401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704213;
 b=FlzYqozB4hEL4Qk2yjsIq5pgm2M3iYKbqRlj/KNhhHsM448yGGir2HdY9eGQku3yle4b
 zFCcjvOunjFqFnyIFitldZ9H/+BUVG3ZA185jVu66R7zVbL1TjnVCU1xzjyAaks53MUe4
 Rc6Z47OGgJ1d7SWBqDi3gkOX5Csk4i0OIP2y6gnEtWrd56CDuTmmvMJgm9J1P8MiY5sW3
 3uVwxBje5XWYvTMzDLEtiCY0D1YZQgqUkG6TfkhWMk1lpECmf99NZcZW4HyR0vHhS92KN
 tqWJnMiPN6WTyxH5LSsEfV8+VmlOeAr1eXyd9x9kkP3wyFyzCmVe2rc1Z+t4EY6okOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S/g36wbf8LxUgPb2eaT/8q/xOVK44g4W5mEJ0/qvSyI=;
 b=mnHBtk0aiK+bhq/9JFy9dNbAOAbvvdWzmy8nTBummImzL4wuGuX5Oic7c86CgnNm9TKg
 OkA/ORYnGx6D/NXczn4m6QIJAPa29wlCX4fHVEPKZLzgQsWJikp2WYEUZ82k6T3K3BCXF
 D7V+J8ZBxAsaVh7zAJL1I0/M1vaumJM+zoTHwysQm4NP3m1W5zSltT3QyPbmzeKTQzDx9
 WxeZYfStl5ltq4T1a2SZ4rz4Ibolgl6Psc+R930wq+vp4RUr9euZZEIdDnGVN2ih6hg1z
 cwC86cvZ7yLVYFvaL90f83LTuNyIPQwdLEovaInV9fdGjlq4KqXOBWj8AGiC86rxfhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B0C401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A12129C26D; Thu, 22 Oct 2026 21:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:22:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b56db7616008c93d9e6803a2376ccc9873eb6f7f
X-Git-Newrev: b904a38926a15849ad92482a7ca63914fecda420
X-Patchwork-Hint: ignore
Message-Id: <20261022212209.A12129C26D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump version to
 9.20.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b904a38926a15849ad92482a7ca63914fecda420
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30

Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8129fa2d2b..2d6aa2fde4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
+sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a05ef6c362..7fb07fc83c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.29
+BIND_VERSION = 9.20.30
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
