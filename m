Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92138606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TuI2lAlA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657EA60649;
	Sat, 24 Oct 2026 08:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6t9iYYdgGxf; Sat, 24 Oct 2026 08:24:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FD8760657
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792830271;
	b=S6Qqtn7/vTQ7hURvpkR7vFm6yJ5jXtD0lEEr0au8ZDNpl1FrQ6blVLRSAzD+MWEdOx97
	 QXywmW5b2QPA9I51jcZl6GlE2EyyuBm0BPf88XEup6c7Fhe4GrPq+hTN4hJbHrdJThyFH
	 SWwdgPGd4mHEL/M6qEN2WXzbWb6xYNz0BLwKqlonu7WCLaSTsJPocF5kJzLtMLyhj/0J2
	 RFjTbnZLsGrD1KKoBa+IFPOOvBWWU6kaAA73HQrDQJiFLQW5opQToUOqo+TKXKlycQ1In
	 EjeEK/bQI6ydCOoA/Qq8I8nF/1gBqH6yw/vBzl+SmFZhWDAxM7pd14Tygx5LH6xWoag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792830271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5mv+PlZeD89P/nIXiFjC5PTbrq+RIh55FC4CHyjP/B4=;
	b=aWoSyqawEdd0MLYOXZc4mmid3ys7xctPSmZvfOVisF7CEp9VownxjuY7/rn43DNRRCx/
	 iw1MHJfFTXMzVZPwlHpnifXL+Ng3q78AktnmHH+d8WFlSIPNz2qUaRvSFE7W2aWOGt3wR
	 QtFwGBAJmq1eKGXJkTfYDv5thzHLbwg1h1WsEzphn+bn5sCOS/JpUp/N9JXBqFURNek7K
	 DSKWSAIAnPc52Hfkio2SDYDELAjEX4HhS0bLDRxKUPWsAahRjqBz1JtfScx+iDJokjOd1
	 fUyCjHULlF5XisC3FCMUlVUIumgJrWgKijqv4GgCSzcZTSmEdPthIHUIrwhNo8x1a6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792830271;
	bh=5mv+PlZeD89P/nIXiFjC5PTbrq+RIh55FC4CHyjP/B4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TuI2lAlAK3IpzZ0+zeayzRD4KtujLpOJ/zKKFd34N94i6q1rNlG3OHDQVsG+WVkiL
	 L/cCcRc3UQ5EZmpzHs8g/zR4N1dFDwd+EYEJbONT8mBHZTkgVxZcpzionT5uDIIO/Q
	 bKrYU7Jw6aSj2Wtnvx9185EezBLSAGtEKhovM4+/+KONmSbhHh8cJvIpHEfi1F7UqE
	 9FDmT6mxKnfb1uQmTRgENqpZe2pvNqvczR/OH4mSRp6sUB5PEysIP1y9S4lkVlnfK2
	 lL5rgQ1Y9OLhueBHK0jk3ZFYojL1URDndKHXU9V0PNXCzBiAhk4MpHTBqJjdvQlwjv
	 +gWIzdQ38Ts1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD8760657;
	Sat, 24 Oct 2026 08:24:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3682279
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 08:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B519C400AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 08:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRbArTJvrzAc for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 08:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 551D140068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792830268;
 b=cXiVhjMQdHo15rlsvP7Vj/fockI0VAaUf/G1fefjLYp9/z1U+1frP2ZUO3pyK1CUGcts
 6xu+dHQXZ/Wy22FNQDFwEihBqM+uABp8F1oImDylllhvbKzX6YIxwni6HQBkhzghBp3m6
 SChPKUfV0i2RSzdIIgAnyaZOu+JF3mU6uWlndmWJUrJC6fAHlgFYmuotQ93ZPjjan16Bq
 03hB+AyQyCz7pBw1bjbeKmpXXNXwNYusCbYSmZ3Ge/hk3b/JXuyJb2ZDCn3+70v4YRJJk
 oFEN54Fbt3cVq9yegja5LS8HPjNRgOAf0QsxLMDnYlas3W+TQ1+Werf+gZpTSkOH32A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792830268;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SjOfldJC/nlbfiAR4npsOqgST9NsrsKSioYoHrH9DA8=;
 b=fO2ksPbXlpdZRi9yfRIT55EzdneON1sF2e+rdAQJy3R/bVulN4cka8PEy+PCND861Esr
 30tDP88mOqLeczRg4Kj3FMl6mv+0iJssJpupOwfyofF+utybLW9ktRLTCo/UvCLIUZqR8
 z3AtvB9jdocTSZsPHIY3pUKh2m+uWlOPA9nI7/0R/7+2CApN2k56vkn+YGFp1Rv/uIp2d
 fPjlwDYnCyysBxklvqWS1He2cRr1u8UQ3F8PiLFpeMJLWppWAur7uhgUlSIyFmM1A0fNP
 jkQE1Y8V8XXHR/CZ1LgSQXH+Jk+CN7u8ySF00yRhuEET2xE8pjiBsFWXptIy0tGREeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=U40irDM3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 551D140068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 08:24:27 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1d8944cb0so2354946a12.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 01:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792830266; x=1793435066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SjOfldJC/nlbfiAR4npsOqgST9NsrsKSioYoHrH9DA8=;
 b=IC9RmBdOlNb7RyCMIM90FUbWvFp3wzdrq1Kj4CBEz2vujOIwNYrflDb4IJanE9B6/R
 6txWMT2yhMLT0TscAA19+NQ5G5aHIeowyJQgmN8P1aPZCoBaDNwkLh4aLwqEjgnVM0ff
 BYCXf7bXeTDKpx6FL73kdXsz0uDflYhZ4zVdHPiVkaaRSve5n+icwzFyT3D89KjcJSQv
 7D7EKhiTXp0UJ5tdegU5Lp+nIzETgiJqb/riSHABSnIZhu8tLwGmHCOqdbSx3LIpASbW
 +NjZyiPzJqN8DkCqg5JqObridM9VU177Yu2JAexgMZmdFyBmYDVE8G0RJTOa2NfhbU1w
 uNzw==
X-Gm-Message-State: AFq9FYK8avgd/pQ1unEWNFHUqCyu3uDGmhPo36p71IMlZRf7sKetILwq
 /u2G10hBCc3gFH32rxe7Iz9GYk3s0xbe7VSLP8CoQsU4yy5xcGNQKJ/eFEmSrQ==
X-Gm-Gg: AYBFou0u1ZMdPFDtvQ0yAoVeeCZXQ22auyc/tZmuXIuln5vVvWYTp5TTh/Ii9e4bhKY
 CkD9ICTaIvk77OtAusDRA6GFnXBz6/QOhi+ycOqwdyo6nzOEBnoK/ytGwLEkvUJuoH6oM1fTpTn
 /9snLaCIqHF/5X2NokjFIiI8bvkM543T/w1ThmqdDQ1p0EwUkg7xFoJHxO1Fqnx7oxlFZz1aRta
 zf9fOWn60bVGkiH5TMTLsKGbQoPT8w3grkB1KSRNiF7wD/rEMfT8m6E9fv413zgZcYkxf+jloCR
 AAQnJFkEy8cIIRLWS+7PSkvSlgfBn/ujT9EvBH+moTPMUixWkXuHm1ez5AgkTvOTbWGbsXMhAbb
 x4M0qzPNrhRW4mIR2tOuvHoTCfGXMh26ALqAFpicDTVwbTY3g81So9GaY+/hSPn5pmswcbLuVJV
 i0e5UOGg/iM2CtLd5yWr1AiowqGzI3Ygp8Po5EbsGoCj33DjJN8rZmBHzDCz/rtHktIEH5JFApp
 wbpz4ZD7GQ+XA8c++qaVSja/CiAFFDHtaht59W/Qb+pEUopUlae8jcUurBjuX54KLn8YbUYzCow
 2oLBhZk2qNRlKVnd0r9EPRh2T5FZ4l4a9B4=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1163736a12.26.1792830265682; 
 Sat, 24 Oct 2026 01:24:25 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984d85sm745420a12.29.2026.10.24.01.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 01:24:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 10:24:24 +0200
Message-Id: <20261024082424.3219244-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/uclibc: declare wcsdup() for
 POSIX.1-2008
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hidapi fails to build with uClibc-ng and GCC >= 14:

  hid.c: In function 'utf8_to_wchar_t':
  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
    116 |                         return wcsdup(L"");
  hid.c:116:32: error: returning 'int' from a function with return type 'wchar_t *' {aka 'long int *'} makes pointer from integer without a cast [-Wint-conversion]

wcsdup() is part of POSIX.1-2008 and glibc declares it under
__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU. hidapi's
Linux hidraw backend doesn't define _GNU_SOURCE, so wcsdup() is
implicitly declared, which GCC 14 turned into an error. With older
compilers, the returned pointer was silently truncated to int on 64-bit
targets.

Backport the upstream commit moving the wcsdup() declaration under
__USE_XOPEN2K8, which is enabled by default (_DEFAULT_SOURCE) and by
_GNU_SOURCE. This fixes the issue for any package relying on the POSIX
declaration, not only hidapi.

This issue has been present since commit 5eb0203cb05c ("package/gcc: add
version 14.x"), as GCC 14 made implicit function declarations an error
while uClibc-ng has always hidden wcsdup() behind _GNU_SOURCE. It
therefore affects 2024.05 and later, including all maintained branches
(2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x).

Fixes:
https://autobuild.buildroot.org/results/eba842f15d96e483e0d16b12028da2ce10dcdeb0

Fixes: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27 ("package/gcc: add version 14.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ar.h-declare-wcsdup-for-POSIX.1-2008.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch

diff --git a/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
new file mode 100644
index 0000000000..76c3039a4f
--- /dev/null
+++ b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
@@ -0,0 +1,41 @@
+From 936a08b682e761afba98ef3800265add951201fc Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 13:55:32 +0200
+Subject: [PATCH] wchar.h: declare wcsdup() for POSIX.1-2008
+
+wcsdup() is part of POSIX.1-2008, and glibc declares it under
+__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU.
+
+As a consequence, code that doesn't define _GNU_SOURCE (for example
+hidapi's Linux hidraw backend) gets an implicit declaration of wcsdup().
+With GCC >= 14 this is an error:
+
+  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
+
+and with older compilers the returned pointer is silently truncated to
+int on 64-bit targets.
+
+Move the declaration under __USE_XOPEN2K8, which is also enabled by
+default (_DEFAULT_SOURCE) and by _GNU_SOURCE.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/936a08b682e761afba98ef3800265add951201fc
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ include/wchar.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/wchar.h b/include/wchar.h
+index 2e6ff77c0..0056f93da 100644
+--- a/include/wchar.h
++++ b/include/wchar.h
+@@ -210,7 +210,9 @@ extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
+ libc_hidden_proto(wcsxfrm_l)
+ 
+ #endif /* __UCLIBC_HAS_XLOCALE__ */
++#endif
+ 
++#ifdef __USE_XOPEN2K8
+ /* Duplicate S, returning an identical malloc'd string.  */
+ extern wchar_t *wcsdup (const wchar_t *__s) __THROW __attribute_malloc__;
+ #endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
