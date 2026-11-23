Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FC606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XCResXxW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvlZZjGX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9734043F;
	Mon, 23 Nov 2026 22:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJrELi8HyY9l; Mon, 23 Nov 2026 22:14:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B27D4039C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795472075;
	b=DmBmv1oPhLz2siTqNLre+euEzOAnnElze849ogADoHI3rDzOFmMq0+xPHdw75NCTPEyK
	 oUuP1NNr4+Dq6wkn4exBcZ/YnQD9F8U8GoYlksvftkphiQhkpNuN1cAThtKqseT3gPO75
	 hrjpVKhoMaYY6MWWGVCOJ2ta2JxKrl1tijfWOCxQtmhfBJ5qxpkndy/Q6QZe7GGmR6E1K
	 NYyqtfCQWF3L1BQsW6SLljmj5n2k1kXH8xwiFfP0RMJBsgiQiw1BC6yoLbngMEYuKhQr0
	 z9cLZjqtV8fIx2/d1q67fseQBllpFbbtjxof9Ert7WiWSEg3HlrefwMhtLUl6+XdLRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795472075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=m0/rILqaYwGnDHW/rpVhMYV88q/BpjgPZAYAXxfOrEI=;
	b=clwGoT17EA3Oj46sHCeD8WACMkQWNWr82HJIldIh/LfV8/4vWOGcSdfmB6UuyMaY8McE
	 FfATlmBfA0sDvLk/uSdk7WOvLdYFU2+cuzT4cf4s/J/yciitznGJ2lFqN8tjkp9UGwkbs
	 0SjcWwaMcd9Rd0RetYF28wgfiQDLD3M+T13KXygKowrGXsX1hmErujJOX6Ip/C248pBqz
	 eP5WUowv3hoORN+oYSC1Xl2X4+E7u4q48Jj7A5wvkmschLSOvjfQCS/6y0ornCaPXFGjt
	 vLy2sibw6IB4tGUC8PQnSlqxZ5yRjGAwflCKmiyWEpuvMF7CPX/PGbeP7J4EumNWWug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795472075;
	bh=m0/rILqaYwGnDHW/rpVhMYV88q/BpjgPZAYAXxfOrEI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XCResXxWP0yCrlwJ+qYsNwNmywPZGyiRj8FGF4NIlG/Bb7chcRB48ZzmCCsOx1wMR
	 tTJ83TMjmvdGMR49m2Fky1Dr3iayGl6RqsN/5HMbs7BPhwPpqgTMthjHLs3b2b6wY8
	 crYyWVM5VQgGwLGSWJyLQ8wSGJqTVC/yeuVQrlOTkf89R2CUj1d3Ai68s7YF4Betxb
	 xaklGYH2SNVWUGwOqda5/q3pKoFynyStWIMM/Z8v8UIl4dWhxS78JRb68pbHDxDCRl
	 Ox5buJp/DDnDvrnPabHwjggFgSXxpLph6wbFQWJie7lA9ABmINwc+ETsKo5GLX66Bn
	 aBJ6TQR15ir5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B27D4039C;
	Mon, 23 Nov 2026 22:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40190715
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DCF6400E0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6vZnEUXgrqI for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 07A3E40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=EvlZZjGX
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07A3E40024
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:14:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so24460485e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795472070; x=1796076870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z5OJ9esqcXzTxViiCEdxZwtZddzJoVwvb7gdphz7d0M=;
 b=EvlZZjGXfJ3JGtPtWk0AtdJu//HURt+xQu9je9HpGHuSxP/H6dkChExYf7Wb1BUC/L
 LJJeYdfg7CUE7t7rR5BjsMfjixdUQk6pN1XydX66GxJ8lQU5qJ1LJI04HTO/SD/aX0Gj
 8kVU4GE9W2v+bv0IYuiVNLPEr5CT7PObJVW7OFeUEiU06gTVnTj4RNL8iZRDeku+edqm
 lg0CMrE3U1Gwo0P54LzVM+8xybjjFoUry1OA8rEUaCvZtc1RDr4q53ATtlJRbANYkjhc
 xe7C7dtrcbQSsJCxZ3/Hh293vRhrcoPg0VVfLObRq/gDDSGK8s5yCJYE5IXzCQw7cPfx
 jofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795472070; x=1796076870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=z5OJ9esqcXzTxViiCEdxZwtZddzJoVwvb7gdphz7d0M=;
 b=XvoGAsVPSIAgC1L6AviUvQfj+ugj/wHu/dwPLuz0JfizSHe4XQPmm0eWeuxtmOOaQq
 3OGq09NIMpmoQ/I6C+gecBtKNpNucMt3+DPCLxxQId+PmhhWfJNF8W/Nz20pxPOliD7A
 +9TwBA07YxKd9onNVUol9YrJwBmdKycOdHXne+6hk13NQrYFaEI7zSHDnNTBU0lMKo+5
 HqXAvQZEBSaruZVRdxOHo3J3YzYIKEn4gV8J53FMBkksmPraTTtYHqJK2VbrpFKKsMwi
 u08f3vCZxVYDYZ5qcGwBh4NWps2eL5xsleUPoS+/Oo1XlUCzuqYnX2obJo3L1B6ojBul
 jvcA==
X-Gm-Message-State: APuU4Z+Y30R5up511g0TJ2eS4D5xQ7oGz23HCtUY/7CIOxeHzpW/+6gQ
 5HwBgiGWDwPOKWS+sLoVVhRxqWe3TVc4+3kpPoXuW3RMrcfPrEKolThyAhQ5zDMt
X-Gm-Gg: AZFdTZczRKjU8/AHyIEvV0fjJpuC70XR3y+d0bSHOREYK9ckMIMexPCdqPcAXNZoSzH
 ilHfdmq5L3LxS6OqQ+yrgBHb6WllQe5wiEFX2MhbwMLLu5hqkrwZ/0s+hDhu/duQ34+rw9gM2om
 GCuOMh53Vt13ZiHaqDkT/Wgcmwpp73pV0gdakyob89BOBckb7UkOqQgTNlzBx52Wc/NI06apjJg
 2sOY+Ed3y0p8c5cDt1kEruxsLMjk5SCR5YGxP0rtHfefQP6C7Vno7VxuFx4mzCf6q3hGCtdn6q3
 9n3iimp7qmW9nXwKTs2Z7l+tjd8pESQnkq4q+bg4SaiQrzCWfsf3HVF8EWNn7KrNwH0z6zPFfok
 or3HMY5laPYE9sSX6IH+vPpPPH973Ya7pHpqr0Wbh/g8wCpCBQwwEcB+c+kmw0ABYe/zfpvw17m
 gmwoqeOrPMfHdYgdgD9Vyz0wx5Ij4/oSk38l2XtSiem6Id2ZyuJcTeRNs+KaWbjbKkWg1UuSl8k
 f0FLIDvcNVAE/AJyq+TQu6hBy+v1t3JLv8Bcd3ZLouDDd+eqNS9XeDCAvaR5pGkx6StHFyAGVL5
 slgQ4T76UxFrZjmcaQWzNDXDJJ4NLdAXnsQi654xkz2h8omIaVI=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4bb88812a84mr261509645e9.13.1795472069641; 
 Mon, 23 Nov 2026 14:14:29 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8533579csm341085225e9.2.2026.11.23.14.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 14:14:29 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 23:14:27 +0100
Message-ID: <20261123221427.4028223-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aqAyY__D1LhpPHDs@waldemar-brodkorb.de>
References: <aqAyY__D1LhpPHDs@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/nginx: fix sparc compile
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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

From: Waldemar Brodkorb <wbx@openadk.org>

When libatomic_ops is enabled, nginx fails to configure on sparc v8:

checking for atomic_ops library

.../sparc-buildroot-linux-uclibc/bin/ld: /tmp/ccmE9jc4.o: in function `main':
autotest.c:(.text.startup+0x58): undefined reference to `__atomic_fetch_add_4'
collect2: error: ld returned 1 exit status

./configure: error: libatomic_ops library was not found.

Since version 7.8.0, libatomic_ops uses the GCC __atomic built-ins on
SPARC with GCC 12 or later. SPARC v8 has no compare-and-swap
instruction, so these built-ins are calls into libatomic. nginx only
links with -latomic_ops.

Link with libatomic when the toolchain has it, as libdrm does in
6fec4282a0 ("package/libdrm: link with libatomic if needed").
libatomic_ops is not only used on SPARC: the upstream zone modules
select it on every architecture.

Pass -latomic through the existing --with-ld-opt option: nginx keeps
only the last --with-ld-opt, so a second one would drop TARGET_LDFLAGS.

The problem was introduced in 4b285598e8 ("package/libatomic_ops: bump
to version 7.8.0").

Fixes: https://autobuild.buildroot.net/results/4ef/4efd5ca93abb181d3a982938429db00f235031e1/
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - link with libatomic when the toolchain has it, not only on SPARC
    v8: libatomic_ops is also enabled on other architectures
    [Thomas Petazzoni]
  - pass -latomic through the existing --with-ld-opt: nginx keeps only
    the last one, so a second --with-ld-opt dropped TARGET_LDFLAGS
  - reword the commit message with the cause and a recent autobuilder
    failure

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de/

 package/nginx/nginx.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 187fb17eb5..1cdf001b38 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -17,7 +17,7 @@ NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
 	--with-cpp="$(TARGET_CC)" \
-	--with-ld-opt="$(TARGET_LDFLAGS)"
+	--with-ld-opt="$(TARGET_LDFLAGS) $(NGINX_LDFLAGS)"
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
@@ -76,6 +76,10 @@ NGINX_CONF_ENV += ngx_force_have_libatomic=yes
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
 endif
+# libatomic_ops uses the __atomic built-ins, which may need libatomic
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NGINX_LDFLAGS += -latomic
+endif
 else
 NGINX_CONF_ENV += ngx_force_have_libatomic=no
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
