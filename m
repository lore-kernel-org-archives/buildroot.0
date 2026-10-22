Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00339606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i9w1nYrX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D5A814C8;
	Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIYiM7TGB7wa; Fri, 23 Oct 2026 12:24:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF691814B8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758279;
	b=tHnHe0l2Dm91CGwAcC6l0Oq93q/YVUJZN3HJ7tjz2mSEnH1cZYkzcVTfFShspFW1aJsD
	 tm7Y3zM+8b216ilEDSoYF8Ap1CbUlUNNrEDdTPUkTM60qlSRZMCOSQJdoZ1xYBueBD+Tt
	 SLkhh+KviZMdJyPPSweYM+VSB6nty4A8VB+1hWjlQdfuZFmaMo64qRt3Yrx4zHiX/T2et
	 O4mjXNYprLlM1yUfqnsgfXqJ/AejFO5z40WlS23DiRtHym/lwgM8H1ClRUXdSpdAErkFH
	 4UWyxFoYloIit5kOri7RxfY6XLuJ+Q9bVxi/0ZtJl5gsPr+8wxka0rGjVT76OAWlRZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8TTLJME235n3g10JQ1oigRqNTxD6SFCmmJYjDTSJaMY=;
	b=sBsEbDanjCOkkQOpPZXd+kMvBpPlSIRTjPWCwo/xaqdRlmUBRErvr8zPpbb9gIwFaGw5
	 29KcBkJ8OythIk2DyGBintGoQwoBGeFJRUr5tOyfavqofMfAVHzLHhh++J9MmjzmoBTL3
	 76iuI//Gd8vakxOsmCZI47WZ0zmuEQOXS9FcAis7zavxuI/C9/InagqX/rsJU47jzYHW8
	 X0NVoFP65S+i9HWL3VVpFzTYTWfY3JJvV7iqZHrapYKXfQVYPRm4jb4ZTYdAL2wTTvZiH
	 uradO0YPJPaKKOTlXZ0iqHQTWp4p9gb+4VVvKmJ/LrkOvx6NKQRxLg4djFHBgFfz+Hg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758279;
	bh=8TTLJME235n3g10JQ1oigRqNTxD6SFCmmJYjDTSJaMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i9w1nYrXOyYGnYMDLdN9NQn3do/c+UYBB3fLzx8IL0VJDAjm1qyf0fAjxihfIabq2
	 rbUuMNoxeG4+JZvzvR3hGKgXUFWki03I731t33kieSHPrvnbLufM/TAk4rb7tXz4hg
	 /3qIpA7pQ3KBMj8fL1CttVxpgyHBVqIBbFY3yOyZDh7CkRZd/9kNBth89e2t5/HkIv
	 XCQw6G5vJA5Ik3rIBFcoZ7AGbcdRy8mmrNXbUyHnHPg/YTiwaYYpic+b6+JpwE40I8
	 OsDHNM2/LeNzWX7jNje62EaB+rYnLxqdnfafoEEj7+LNyG730PEc/MXT3zms98TGJY
	 /jGK8tXF2E4cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF691814B8;
	Fri, 23 Oct 2026 12:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5E7B02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B9940782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ltVPEIzRTkB for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA8464072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758270;
 b=rYwSD0kw05hoWg6czwx5Qt4i+CUvN412bc72UXeuwedoWCNEL656lAYl93kkQsNfW875
 2jSunEFGVWbph1c28eDwsqU0SdHDZZKX//MwW1eO8o7QTeAwSwTA9vXwLzHznkpeZQx5j
 2QYCcfozulUpIq0BxDNZm5uoVEXRyNbWdaFp+qv/iBfDDHPcuQqkJu3LWaAhtJk4p+7C3
 xNhBU1viUn8C3a4VNAqXtFkFmiMzUQBxZJnn/vwsEypt8dIGoq/O7IhZVqPRAdEFVXLLA
 7ctYiyiKVQAkxfAEzHhEve34maotkFNDyC8/NzdS6wAGuBAA2ECjThqEGnWb7vSdmqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758270;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FLALaOen/icx1H1ijmxoPcoJVOskRTX+8eIeia+6t28=;
 b=nducB+GdLbH2LpLyyiBdAN0faN+kJpj64OmUSOmSUmsy3qI+qnfVHVXYj4CV0bLR+GKD
 KleqzEa/nplO1J/Z0PxCQlMLrTuOQlyNfUNs1i9cT5vpNLulpcwgscQoo55y5TcWppNoU
 CvSswoLBJlwK5FU9rMTLqMXgEyjfSsIrFPEw1QNTstzo8cDWATmg8YxcqyiCW2oycVY0o
 yYtKa0GdKTWIUW7A7YpQahta02OIlSu6M6IVGQ+XGuHN4dTWHNQXN6+1wRIh4OzZV4uSw
 OKD6vwbomRBGeN7pDSedWztBNv3yqZKC4cN6oNZWJtHew1HkG6TZLf6SX53LGcHMh1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA8464072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7220A9C669; Fri, 23 Oct 2026 12:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8bd1da88250301b3be3f399da70bfaa163f1a54a
X-Git-Newrev: 4040c0e4df16bde8e4e3191cf54f432139b01ef8
X-Patchwork-Hint: ignore
Message-Id: <20261023122305.7220A9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtpms: disable
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
Content-Type: multipart/mixed; boundary="===============1341252182073078553=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1341252182073078553==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4040c0e4df16bde8e4e3191cf54f432139b01ef8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============1341252182073078553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1341252182073078553==--
