Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3820DCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0022781586;
	Sat,  3 Oct 2026 13:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IDGC8N4BPeL; Sat,  3 Oct 2026 13:57:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 033B881553
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035850;
	b=QAFd5y7i8c9+JM60WjAcYiTbPY5J1s/pxKXDHqZPRo0O8dlc7xj7PeYhe2+/RXtnlquY
	 AJHin557huGbKsy6bYmYxv/6Q0KZkUy4tbcs2hbgucW6OKWnF/iCnnUieFE/zbkEH9Xyj
	 UxkBtTVWjONXmz+6zAe9r4QeKm+Gfpz4W5LDiPQEkFyirDRto3hN3D1kh0dENlFXU4fFK
	 B6C4x3Jw/vh8xdRqYWe0NTygYxyXxL5aNyePxwjiEWvFiD5rHTPoYzvP2g8fkeo/llYTG
	 jGhoS0v3ZQu3ej7RlwnkUrnka5oAZiABlMZCuUM350GPojJScdx0EiiLouZDUmvGVtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kARx6qq3tETEUz1BSgg+ldclYLXjokLhkF2fgyIVa7Q=;
	b=kMpyE9TqChm1ZGzU2tSK4cCG8M4EjKZGV+QUawBJj863oP8gylZcse0tGyfBEDXKOEVL
	 kfgiTYlhu25p6q4WjokKVbKab26EerPTwSU1vQljet3ygON7LVSsJboPcCbcsWlgoRnOR
	 yp4TDytfwuT68pP13CXuMWOUq2R7Mn8qbl7F4p41mx/ucFPllbGPXfQMMBl6P5RoynoFt
	 O14UJqF9AdfKvVQw6HboxpWpZXJ9TEWT+KTYReHqqv96sudAXlgxKGlalzRGsKXL+SIYS
	 Ut9qazju5qUgdvrbRRi0PpdBWAXgPWldoeCR+JU161L34l5CQPWEHbWxDNLET8c9TwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035850;
	bh=kARx6qq3tETEUz1BSgg+ldclYLXjokLhkF2fgyIVa7Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dsq80tcaueS9vwxyVLoT0rbWv75ZHHM40mV/w0g9ulAePSAmmRvCjELE6CDGL7Qzm
	 vPvwGVMsvEl3X0A6HD8GdeQpj/A3ohaWSNst2EMJVcy/3U2ZINVcpTQiEKJCOCgXtL
	 D0ZVLcuse1V4mkLR/Lw3gdwUS0uSh8u+kBcVf5MtVUsCO88noytsrPOHL0mtyaZdyr
	 67kRitIWrE4Fe8jd9tHCzzaNvHV4w9R9V1JGFaXyfR2sBjgM1ERfPIp+YwvXUEklrR
	 n9uKjcv+Daa++J5hmdfiC26/3okxvBYbXE09W+WJpzZW2ATDYDQLzp8Vjr0Wtz6n+V
	 1o0GNnrIdSikA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033B881553;
	Sat,  3 Oct 2026 13:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E81179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C97B414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmqdY2_AlKxb for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EF33E414CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=Pe9b93DDlchFLqIp5FSDzHrcPOSgj5JDUSJw9nCJNVaRj09C87jwhkOH8ZTmt9R0WwjE
 qRd6O4YlsFhj8DDG0W1aXR5TNxxHDe2InXQ5MfOSWiK5a9eSAEHb1JjVVAFeZBpcKQ276
 ngK8RGl/pjy2kkhft93cOs+UNRWtrJs8FqQf0cgA5HHle6fs7ZVLNhqsWntzYkXBMrzPU
 e1SltitC9yUu84CkCMUxHCUyKYHbj5crlfXWnX7oNiT0V6I53l4Ibka0d3oG5jxZUPD3A
 BfPWduz/11sRT/pZB33fXPQcMjzvvtYHevl/cNm9dASnbR/CgAkHWpNBBi/NGLLQaFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=97GKWJ3rbcIYFKIrPdSr8i7rEm4aU7APeZ4QJJFRdNA=;
 b=o4jjPe5MaeuDdCQxnnYuV2Zwy0tuj7gwYfPKRjAE2cjlSYWAS/IybmMqW/6CrCeEu8Zw
 BLMLj/BZ3ASCmsGblDRSM9p7A5WDulZx+gln/lyxjnkfzT+HNAT9B0ykYs38b+evGm0gO
 l4gqQenxzSWGksdi5A22r3HJeAPaVyvL0+9tGaU4+YYWYw3bazVEOfJ5ibXk4C9O+t+mn
 baB910lF98n1/ycZCR8AhezknwNglJJytSUiHMIjg67YFVLIaYSS3my3llEz9o1cdq4I4
 pvJp4QPzoqWnNSWORK9S+LN9+tmZJDM4ULxYa6b3YUQcjuvJ2OSHAP6u5rJzGTsjqYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF33E414CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 462D78A318; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cb474811953b3e69d9a338d92f613cfba7fec8c
X-Git-Newrev: b942389570f38a81589504f753f5cd9b2ccc2acb
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.462D78A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: bump to version
 1.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b942389570f38a81589504f753f5cd9b2ccc2acb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index a259fd2d5e..0cb3baeea1 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  48f7fbc11051430eab3c1abe216bed7a  build-1.3.0.tar.gz
-sha256  698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397  build-1.3.0.tar.gz
+md5  56f61c2663493ebe4916b8acf40bb039  build-1.6.1.tar.gz
+sha256  51cc11666391ab6f092070437ac747002ff46f3e4113a3622177ee6b488bfc53  build-1.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 45ae7818c4..85ac4704c8 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.3.0
+PYTHON_PYPA_BUILD_VERSION = 1.6.1
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/25/1c/23e33405a7c9eac261dff640926b8b5adaed6a6eb3e1767d441ed611d0c0
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/bd/67/4898a44ea4f3f8e213b0954ec0aa0a16971d62a6212d6ea3931e97115b99
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
