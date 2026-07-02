Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82197C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 18:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46410419D9;
	Thu,  2 Jul 2026 18:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fsz-j8SosfUD; Thu,  2 Jul 2026 18:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA636419D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783017142;
	bh=J7dKR5BdfwSvWKHaahgX/BaJqVj6g17XBPgmHHXcHOI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iczp7RXzYPwHz7a70FIGd7I60BbZI57l9YkssMmNKTB7l/bm4t83KISZrh+xKVcCv
	 SjCUlygs+AWo9pelqZgJTDaHgi0iionHbpfOpFHDxzg5G6NyHnashTrffVLl1ly+5T
	 IuL18BGth2SiTm71kVT1ddUX34Ut+NlVZ2LzB/BRYDRGDXFijAiMC8WPmD6lBoskgw
	 SqiBEZgMKNpwNJIb0pJjAm5mog3zqRMgOevZL3AJTC18vP0sz9gZ0weYJuBfk+hXMD
	 IyErJ/8ryFo1H/IIusntWIEDu3CxwvkvRBkoL0cKvskACjzXkv8LllWdn62I5ngtap
	 Hjv6mXdV88K4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA636419D3;
	Thu,  2 Jul 2026 18:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 910D9316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D9E408A5
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzlc39sW5a9C for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 18:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A64DD4004B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A64DD4004B
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6094881F2; Thu,  2 Jul 2026 18:31:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 20:31:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b8c65a6c1f2329d5d7dacc6b559023ef2bcafc1
X-Git-Newrev: 3d06661fc1bf0f88356981a44cb93b7b0c76a669
X-Patchwork-Hint: ignore
Message-Id: <20260702183149.A6094881F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: fix build failure with
 autoconf 2.73
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d06661fc1bf0f88356981a44cb93b7b0c76a669
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of autoconf to version 2.73 in commit a6e8c07a330a,
the TestApache test fails on CI runners (and in autobuilders [2]) with
our current docker image (GCC 12.2.0) :

    gcc: error: unrecognized command-line option '-std=gnu23'; did you mean '-std=gnu2x'?
    make[3]: *** [Makefile:136: tools/gen_test_char] Error 1

Autoconf 2.73 introduced checks for the C23 standard [1]. During the
configuration step, it tests the target compiler. If the target compiler
supports it (e.g., GCC 14+), autoconf caches `ac_cv_prog_cc_c23=yes`
and appends `-std=gnu23` to the compiler flags.

Later in the process, APR uses the `AX_PROG_CC_FOR_BUILD` macro to
configure the host compiler in order to build the `gen_test_char`
utility. However, APR's `ax_prog_cc_for_build.m4` macro uses a
pushdef/popdef mechanism that only isolates older C standards.
It fails to isolate the newly introduced `ac_cv_prog_cc_c23` variable
because the ax_prog_cc_for_build.m4 file was not updated to handle it.

As a result, the host compiler evaluation reads the target's cached
variables, assumes the host compiler also supports C23 (which it may not),
and attempts to use `-std=gnu23`. If the host compiler
(e.g., GCC 12 on GitLab CI) is older, the build crashes.

To fix this without heavily patching APR's m4 macros, we explicitly
disable the C23 standard detection for the host compiler in APR_CONF_ENV
when GCC<14. Since APR is a mature project that does not require C23
features, preventing its use here is a safe and robust workaround.

Doing so will not disable C23 for the target build if the target compiler
is GCC 14+; it will only prevent the host compiler from using it when
building APR's tools; according to the build logs, ac_cv_prog_cc_c23
will be set to "no" for the target compiler if it does not support C23,
and will be set to "-std=gnu23" if it does.

It's important to note that this error could also occur with other
packages that use autotools-package if "AUTORECONF" is set to "yes".

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15112315884

[1] https://gcc.gnu.org/cgit/gcc/commit/?id=fad61bf73b3158157a136bf4d9373fc3d9afe319
[2] https://autobuild.buildroot.org/results/d7d/d7d2703e42034d9c11de89b2b3b6cf401f677aa3

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/apr/apr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 1c7553a501..e8cf0f309e 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -34,6 +34,7 @@ APR_CONF_ENV = \
 	ac_cv_mmap__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
+	ac_cv_prog_cc_c23=$(if $(BR2_HOST_GCC_AT_LEAST_14),yes,no) \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
