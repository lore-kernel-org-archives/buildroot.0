Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639A606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pk6XBHV6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DC060A4C;
	Fri,  6 Nov 2026 21:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Id2VVd2apGb7; Fri,  6 Nov 2026 21:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0108960A82
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999696;
	b=ngk2iEjttYNIRe0c30ZxC/YWtHbAxOwQz89rSzNf3CvqMwzPArd56qxGs0p5oR6JPVAY
	 Ct7M6WhCpktToXSA8yYazaRXp3nBknJi+1Tz5nN2klUjC5UgUY9w4zNdA4D/UAfTCYtmK
	 nOJ284EJUPaOy2Uf9gY83+ITo2TT+RiukkI0e/YNF79Qe4rXig/L7ih+vOzetiR5yxdgX
	 LtPEObzCuJWnjBMApzuc2zsCU5VMbjqyCnyEmLcd4tpW+l6FO6rw4AiNqOSqsoGT7mj8t
	 uzpQog43HHr7Fqo7QqBELoX2xdud8lERxd+0ApX+rCEeN7C1uPu2Ge/0rbotU2vxvJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999696;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2BqAVSGtqNcuk9A4adi5W/GagwPzTQOBQRPP1sfJL0c=;
	b=JXwpMqDCHcax7fDcdyHkDm8s05m9LEm6sNTZwz2AGg/Mo7v2n4zdVPjSokWf00KKeDtK
	 i+RBv3+USeBiR6cpYO3Zpr9axXYMzRq/2W2iSCjYKDmjeXBA7Zeo15QeBtp9JjMrkMPsq
	 1cqOaAoi/xw/5NjJtaEkDFhaKThx9FN/LTP8N4X9H5B8m6alsisJCJX9QnRjCJSIMIS+g
	 BPds5qgvu2vLLvuhHXtOYTzE4J412KRVyCq2Nr2KlxBe1dTaStfG5SfgAE6pP53zM89ON
	 xRbg4fezdBjBCVmjQjKh2JD/iYCYJLEpSW7h9LnBCKC+0GQw64Xi2Zq4U+Jm6f/+V6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999696;
	bh=2BqAVSGtqNcuk9A4adi5W/GagwPzTQOBQRPP1sfJL0c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pk6XBHV6MOHIbvkcJXnT7e4naYOubCr9XHs5OiF1e90I8Qt4GPEnItVji6C7Pk9T+
	 ekuk2zPoFnLPqn3X8q6F/e9ZZMVCM2B5XW52PdqFryWTvGT1p1S/rKJWbPmAQCRtih
	 fKoSgupa2OQvPaAky0WjXl2JV4BkNcs+jEQFtCTXzB2Y0KrxU/ip/VifTySwz1q3Ab
	 HjWlpWsagn5javFbR4ajeHYEHgIjdKkl93ZyGcNvY2ictJJ9xvwqeHKlLcJ8weX94b
	 sj6TGr/wVl4MOv4x8Muaofhyw9oybrC0Q19F/JtpLjLyHp4CMiVrXP0SBmUAC7/TOS
	 ogbZI4XoOW7DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0108960A82;
	Fri,  6 Nov 2026 21:14:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6B4AFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1EE140907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7xe4q0Ig3mK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0D312409A8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D312409A8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 297559E0FA; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b7faa5ff6048e5b2a916073c8f2b465bd1922ab
X-Git-Newrev: bd1beeb4b6733e26ec89ff36b59e016fb2ab9d77
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.297559E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycryptodomex: bump to
 version 3.24.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd1beeb4b6733e26ec89ff36b59e016fb2ab9d77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 3d3c72172c..58ad8f310d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  1ae989574479d8b5f5440a68a4159148  pycryptodomex-3.24.1.tar.gz
-sha256  09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356  pycryptodomex-3.24.1.tar.gz
+md5  6d4ff7c5db59af922b6f5e3cf3dd21aa  pycryptodomex-3.24.2.tar.gz
+sha256  e4dbc29e2575365d15e272f769329106277649aea081e2119cf43d66950f8f8f  pycryptodomex-3.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index a9ec4b25e3..a12f976c50 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.24.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.2
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f4/e7/50e72301e32acb73a314e663c2014e1ddefc019d5f434ff14ec89861d664
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f3/c2/f5855412372e47d635599a97c00cfcf9fc40accac9436a11bf9ded19f859
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
