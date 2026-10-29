Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F8606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Umo3/pBk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F013040D7E;
	Fri, 30 Oct 2026 14:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heEFV3p8uw6w; Fri, 30 Oct 2026 14:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB91240D44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369965;
	b=jerM9aKynD55rOpc9WOn7sE3c9JPlbu+d7OFMZP3cVXxGCNm7Fk0B403N1p8+TfRQqWj
	 AZ1sxyK+7NxuGUYFPPshmf07Pmlv5oWbzfGH8z8JExfK10SsJFVB24T+Zg9g1BxzPgYxY
	 UfX7Tx7AkAvmsMJnjHv79iZA3OACQhzEQWN0i2cSu//OWh8O6VquIv6w9Z5I4chjVcwUV
	 KliT796cmdbjTYVpRS20F0z4mvWaDKuzfaKBIxuUgNAk+Os91yp7dsM3e1J6HuAUPx6L9
	 JGJacKl279Wo9rpymMXgSbf1vOxlJmwhbBpeRuKb1iKWqjAEVPo/LoxNAFa2weGsxAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UmOD5/lfVYjlOnYIlnphGMYRwqf76JcBHToLgeu2jhU=;
	b=B3DleQsPMa/W5QKPqVHnI/tGo7QALWsfD2ZoJ5HIeuq0RnltbeJ0Z1nTyPdPlCu57ZOQ
	 40MyP/aLROQoisYAUnKGi8chpMpO/oPXTzAwFr1etAsY0SNxRJh1xSBIHSEVPgvocuoAP
	 P1dKMe+OwmrRZg8k+OI4ndGph8YXQ8wnpIQJJvDpHVbX6IfGGjYWGAdWTBrXJijrp4nyp
	 NJVLUVTxm1Ja67KrTJRNbIzJIjbhlFoqEIRMcRxleD1ky9AWWnFgdEf6IYIymK/Pw6d+o
	 Wsy6aekufhKlZ4fhnuglvsaZ9MMAuegzAokCcZCZR+d/tE+JIU63A9LRzXuuUAK+A2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369965;
	bh=UmOD5/lfVYjlOnYIlnphGMYRwqf76JcBHToLgeu2jhU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Umo3/pBksQHiVZjIlTA0H0QaHDr9/NIN5SSlJQ8SmgJlAPLnA4jdUxgMcb1wcWywd
	 ONEn+H9xbzyhFGFFKGh5+/iYtF1hKZ+CovUC9sCBOIFrFNhg9t4+JnV4ZzongVMjR4
	 E99wopx05NfzXKjJ0UZnYAAiVQnDReX03Z0qOKtBLBbLfZ/1PdmZfcL5dLcinDCcIV
	 3sVYysRZ+sMjer+HRTTpplYpSrilqp1xdoDQ4HM4BL6SrjaK3GmBoheaHW6gcxAGaw
	 PfujRCj40p0E4r7Lsg/waViWmRqpbytBewkKjjB++xmyhfjV1yn8DthnkL3uIhFTG2
	 Q2GGQOp6aOTjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB91240D44;
	Fri, 30 Oct 2026 14:19:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B90D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D596C812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiY2UYPtK-Lw for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D64C4812CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=Gdi8LmbaSjqNFA93BWY829k6Cx1gYhgrRYzXM41c+pDW5/fDdNxtZ+D0IMMs9+LpulGZ
 YzE1SBheopr7Xov9VncUhUW30BDC81MqD9ZY/bh0e2rY0zjYCnCx/eSGVyIDuUFkx1857
 DuOIrhRWBeBe4sX1Ur6s4dTRX3kh3zt7gSHMntSQ4ZGWH0DALr9B0IsbbkzvMR8pz6DiO
 IkhXogpsHRLtMr8j5mWWL+4xSRlKxMeV+9zc1Nn+6ad5PXhkex9/zJwSW2UKpGC3kCl+N
 e4npJO+v7Dz+E3tqZ2J6ATMzACXJPKD9VqMVMHoBCyVTUn6bK18aqmJrK0GKUFo2+vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zNmOsJAVBi+kiJ1AR4RCi5gp9tvPW5I9YHL7+S/nAGA=;
 b=UDzmNiP9y4me5gJ06+q3GYG93SrjRttiAai0ahyQ/b21tiFvM0C/csoAALuvQ3Pj3CVA
 Nj4gSx45gxluoSrSWkzy49QalA81foGgsi4JVm9ETAuNO2qfyuzoSyMM2APiuwrH32MHm
 kSG/xSsMkdNVQF+g+kaL+eNc1Zal7BylQJ0reGtj6OQMY3r4vvKn4JFHT+HXrAe4V9cM3
 ZxLMnczSd9VE4DbZPK+H23n6McA0wcWngG5SzCof0BYmqsum9kIqAtsFhbUnOc5+b/6Ez
 bM3Ce9UJK/sbZ4S6z+a3Pa/NUr2IMb0FFz6bliQsvmr8lpo2PUl9V3Y+0xv5jd9TYLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D64C4812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F36BD9D388; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f38d10011347b3d72a8a4724dcfcb2ec14c63887
X-Git-Newrev: 20bdf6feb73ce97876c524b520f84f54b1356c72
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.F36BD9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/valgrind: fix
 build with a libgcc built without optimization
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8430669755559715211=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8430669755559715211==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20bdf6feb73ce97876c524b520f84f54b1356c72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63cf7e10a9fdbe5ac48cf7d132a8f59f3ef4db66)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...my-unwinder-entry-points-needed-by-libgcc.patch | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

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

--===============8430669755559715211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8430669755559715211==--
