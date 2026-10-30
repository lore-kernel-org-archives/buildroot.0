Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDA606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 22:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AQCkDvrL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADDA740B10;
	Fri, 30 Oct 2026 22:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5Sexnf1kf4u; Fri, 30 Oct 2026 22:27:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2BDB40B0A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793399224;
	b=kk9pTxhkxA4ez8pboVv0vOxAAbCoVjZVt7s5JDvj3NdIHMVCSHzlx8afmmqJkkFJOljf
	 QDtzNVtgxqyB5FErlVR4nVTh9j71v7eQLcZkNBVkP02bdYJzxItKOFYcD7qzukCyKAIfD
	 UujmnEVuhgf4TRRBEXtwfK9MajyyiH3SEo2UMbrwmYEriBd27Ju3v+VBL8T1yosKQiwkt
	 BhFEgIhNIpC2BIPD7g6MUxKDHtbh5r9l7FLInoFVlG0R0LNqcZUwzrsvrKwbuQa+2rZqi
	 dgBYVjcBFsc3RmBvGUB2ci2WMEOiP6aeWVdeFdNyWM3Ss6TDzXRpzeqbNdR4aCVnDfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793399224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lEqEenSRrgorfjlVC2zwECvsGAk2+S04jn80mB7wHO4=;
	b=n5i0yCvRJiJyvUwhE+tcjWzs5LCLnN59oDDgCG/dI1mB0qIlSEUI1R7E7J+g6ADwPI5n
	 J8nlF9xxCBcWgINSEMhXgpAwxnIGjWMoFRJtY1H6Zpqlwi9A+3Ljst2zRoz2yYr0iUOZY
	 YnMmhiE2pK/ls0j0VyOJl3DvMeR/pETqhHuXHhs5RoPLcQvs3pdgD0LrAxTF8nyFQjjLI
	 utz88bmQR6On5L1EnRvp36pjjQFzwfsJzs+fsYw8Z0AGYyKgIvogE0S6uv0shfTlkc4pV
	 On/eGBuFQmVKORqOmqN2hu44KjexhKEkvSpzt7ruiVKaHcRfIFSx0nnPA1hU0xWedCQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793399223;
	bh=lEqEenSRrgorfjlVC2zwECvsGAk2+S04jn80mB7wHO4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AQCkDvrLfc3jBGUxrqhwdrML9VnESB4YUWTuy46N4Vb9zsrEqRoZBW8BfgVXCo/LK
	 t42GO+eXWsCFKxz4VGJtkczD5azzn0oNjU5GkQdJ6V6l4+4kokalP1d5CYDYM6CMOn
	 4BpOWVLBQRG8nZg/VzqcK/BuHHvw9YO6y7gULIp4A+wogP+bDGEvgT3+0FOY9xw+wf
	 lfVy/jjLd7eTaPbGK0VS5+BfAZWPCZcbVaLMPI1J2zEesVUKYPk85Mi8b+LdS8MF6A
	 fFpCdFWmAFEIjVj5CX85z6AcccZXVy4iEH+ntOnFouxczGrLdlTG/50U6x4qI5lreU
	 3FRg8DkcXSTqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BDB40B0A;
	Fri, 30 Oct 2026 22:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE1A156
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8C9940588
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s40UkNEeXPiL for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 22:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AA4FE40585
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793399221;
 b=Eqgu0Apb33IfrWr6l+82XMWUxNl3Gofc+uPF6TLYDuwOd3GelgZ8PrAXLfdyDe2GcuJP
 Yn4AtLQ01/ux3JfjN3WhqknAGUERfd2b963BtyOHWeAedurde2rxS5q0rjWCJ2aG+cYtm
 h5AK7iTQRIkZMQXh5B0XWVrHmI7aVqNcDHkkm+ajGbaw+yuTb60JgcOwt2rTxjrdtKLsY
 Pl8x3VNh+jY5yn1TUfqVRSICcyCGQ7UTqRBNoy725Q4x/cK8vQ6XwDMPb77UMJNgG4kkj
 6u3RPI4iCY26IxFwePrftvQYVv1rFqV7j8tD32UOkxQ8ZI7O6K7VFkmIfmYZNtPjD/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793399221;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=5/ywe3cKy4EJAOaKfXBjoK8qm3skFHwLkaP9DoeA75c=;
 b=Sv6exu8r/NTAQbJklAvhxLpivRzJEWR5fXLY+tT5DTEYCbpHKZEh2HDakyBpSWRWyvwx
 5sqNJRqJ0p4WuzezcpksdrQDeI+AKhH8tPab4KBp2SEqP+MtyaF76vyDYs8w1g0xPayTf
 WdspYeuTMRiTXsaxa57NIM7J5C7qg4dUz0BHj4N6k8SYm5TnEP4pCcSRNQDe6e4dRyqwB
 BjZ/s5llzyFZBJRoDt/Xb2lxi4RvDqKAGJYdrOQdJYxV9Adi30OIKMmflMBI9dnzjigKq
 cvhSIZd6c+34ferhYH+OH3ONYexb6MuI8pgD7V8qm7ew1hmBQwCRBUKb7HYOHMl1H2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=Cs455qNQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA4FE40585
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:27:00 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6acb9c018ffso1786462a12.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793399218; x=1794004018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5/ywe3cKy4EJAOaKfXBjoK8qm3skFHwLkaP9DoeA75c=;
 b=TgYPn9Mb7NA+TCLchJV78ZaPEHXO0ITdvABXsLwWnlN5X0Yya6FVYi8+xfDOiDRIKz
 ADull2Rz8w1Zd4pk6/pioItxpFWeOyI78n+3q2CpfEF7rnEu38XMsjyg/gOMZpcHxPUw
 UxAvYoGl88FLFhh7CbmrnVKsPzbLNdxpz10MTzNzQWea1oQA15INrt/rdWH9qLj2al87
 ldk+rBpNewQks45wp/MjjlBSCyKRQeKE0pNQCd0zAwcHXDbfVasHrOQDHDnbEq3buGnK
 MEn88bCnXUeqGiv/fPwWce4eaPcKwvy4PP3zj97vALyuSayGHchHTebZ8y17YNKgCIJ8
 V+pA==
X-Gm-Message-State: AFq9FYJxTAqhmFfaV3GgQ4feVLHSZ58hM7VbzXACm4gd2x/B7XjU4Roz
 thW+fyq83gk9nuK8RmaO2+eaTLG2r+JNcjsO5RzVnwP7VxWtKnFht0JAErML6w==
X-Gm-Gg: AYBFou2scYSsUK+yeq9oee7q9qGR7UGFRVWvql+nHxV6SetyQZurdUiYuy1EzCnqdo3
 HHi2t6KTldpy/qb/woYXwislE6tme+XxXVZ6P3Io22FxTfZycLg/aA+ryqnHMlPVkIhCniONIAt
 zlTE7hRkhzBsy6X131RInTIC8N1KD67eXSj5pd/DgCLUFvU/6vouYdmF+Ue6tOpyvz8dB3Mzik+
 fVR7t0JSegk+AhFj//ejt6GbMAbP7w5YdtuP5mpUVbRWF08wI+9Zr+35zn4OcnejU8Fp8jO0bGn
 a7d0n8u6s+9ktn06bPJU6MYhyRavwvKX0BNdVkPnz8aQuJQU5lZKwePOAkNh1fUh0k1uEBn1cdE
 RjAxaFqJ8HT0+SPsX89DQQoh+5d6U3pYF6x1RzACGp4I7lWR4+ilm2+rCivwxeCPIJPLP78plWx
 KXyfa9yosnY0FvfXBgB2PALpG64+fsSoXscHjJ91UBiWJ01XOz28rsUHLlcsEhp9q/a7bsOelt+
 kNN8ljJqW1KKD4mH4HqJi3yauxv8p7v3KrjGqaAawCLvGBz8vhN/9sQWX8Ez9T5ziLo6vgvkQV2
 N5yHiXuYapEknDmY9ZCgoW4D3FMtHb6rn+4VZI9vIROK33edmeoUiOLbHl+NI56Dozg9JbS5s+T
 +gedGdh1ZAMQgG4VOBl4TKOU=
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr2030284a12.9.1793399218049; 
 Fri, 30 Oct 2026 15:26:58 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4eca2080bsm385241a12.31.2026.10.30.15.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 15:26:57 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 23:26:48 +0100
Message-Id: <20261030222648.270223-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-tools: perf: explicitly disable
 BPF skeletons
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

From: Yegor Yefremov <yegorslists@googlemail.com>

perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
and openssl support are enabled and a clang >= 12.0.1 is found in the
PATH. That clang is the host's one, and it compiles the BPF programs
against the host's system headers, so the build fails (here with
linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):

/usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1

Without clang on the host, perf silently disables them, so whether the
build works depends on the build machine.

The perf tool does not depend on host-clang, so always pass
BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3271fd5683..45bb2bd7a3 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -30,7 +30,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
 	NO_RUST=1 \
-	NO_SHELLCHECK=1
+	NO_SHELLCHECK=1 \
+	BUILD_BPF_SKEL=0
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
