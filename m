Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEFC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U6CEItna
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3938127A;
	Thu, 22 Oct 2026 21:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcAgBqiFNMmw; Thu, 22 Oct 2026 21:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAFB881134
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704218;
	b=MsOr8WLpILambaY6pCWcc0E6xcTHlj1izHIUt2VcVDTrGfxZutEPJfoj0tIXJderCZUi
	 bP9sfHSCC5g5ehM4OTbPkbg27/TWC5/lZFTBB2ma2LB8itT4NrXci8A4YJUDdZTRz/Zp/
	 zJixraBo/pAE4j2ENRiyG9Xh6oWZOgXGwhKpZP71llELAXZbGKqxbiZBLTbwY7CP3qYaD
	 WRyW13E8haMrPhNR9WukWBzwgc8Z/LkS6cUKmoKnPUfTgxYEJdveztu3szPhCCoQIIBp8
	 XBZ7H1X2GPUaKChbfoOJA2WxwfnZQ+8IqzaGbtabOV3dyw1ejWdfnRlLlzYDPoEOUFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wHCkwswq22LzOvPaCRMqsCVaY6W5RRWgyd06++6jXXY=;
	b=aQhWxp4Is+ffjktccbZV3VuYn/r4vRTJNa6N8ah/JutbF4JKFmDWyxCHki8sDZiOhO4f
	 bfyGKasIkPqJOv0Cet6aVCb51pL4g9PJt1b/XsETEPCVcG3U0eZXpDnE/gaJif+FuxPuX
	 qyntf4L7b/3xyI0k7y03czrSA0xvXZSai4KfPmK8aYfCY469B5lS4v8aEV1LH8L9kC0eo
	 39zdoiSFMiooL2t0lUISNTLTdHAo3VuXV1OzYwU9x9ZNIyXc3jqbrkxGxjTfUqySNeDof
	 2r44GC4lyY2A9pJ0MEoWGlNAlv7KdytI/mSVcRe5j+36hbo33JxjSsxuxP6KTucmzqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704218;
	bh=wHCkwswq22LzOvPaCRMqsCVaY6W5RRWgyd06++6jXXY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U6CEItnaCuQn7jeO9nlScTx+kesJrfybf7oSroCSuwUrcVud6J0Nx4ui6c3+RPtc2
	 a95huT/w/dwM8MDuoL9Az3GLLZnLnHY8NQO3C++0FWzzOhAamV3xZ/nTMhJ5eser4J
	 V9tLK20RLYwVMitWtTDAbkurP1ih4dVEA523ajiAqTHEIN7IbrIOx8dJuO0k9n0bgr
	 c93YQc5XN1x+xn7CbpJOrpwLeeE1gKzMN8DWgycvmgHczd2rdRTaDvQyf1YFLCAqen
	 DLOJ9Lrp+aDAg6j18i7kqurnA8NkizphlUeQlQ3uk1lu1q/wwhsWK/YSdBNBNpsw7W
	 br7iU8NVCEFyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFB881134;
	Thu, 22 Oct 2026 21:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3DF499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF764096D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELV-ILhZwRv4 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E049740967
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704213;
 b=UECLMBOK4hfCkXPzzL/WYk9a/qdmw8AAdTKHMV4+13vRtYncENIo+0BFUxuNWmLa8XL1
 ER5noV5boJsiUCnqrkY2r6JLNzp1dry3ISafgTVbq1o2EwjPCwrM7p3AVsIkmOqweyNVS
 NHng8XhpH3OQlvBECKzQT38BYFPpTUriH37a8BwYMysz1Km/MKkFA9cwISfUDEVAuQWKX
 DgU6pRKWJzT4goFO3LpBTs6rTr9lNoLK4t/RlxgjqmlcZSXPrEV2A5fAVcX3xDLr/Rt5Y
 AVz0xX936Cazb7A/vM6xWUkdQacHlfTsJkaftrSzR/SJL7om672+QdxE7ZzbuWYJdJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9EZGfuMxnggfw9ap7+ihPrEP89FtWbk9G0uVbNCXM/A=;
 b=A3qaVTJlZe3ATL7DmTB57r9rRhyZgonr51v1IoU4PycbBP/N0KY4233T3Ve+knScbncH
 Es7g2i/kPdxTJVZTU+il/YXVOwg8ecgnI4loSk1k0Anv4E5Sf2lmVih66CJ8jVxS5FgWo
 eCa3Lvn2m690/iMXVMaDc7y55gOlkAIQXGoc2g2BgTZKXXXFKD7Q7u41xYjfD4HHdlM/N
 HtNATNfs899I5z0pKnmcE+6WQc/MGRWfT1HfyHKG4t+u5NjRq+cFGf0md/mfKe/ao2Qf1
 sVAj7/hjvYepXYYnq0i4mr3mcf3OJGxjbmT9Av7oxY4htnjjG1sBk/E8m9PMEVffliw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E049740967
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE0919BE82; Thu, 22 Oct 2026 21:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:22:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b904a38926a15849ad92482a7ca63914fecda420
X-Git-Newrev: 2b3a0ed2cb245e7873e7fc6d792f8ee18e02bafa
X-Patchwork-Hint: ignore
Message-Id: <20261022212209.AE0919BE82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: security bump version
 to 26.2.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b3a0ed2cb245e7873e7fc6d792f8ee18e02bafa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576/3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 427cd14ddc..445953d08c 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
-sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
+md5  399f3e6053dd52028d2b60384332cea9  pip-26.2.2.tar.gz
+sha256  3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f  pip-26.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 74c789e097..a2efaf4918 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.2.1
+PYTHON_PIP_VERSION = 26.2.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fa/e8/0842d757e483e895e670f655084cfe8b8c72580c6769a76b30b2789a0608
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
