Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E454C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB3680E1D;
	Wed, 14 Oct 2026 16:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJepNejlZk7k; Wed, 14 Oct 2026 16:46:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 267F980E15
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791996415;
	b=A45AXjPZo+jy/qrNnPDIcS7sPZM/cRvTuPvQk9OrtDc6VzgmdEcLc89qKNVfC7DCuQlF
	 sXSAxAwbeXd3ouIDk8l80G+d+AP/S+T1uBrh6aWGKNgm4xwPZuJ+7BuwMmriKm3Xv23yQ
	 Y93yLsqVn4wo3c2SMItrW/6qDxdRkd4O/0TYVzUNM34eFKxNLKP9Y8xXyG15myaOBRpvm
	 cHOyMF2PH0qdgzh07nxLcRQnkw+vqbAI65BbRjnYH8EujT3cXXHkhxWdvTcwGdiqbdmQF
	 39mh9cEa7ErY6m8Pkvq58u1ipVyiDkAYt2PAohxHQj0WzACqnXaDecBNIQgRMC2T+JA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791996415;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JFTwz4IajvJkydi2dzarR+nOzil19iqdljDywWKZJzQ=;
	b=iAAaQPf/F09WOtLvyAzbSBTJcEd8MLVkkC9MYzxYkH/e3Tx4mMdwRhdEBrRbKDFfLWhA
	 0JEDkTda8/R8eyH9Or3Nl2CCDc7ey0ycj+EPJOW/in37K/06jWvpvtYKcxxgi0faEpQGQ
	 sYk/irD4gpLA6sL0xhm2Q80T0tLaq+SHZN65r7sSJLkHyVLzW/+nS0u6aU41Q3W5tSkW0
	 sWSihgZkMck8dPZxftXH+Ma0oOt9dVYYxhSJDV64HxV3b5xXeyxCM7j5Thzkbdo/k4qIv
	 rveO69JpaY283G4KpV8wtCu5g3FYDzePWw+l4GNXkrXCTwbO5eUcwLLkeSe40ixJOBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791996415;
	bh=JFTwz4IajvJkydi2dzarR+nOzil19iqdljDywWKZJzQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jSRbJhi2bBKMgdOwbKXH5sz8717ixB2rtZvQZOpdezVtWPJzqjI6cq/7IjFhYF3v1
	 kH2E23m2O+tddY0npB11y/YHnReocLjrtuJST8+FX97yRgtPN0hJ14ytL5wwGAKhte
	 vZyWKHFoDzyBBDCIdf9/QgMdHWL7ZpYoZ4bQ0V6FHnufvCWGya8D4yZXPcUI8evJd6
	 ZOXxAfavc15RUUogPMw7zBwnBDrruAvEh6BYZDPfZo//RUeeZ7Jd7HEYxqhWgWSnu0
	 dFE289C7bHRL9LY61gHwNDWK9MFM2WP4u3oAlEn2q6UgW65/U0Nn19VH6nLCtP9t3f
	 Q29pLAON30k1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267F980E15;
	Wed, 14 Oct 2026 16:46:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 923A6A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7880B40483
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-L0ZDfQtoST for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:46:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21C714046D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791996411;
 b=ZMqpptYsNVwQX4gr0r/+VRrzZNNuxWby1ESwTgFk4u/KYN2W2vyag2Ryl3BB7NUpSwBV
 8mG98FvvoF7njnv/6l278Cf7uvcHR34d+nSHWUB72lfVij6qn5LUXLJnhDecj69GDSTuQ
 uuEGhI8UrqmEf97skuRD3ppXyLZrozkqwz2nk10I5KgQM7nnYNkbTo0rQqdAGvAc+wLmg
 mVkJjlFWemknxtNY52EcypeviEOF+1cK5apz/rIMBy6S9RsqHaBg17ODI0nUlD3zk4Wye
 E1C79MsDyhfqiCES4eXvTZySAGDoeJU42hytsfrERI6iusLSHtMTE0T1uHmWU5QiPoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791996411;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=z1HvfyQJl2miWOJ/AzGT2ZZTFRHQvDLwmnQM+OUJybU=;
 b=UElrIu3ItEBrGlQNKHH+Wc/0IJDyYdq5gnrveLAiP2mKjsbnfnOp+JtpvkFYssgy+Z+l
 lijRYW86NM9zBV0V1y/eXv39Wn9O0+YATVunkUiN1ZN8fefMC3lKDrIJIxB+RNG7EMOnf
 /NV/gPRkLugrhpIES6+UqRzZsdKzni8EDp3R3HqFac1OGV+gTcWjuBkkCxNx65/u+SIU1
 1d9TarSGgIePmEXTcFFqIFnXY61X1L7GSq6Px/R4ucRO1kHfMoHPu6A5sAUpaoBsifzx/
 9CtMjPMQZc79lqlMt7Ldbndhfk0SKBsAe5elJiI3DkqLP56GSAhw3s6P2MaAcfkm3JA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=m1c5L0Kb; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C714046D
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1wpulm1lSc-00h9hV; Wed, 14
 Oct 2026 18:46:48 +0200
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 14 Oct 2026 18:46:25 +0200
Message-ID: <20261014164625.1474866-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014164625.1474866-1-fiona.klute@gmx.de>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UXGF37WeiZQbZkMVMJanCsTVKvPU/VUQOwlwgaHso/OxnDWcJzg
 jkofEr9GX9NR7s4B4vNGQGMOvmxX4UX3KHe4cAx31WXbs28AwgMQKMmqRtGqH8Q+rw8MdZX
 CsMf4OMtb95r0COO2KkPyqZLV0z/lmSBgQQ8PIye7MdEzb6ILYTYFCZZPTYdDd7zaJFF6Pr
 q/Qcvtt3Lu+C4Tykpa3qw==
UI-OutboundReport: notjunk:1;M01:P0:3sNWgrs2qxU=;/OkoLm4mxKIofQWGuutbdB6L9jA
 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
 =
Subject: [Buildroot] [PATCH 3/3] package/swtpm: disable building manpages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Swtpm builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 ...ld-sys-Allow-disabling-manpage-build.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
