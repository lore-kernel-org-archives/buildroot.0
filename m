Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9761C606A323
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XAdUdDNN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=McyRlZQJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 346DD60613;
	Sun, 15 Nov 2026 06:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIhegL6ZitEg; Sun, 15 Nov 2026 06:58:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 460B26061F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794725890;
	b=GcfsJ2cOf+dz+1laJN4lVTtmPXEcSFQo3knEklsF0cT83NLw+aUWt+RIbsvMrU5U3gyx
	 2LUqCvoBIj31RJ6rIzgON6NY50Wk/gLMh74wynMS4KNqoruJAqFL338njVfxOWO9oXvA+
	 dRc76xROjLk8eVXTsm1T1OBFm9JvQXtWLXRpzWepAkZWM+YiFcR7Octaa5petwlYuUQgu
	 0eR0uev/FrO3ZtnLtjdjt0GOLRD+wTIbH5MLkG6B1oku2E4qlqciTG/tbskhVvgIHK/X6
	 l+XuX/yvC8tbIo1djKJdX701S/wBApUhAgOgItGOpNoXu79f4/qpgMuP9IU3odh4mxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794725890;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B+ltz3D5eOyDLRLeeyHT+dFPsyTOHtxa1BAZM3pVF1k=;
	b=KNqwP2Exv9IxYSWK9Q2kz8IrpzYm3b+S9CTdjnCbG0LPK7n4etAvuGigq7vevE5Gia7X
	 IGHq4arSVJgBC84nswZzhJ+QmMXn1DZWww67diFXkDiBSo5Zo1hzth8hmi8OmM5WMNuT/
	 k7GZP4CsMe7pyYv8g2UBcl5B40qJYGtUGhsY4MRz0OJ8YYxI1wmV/LSG/zQPVQleZKrcW
	 ZXy9mxMEO9TNifXc7YPf9sWXbmvBuW3GWBh3nZdG+7DlDvKKx/oMv2mdSW4wAJ0ZfkD+B
	 qbepf2o0nmOPPONXbX1lupYq2w7uS16heqJHGQGbpBoHtnvrIyTUiZ/omWy4NnJVTpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=McyRlZQJ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794725890;
	bh=B+ltz3D5eOyDLRLeeyHT+dFPsyTOHtxa1BAZM3pVF1k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XAdUdDNNMYiVAoIkL/fYWIY08Y677uGV/wgUyWlAxE6Rv1AqR+iVavsBtzgdGzZTk
	 hGNqKVSGzyuskQ0B5bi0AiHR/7ZKtRRQ45xEfTDvcf/zD66BbHcfFHt+50TP7rm5g8
	 LRt1t9Bv1Iox0uyYyieKBph3H/Nf2+flrevbtQxDyEfCvy4HFjhDUr+VGXak5WzwB1
	 oqyR446bIuPcEG3Wty8lpKrjcAfaC9E6steENg1vqWHDuPY+CoaITeQvI3vFQfpGgJ
	 tx7HAkVMtTCC+svl/SuL3cNxms45INBCItzelgEGYPEsJkt8w8cR3fBV/OtdfP8HKy
	 9ACepIGAneM0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460B26061F;
	Sun, 15 Nov 2026 06:58:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ADEB70B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 06:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 610616061F
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 06:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJwpdzDjU1zn for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 06:58:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3298860613
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=McyRlZQJ
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3298860613
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 06:58:06 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b167ffd132so4202623a12.1
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794725885; x=1795330685; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C2kE+jmp4ppdtVs8Ktswr+auOxeIJzgrlbKmRMugcDY=;
 b=McyRlZQJ0CwmhX0TtSS7OS9m7RJJlMK7hc+En60Rg7wGaxGhuTBCmb2WOOWP0YDT2B
 ZpLhG7u5WxaOCoD6f5uS8gmdP0sFKAesN2z6SULT1MxV9nLrl67+Ss8uUXgMuUTZVanO
 eshyR8Yo57bOuGRHQsLJ00VEKnwzaDdAdKWLz1A/cxOCRWflcGyWGeXaOxmsdczpbl3Z
 V7nO26hPVoUe37+98fvsmm0B++PP/2+vbvLZ1cUsW4Wkg343+PYgS4I7m6Apvymvl8N8
 bwp0pfldvKCRTjzOIJhoBLkgkH88r/y6PLyHIa5AKBmBj1u9qVmg6Sk+8QnfarBJ5iqG
 Ufuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794725885; x=1795330685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C2kE+jmp4ppdtVs8Ktswr+auOxeIJzgrlbKmRMugcDY=;
 b=pOTpop1CdiTdJjXEESuMbpVKRJZjk5GOFBAvB6nnvZ8iUP6QW6aIQYE91ar/ONntLb
 XdnTQD+rzd7uGVYYQnwQI0s1YL/COpIWsz2fWywuIcBCVHRJz6rU8RUsOP1dFwrlYfVr
 Z29EtPciTB+OwhkCu0xtVxhRkPGrwED8Wf0qO39OYODVghsweM6x8x5j4SSnw+LYvuCF
 6TxAQZFojEf+vbHk9fIGobHylTHKdZe3Q+4z+lnBmRZ8LhynBFShlaMF/yMRktFGO5tJ
 BCP+ZSJFUdnDJexyY6kqmGrY6j5S2kb4tWMiLBxLC/OuBgrI4Bm7B1nRysMEL54pN565
 7yaQ==
X-Gm-Message-State: APuU4Z+IvwjoG7Kb3V6HHu5xOzrjW4+ibIykys4G2ldbIbnYTOwqPPvX
 XENmSVGLnzFS0RUlPR1HHdFg/I+Jp8wiiEi5r6CZ+uhm3u7UoT3TJb8dWeHDRA==
X-Gm-Gg: AYBFou2HyGyJJ2474SMuZEuDSNgEHEEjbqHQ6yAgQLKkmPhsbvvYh3PZhQgaENQr9vN
 8j2wjdbxMbdpnk/z7fc+ceQ1fDMBH7ae5kApe3ZrTJESYiMjeDAgnWPtk1ldrYPn78FBcnGczVS
 7zDkKNZwZc1M9GUPNC7TO4OKnOzKv1jZcAbR5EFpOdnLjNqbGRSYSD7BT/Q+kHQvi1lv/h/W3Kv
 W+CcGoipI9oDG17YLo85xvEs5gIHuNwv2nt5hFGK5HWs9cC6nfunDpR6PUTe92IzDbslDqM8yRn
 Jlyv4aKYF1JktIHiXdIfeosxO/0gSKor7Q9EghD1etKMgf4cK5raikr7VNPA3lbfgcpUu3iHnaH
 /hYjLIWuFl5zPL+b2YFWbEkb3FpHb1XURQ8wz3y9faFYwKKJXaFK6rdRTpjjIe6JHN8rNS2B3m5
 mw6Q2hCd4hxqDV+Znt1nn4SZuncXcWAGebzVHKJL/s84JwHW8tN/GD4ITzmpVtfSujG+cGnBo42
 pyMFT1C2UCprUq2Y1+G85nVtHdcOy9toj9Ifj33I6ikRlAtvB+kLrNfYKQeCAmAa8GnQgog6W4k
 y1NZtbXfPqBMjRry4DobjM8YVnggJZ18SLvPHdqVgQntyfgGABBoIpOQstuBcZdZTbDOdqEMNY4
 1Ns7FXu4D
X-Received: by 2002:a05:6402:5625:b0:6b7:8ace:4be0 with SMTP id
 4fb4d7f45d1cf-6b7c0957ed1mr3637258a12.15.1794725884334; 
 Sat, 14 Nov 2026 22:58:04 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23dde49sm3097157a12.23.2026.11.14.22.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 22:58:03 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Nov 2026 07:58:03 +0100
Message-Id: <20261115065803.1426249-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/musl: fix build for POWER10 and later
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When targeting POWER10 or POWER11, gcc generates pc-relative code by
default, and the resulting C functions do not preserve the TOC pointer.
musl's powerpc64 assembly calls or tail-calls C functions assuming the
TOC-based ABI (bl without a following nop in crt_arch.h, b __dlsym in
dlsym.s, b __setjmp_toc in setjmp.s/sigsetjmp.s), so the linker cannot
insert the needed TOC save/restore stubs and linking libc.so fails:

  dlstart.c:(.text+0x24): call to `_dlstart_c' lacks nop, can't restore toc; (toc save/adjust stub)
  ld: final link failed: bad value

Build musl with -mno-pcrel for POWER10 and POWER11, so musl itself is
built as TOC-based code. Applications can still be built with
pc-relative code and link against it.

The issue has been reported upstream [1], as musl does not accept
AI-assisted patches.

This issue has been present since commit 3523e1ac79c1
("arch/Config.in.powerpc: add Power10 CPU type"), which made it possible
to build musl with -mcpu=power10 (and later power11, added by commit
da1b45dd00fd ("arch/Config.in.powerpc: add Power11 CPU type")). It
therefore affects 2026.08 and later, including 2026.08.x.

Fixes:
https://autobuild.buildroot.org/results/1342da7c9258a93eada96f92f53a643e316ce7f6

[1] https://www.openwall.com/lists/musl/2026/11/15/2

Fixes: 3523e1ac79c15c5199a15589692e269191abd546 ("arch/Config.in.powerpc: add Power10 CPU type")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/musl/musl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index cb9f7f8870..b6e0ae6d97 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -49,6 +49,13 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 MUSL_EXTRA_CFLAGS += -marm
 endif
 
+# The powerpc64 assembly code assumes TOC-based C code, but gcc
+# generates pc-relative code by default for POWER10 and later, which
+# makes linking libc.so fail.
+ifeq ($(BR2_powerpc_power10)$(BR2_powerpc_power11),y)
+MUSL_EXTRA_CFLAGS += -mno-pcrel
+endif
+
 define MUSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
