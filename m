Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EEC606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K6hfo4S/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D00574091C;
	Thu, 22 Oct 2026 09:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYwFMCDFG_cD; Thu, 22 Oct 2026 09:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC55740920
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661526;
	b=S4ALig4fwApJABZAhnu/9B8xHvPYTU8nDMgnHrgOcquJ8QNu2Lx/ZEjwN4Es4mTiURlv
	 kZUCRApZJ207v1/lQnzqHxwYGiaprdrffJozDf6PLqlSpUOPHXpol2HTiCQWcETd4i+qm
	 FWY2wR0EA3D/T/EoOjEERkenRBySpPcG6obhTZZnBaqGpgWs1zDiIm4aXAcwpaicHPaxg
	 5Ax97tjXscC/lOK+DVKv29RXTUjlkhjE1elzWTTQGsz420Py6Ce5vZ02iLuV/3JI4vgkG
	 X3S5vj3vzZhNLRdcWV/7/o2OOpgilVl+D9FYxkOCRNwwHDix2vKd7Mb7hd3Uck+9qOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AmTsrgInjzUt7bLbs+LKH2IW9Yab+7ffDtqG27uVjDk=;
	b=ll/NyqVapf3CzmsDGKYPm1/xYdu4452DkeYsj4k5NhNM/vg6DRwPARIJTVj4ZHJCLMGa
	 +Py+yDQ/H8bia9+NRGIo6vp1MC0q5buqBh/jc0csasIui/l3V8Syp9+k+IwJ2/w09y1Y+
	 46OGMg+cPDIr2XzUUR1WZZy+UXBARa5C/4KwDdHrI3dxcETvm1SvaT6eDcbQFYtCkh2w7
	 toKAEDJVZXilfWNqIvdKillDnb0p//zbk56arC7wTQA13XPTKWn607UEnkVCfOBUYbvs5
	 FgikWldCZ6GebC1esYhplbJulhLmcHKqm2a0iFlDQQ294yXLzuxJ764YBxi3KgBKK9w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661526;
	bh=AmTsrgInjzUt7bLbs+LKH2IW9Yab+7ffDtqG27uVjDk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K6hfo4S/5u+ZUvAN+3hP6bL3JVr7Hc5vXiDJRPyivPRE4/GafSGiPeSm83q3a3I6F
	 oQwI3Z79GroYpkIw49pLRycj6N3pOwhpwTBa9ytffakzqHtPBb7jRBNFoiSvu1npSe
	 YwYmAY8mOVQMNi+BcdLHQW+rkMOMunRP7dAqaWXREZ1B8GPSn3a1XDz0qZb51lHc+V
	 zaQCCcu4WIVgXRf56NLYcbwedk3gJiL1k3h6W9/pZOev6+SYO1klwh7zhDSDjq7/b4
	 /m/PoNWdYd/5L1V/hdWLJZVplhf0LuYwcoituc8Oz20a4XcNdMz+QKLNhBLu5OwJ8L
	 hnVWjBlE28ZQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC55740920;
	Thu, 22 Oct 2026 09:32:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FAE3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED5E4039F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD3N0laE8NdW for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 33C9D40050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661521;
 b=R812cn3uFP/inZIbCDzIbRLGFLU6VJB7hhkGJTPC+9H5hvel7rupIpSL/F5XJLky7VR1
 ML9XCngWWYnbbVtPpABWK2hC9ImfDRjbBoW87OtNJH9FumYBoV3ws0Cysr/Cpi2Khk6K5
 gl/djHJdc96Wh8FZqiZfsexeyy92OWzHChh1gZLTog/t0ciuI1ebw30XiA0kUhhlsKE04
 YMX3hR2DKuBmbB16prC6h1FEWW28W7lbIJBMEW3bzXtgvVQ1Efg5ZZGKhLfkSR2o//IGN
 NBdSwygtUTx7nLaJfDXw804UH2FEQ5HxhsTJWJ4MTv84gtbmFaxO0SEnHbd+2NWn+dA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661521;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gjJ6/90ZETQmvH6/a0T0haWefSD0Y/zjQ/o7hiV1VNQ=;
 b=AgJRUACR6aa220gATAZMztRbg58/gS6CwWTK4hN6+85SFV4IWzKfE3rsHG4/HY7VXVSf
 FJImz/U3C8ufRe900BIf7/mf6PMwKXSy9OX6F49XCF4iE3m0WkKgzc6Kl4Vfy74u6LJsZ
 NLVZwZinaTpik2RBwfY/VmeCH4UkYNE/P5Kk+pp3HJV3ovXJzLe9gdi4rbY/EIaKbBXA7
 I5jt8sMoHafMS7qj3ZFosf0uIbt28bMR9FSvosXhsJLgHa2RerGBAYe4/SqP62XtAxWeN
 Cr6g+Fhr8tBV/UOzi3n8dDkrVu18S3VA3JXFtR59a0CJ4NnpyoHG2DexWiGUlPu+X3w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33C9D40050
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 065769B97F; Thu, 22 Oct 2026 09:30:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:41:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef4e20cc948cd20cb161da4a559cdddaea48551f
X-Git-Newrev: 63cf7e10a9fdbe5ac48cf7d132a8f59f3ef4db66
X-Patchwork-Hint: ignore
Message-Id: <20261022093037.065769B97F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: fix build with a libgcc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63cf7e10a9fdbe5ac48cf7d132a8f59f3ef4db66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
