Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6417606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IVjtbWgc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1901811E4;
	Fri, 30 Oct 2026 14:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IiZpppMr2bR; Fri, 30 Oct 2026 14:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC78381184
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369206;
	b=SVFYPhN3j+K4OTZtLWOTgtE6mwvCZ7wPAPXoK0pMjcqoeBelVXWMEaCsHXo2qKEJJlOg
	 TE259vE+WoH6h+0hMTwm1CTM30g4ai8Fwvq/9Ul8hdd3NlLm4oOKVAUG9pi5NyIdAqPOp
	 IrjBTGnAjZhaFK2AwoQJos/Tone1RAf8K94erytuR5homMoThpjWiFqZhV1e6JQzYb0GU
	 BEr54mD1TWQZZ2wMDvB7dkSB/P1suUt2LAyzaTKV2QlzmzjZDqI1E5d9VgrRcHZFeKnbO
	 Xp/X630K1QFuu13/PzxQ6Gqm53sYUxixSCgS+kSNfjTcoZPhW5iZV1uSZdRaua1wvMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7Xj8BpiGykPovkhVuMbQSvZV0+K6nzrYyf/ixhsySzQ=;
	b=BJniIzmNVldGiRuHzVB5DCzoPnLExOYa4ftsVmZLkcG8MCRfKb5y3Bx/axEvDfjwqHrB
	 jGkHr+OLX/yEXzL9uhWckBIpM+Ea3ZrzDUibKMXjxTt5vh7e4eTyu+zr/y9ctujzpMXxD
	 XZu3sVDZp4jk0MalcZMAtepYOBeyD4PXgNNVT9hOCK01LBE4mcAhnLVrkh8fGXC5gfM2m
	 S66AoIuOprUdkfnvkAf/EyqWis8P1wCcXbi7BD3uleflbOLuiRJe+0vIrxlcOXfnowfdW
	 qUFc2F4Vb98tV2GnHsEuxSLn1M2guF0H0LnB+7xrn8YjdUPUgEVddXVg5rnIKGNMBXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369206;
	bh=7Xj8BpiGykPovkhVuMbQSvZV0+K6nzrYyf/ixhsySzQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IVjtbWgcuorBvuXvpm7Kp8EcOfSOPnWNPPV4Wi9dhAN2VUdzEkAHRb7oK++6L389p
	 5rLDOMO/zvi9IyLJA4yr/eoG2N+A2eDHE+a3vd/uOxKjZ7tgXvWxGlSPV5DRm3aGr3
	 58abEjN6B1DwOSY1ntDW3pBSEluh/ah8p0Mg0fMVcsXzwsiLLvki+hgWTkM7z06HGK
	 fWEKP9xhWScqyvXZUZqekn180jybdmh1IaBXYSk5EjiIVAr1UsaJPOYh65FjedOR67
	 xlCaS4/MVBj5/mV0qGiR3EIwP0jYJpNpLMTqhqTFFH9oSOUPC8t5PjsD+swoHMSpkH
	 Iz5rro+t9Y4OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC78381184;
	Fri, 30 Oct 2026 14:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 289E3D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C77F607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2uAC4R28VPc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFE5660ADC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=DjUkUtdDCZP1M71IiV7T9Q5iA5VSLmtO90Gantj2A4fox/J+w8bksu1/V9SGT/6Lp1GF
 aetT9pYUtBNtDPfEXpsVM+rsYAfjacrMcIaLwVtEvRqI2f8UK2QJgon9hm/Gmmoc38/cG
 6rcHfTefQv++zeYepH4VLI5Er0jp+0fEbXMpnDDOmgFoKci0+2LFQGdfKLTfnbwNlZArS
 2Fmho93wsQ4bfw+8aBzxf3N1f35OkWirmrKS6DTm2vqT6bXcFYHyka55jfaMXqGygWuaJ
 YcrJY+Z6WMIMzvk0ED8aXArErnlGH54GFoNWm6x1ks5VXccTMaDN8FsntM9kgYcupPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SmKWHjRTlD85SzwRhmxzxNOpLBpc1jZ3K4tDkVjBUKw=;
 b=aSNve6NAaMDGlQE8y9jAG9aF8tsTdzzIkVeWCxCEVMgVRsxbDDAId3OMvwaVCiVCRbpB
 WdzCH5EeOshcziEgi4LNgZhyVXlx71tBVw1IBxET920pJgrHvuGSAP6BvqaT49EbsvFiz
 p5k57PkZyOLifWTkMdsKU19kEutaIOgxcAwmpx53Xpl3XOtLWhU4sW1+HYEAEYDQblps4
 Yg6HmxASkpI9OTQdeWU6ECdqyO1oPhOznSUPJ3erGNoN0CV1T4VbaXGwC9kixZWlpeGf3
 PXpc+6VgVacui3xmktaJnU88KRNkEX3o9Fu+/zO75NQpiO5s265H0NOj03HyTarWuWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE5660ADC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AE309D389; Fri, 30 Oct 2026 14:04:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc83223c5a58502f93d61b21312278baf3e40129
X-Git-Newrev: 64a251de22022e35515f72e277fb89f5f6a2c9ac
X-Patchwork-Hint: ignore
Message-Id: <20261030140431.0AE309D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/valgrind: fix
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
Content-Type: multipart/mixed; boundary="===============0842333165752038465=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0842333165752038465==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64a251de22022e35515f72e277fb89f5f6a2c9ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============0842333165752038465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0842333165752038465==--
