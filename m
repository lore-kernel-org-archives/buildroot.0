Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8255ACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FD7812D4;
	Fri, 16 Oct 2026 07:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6qn3Ds5WeuW; Fri, 16 Oct 2026 07:07:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 41E07812D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134422;
	b=Nlr6zqrj/wGpiyNHDY8+I0PKqXh+KSKN/78pLaurWe++YU0TyMsN5J8WvCNZT5FfYxcY
	 72SRGsLzx7th2QTYPkSbUa55QG8p7UvqP6gGBNtRAo43fGAZsQEiA/s/rcqfhczTmD/7+
	 op3v7TKpTg2dg89ITgcZiAXXZg9VT067uxIyx5XgbRqZSYqwevZgjD+zsFC7epiqvTAC2
	 TeDPBBI4qDxPw97taxghf6zKDKTIcLByVroXIZqTvFqvGlYJKvmwvr7CXYiwyeM8X5PJD
	 kKX1BZOEEKuKv0jgYV8y/bm8LLWN2HA4/APryUHbV2ZgyyxNe1/qN/q6Qn8YSXPc/ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lqnXDm8B02aLkQRVW2Gfv+ZjscIx+/tcteLgoiokYNI=;
	b=Ush3Xa/9KkbM8rXqbqBX2mxvMVPQcVju/q0ks4zhL98bO4HlCu4vVpImYpZOkJDgZog8
	 d967wFeuglwCpKtKNBGvSig0WZLn1SUpwQYigqpP0zlmFK00kWvONAd5DEQgD9hJQc+1h
	 txCOUElU35m2i5zxAa9unGCUtxPFmZ+bNQlnx4RqKlAmkLAl7VkUytNHaP4A8ViGuoNir
	 4mx9a1kF8hbhUlRb9XPPhP1Ao/RfbzVskd2p1FS5CxXJSXKGz7i0JNtyApICO5naOXBjy
	 f6jtYOaXsCOZCnCxp8Y+hF5IgSC3A83Z1338qQrgrTXEvI/TbSUyEjMV1Bk3A8akGwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134422;
	bh=lqnXDm8B02aLkQRVW2Gfv+ZjscIx+/tcteLgoiokYNI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sTbwV2pBkK/gItgVLbDq0UxeaxRpLfPfAgTWTknRqInTFQxiAk+7Vd5sHRRFP41Fw
	 wNoPGej8yD/Cj3kXcxgOFyueJixum+XBY4/yNxZby7iT89xXNBpTX1jITzO2svOJYT
	 UjISo0Wv4E0Il9MJ/JplMGaKtIm17og+d8I627jkXYG+lG0Czu6go3iGYyHj7aISmB
	 6l00c6r9aPo/KS1awvpOFFKXtfcmgYjhJR1G7BHdAzXFYjqe7BDBZ938ySKNUjieDV
	 OTzUO0FjU7s86Lb96lK90OX2H3EphIOh/2NNviEXb4IxrJNGIOKJt0uoNMvQ5kBf5N
	 20vHpxT2/ZQ8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E07812D6;
	Fri, 16 Oct 2026 07:07:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8FB362
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EEA160A9D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VT0V1d-EsiGJ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82B8D60AC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134418;
 b=kkCm7UW67Gm34fPtSak+I58+VVuV7DLWLSLpbBhRQacNdPBlAH5htbpbSjwhs3ANEpUc
 i8ZrCK56vy10XnkhHjJRNwaI1IjUbbm8JfxldoYHQA9aNasUm5c5mA+Ahl3nup9ZyDjA9
 4PJEpX8THkQYLX1LcOSeBGQk4fRyx61ZB3+54GxQHtf6h8bXsKG/GxILl35tngjDH7hwf
 Y8SLxjPmtBPs/IZyL+l+93r3Jsaw9+1AAdIeI6qePF8Nqmof6MFo9+AbJL7YO6z69TaTx
 yCVi2+KlVyIdIHCWPaSlV8+YnR3isktL62mQXgUfbi1tVRhjSDrVBmJ5b4KmMofmGeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134418;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zh2ytjVMgjLn7fKbuB6ZeRNbrJWg83dgQVMFzhj9iS0=;
 b=TeTe45IdW2TP+HRAZDoS6+fiohF34lQfQO29H7CyZcr0eFszQL+nPXPksOVvboUzy9ZS
 TOcnFZDE/rzRF5UcRe4tlhuj+GhsFpD+K8bKgMX/pCHIg2Vn4bgq2S0+CVzUxLWy9pyhc
 zo8JcxqsJzuhdQ/+kSnjX5aRJG443oliUPwZGWqzxwYX3fde0UdAIZQ3Mvziw/ZbKjqHE
 pO+T5bW7yO6EUdsWFJCYUfBrJyp1zhBtnkykrF45zSW8V+VLegtjeTsK6vhgUj4HJI6+M
 h1E5njttGEmJcrSIboX9zkV1uvuO/8ruHhduzjq745prjePKb3THbYwAepB+WWTRNiw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B8D60AC0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AE5F960BD; Fri, 16 Oct 2026 07:05:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 09:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc7f3bc1fd5d4c564539c4f7796eb60a8ffef8df
X-Git-Newrev: 6ac8b1e33da805eb9607359237df86c174b1c37d
X-Patchwork-Hint: ignore
Message-Id: <20261016070537.6AE5F960BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtpms: disable building manpages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ac8b1e33da805eb9607359237df86c174b1c37d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Libtpms builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448 ("package/libtpms: add host package")
Fixes: https://autobuild.buildroot.net/results/b393e0b945227093e4a076c06a8088d9a33bad4f/
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
