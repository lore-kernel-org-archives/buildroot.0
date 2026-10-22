Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58559606A326
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AvSf/GCB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E6780AA6;
	Thu, 22 Oct 2026 07:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMOchkimD2Fd; Thu, 22 Oct 2026 07:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B31B80D36
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792655860;
	b=T5ApteCstgbGMjKe+lrffZZB5N7uPScbY+EyuzVe8YUZ07m8N/3u/TMmyhyu+ikWOMR8
	 9OuKD7vqbAriQ0wHTuJZdSflDCdmtse9pdGiPVBibjKoHFX0Z9rcu2rUNnh30f2Hiz4M0
	 VgddJE/8iVuV7C/RrF5O4fCYru2Uk2B2OFdZQ+G6AkC29YYy5K6B+q/2Qk9aijBMT57xy
	 dYZdBoY4t2VxKUMTZWnJBavp0k+Hwn01Wrka0RSVqFSUyTWXSSdayCmyK20sKjMJWDnyq
	 PpDekLpHLBlByKLWEkjOQNT8BR8lcWsAbFBvQp+fvoWehHSgFmdHR1Sq1R1hYbWq2mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792655860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HPIjeiUwzXs2FL4TlN7He/FDo2zCqCCSG0fNQyuCV8g=;
	b=mH0ku5m3VrjuzzLhXcl66zY/AMYVV0zpHJ97Etonkc+XK5/pKwN+/XIkIBgDxO9b7tvo
	 iaq6seACSrPqNRQzzDaNihCN0SCmUVII0ZSoCtHMitW7lDWbFoR4PltP9zxU/5oONH/CN
	 j2lfrBHxeFaVFezEyr2UHLbs+LdOEoLkXhaWv2NABJspSzBrltA2BBAwecLV+AEcKhFUS
	 StVgS/ZJPmTKag2Xvi1Tbod5/ga25cCYqUfSs+PWEnFgV2M+8AvUSKLe5hB6t1PlNCO+T
	 HaLGGNoAU/ppM1VtBO9kmg5ydUhX540lxwoiWrW2XY1neqL9CJqFemKFYRG8r9H8D0g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792655860;
	bh=HPIjeiUwzXs2FL4TlN7He/FDo2zCqCCSG0fNQyuCV8g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=AvSf/GCBV0gLRO53UmRwm0Ri92iaj6rVfzzge8vJ8gK7H8Cl3WZbP++wyIJD3hxR+
	 CNNnomjat6gXcoEP+M0/PorS1yZ20BYmqoSaGyjKP25F6ZqMLhvCi3XVdxee8n2iih
	 xqGLlTlqvQ5fGEIoXJB/g7QooBaR9OY/9570MWIDqHbNWzGcAhkk1QBhIJcpFjbcU0
	 zxRX4YW7xYnY6IL23bSe6szlWIXZWsfK4KKtsCCZBVwj98xP4lS4Vgl8s8UIkYQnXh
	 u7e7+zZxzuJP7z3ftEDqNOKPxqbd8FBD7BcEFvrol4pNR3p963l8lvK3WdB1O8dKi9
	 m/PEmQPFBsxgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B31B80D36;
	Thu, 22 Oct 2026 07:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C70235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5C7408D2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3eO4zYvBBwn for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B812A408C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792655858;
 b=HgrpmMMcovv3ao/ndtuS4lRQCHoBd6KfpUtE60vYxRNEctS2MQkTb0yAKkMybRzoIXRD
 YNIF31maacUMHcGcUr5ORdxq8/UEmkWsA4apicgWwyGgT7WqHDEAz8eqp86R4zSNmbAlB
 072j/kw9//IPwvqsx6V5HLaC5bfGF0AQeK8V/MRGCoMDP8nl+C1GWkdrW4SBHL9OegMxE
 jDuSZgyE2s2GG7xR+GkjGLldmUaQsRUVfWkddsLIpqdmSPwHLdtCI4MNY/2u0Zymvche/
 w8O+KED9TOWOdP/MN+90yKwxsWA26GTdWwFJqdc5E4FT/hXRCHryPiw3e05fQkmRL3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792655858;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+aYk/vIvbja2Vd8+QyPfQi4xj4Nh7fEMa5P0qLxB5zA=;
 b=VdJu20Y8dQ25s3nMs4vnQODBP+NuHzSwBoCnU9QaOoaAYPmhHjCOXtXcNZjFnYTDEx8/
 M6DTLfTu5uPgQEPi/RQZo1Um/HLedfOiD8k+NL9R6xQAmL26taK40LRybKB+Mpf+nztfj
 iS24F/pxZe9Qff52EQo985JQR22sMlCDEXFJceoJNakhD8qfCQsMwCGkBVLwJoUycrOmA
 ps2H57q0/j4fZYbJgHz6UATRAaq3q0kR4+98a5s5/Aj9uONB4tEz3n7k6zdf8p4l67b9E
 3NDgVeUWrDsShh/365XVs4fndqjry5oClLZ7l3Tf0b61OSCKicWn/rjO8twiQDC5P2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=SBHxeyv4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B812A408C4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:57:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so252958566b.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 00:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792655855; x=1793260655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+aYk/vIvbja2Vd8+QyPfQi4xj4Nh7fEMa5P0qLxB5zA=;
 b=Mdyougg/BOy4n0qjnosJ+rUEpp59aTLlG2fIliosEZELqpjk9aZClDj5rF0M42zaD4
 MA3V6ERAr16V6TYaraJN2Z3hBMwtXnxmsz+tk8IX0k310M78Qe6oa00OHZgNl+rFQkTd
 cyKkS6K+t01vAa3YhI9iOsEUVZpze7R7P5jBi6xbD3GmkFA+4oMWkwSm8UXxuRiDb7Dn
 b58TegZeoFXkhiRa9NudfHpGPFUkJ8O6M/kj3ldwaosWOEb2QFJLvnudvVbwNiAkVcyw
 H0hrKQojxRBhkosIHRKnEQA5gfEpyiV+RrhOSyVidhRTY40jhf+XMn0S8OYkfsaDbYew
 /2NA==
X-Gm-Message-State: AFq9FYI+6DmA80oZTbmJ0/5tdU/TLoWpSXFA4vpoRzBVN4E0TkGe1RO9
 /DjRMhKVZtkc4NrpnYbG8w7YIbUOIDqjbJzJt+NJIGb+Pb0K7xMvKCPLr+/9sQ==
X-Gm-Gg: AYBFou2L/8mlyC0Z9xCIX0E/YrYen6P59/aGt4wtly/h9Ri9OXcsLJDGDmONU5i2exW
 2i0lavAUokmzVCPg+CeDo3KHd8AWdJHTMFtLRuLOvEINI9cyvwEqY5TME5dzOqDpOmMecjOKVuk
 f/p6lBesPnTCoQOLPB1H6Pjsgjb9bwUI3/JD2oCqYEBB/kQO24EEgto6TuA/OyqHj5QJQkccNPy
 5DYqTcA1k8jhJxIMu4DbEN30+84mqfSuP97bTfsrkTPquasmQ4L+1y9mrLcXXJratGI1hD1cYc4
 ACZWQ445pGU+2g+UypyNZYHP2qMMkaxU5qmO5qB/ReOT+fLUXcnZ9ZzkWb75q2SoPKzrPAd9u4O
 RnndgFvRusjFU1HlHHny+4erH71L2NeZwmpEPjZDSdtHcDzDXUUODaTif9x0KUn2jRsQCyHtzva
 BxJJzh3XvR/kOsajJHLyKnBFhPVQAiMcu3rKfTb+LlYyXmKwfC3xBXGh4BNYldBoZ6rghL54uuE
 CWxpkQo/x5GC0L9NegCjrSVVegPQzyj04iS1rQUsVjZ/T5jA4EUetpPniisl2CHSZvl3krZpOds
 BMC2FBQBuqF33kdGZWi4lMvsWr/UiwiuuOo=
X-Received: by 2002:a17:907:2d08:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c4679537741mr354153066b.8.1792655855075; 
 Thu, 22 Oct 2026 00:57:35 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a55ccabsm76695266b.33.2026.10.22.00.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 00:57:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 09:57:34 +0200
Message-Id: <20261022075734.2659243-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922105323.2939955-1-yegorslists@gmail.com>
References: <20260922105323.2939955-1-yegorslists@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/valgrind: fix build with a libgcc
 built without optimization
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

The 64 bit division helpers of libgcc (__divdi3 and friends) are
compiled with -fexceptions -fnon-call-exceptions. Buildroot passes
TARGET_CFLAGS to gcc through CFLAGS_FOR_TARGET, so with BR2_OPTIMIZE_0
libgcc itself is built with -O0. GCC then keeps the (empty) exception
landing pads in those objects, which therefore reference
_Unwind_Resume() and __gcc_personality_v0(), normally provided by
libgcc_eh.a. Valgrind links its tools with -nodefaultlibs, so that
library is not available and the link fails on 32 bit targets:

  ld: libgcc.a(_divdi3.o): in function `__divdi3':
  libgcc2.c:1226: undefined reference to `_Unwind_Resume'
  ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
      undefined reference to `__gcc_personality_v0'
  collect2: error: ld returned 1 exit status
  make[4]: *** [Makefile:1180: memcheck-x86-linux] Error 1

Backport the upstream commit providing dummy definitions of both
symbols in libgcc-sup-<platform>.a, which is linked after -lgcc, so
toolchains providing the real symbols are unaffected. They can never be
reached, as Valgrind's core is plain C and never raises an exception.

This issue has been present since commit 0fe633cdff66 ("gcc: explicitly
use C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace"), which
started building the gcc target libraries with TARGET_CFLAGS, and thus
with -O0 when BR2_OPTIMIZE_0 is enabled, instead of -Os. This is not a
gcc regression: both gcc 11 and gcc 15 emit these landing pads at -O0.
It therefore affects 2015.08 and later, including 2025.02.x and
2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/4a58c34308095e4d8ae91e0a779c94123ee497f6

Fixes: 0fe633cdff66febadc50bab3e0af4b3be53811c8 ("gcc: explicitly use C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - replace the local patch with a backport of the upstream commit
    0ff27aab0831 (NEWS hunk dropped, it does not apply to 3.27.1)
  - describe since when the issue has been present and add a Fixes:
    tag for the culprit commit
  - fix the trailer order

 ...winder-entry-points-needed-by-libgcc.patch | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch

diff --git a/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch b/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch
new file mode 100644
index 0000000000..78ebf3e5f0
--- /dev/null
+++ b/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch
@@ -0,0 +1,88 @@
+From 0ff27aab0831786c7f419e73a2b5217cbbcc792d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 21 Sep 2026 23:45:52 +0200
+Subject: [PATCH] Provide dummy unwinder entry points needed by libgcc
+
+The 64 bit division helpers of libgcc (__divdi3 and friends) are
+compiled with -fexceptions -fnon-call-exceptions. When libgcc is built
+without optimisation, GCC keeps the exception landing pads in those
+objects, so _divdi3.o, _moddi3.o and _umoddi3.o end up referencing
+_Unwind_Resume() and __gcc_personality_v0(), which normally live in
+libgcc_eh.a. At -O1 and above the landing pads are optimised away and
+the references are gone.
+
+Tools are linked with -static -nodefaultlibs and pull the 64 bit
+division helpers out of -lgcc, but libgcc_eh.a is not available, so
+linking a tool against such a libgcc fails with:
+
+  ld: libgcc.a(_divdi3.o): in function `__divdi3':
+  libgcc2.c:1226: undefined reference to `_Unwind_Resume'
+  ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
+      undefined reference to `__gcc_personality_v0'
+  ld: libgcc.a(_moddi3.o): in function `__moddi3':
+  libgcc2.c:1249: undefined reference to `_Unwind_Resume'
+  ld: libgcc.a(_umoddi3.o): in function `__udivmoddi4':
+  libgcc2.c:1204: undefined reference to `_Unwind_Resume'
+  collect2: error: ld returned 1 exit status
+
+Provide dummy definitions. They can never be reached, since the core is
+plain C and never raises an exception. They live in
+libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains that
+do provide the real symbols keep using those.
+
+https://bugs.kde.org/show_bug.cgi?id=526075
+
+Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=0ff27aab0831786c7f419e73a2b5217cbbcc792d
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+[Yegor: drop NEWS change]
+---
+ coregrind/m_libgcc_sup.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/coregrind/m_libgcc_sup.c b/coregrind/m_libgcc_sup.c
+index df509be08d..10ad8ff86f 100644
+--- a/coregrind/m_libgcc_sup.c
++++ b/coregrind/m_libgcc_sup.c
+@@ -60,6 +60,39 @@ unsigned long int __getauxval (unsigned long int type)
+ }
+ #endif
+ 
++/*====================================================================*/
++/*=== Dummy unwinder entry points needed by libgcc                 ===*/
++/*====================================================================*/
++
++/* The 64 bit division helpers of libgcc (__divdi3 and friends) are
++   compiled with -fexceptions -fnon-call-exceptions.  When libgcc itself
++   is built without optimisation, the resulting objects keep references
++   to _Unwind_Resume() and __gcc_personality_v0(), which are normally
++   provided by libgcc_eh.a.  As tools are linked with -nodefaultlibs,
++   that library is not available and linking a tool fails with e.g.:
++
++     libgcc.a(_divdi3.o): in function `__divdi3':
++     libgcc2.c:1226: undefined reference to `_Unwind_Resume'
++
++   So provide dummy definitions.  They can never be reached, since the
++   core is plain C and never raises an exception.  They live in
++   libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains
++   that do provide the real symbols keep using those.  */
++
++#if defined(VGO_linux)
++void _Unwind_Resume ( void* exc );
++void _Unwind_Resume ( void* exc )
++{
++   __builtin_trap();
++}
++
++void __gcc_personality_v0 ( void );
++void __gcc_personality_v0 ( void )
++{
++   __builtin_trap();
++}
++#endif
++
+ #if defined(VGO_solaris)
+ /* At least on Solaris 11.3 ar does not like
+    empty .ar files */
+-- 
+2.43.7
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
