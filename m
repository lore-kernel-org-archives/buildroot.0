Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF55606A328
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 19:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WTmSoz7C
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D8A960773;
	Tue, 20 Oct 2026 19:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC2lAIwEx7Qu; Tue, 20 Oct 2026 19:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 08A0560719
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792524841;
	b=cWac2v7bYdkTkPuxhEkpE9le+pfwOk86SN3a3DO/BX6ItOud/EIGTBiAff39fIKJUb58
	 oFfFHKi6z98pdS1i2tMSQqY2Eb2jip2TLkesXX1N0LcpEMmarhFGNGJR1DyN87Xz4rwY7
	 jCM5kRQu57POpWkhbHPNDO6JEcv+YWOl4bUI/vjT2bJfy7WPE9Wp9+x4CHjX7PLHVAzV6
	 K70lt6LwlSM14RjKgsERwkzwy+kvJx8J0Nsan7aetnaIB7nI9uMOYFke/fD5Q44qMcLsh
	 8Qs99mmy8sTnwCnRizXUSbMuTaSReYuhAwSdCXw+h61llmKhqrjkdkEryZEO0GaCsOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792524841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c3L51FHDZJj/aPGMs1ElDrWJr08nXWQ4eQecKX5qmQ8=;
	b=MLb4dPFxnxtBo+GJGiDPbInM2erGmQjH1fuZctwdtm7BlozQW8Syh8rqQ46+Xn2HxFfG
	 kZBGlLScsuCSdr2C35C8eYR1aGMgws/G9L+32B23R/B7jLknoRSVKt8lXSi3u8jdN+I+c
	 BLPmgBf/li7P6oKXTIIxPRJzyHxD21NUi+WvjOgvErar0LOeA1eCQkCGwD8HLEtX2y8E8
	 qrtgMFQbtYwhJPaIob4K0+fRdqURzTSwmmDEnydHvKgjd7hhtTs1p4NIoH//CaS7+qvBV
	 JnR+/SHNRnWHE4zGQRY6FIrgd+4PkmI+2fJDAziTt0ZcvigEdggcLNQ3RkIUVeutqtw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792524841;
	bh=c3L51FHDZJj/aPGMs1ElDrWJr08nXWQ4eQecKX5qmQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WTmSoz7C6J/s6xsqalvD9quKRqJzJle6/TFq1L98onJ00tWVlYoSltztMxBM0dl7X
	 j9C9Lvll5Fxm1EZ3N5yQWfnxOcujcS6Mau1reDVoD7G1kpzzRSdMotcJqXjbREItl5
	 GT+uVF/OfoUMd/3FqrPOc13N/q1EmM04FREkziPfEgJj+c8nyRPOqjVVqbvOyEP52d
	 9y3P9Q+5/bEE0GNvGnAXgPv/7Co8PTI5y6LDJJeRNs35G4HPY7bCtJBsRevY45itqf
	 oV7bFZbCyqwMIb6Fiia5zYYM3EAx+25Dm6DIo2k/DL5t+cbLwUmmdAhJpobbgTOgzn
	 QLSo2msYPU83Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A0560719;
	Tue, 20 Oct 2026 19:34:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDBE255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 624AF40596
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbcjgHPDyUX0 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 19:33:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A1B984054A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792524838;
 b=CNzyD39fZ+ABxwpDyHVgv/9rb704yh+mIee+giNvlKRpL2PEWg4CX9nbj7Z5JRdG+/FJ
 o9rjLotmIXE8/WxIZr2QG7W+zg7U/zpDFfqXvYlvdpQDqTb+7M59Uui9FqoXhENvsw7Ix
 jYLNPgwMfLZD/5wUnji2CsENhsHD46z58dx6V2cFkR2s+C2CYU/cAG+6SknmJzo1sY1xv
 zQzsgoAExz00FrlyvLslqPIYzNeRAUqmlVcakNOlMkgG1Xna8piGK3hiPsWvxXSInly58
 R3PAGaKIgdwX1atD/UeCsQkcwy85TWA+vxuKxV3eUk/sbIhmXI2xCmszl5GeTWaPHxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792524838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4X78SbN8Iz9saZ35whHTmxP6rFSNgRnVuvQLcHanYjg=;
 b=psYxDwKOB9MaH+aMa8KfDN6X/hM/K8M+Dw7RIrt6KKvYPk/oIdFMb7OOkQ0Hwt0uoSus
 DCdU66+WpXPWRdp2gPQlaQ7Z4hdaVV2fUWqnUCWKFj8Q+fYyvD5h1mAwdx70HfcgtmhMv
 PE6a4XE3uHopMbg4po7uMJr6z3svozRTlKmNTM0tpfDnAp/j/rkLF6M3CdMMZojhfo+g0
 NSZ1ebig5l2LtBZNHI0a8VcQMOICkJBC850zqvy5A5G5rDJTJJASaJ6DVLWGVGAz2w+Kq
 HQfTCn1+8z5oIi7lTXiZVlqQfzA1sWdhLkoJ70IOlOR+ysiyN8ahrveSHlLwqI3pR6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B984054A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 715D89997E; Tue, 20 Oct 2026 19:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 21:33:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69cb418bc80276d602ae9e4fe5a30b10ee0a957d
X-Git-Newrev: 90aa723ddfdf8407481d3c02704b077ea6d79ed4
X-Patchwork-Hint: ignore
Message-Id: <20261020193235.715D89997E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nim: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90aa723ddfdf8407481d3c02704b077ea6d79ed4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Nim is a statically typed compiled systems programming language. It
combines successful concepts from mature languages like Python, Ada and
Modula. See https://nim-lang.org/ for more information.

This is a host-only package required for the new chawan package.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           |  1 +
 package/nim/nim.hash |  3 +++
 package/nim/nim.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f52ba2267..9bba0d9698 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3511,6 +3511,7 @@ F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
+F:	package/nim/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
diff --git a/package/nim/nim.hash b/package/nim/nim.hash
new file mode 100644
index 0000000000..c455ab91a9
--- /dev/null
+++ b/package/nim/nim.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2639a06a5ea7a7fcf57df1e7e1ef4d1b2bee58c7ac9bd00dbd2aa5bea1e5a56a  nim-2.2.12.tar.xz
+sha256  1ef33f7376a2e4b4c090fcaa42d8a206c19bc70d8d816665ff983bc14c5fe159  copying.txt
diff --git a/package/nim/nim.mk b/package/nim/nim.mk
new file mode 100644
index 0000000000..946c8e1af5
--- /dev/null
+++ b/package/nim/nim.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nim
+#
+################################################################################
+
+NIM_VERSION = 2.2.12
+NIM_SITE = https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/
+NIM_SOURCE = nim-$(NIM_VERSION).tar.xz
+NIM_LICENSE = MIT
+NIM_LICENSE_FILES = copying.txt
+
+define HOST_NIM_BUILD_CMDS
+	$(HOST_MAKE_ENV) cd $(@D) && ./build.sh
+endef
+
+define HOST_NIM_INSTALL_CMDS
+	$(INSTALL) -D -m0755 $(@D)/bin/nim $(HOST_DIR)/bin/nim
+	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
