Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98A606A331
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=avl8dThw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AxTV2O+r
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D43B40D09;
	Thu, 12 Nov 2026 14:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T95hoF1jHbnJ; Thu, 12 Nov 2026 14:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1977F40D12
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794494748;
	b=sQB0iJz3T8JZR3Yt/WXPMSj4tjcZjlzkaHTEkGpcf6zYhFn/ZakhFplvI3l/Uu6Mh/5j
	 yMsr74hezXfIz6qjL3QrquPXTaOQYNNtSgVIkD5UYgI7kGKATry36QZ5nbj0wYGvSTa81
	 85kxhJxUo7r1crMfsdiE48T6nrW5o0O0wKhRA+sQhK9qrgX5V9Wuk3OlOsahV5NMIHI3r
	 YISJNO9aNSW26ESsFvTrln/X4Ae+4jkbSrpGh5paVzGBfdno/YjEiEJ5+pHP0cfujCbO2
	 x54HmpTuzzaNzuGWqsbN81GWcOPKlxcl6PHsutOZU2cW+76Vn3A8h8kETHMrm9SNs4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794494748;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yvjpQgYD+s/aAN53Lu1qoreS40CtRtfP99H5M+YH1FU=;
	b=OL4IZOltZtZ+S51907/aNU8t/w5Aopp0pu3LQXO8XJpKofWmycaXMoFjKniHKT7O9XSU
	 L17pi8trdWTdW77TXl+1Or/Bnid9T6K5+BcRIiz/wBTsAE6lkElZs+1XCj2EDhZUetj9C
	 tMvIE6EVWz4yNKdZuD+ZwMBh9Pqf/d/RCYzw2aYajLhHfDZbcO72MaBWSpfOeGetWK7CS
	 qnYMP+bFqq6uIG4F2iY8lXDeKIgvG8z1I3V0PCDWiuzW1DazQgApEVvdzv3zWdiPibGVp
	 1OSBjcxkupGbyoUaNDw4cYB3qbXsI6/V1zUvvo5BC9BrWZ3uQYEx39lNaDogoipQVgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794494748;
	bh=yvjpQgYD+s/aAN53Lu1qoreS40CtRtfP99H5M+YH1FU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=avl8dThwnuegtVRlWnH9BX1j5iWiPVjp10W7XTZenWrP7TLgabaQTVWISM9S67jhM
	 iyiWR6JXjUxWp8EVA5UPXIw3TgbBlcBzfjboWfUqMtuhzQIgFGfIFNkcE9H/5hbTrV
	 QhFcB745lxGJAlLGdPi5gA3wLgjA+s+lDIXKll5CtHr+y6TUy6TeQNS4oxlQ4IHfUF
	 aKIraEdSRiZMpfvKBbAKQUv8H3xvyh2hPkn3uJXVcuTm+VTB43zbBoCHvNwAy90gF1
	 YvcBHbKG/AwBEvyILXuVQcqFk9KJe8eZnAInrBBQBokSkdaft0ThEusZTXoGffeTDG
	 Ta4rZLfCZSzUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1977F40D12;
	Thu, 12 Nov 2026 14:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4D2156
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CFCA81570
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6evdEvWKPI0 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 14:45:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 437BF8153E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AxTV2O+r
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 437BF8153E
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:45:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b7221c0f2cso4451405a12.3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794494743; x=1795099543; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rkdd1O51EgudhIQXO9tkfmWZmJun9QcAvhV1ZKVVDyM=;
 b=AxTV2O+rTE8WzPA+TWMo/r1ioq27hewuvei2yTnkzOAfc7+SflurHdwR9YgvMQWhb+
 2ITGICdXe1+o8vsod6SUypVRdY7jGHrBBjc252f1uNOtoKykxIPV3KzkhMOpJUg82e4i
 hWWOaTztNYBJaHUnj5xQHktTO23pazsS3WlZsW+WLHkdiLhSFUWjb+YzR01GiPKX2Ldn
 GYIjo+jJUSonQcskgkkJS7DM4xkBP2ZXs4r8/3ADAiNkfC7NWZBr76g891YWPtNNd9Xk
 DD00/vYTYSZ969gNCeIW0ii2HCpYnp1cnOjzacW+uq5lki6xN81SmY/RUSuwm5z00hbg
 TxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794494743; x=1795099543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rkdd1O51EgudhIQXO9tkfmWZmJun9QcAvhV1ZKVVDyM=;
 b=HhkYh/rFUdlUGkefoOPMo80MHXe4gViNK2akO+uyCScSQRRupmGlrS7JQDAJ8KjLZx
 AdjBoW6IF1m/eZkteynv9YiodKBpvN5lyBk/E8jF+G1zlEYMTZwr62vfM3+d2ttmT25y
 zjLOybkhuVk3UIylkG8gCCYA4y5uHhWDl6KK3pwrOkbLa+nUWqHzrM3P/l/p/An+JPFq
 j+MCaaVKhcJaWiizOlKK97BeN6ncMyRkSjz3Ay1NDK3a0JBi2MYs5/Wqk70w4KpTt6c+
 VIpi4YdiuDP5pRSpTV1e4g1cl4GdpGPFMKRd24CDbd0XqTgXvbpjqSUo66EGzA740/Tz
 eK1w==
X-Gm-Message-State: APuU4Z/aKzmGXCmC0g0pDU69EPZdZV0J33/pkJHZOBpTapWub5mAGkq5
 hUw84VIUViV2ro6TgfBirTLN5vSHGRD1sgBkE0JeA0PdxuL4TG6GYLAbXDHGtg==
X-Gm-Gg: AYBFou0nHv2of8axHajc0C+UwnKtCrwwuCZRgPX7Tyrrk9WXjNM6fxe93lpKtHCkghE
 ND4uBttCtEWPRZzdzpu+t07+N8POjj6G/SPNRYzal4LENM5bSBcBre1PUP7XKn5noXDwNA+TEc+
 tN1Gd3NLaTrsfe7jabABwYMkMuLduCl2z146Avp7ejRUW/RAl3KzMeLWrdVHoSW1rVPvzbPkFnf
 vDZzjBwwbFxR3TzLg3TOzgD92klVC6b7MpYr+0jIMOnPgonpHmA+fDJmc+iRL3XzzgFlvM+XPOU
 XtXcmnTgiK89hxgKy8Eruf3LvERjM3pxLCAqYn9oXph2TUMp/GBLMCaNS3rkcihf1VPDtN1GtoY
 PxSdLXEL855+0TwPDk/SVRA4W5x+yE/7ycKobN+aiDp662YL8DJL6Rb+/YzN6pG+dUtK7fgkM+y
 cMHzp/QAdbcDNXBDxvuEnX5LNhw4FEEsPC89LHJ7Rdvtj9/EvEOwWYfiqIK5XYSoB6bXaJziNtz
 Isb8uW52MXJJmGIV96IB+P7QZZceQIx5RB+0w3YxYirTSWRASVYWrGVxoKKfhqQkIA2x8Ek0M5h
 HLmKe0z8cpoWzkReJB6m1Kzjt4i3aAMjD90h/qzxoab8JecPRXw6VqJFaEmfjG/6mlslM8ZLshb
 SSR1K11YJ
X-Received: by 2002:a05:6402:1ecf:b0:6b5:69f4:e7ce with SMTP id
 4fb4d7f45d1cf-6b79f5716a2mr1990258a12.39.1794494742497; 
 Thu, 12 Nov 2026 06:45:42 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7a01da2bbsm837418a12.27.2026.11.12.06.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 06:45:41 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 15:45:41 +0100
Message-Id: <20261112144541.3663027-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cairo: work around gcc bug 125410 on
 hppa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GCC 16 uses LRA by default on hppa, and crashes while compiling
cairo-pattern.c:

../src/cairo-pattern.c: In function 'cairo_mesh_pattern_end_patch':
../src/cairo-pattern.c:1417:1: error: unrecognizable insn:
(insn 325 0 0 (set (reg/f:SI 381)
        (mem/f/c:SI (plus:SI (reg/f:SI 89 sfp)
                (const_int -184 [0xffffffffffffff48])) [25 p[0][0]+0 S4 A64])) -1
     (nil))
during RTL pass: reload
../src/cairo-pattern.c:1417:1: internal compiler error: in extract_insn, at recog.cc:2892

This is GCC bug 125410 [1], reported upstream with a test case reduced
from this very cairo function, and still open. GCC 15 is not affected,
and with GCC 16 both the test case and cairo build when passing
-mno-lra, as reported in [2].

Add BR2_TOOLCHAIN_HAS_GCC_BUG_125410 for hppa with GCC >= 16, and pass
-mno-lra to cairo in that case, so that the old reload pass is used.

This issue has been present since commit 1b290781cf37 ("package/gcc:
add version 16.1.0"), which made GCC 16 available. It therefore
affects 2026.08 and later, including the 2026.08.x maintenance
branch.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410#c2

Fixes:
https://autobuild.buildroot.org/results/f76b8f361d01eef892ad21722b099ba8bacfcc57
https://autobuild.buildroot.org/results/a5ee815bd49784cc522e76e49a2a021a151a9e57
https://autobuild.buildroot.org/results/54bbea14bef321c193d9b6450b253edf832c6b8d

Fixes: 1b290781cf3782576091dbeacdd7d1a30b051856 ("package/gcc: add version 16.1.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/cairo/cairo.mk | 5 +++++
 toolchain/Config.in    | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 26c2555f9d..0c354c7414 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -24,6 +24,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 CAIRO_CFLAGS += -DCAIRO_NO_MUTEX=1
 endif
 
+# Use the old reload pass instead of LRA to work around an ICE
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_125410),y)
+CAIRO_CFLAGS += -mno-lra
+endif
+
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5f4c5f5fb7..3f5d9760b9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -249,6 +249,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410
+# ICE: on hppa: in extract_insn, at recog.cc:2892 during RTL pass:
+# reload, with LRA, which is the default since gcc 16.
+# This bug exists in gcc = 16.1.0 and gcc = 16.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_125410
+	bool
+	default y if BR2_hppa
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
