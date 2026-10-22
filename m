Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77D606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m8vGgtAO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98CC181518;
	Fri, 23 Oct 2026 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo8Frl7cJcaA; Fri, 23 Oct 2026 12:24:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F2098154B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758288;
	b=jBglm3U2KC3fXgYG0vFi1do2AbYIe+Ydz75GmvFDqQ/KR0PqFyYU7A11ubu7AR+LUbZJ
	 Bc91sczS5poRFGdihpYZVEfgDC2WGIJvI8W5r5wgGY/iIii+UBbrJkzP+++W5GdH5yu5g
	 FlUlvGDoUYXj/JMp2CVREXm+8K10qzVMEe2EK8O0CKv3c0Do/74siUZmtxx+zdSO2kC5y
	 guGIDqNPmEr259feDGrjx8uvf13DTWqO95JFabUPuHktY1aHDdysudSsoG+x2wXo/iw+g
	 NXWm3KNFSqzBeLprdFmhpKjNbnnrk+PNEcy38qrVc/+wWZkkIIw2t4qrQ8+GamjXf6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oTaKJhHZp1GeRsfLqcOF/vXr6YEdmb+6h4VPr8Brplc=;
	b=AOLhVcUVJossCcHCB0WlF8aD/MkjGsDqlrNL2DSMaLmik/F8mu7wut5N+gvdZw1qWqAW
	 fgmTrUEEgLAlst/2ZH96fvcJYg/Wi6+dfiywL909g5zpDDqMrctdinvvZRSNHgBfRYL7c
	 ECuxu1GYfvsQntK9eWY+3QqnsJgQbsvT+EeZqgB9p88HDKPnMfG1sbcZLXKBso6J851Ho
	 LDepeUsNZ6N9svcInoukgTkFRxbBjODOGSLDZBN/Xw1BMFGJ7hK18lk+Iba4Bv+r7TX//
	 7rskJDKwFcdBm+miYqra4hIr10lTjIM6zYtp3znidCRH4T5fIRa/Kim/EVFMtCqG+6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758288;
	bh=oTaKJhHZp1GeRsfLqcOF/vXr6YEdmb+6h4VPr8Brplc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m8vGgtAO4fXjea1soDh/yMqT0SOlhjrNbPY2zB59S2y4neLl7p2OKgcsbF8l/22py
	 Up2cZX6wJJ7oNkuff1NvvfpIWf+9S82oNUK4eUzlc3yn85aFDQF/jePKH49Nu05QE9
	 IywbYILMAktOaJo6e4DnATp46DPipA8waQfRfsOp+4VNNNVK4Dt2CxPrOk9+fHXbIF
	 YAgnfkCrHVe/+OyATtDtOspM4RnUotmqIL9nlnNoNLG8NqcKmX5+rC8oFAZnfSnqfk
	 k2PIwQnhiqW0OjDlA0maz2Hk6T27bESCtsql3bwtIbWmMqFsU4hEu1DwIT27OgHROK
	 6ClSxMAaCV/mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2098154B;
	Fri, 23 Oct 2026 12:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77ADEB02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B19856063E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kv5l10L-9DDu for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0535260618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758270;
 b=Vx13oUJO6sWsOYHvmLE/7aoekzylDs9VkJ+wGANl4YEXVme+u+v/DlnJ/kH8tC9CxSuI
 z77yla5S/mqtWBl78bBCWLd5cRFIqjnVSd0CsGu/3hobpjUf7Lze5xwOAeZw4qGvHVVvJ
 jjBz+ISfjqGPjmkxrZ1PGKgB5WfEnwMG482rJ+vDik/ThZLQJooAgybRwGURikX1hash7
 dW373MrqaLN93KFAjD2gRo1G0tiC42GS8aHOA0jsiZOS0zNjo4X+jLosbaeuyZTGZ/+V1
 Kkw2xemBEelLsZBEWZvyIGEGQnWbKBsVWaHk4b59s8PwV5vI3Ei5b1iU+9t7fxL801w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758270;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tukF/N2myr6YXe70WgEH8dXXPY44hhC9dH9QeShkhJQ=;
 b=MmCHTV02f8mpTQkvpkbpXzCKUTTJBveEER3J5nVGmK2FvU+ZygyNhWbhJuEHq+qO1/+x
 PvM7KjGWPv6hiBsOLDit53F8xjxFUqMtRr0YnowtcPJempyipBLQt3j2yf1heDgcRMj7r
 j8Gn1UkQahpT+h4jKgtjEH6PgyVZ/p73RihKjunsj3Tr5+3cwntGaGj2S9xnrSgsvFk3J
 pojT8eCvIE745UyRz0JJw35dVo1K1dOJZXE5Q1x5jiyvm+zQNwu1yLY3hin5P0RORIHmh
 bDFj15VR5nCwQfMXGCIEr0590+Bd0iczncF+xUs5mA2ERQe/TWipQhozDJPl94GS1+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0535260618
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 808E99C66A; Fri, 23 Oct 2026 12:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4040c0e4df16bde8e4e3191cf54f432139b01ef8
X-Git-Newrev: b8471364de8a7708e37ff702a558378419345914
X-Patchwork-Hint: ignore
Message-Id: <20261023122305.808E99C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swtpm: disable
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
Content-Type: multipart/mixed; boundary="===============2962929194066860166=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2962929194066860166==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8471364de8a7708e37ff702a558378419345914
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============2962929194066860166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2962929194066860166==--
