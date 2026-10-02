Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B398FCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4290B80F84;
	Fri,  2 Oct 2026 10:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dVvwNgDjsBa; Fri,  2 Oct 2026 10:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A6D5810D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790936643;
	b=kdVyAXSjRLnnuYDv4HPQQeN2B2W+yy6hSjkiRvg/Tq1ET47Eox8yGZOy3V9DLpVtTynD
	 8RgIpN2ambV7Rof/4HCjuS/nEws0tK5oW/UmELyawjvN52B3J2z2nqEL+jUrsn4oOZjNN
	 kzvbOt1+ZY8RpT6CYU/aDh8GY6kHEWHDqhW0PkBTBsSrutCASVK97nLSsdc4rBoxNZ91o
	 8uSiRKP6XdEboVDc8qd1FRR+qwK4R8vmr8Wj32ZfMV2ScS4T9oYqSFlhAD9L3hyWCR312
	 x4omYG+qXynxtJOxSCPeo3pG6HbPvtKylr5rb7GoWvIEE6GQUwBGgbGZiP9D6G46zgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790936643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=XrcxpUBcF/kJML+/tiTu8blA+bkQ2oVrk08XCG0K0uU=;
	b=akChqdBS3ZYZy2w/fguIZqj2SMrOnFPzTsY71D6rch1upX9Tk6wYeE2QkTr74Tq77T/s
	 rUHRitOJa9ihggm4UGGnhAH5E+2sLB8AqdTV6g7LxCAmWehX5MyJjDMZXXi0NdH9an6Le
	 t7DIONbi7DdLbi7kRrqiMFHh+LAk8kp12juyKfZlwFPN6IT+BFHNn+IT0A1ntX4hJRdhN
	 snl8m/oMPB6X3WlKmv+00dKSTY6o1IpM9fm2dnh5WC29qiE+NxwM46dE+421nNuLA28qr
	 fWRwSmlN6zdUOdXv1aQ0nHRomrFzqEs6ZUL3IilrGyCjCv8gQ7hN5mL+ZyT90lCRwQQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790936643;
	bh=XrcxpUBcF/kJML+/tiTu8blA+bkQ2oVrk08XCG0K0uU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c6eH0WRY4JVLwgI50jW1VNL2506/Oixtcjxtdij5OXl4K1+R74dxdAB5ka11q6F3U
	 Jt2oD2q+VFrhUtJyP4aJviJz+Iw0qJ8ZDsra6i2DZoBWZmnmkxs0RlY0RSxygcYteY
	 LmeWa3ITyXzN80gDKBd+9gElwPFf3a/L3R5eE1dekzat/5EmYtlBUdqeQslI58KQco
	 41rXsMremZa+w4RqJyKMsQ43IeRxGzjA7P64hlXKqpz9EzrakBeJPOfhzHvDdRe/2e
	 9cqxUzhKUNsMa2vNfuM9Rt66e+eqfXsQxvgkIccDZSNahZAaR/2Z4NuKONtQSCHX7w
	 tiicjr5lSO9MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6D5810D9;
	Fri,  2 Oct 2026 10:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6C00282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFD9A60865
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIvdTZyh2Gfe for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45E7E607CE
Authentication-Results: smtp3.osuosl.org; arc=none
 smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790936635;
 b=WWGD+QXGVZ9VTB6j3ncdrGbRqEGk6KmlN5Uy/O9UBf86e5j45nUYNNcezMCo9Fp3eDXP
 sgJBRdFvbvMHPiVlqk65L7qGfcXQv91tnRk7oc93tNm7qrVmfYggX+mmdLMH4H89OnTen
 jcHbtXP+dKKzwBOBMc11KvWhctUWdlxlDXayneEU+KhJapYLGG4ERqRt0xGezjXmL5yJa
 /0oF21mOyukNWch2crqhP59MbKe1zrDotHyCMA3z6fR/ssFuwk/TuCYJVotAgSOnaO/Br
 C1LCb0qwJyfMTkOpTZ7CD+gBP+Kyufj+CJL7B94KrYz/HEN6dBNXm+Ilgv8jeEG1QHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790936635;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CZB9qfe+3xpLsg2YaTX+to1EkrobmSeKay2XCCHd9SA=;
 b=AOsnKW2Z+3VeInbbNDKSfTkvNwYtFym7D/5JAvwhGtI/3ZALs3CR1OQWIARAbe479aR4
 +hBRr3nteEC140zrkxgn2FUU2jlx9AikY8kiDV8IP9NKtMViUxvvLyJLtl1L5nPmtVCpT
 EiS2Ub4fNV1oDGt6r3+OP+JGpcpG8a/caNj9dB/vnW3RmsmZl4cLvTQw6W6Qt5CbmOBkG
 mDXMrn28gjWs8ALsblm55kgmPIb5i88R45kT20OFR8sTcdf1acqjAbQoEY2X9uJ1P6I90
 i99vWVKPyprhjbRvej9wwPrpN5LWYhMIgK9Y5cxg2nPLcrIdqYh8iO8YoOoNr+7edPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=KIwu9ixA; 
 arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=paul.elder@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=KIwu9ixA
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45E7E607CE
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:54 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C52D35E;
 Fri,  2 Oct 2026 12:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790936517;
 bh=ZW2LUNlgbBe29RfjGfI1e8xAUsx7Cjs2euP/eMui5Ks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KIwu9ixAee+QXzPHEYT3OrO9ydydmMKkYfEGBWxq2HQ1l9UfG0/GTa++xbIweOQj3
 vwSbJdX3b4yPBT2NneQH3bJRbtJDcQOAoYdCBYopQ6V1z22qfliodov9epnA5/TrOZ
 g3ffHjlBZ7CwYzo9XJ1gVNwe5s8HdllMdtUUWLmY=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com
Date: Fri,  2 Oct 2026 19:23:33 +0900
Message-ID: <20261002102335.12501-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002102335.12501-1-paul.elder@ideasonboard.com>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/kmsxx: Add option for pykms
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

Add option to kmsxx to enable building pykms. While at it, add kmsprint
and kmstest to the extra utils that are built as they are useful for
testing and development.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 package/kmsxx/Config.in |  7 +++++++
 package/kmsxx/kmsxx.mk  | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index fa327ba18de1..dbf2c4ec2a42 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_KMSXX
 
 if BR2_PACKAGE_KMSXX
 
+config BR2_PACKAGE_KMSXX_PYKMS
+	bool "Enable Python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  This option enables the pykms python bindings.
+
 config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 	bool "Install test programs"
 	help
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 5aeb48910c7e..f52a1047011a 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,17 +12,23 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
-	-Dpykms=disabled \
 	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
 endif
 
+ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
+KMSXX_CONF_OPTS += -Dpykms=enabled
+KMSXX_DEPENDENCIES += python3 python-pybind
+else
+KMSXX_CONF_OPTS += -Dpykms=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-KMSXX_EXTRA_UTILS = kmsview kmscapture
+KMSXX_EXTRA_UTILS = kmsview kmscapture kmsprint kmstest
 ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
 KMSXX_DEPENDENCIES += libevdev
 KMSXX_EXTRA_UTILS += kmstouch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
