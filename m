Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B66C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 16:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 433164190B;
	Sun,  4 Jun 2023 16:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 433164190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXf7AJftKXJr; Sun,  4 Jun 2023 16:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7450B4190D;
	Sun,  4 Jun 2023 16:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7450B4190D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9106C1BF574
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 16:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64AFD41908
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 16:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64AFD41908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YprdveXa-Nyn for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 16:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D6BE4026A
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D6BE4026A
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 16:35:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5147f7d045bso5844117a12.2
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 09:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896545; x=1688488545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yimmg3KyaTdhVHKAaowxbA2foVLumDVcLUen0INQN78=;
 b=CzT09LNdlaePngKvJT1B2c3iucTvX4SBMzHYD6Zl9TL/SqeBt+VEbFdO6NJcCwXzFu
 jCBwRslXflxK3j/6FHYGEzyePekT/oK7sJ5cyJKfDjoTQhjg9V7dvJeB49Nw9hwyi8lT
 h14lWsBLbyDJ0XUwBVndfbcupALq/Dh5faYCelzgd4Rjflhsq1maRqS3GNVfUZUX4exR
 alabCS9dxBi4puYZRoTxe0EbbGE9hR5kk35+YssOGfQ8ZITKzxuM8/wQ7SSOPEVfgpKM
 eMpCj4MoZlvGfXyV0NbHUJbvEM3IAB0t1nYh6C5ygHS9floZ5V91CSbHBki7KKjCXw8Y
 FI3Q==
X-Gm-Message-State: AC+VfDxaXhTGljfeXv7DGWRLFbUQUDmWoIcX0ySbKNQbqiXzdor3yrAy
 R55sXEUbcQPtkGrs5kSXEent4g4IsNPycSwT
X-Google-Smtp-Source: ACHHUZ64/vEvFK33s7grj/5wsy9YdCjAZDPxKyOmQLVcycs4sqlQgwkuPJ8Sln08M0CH0K9o0LjHHQ==
X-Received: by 2002:a17:907:a41f:b0:973:daaa:f3e1 with SMTP id
 sg31-20020a170907a41f00b00973daaaf3e1mr4669080ejc.39.1685896544387; 
 Sun, 04 Jun 2023 09:35:44 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with UTF8SMTPSA id
 a24-20020a170906245800b009745ecf5438sm3234392ejb.193.2023.06.04.09.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 09:35:43 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 18:35:35 +0200
Message-Id: <20230604163535.1102239-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685896545; x=1688488545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yimmg3KyaTdhVHKAaowxbA2foVLumDVcLUen0INQN78=;
 b=XM0Ij0J8BYiXTTdzGpThrhPvRxuRLq30Q8Q2anRFX4bQ3RqfQK52wSC79QOt6hANfm
 uxJw/2vmw9Y3hdmpQMjO3CKCTihTlt9tPPOa7z5/mr6AtKfCUtwT16JdlA48FoQbQOBD
 HkdHTRiGafNqEkJ4FRBfC8ZHjN3Cm4D12CqtiOZaF9flQS9GzOSQV8cigbkIjb9+N7X2
 ankDqsavA2lOOQM6hB0+6Ujpf6FwzJiQY8YSfsJ9kijbqSUKrF6fOwlMbINFFEAqh0tu
 QGBbwm2/eIwVGWS57D+Yc3NqqvMitpTSPmls64nvWheHc6JQ4ZQUwUsq1lzZm3akoIH4
 pb/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XM0Ij0J8
Subject: [Buildroot] [PATCH] package/gcc: Disable libsanitizer on
 arm920t/thumb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsanitizer is broken for Thumb1, sanitizer_linux.cc contains
unconditional "ldr ip, [sp], #8", which causes:

....s: Assembler messages:
....s:4190: Error: lo register required -- `ldr ip,[sp],#8'

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 25cb4ce8e2..1ecbf7e9b4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -154,6 +154,14 @@ ifeq ($(BR2_mips)$(BR2_mipsel):$(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y:y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer is broken for Thumb1, sanitizer_linux.cc contains unconditional
+# "ldr ip, [sp], #8", which causes:
+# ....s: Assembler messages:
+# ....s:4190: Error: lo register required -- `ldr ip,[sp],#8'
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # The logic in libbacktrace/configure.ac to detect if __sync builtins
 # are available assumes they are as soon as target_subdir is not
 # empty, i.e when cross-compiling. However, some platforms do not have
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
