Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2765606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l35NV1MH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB98813C5;
	Fri, 23 Oct 2026 12:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORpDxL5x6p5A; Fri, 23 Oct 2026 12:32:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BB0C81655
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758752;
	b=qIQEiZJ1sike60T9j1GBHNmGW1GT42fcKbQNxkF2w64Ea96XBmqpeezj7MkaQLAlra8L
	 AEmQQYQPEISTq52v7zaRVAb3yyFYgHos26ganD9iwGUhfW3BGsOaCYcIHcA7StJXPG5q0
	 lMKPaoi7hmxOaEdw1gGPNAfayPfS5OmYpqgFFfGiH6ZT+N3IKWfZhBuZhtako3I9aIDCL
	 iz89B43KuPhZxfhAlcNJI26iAdDjhkWdJKGcz2ZU0UZi+IPgaWJemsYIx1zAobGIO0wlz
	 gQQfjTaM3+gXl0U25AZ1bVRkmmXULBRS9U54k8lPBhsHZQ6xxwsoqrY9icA7tu/ml9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=S3mFr/IUGw5ckbCE+AU+F/FlpBkHsz6sqWk2D1oogWg=;
	b=Yj2uEXW+droubF3eCUVlz/FNQBoobvaCM01HXUNPPCJv3LJnbDB35NXNPCjBbh+o1hRD
	 FM1uLF1EPiMBV9D+YbYpsJZ36q+vxtFVXm2pO1lwhYlihp6JBNo/MWPzpZ8UZpuVK/tZ+
	 2HnHzmxUpj/zFjUNGLfVm1Wa2bb14nMBZ8rSB3yj4v7flMP1r+AjhD6U3gyXk78DPgJ+y
	 MBQtd3LMJ+ySuJBoZ8Ip+E4VbtXc/zE0TAn24ED3XY3iWrgjp0t/CHV0M1Vevie39F2pN
	 Q5f41mLvWkDkGnoiAStr/uvp/RS5bwpGekiQsVYX60mlGQx0530xUTyRlzkesw9iC/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758752;
	bh=S3mFr/IUGw5ckbCE+AU+F/FlpBkHsz6sqWk2D1oogWg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l35NV1MHBJyMTwsfi3F0A9S0rSHNNURaRRglRnszANWW3M67Be3UXT7/LL9jXw/zT
	 blapig0n2WxE0yVKXHg2qL6jmgexJor33AKPxyz1S32a05kBbcc0b4On2PD4XFh0lS
	 G6LD1blnDsDRk25PfaEN8AWUer8/cyYvq/Kg8zif0fzzT/YCB88rB0lXEsj7fQ29zH
	 e4F0hNMDoZFl2Lto+8o1i1naft20xL2EhIS7V5Jt5o+6/sGLByis/V07+mjs3CGHcb
	 nJ7z9g5zNGNWs7y/y7rF14JzNSAt2VUAPeK9C31Bl6gl2tuQL9pNHevSWPNym+PhSZ
	 L6UdOhjKfL1mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB0C81655;
	Fri, 23 Oct 2026 12:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B503749D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B354401CE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JzPOEpncI8U for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DE546400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=R1cg+/Mmx1wCsXXTlUWhW0rYTRfZvzAgOM5xIkKYUM6KilLsak0F/yDgYFgYPz65hmFd
 ducHnZ/gvuX470baBpT6wi6iyKEanQgYubfxsowcwHQmfL3cAqEzrJw5X8tFginn7K8x2
 zPiexfulJPBwQ0sFAcr0KoK8vztBXHJwr81gE4kOxH3Avwrnlauz58MIicb6rY5YJQKm1
 b/fi4PG54m1g0mE3AH0Qf/Wtc11niy1FNOJSAQ0E6PnYPr77e2YgoyBvRW5ImnPptXT8n
 XKCdKBg60UZBuN5IYZkjeEFtxG9LtP0r8Q5ktvj3ro2KLmkOU4VROEoITLuxmwpPsbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WF1pjxMNAjPFy2Rug5Hs9T+uuvAL3qVzVtNMq/7e9ww=;
 b=KIKva9RYdgLCzVBVXKzfvHwUooFQMIWJFUh4Gyp45l5Ttf00ZQJE69SGh3dXmq8DNgQq
 +hLU2imxd3gJ3vsI6eP1MDf9ZKrxBH2sdiooUf6sN9CtR56aw94dTRgKzI+tG1niMjBWu
 +tZQYHmZ9/6hiG20CobXe4x3Zh07imn5KqCt1lJs9zp6Ao8Eox+7Ntno8luKgp2LRGyW/
 BRB+4F9gdPEDIQ1FMirBCuKPYt72f5jlhPMvPp3tjoE7jcvlBJ994qYmLjTqrl3GgcIFH
 +MLtKNgHzDVjTV8cxtn2vgFzIqVF7YY81HYcd81oLY2uUH3wju5+3ZV6TjxLcXTNPfg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE546400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E28C9C66B; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ed9513908f7ccda19a5db5112a3cf4a1ab4be544
X-Git-Newrev: 479e9eae324a163042aea2c93a6aada8aef62540
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.6E28C9C66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/swtpm: disable
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
Content-Type: multipart/mixed; boundary="===============0742959307519895039=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0742959307519895039==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/479e9eae324a163042aea2c93a6aada8aef62540
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Swtpm builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 ("package/swtpm: add host package")
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b2ac4d9356c3772c2be6c0b91e98390d3a4e3d7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...1-build-sys-Allow-disabling-manpage-build.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
new file mode 100644
index 0000000000..c134b75c23
--- /dev/null
+++ b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
@@ -0,0 +1,63 @@
+From 43eff71dc1673c252352c584e129e5bce312d173 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Wed, 14 Oct 2026 17:46:51 +0200
+Subject: [PATCH] build-sys: Allow disabling manpage build
+
+In builds for embedded systems (e.g. Buildroot) manpages are not
+needed, and building them adds a dependency on pod2man. Allow passing
+"--disable-docs" to configure to disable building manpages.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/stefanberger/swtpm/pull/1186
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5dfaa6b..f7d15fe 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,11 +6,14 @@
+ 
+ SUBDIRS   = \
+ 	include \
+-	man \
+ 	samples \
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
+index 188b1a2..7156a21 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -509,6 +509,11 @@ if test "x$enable_sanitizers" = "xyes"; then
+ 	CFLAGS="$save_CFLAGS"
+ fi
+ 
++AC_ARG_ENABLE([docs],
++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
++    [enable_docs=yes])
++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
++
+ AC_ARG_WITH([tss-user],
+             AS_HELP_STRING([--with-tss-user=TSS_USER],[The tss user to use]),
+             [TSS_USER="$withval"],
+@@ -662,6 +667,7 @@ printf "TPM 2 profile support : yes\n"
+ echo
+ echo "Version to build  : $PACKAGE_VERSION"
+ echo "Crypto library    : $cryptolib"
++echo "Documentation     : $enable_docs"
+ echo
+ echo "        MY_CFLAGS = $MY_CFLAGS"
+ echo " HARDENING_CFLAGS = $HARDENING_CFLAGS"
+-- 
+2.55.0
+

--===============0742959307519895039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0742959307519895039==--
