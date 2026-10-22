Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862B606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lIHtbVqr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33BF814F2;
	Fri, 23 Oct 2026 12:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAA0nUSGKobk; Fri, 23 Oct 2026 12:32:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8945481683
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758751;
	b=AdVYcptqGgXTbvyqbVhC79MVdsk5+an05tFl2BBkfFPd52/VE+w5Nc/ii1aNHyNtZtwH
	 /IB1ZlNjJlf/obbkqn1MKOqMe1HIanMGDzuveRaXQFItpt8Z1erhI8+ZZdySSIg5LZobG
	 yHs/LZNWcVHGGF9MqyG6VEphgFG0GTYqolmm/Z8cmwcLLruucaVt+WL5CtEqFPpLNWwN4
	 bzggqwPVN20IS3i35yUueP2e5ZHyZv6lkBGqqA1/D3c3UnsAaOhCDDyfy0Z3D+RQn7sfL
	 1LZcJzbJxTfddvaOealUUfYuxl1nXvzy/TDQATTChvHW8tdC7a/2CNCJBQRyAFdkwIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2nyGPb9Haf7gRUhRHbV8ScK5b8mARPO/6Pcm1VHcPUw=;
	b=QmvFKcH6Kp3eE2bHgdAyeusDPVe9mve/2a2XvUEDy4UAjqCWT1C2vrX9ruK5MbrS+fcO
	 OG2YO0+Hp88WsudByL/7FiaRhJFQ4QWgoelYhGKwyymNlIXRLWKLTKL4sa/P84VPphBM9
	 xD0V/5yzaB5J1EfALh8BWaLS/LmjhSlqzTm55+cPBGZsjinKpjucXw6BBysXj5od4KX/J
	 55kAyp1IdNWeuIEorIEnylNXr6MS2gP2N0T3QUOvbV7CvU1AQX8ZAUqcyXT4nPhS/C145
	 IKWCXJSVCeWjphLbFp/WLV2oopAfzDsbSXghOX1fWL/lQi/fmf7m+ld9piKUk/yBB5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758750;
	bh=2nyGPb9Haf7gRUhRHbV8ScK5b8mARPO/6Pcm1VHcPUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIHtbVqrfaE2Drap+J3jss7yPUihcMlJSb+Qmxzntxz81DVY88kouNuiBYZGyRytS
	 wa2ZYvJAbLfrUWWOe3ibLbUkDdPti9quetSqjcYR9wYoppSPYoKa/6XPhLu3AWThxk
	 yO+YmiRfbxWWrB2O8+7SgH9SRengvCs5Kq/zbm+MMZXyiXqoUEkLwIY3x+I3n1cdzC
	 YuhMP/FF25MYEdcZN0y2j2AebKeKgGKTkUWADQPZzyuoCjggAATXP8dpUUQVoQUeFk
	 IJvuOnhzalOJDdsBy+4Xw03RRzMGWrTrYyC5OhsulhSu11EHOQmtYa+Dmf1n0SVS0B
	 HA0lDVvUPz7yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8945481683;
	Fri, 23 Oct 2026 12:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B08749D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A06401D2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5Mg4D9iU-XZ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C80B4401CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=Ozfo8SrAejRG2Yv685j2tYDSWoScVmo/lhUlcc0xDzeNCX2K+UGtbu/66MQeMbk24c6L
 n2bl+6T7r7gz5UJ3+qQBvSNtaMbJ1rVF/Kso6dTJo/EYLfH7fKGGYFPEAzw59fGuY3DNO
 FoFA6a+55QiD27kTQuOOkFip/EInSz7O3k7/c+x+gRoocgOTVmEm6eySkFKCDwIdvg+fD
 7iz/GlMNlY7+hz6LxNbfKka2MoTd5zCqGW7zi4E+zLAGQhOlrgtzuBQt9MEBEcB/httcD
 6i59HiCjajObppLZpsnUsTt7AZHNeDDyYfXImLWc6ZeKiqqRgNZFr/TorfMUBYuPwjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XeGu6QphawAfEUBe9QHN+iC0l5cTkfNhHqR702Np6Pc=;
 b=mxBEDP/t/F8NFm+TV03fNPbTb+/k7ZXg/Z3aoffgKIGzCL+Se34C6AwWp5E9PERsRswH
 zY0qy/9pnoAJngfr24oolhblgN3YzxOtlIKNfjMxXbnNidNC04pOYU1x818BEeY7B+2Ed
 j2A5ZOP/xFZZpLkAoeF6TOU6lEPPKtphBkU6mT0ARNTdA7JOUYljAj1VKYTxVlyrVxVOY
 +paoZRMYm0+SSdqFASYQ+6bwNSo15BA7bKHhCzRBuyfbARYhlSpKYX6UkeCbq0V2uxHXa
 A+qyZ7KHy97Ii1nM/414l4zj3dKBQ6nZ4ODrXMxP49E25WHysAVBjTpG18Nbqb8B3+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C80B4401CE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B28E9C669; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b16898fb478c215ecc82bd6d0967cbba2d2ac3f4
X-Git-Newrev: ed9513908f7ccda19a5db5112a3cf4a1ab4be544
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.5B28E9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libtpms: disable
 building manpages
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
Content-Type: multipart/mixed; boundary="===============2147483245742752812=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2147483245742752812==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed9513908f7ccda19a5db5112a3cf4a1ab4be544
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Libtpms builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448 ("package/libtpms: add host package")
Fixes: https://autobuild.buildroot.net/results/b393e0b945227093e4a076c06a8088d9a33bad4f/
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ac8b1e33da805eb9607359237df86c174b1c37d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...2-build-sys-Allow-disabling-manpage-build.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
new file mode 100644
index 0000000000..20849db49d
--- /dev/null
+++ b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
@@ -0,0 +1,61 @@
+From 6e688d2bd1e6e1545fdb25bcfeee28f78240cbfb Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Wed, 14 Oct 2026 17:31:09 +0200
+Subject: [PATCH] build-sys: Allow disabling manpage build
+
+In builds for embedded systems (e.g. Buildroot) manpages are not
+needed, and building them adds a dependency on pod2man. Allow passing
+"--disable-docs" to configure to disable building manpages.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/stefanberger/libtpms/pull/641
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 03ed7e65..9d0ea053 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -23,10 +23,13 @@
+ 
+ SUBDIRS   = \
+ 	include \
+-	man \
+ 	src \
+ 	tests
+ 
++if ENABLE_DOCS
++SUBDIRS += man
++endif # ENABLE_DOCS
++
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ EXTRA_DIST = \
+diff --git a/configure.ac b/configure.ac
+index b19db106..0fc928c8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -282,6 +282,11 @@ AC_ARG_ENABLE([test-coverage],
+   ]
+ )
+ 
++AC_ARG_ENABLE([docs],
++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
++    [enable_docs=yes])
++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
++
+ LT_INIT
+ AC_PROG_CC
+ AC_PROG_CXX
+@@ -392,5 +397,6 @@ echo "Use openssl crypto for  : $use_openssl_functions_for"
+ echo "Test coverage           : $enable_test_coverage"
+ echo "Static build            : $enable_static"
+ echo "Statically linked tests : $enable_static_tests"
++echo "Build documentation     : $enable_docs"
+ echo
+ echo
+-- 
+2.55.0
+

--===============2147483245742752812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2147483245742752812==--
