Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49170606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G7tIevVi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E33840A00;
	Fri, 23 Oct 2026 23:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvLq-qApyXYZ; Fri, 23 Oct 2026 23:24:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 188DE40A66
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792797888;
	b=kkuDhLrkVQPb6NdTUlbFd0orlQKxJL+nGuYxbxiStG0493IoQ71L+4URlvlSRwLjz/YQ
	 OBRNuXgq+8aBJu2AAKbKglT0lHZRG70sSv25eCs8r9l6B+z3c7mCsa+sbC8eKzvS7tWcA
	 t7xdkX8iCJVl0GwaqFeVrjXfq1RPFHYJyhXKqAg+W0WGvSeCG2Y4J1mbQW8MePefYvGPY
	 mzjZyHA4j3ZWCzs6Fj6rHzZ74STBGHAApUIX6PdpmbCv96rouTsefXYe2cCL6tkNspK6C
	 LfP/Il5J96/Lwh6EQl/oMaC5dGjN0XsSyeaxbDwP5nzXAMM1dvYA0wtHvgLbI2cdrsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792797888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eSSbIcH6SrKiaEkRc9QN8kNlmaWfVDMZ4Bd4KT1Iny0=;
	b=Y/YsXZRlG3v7baEvH+n6pCJ6V4p05L9+awN5Yz218Zl9cfTffNRHcJMRMVKA1gKsZ4Yg
	 YzAKWP17U0wk9/b8GUmNuSRgsEEYy8f1OlG0I8NLojLblwmk7JHtMS1DI/O+wixzvzog0
	 VMwTYx4aJWNIpJMmzGeJEZfm4iHMEMNHHMPJl9p7hYBGoxAJhCGIpA9f7FgnMbjdt91QJ
	 UWyfM2qj/3z61iAlriytFPaVbXSjK20tiPMQn0O03Jf2tBhaFqho1+aMApeyNrUW4biRe
	 x9ELocGwaGwIz3iF4knxZGZJPV5ljlt9ef+c4LUTHIGcEL44ZCIT63WEXBTPfmWC7kA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792797888;
	bh=eSSbIcH6SrKiaEkRc9QN8kNlmaWfVDMZ4Bd4KT1Iny0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=G7tIevVi8Zq/FCVCL3EkFZvjqDQoAYFqe0XJDJ3DabyQvwm6aLKXVt4YBEKThhntc
	 lfWJhOdO+isvK1mAIekGT3ijDRfb7YATfYp0GaovQJQmupCO8EKgII5soH9uopTNTj
	 hYiZSPKG2eZJfjIDIYBTYZwUIBoPcCHsJGF1o5/kuYiQ6iYznHim92WFdOZxMKCQXS
	 25wbBzHdmKV2O5TvFeBwFnEVUq7ty9WYh7knoSi+ub3VvQDxt/MbpDmlvMFHsL3JCM
	 7Ow14Zzw16Zqbjj8ssjaXYWCJtuVb74gaXjJSk/1S10jBtjqFQVyUwWfian19k7ubQ
	 4e8xQjIR1EbTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188DE40A66;
	Fri, 23 Oct 2026 23:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42EC5356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 271C9812BB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AK1bPnnfiZs7 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 23:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0A81811E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792797886;
 b=aM5PUjxnegUUDH8rrIOtjB3/NRaP3O7GwseL5uhV2+egjXJz2/WZJ4189yI3I9FuVMg0
 DC17at5Uap/D4r3ou+3NfMSX9KAQy6otyqtaHm35vZIqcDhFPecBCowP3vVw3JJlxE2c3
 EpTFgq04+lpwgGqM3h3McOcCAnNSVhJoMSNocQXLQ0LMefZwbk5BB2FWxKoHgmAInqq8f
 0iq6kvyyuSeIRUFGG34s4wIn8F3DvcS9DUwjz2ITROmIG8ADfcIlBKHzDZ8qLqnheOnmw
 yQ8BWwqaE+syWIQqiJomha8/b7apJekxmb0G7wvUV0wu425sKoK7vDf3LLzIRdCGx+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792797886;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZfyXtlhvNRiiZvyZF7QzNa/Q4dyhnaFI/Zh5cwM5jKI=;
 b=boBQlDdspJ4lkpIyPdMvnwA0c7Tzou5lwZeFJT+LMZGVuQDud1j0bjeRfWTpy62ZgX1X
 lSqKZm1y0RIMVgLaf5lYs7qBXURa5PsQUZNScX/UHa9uXkqJITOwQYmPJg7+1mToMX0Wn
 x2pNsR+2nT2N/cku3SPue1aEdO8n8IYGNQke8L+MEt2iGrwfKXOW5fKiygHrOQ2nR9cB/
 D9ault/k9M2y9bhWmMI+xQm/LvBWbfQIUOv8nypEimT2S42JUQW24AZkhopH5SdpoL8KJ
 3l8soMnwtVOjVKA+MMXJXcu71L5N4CPmRxQp/DTBjfzg2CF7F/FdFN723hj1UU3L6fA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=IDNyDGLp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A81811E5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:24:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso190582066b.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792797883; x=1793402683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZfyXtlhvNRiiZvyZF7QzNa/Q4dyhnaFI/Zh5cwM5jKI=;
 b=GxBimaULizgvKcAUikwLsU7suJpmC2YEDQNAHxZj9rhU8XGcioNREagOEetT+azxOw
 AGgnlL1V6orPfup8ZBq9LqLr/LZYFl8kGROj3yNIRUZZswKxPcSjuYjPIV+8GyTEr3JP
 VexzP7PGm7Wf+i+dGxVl2VEdkTTx2O/vj8088iXa6yvEIhGpvzlAH/k6PX69PdT3MdvZ
 ASaEbnLNroVpYecB42hmqShq5m5Tig9Xj2yatK/sxKc7OYh7pmjjptP9cFOvuARVj2KU
 TswhXH3tUfvFnuk37A1OPJPTs2No+N5Qje11oT2JqXLFgxwejVH7+VQAagtlOMt214qR
 LbIA==
X-Gm-Message-State: AFq9FYIQJncuzEu0Hk9NxNUDWvswMcjRjaLSZ456ELY5K+vWSlVsPff/
 yMzGb0yNEhZZnkC4p/obXGGum1qnJ3N86vjma2c2+ACPLjUPvsNIeEi70Mu4oA==
X-Gm-Gg: AYBFou0EhRpCNWwQIqXobkjQC4qDGVdqMg5j8VfCO8+0ctlMT6jCKM/bqSb9TsFNF23
 W/OM1lnr41H0wsAgHrCRozC/C4Yq67eb/kJ3GqQQwQp6EDulxisT1ztgv+knFFdtCyOeI3+Q9yC
 etB99fW7KPjZcnrmkqgGviyDYK/CsAT0kIiKxBoDy7gjTYXmakIDnPB+8pstD/uh24kO3hpevKy
 zUGPJGrCMJOPZeJs6R8no1XrzQbBN1m/Rtbrp/Ve+qvb9HzMQ8vIfTJcaJuhFEq7l15mCIYlhLB
 U2weaYhCAW1shOTZIp8vwsZ/Oum1ekJG6HksTTseXYmP3yODJ2XB8KiqndmcvwqXrujrFx+AKmf
 4ortfvXK4Ga0L2kqJGPguP1H/FO0BB5OVVmR5WhcYKpjnNiKzOYgg9fdz9MrKpILDz2kn1M0VsR
 7eJeA3LEVQI0iQL4RxTFxcgYx7Bnsk/ZGffu32uR7Z43Xy0LinnHT9M755c+wX0UhKjpzEjRI5n
 a0cFqmXs1UpsHvlWVPXiZaXbrcE49WHOcG/eij1c2DRrQ2PnRRx/3yUDSMbqOHPw9uPsV+oNB4C
 rD7eOWojn1ZptzMRivnHiXezfp//w6TIiv0=
X-Received: by 2002:a17:906:d555:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c46bdc2aa9amr45823466b.9.1792797883048; 
 Fri, 23 Oct 2026 16:24:43 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd34fe2dsm19768866b.1.2026.10.23.16.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 16:24:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 01:24:41 +0200
Message-Id: <20261023232441.2685643-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/alsa-lib: fix i386 dmix build with -Os
 and AVX512BW
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When building alsa-lib for i386 with BR2_OPTIMIZE_S and a CPU that
supports AVX512BW (e.g. BR2_x86_cannonlake), the dmix plugin fails to
build:

  pcm_dmix_i386.h:52:9: error: 'asm' operand has impossible constraints or there are not enough registers

The i386 mix_areas_*() assembly clobbers esi, edi, edx, ecx, eax and
ebx, and at -Os gcc uses ebp as frame pointer, so no general purpose
register is left. Since upstream commit abc9f32cf45c ("pcm: dmix:
assembly: give more freedom over the constraints"), the size operand
is "+&rm", and with AVX512BW enabled, gcc 15 and gcc 16 then fail to
fall back to memory.

Add a patch, submitted upstream, restoring the "+m" constraint for
size, as used before that commit.

This issue has been present since commit dfb3ac81e484
("package/alsa-lib: bump version to 1.2.3"), as alsa-lib 1.2.3 is the
first release with the relaxed constraint. It therefore affects 2020.08
and later, including all maintained branches, when building with a
toolchain that hits it (verified with gcc 15 and gcc 16).

Fixes:
https://autobuild.buildroot.org/results/ff613c2d94c35a38a5886b70d72aa37b58440b5d

Fixes: dfb3ac81e48485a3ab8c018854725cfe30631e3a ("package/alsa-lib: bump version to 1.2.3")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...i386-keep-the-size-operand-in-memory.patch | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/alsa-lib/0002-pcm-dmix-i386-keep-the-size-operand-in-memory.patch

diff --git a/package/alsa-lib/0002-pcm-dmix-i386-keep-the-size-operand-in-memory.patch b/package/alsa-lib/0002-pcm-dmix-i386-keep-the-size-operand-in-memory.patch
new file mode 100644
index 0000000000..f57e93efce
--- /dev/null
+++ b/package/alsa-lib/0002-pcm-dmix-i386-keep-the-size-operand-in-memory.patch
@@ -0,0 +1,82 @@
+From 5729c2cd216bf3fe8564ab720e25e143660c089a Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 24 Oct 2026 01:18:15 +0200
+Subject: [PATCH] pcm: dmix: i386: keep the size operand in memory
+
+The i386 mix_areas_*() assembly clobbers esi, edi, edx, ecx, eax and
+(since gcc 5, even in PIC mode) ebx. When gcc also needs ebp as frame
+pointer, which it does at -Os, no general purpose register is left.
+
+Commit abc9f32cf45c ("pcm: dmix: assembly: give more freedom over the
+constraints") relaxed the size operand from "+m" to "+&rm". With
+AVX512BW enabled (e.g. -march=skylake-avx512, cannonlake, icelake or
+x86-64-v4) and -Os or -Oz, gcc 15 and gcc 16 then fail to pick the
+memory alternative and abort:
+
+  pcm_dmix_i386.h:52:9: error: 'asm' operand has impossible constraints or there are not enough registers
+
+As the asm already uses all registers, restore the "+m" constraint for
+size, as used before that commit. The loop decrementing it in memory
+also does read-modify-write operations on dst and sum, so the extra
+memory access has a negligible cost.
+
+Upstream: https://github.com/alsa-project/alsa-lib/pull/537
+Fixes: abc9f32cf45c ("pcm: dmix: assembly: give more freedom over the constraints")
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/pcm/pcm_dmix_i386.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
+index 0a56e8c6..7c9c9dcf 100644
+--- a/src/pcm/pcm_dmix_i386.h
++++ b/src/pcm/pcm_dmix_i386.h
+@@ -149,7 +149,7 @@ static void MIX_AREAS_16(unsigned int size,
+ #ifdef BOUNDED_EBX
+ 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+ #endif
+-		: [size] "+&rm" (size)
++		: [size] "+m" (size)
+ #ifdef BOUNDED_EBX
+ 		  , [old_ebx] "=m" (old_ebx)
+ #endif
+@@ -248,7 +248,7 @@ static void MIX_AREAS_16_MMX(unsigned int size,
+ #ifdef BOUNDED_EBX
+ 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+ #endif
+-		: [size] "+&rm" (size)
++		: [size] "+m" (size)
+ #ifdef BOUNDED_EBX
+ 		  , [old_ebx] "=m" (old_ebx)
+ #endif
+@@ -376,7 +376,7 @@ static void MIX_AREAS_32(unsigned int size,
+ #ifdef BOUNDED_EBX
+ 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+ #endif
+-		: [size] "+&rm" (size)
++		: [size] "+m" (size)
+ #ifdef BOUNDED_EBX
+ 		  , [old_ebx] "=m" (old_ebx)
+ #endif
+@@ -491,7 +491,7 @@ static void MIX_AREAS_24(unsigned int size,
+ #ifdef BOUNDED_EBX
+ 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+ #endif
+-		: [size] "+&rm" (size)
++		: [size] "+m" (size)
+ #ifdef BOUNDED_EBX
+ 		  , [old_ebx] "=m" (old_ebx)
+ #endif
+@@ -599,7 +599,7 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
+ #ifdef BOUNDED_EBX
+ 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+ #endif
+-		: [size] "+&rm" (size)
++		: [size] "+m" (size)
+ #ifdef BOUNDED_EBX
+ 		  , [old_ebx] "=m" (old_ebx)
+ #endif
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
