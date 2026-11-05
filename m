Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFF3606A33B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s/uumyJN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=wYFEYji6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2923440870;
	Thu,  5 Nov 2026 13:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk3vZ-0VfFlY; Thu,  5 Nov 2026 13:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3B9044081B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793883612;
	b=n/JV9069rBLmngjUM1V8kI1stAq+HHFKx9UxNucmnagh4HVFpJsAxf4z5CtGh1jUf3S4
	 k5U/YW6NeQ7czoqXY6uFeri3Z+FJ0AGZl0A+RiMUL9yJQjBg7mJKrFrUrpCyA+nsslY++
	 vMFwmrEQZjO82mIC2RpsU18CQS69/9t+F+0CXTeLGBOUZld7UJJuW41gPaOcHdliJcg+P
	 Xvpr/Gxeazm3jUZHD0SmPfTrPKZgUSZuYHjydLA4AR64zHTrx56of8WPZzcsQ6/fYcBkL
	 c7zShskEzTYeDWYlssxYM2XyIS/Wt8TvHUldPS1LHdFlwUQK/UYiHMXHOJCqubpr8kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793883612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VKodLlLzjh8+YmEugQTC4/29a3MIjux15kBMNZ9JsBI=;
	b=CWjaEnH+iX7wOuIsp+fhc5SRQIk7ztqhkvm74WX+efS0WyCRfxThoINVe5mBswF7y5Lt
	 1bR6O9qmPpkg6wrq3QHT+E99Lk3YnBe6nKB14g/zn+SUkgN3Z6MplkQEMqynHv69QR3Mx
	 Vk032s4Qe2LfB05Am3YCutPuXbJTGIaYA/L92y6m8ECEXSYKpYTN7JF4xDOlziohPvgBZ
	 5X3ynP3qzXP2dia94C41V/D93JwgIlPKn9w6SJerZTnPZqYIPnPtqG645k5lsYJjnzEZX
	 HRhA60REv1abMJib3BzSHOkKCDCV/Wee6pYt0uKd3X8ZpdWycs/zy3yws81MtOQcj/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793883612;
	bh=VKodLlLzjh8+YmEugQTC4/29a3MIjux15kBMNZ9JsBI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=s/uumyJNnRuwN/+unStcqsP1Axp4heDk0tTftilJ6yOSsxE2S0zqWWJgv0S39OC70
	 xAD//+YEh/vZ4ZhwKtEsELnftcPyAiMQFZmDKzSGo2mRL0GQGtn51LErfH16JW4Tea
	 3j6YD3jWFedkPdvmdTVCVwb8nZzxK+yf5wKJm2NqcFMVRzDAdUieT9Fbhgzq/Ti5tv
	 e2TBOq7aZBIF8LQcoQLGlI2gxya5a4N3gDUr3IpXcTkj8Wht3jpjinn0lcpqZT2Ysh
	 uCNgWzkaq0L7Nu3L4LYmXslR7xQdkVUvdEDxNbnnvEtU4d0oyhlrjvuSKFhM9tcYAE
	 n4ezSWa3igX1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9044081B;
	Thu,  5 Nov 2026 13:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD4731F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D306C607D5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HZ89fVtxjuB for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:00:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E65C606CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=wYFEYji6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E65C606CB
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:00:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso284451666b.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793883607; x=1794488407; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=F9MuqH+XwEP/gTasEOlEpSJwte4ZCjSqAt5euXigcPA=;
 b=wYFEYji6ju+Y6GroyvVXqJl0/mrYoHVaDhjefjacNF6L0J8G6Cu7o4ziNN5j7vTaNo
 LhEVZlS7WCm9EKw0Rm9p5h9GMrW2xdGrlw2ZdBJgyCtmHUYmj5JKDowhmhXo7GQMS13p
 Ayy5ocWDo+1Fxye5NJ2ovsMfpZ8NFtD5ZubZQ/0V2vqrwZ4jUw1BInm5B7/MzNaPr6FU
 mD8fnlIjhxiIkLPkVSGPhfNQAKRRnHiB/nrJvfTHW/iARuzY9V//zfL9TAX/A8W7QGbP
 utE5MIQvQb1YVlv15BJb8Fqf7rvzp9weexIVk6Dn7VsFT16eSQ1zeUdvn2zH9ASWOJXz
 qTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883607; x=1794488407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F9MuqH+XwEP/gTasEOlEpSJwte4ZCjSqAt5euXigcPA=;
 b=q5nQphbiyL21ZNIWitbLky4sSzmV4MrwvmEgB62jURJ8kXbj+2SWUT4BjWSDCWDd8C
 s4nMcZx/XN2YMfyfNWN7YVd8FOUjKw3ga+MiutkhF3AwOvRoaz0RhdkxBllA2G0K54XC
 wN0YY8BncPfTkYiBej6gy3CtWUWRSkGsN0gnwXZzvv+jGmHZNP7QrBsYVfqDax49nAV9
 uK17hxX0URcRUB+KhtL9kpXujImq5NrECNbqLi5XGcqW2p5tyV5X6HcSbc8D5kd0ygLd
 JQhJ34XzUyEHmjvZYNOPSJ/i54MB1+ECxFDJ4l4rc45FdhsKOf2kRDfPiMmzgR+rtVzr
 gAJA==
X-Gm-Message-State: APuU4Z+wluxL6S3grn5CNhEIguES1Qm3zT3H6YTYXldeP7RDEHN1h3e5
 UR6X+OkD12rnzMvunVZ5QVrhqEovY+QKISShC5uolY6bzFMPF3PvfIFKKiMIsA==
X-Gm-Gg: AYBFou2Jouj11CTAdXEtdGUdAURJcMwf1DhF3jCWxJc6+cxIGWivXLKJ/g8t57WQGU2
 6IFbUX3OOPuhWhyy9sdq/NZWYdD/U38VuOD40mFQkjWpa/ySiQeuZk6Xt7nT9F5k9j1OwYVI4Ur
 S1XhfBrCBssd5ytEhDbjVzx0N6ZGHBUMEYJFPzGlZhNQ//Eq0SLDLf0A/A/w0gM2oNMoVSNxCui
 QYhFEDPn43obTzZNmAOkBSuS0/widpG3wGy4kZYjTCIE6j6uGMIktZNlUwEY3xQfoFQom67hVay
 hqSt4tlXXpr4Lmp4/XR1yEkv/PojXvDaiJ40UbMN5HaHT5A+c+Eeoil4aZnzoNchXRQEdNgTSef
 cqa4XrxqYPeQoH7fbGi97NQBfB80Hx7uA/D3wmk1jC8ItbnkMDH/X5CDrGH+X0MJkGPZmK7jFAe
 MzqukWu2J0IGUrFGaym0/pZSD/0ymL3d+QHQcwQrv/EGC2G9poqRcyNrKdAtT55JRZpLXBciHba
 b+H+yk3015tg4S2c9psPj8wUjgN/zYwiohwePKMlH/sQDLz7ncypAUvWn78I2zU0/3YEsFa4FmP
 9oF5OC/IX+0fjRDf1ljH2hMN1AskH22UUcH4zX1ZjprvJ5UEoqp9Zcne4Rt8XVHcpr8AqmUaind
 syuNZMBC2
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c4ca7a8459cmr1803589866b.31.1793883607019; 
 Thu, 05 Nov 2026 05:00:07 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e48d3acsm167461466b.71.2026.11.05.05.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:00:06 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:00:04 +0100
Message-Id: <20261105130004.1462915-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcap: fix build with C libraries
 lacking static_assert
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since libcap 2.77, libcap_static_assert() expands to static_assert() in
C11 mode. Before C23, static_assert is a macro that <assert.h> has to
provide, which older C libraries such as uClibc-ng < 1.0.42 lack, so
the build fails, e.g. with the br-arm-full-static toolchain:

  cap_alloc.c:53:25: error: expected declaration specifiers or '...' before '__builtin_offsetof'
     53 | #define CAP_ALLOC_OFF_U offsetof(struct _cap_alloc_s, u)
  libcap.h:342:19: note: in definition of macro 'libcap_static_assert'
    342 |     static_assert(cond, #text)

Add a patch, submitted upstream, using the _Static_assert keyword
instead, which C11 compilers provide regardless of the C library.

This issue has been present since commit 42f2b480a5a8
("package/libcap: bump version to 2.77"), as libcap_static_assert() was
introduced in libcap 2.77. It therefore affects 2025.11 and later; the
2025.02.x LTS branch still has libcap 2.73 and is not affected.

Fixes: 42f2b480a5a81c7443f177bf541632b0fe501720 ("package/libcap: bump version to 2.77")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...tatic_assert-in-libcap_static_assert.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libcap/0001-libcap-use-_Static_assert-in-libcap_static_assert.patch

diff --git a/package/libcap/0001-libcap-use-_Static_assert-in-libcap_static_assert.patch b/package/libcap/0001-libcap-use-_Static_assert-in-libcap_static_assert.patch
new file mode 100644
index 0000000000..6fd7004335
--- /dev/null
+++ b/package/libcap/0001-libcap-use-_Static_assert-in-libcap_static_assert.patch
@@ -0,0 +1,41 @@
+From 09ac731fe0e3e28d70344062dbbad2e19a86b86d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 5 Nov 2026 13:45:08 +0100
+Subject: [PATCH] libcap: use _Static_assert in libcap_static_assert()
+
+In C11 mode, libcap_static_assert() expands to static_assert(), which
+is not a keyword before C23 but a macro that <assert.h> has to define.
+C libraries that predate this, such as uClibc-ng before 1.0.42, lack
+it, so the compiler parses the call as a function declaration:
+
+  cap_alloc.c:53:25: error: expected declaration specifiers or '...' before '__builtin_offsetof'
+     53 | #define CAP_ALLOC_OFF_U offsetof(struct _cap_alloc_s, u)
+  libcap.h:342:19: note: in definition of macro 'libcap_static_assert'
+    342 |     static_assert(cond, #text)
+
+Use the _Static_assert keyword instead, which C11 compilers provide
+regardless of the C library.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/AndrewGMorgan/libcap_mirror/issues/17
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ libcap/libcap.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/libcap.h b/libcap/libcap.h
+index 829886b..268e1e5 100644
+--- a/libcap/libcap.h
++++ b/libcap/libcap.h
+@@ -339,7 +339,7 @@ struct cap_launch_s {
+ 
+ #if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L
+ #define libcap_static_assert(cond, text) \
+-    static_assert(cond, #text)
++    _Static_assert(cond, #text)
+ #else
+ #define libcap_static_assert(cond, text) \
+     typedef char _compilation_time_static_assert_##text [cond ? 1:-1]
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
