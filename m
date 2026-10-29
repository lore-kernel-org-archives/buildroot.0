Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98835606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FTKmoSyZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A04817A0;
	Fri, 30 Oct 2026 14:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-VjkxmKRpc3; Fri, 30 Oct 2026 14:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C0658175B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370022;
	b=ThXaRQKP1jFwh1t7hnI/qnV6XKXyMGFtp5wwLfe7L20GMztFUY88OviimY8kZ2QRAgdK
	 L9LSUQ3CXlpDkV/Nt06NLXv0Ee4Q5fpbzXoI0i07b9lzBrKIds125aM1HNoFWBuYAFi/R
	 fo+RZXD7p8GuiaFiCwE/6gvGB2rBsYymVbfUGELGb1ymhA2nxYYBQCkVqlk4WUDTA6fLH
	 h1W/5nF/wYnPvqG/Jf786DM1GwrOA31U1wkbr9QS2+4yVewmSWmrHx1G0i6cDn/6EQJAK
	 559IoLUyZNCgYUZmA59c7saFvaMVTJItsiA4o/ixOyhZsvn8tujkmqPqvNTczHEiK1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=I6URauYp1m5e70eqkmvu9KzbYX3wNvq/ORjkWQ0f40Q=;
	b=ISL/ksL8nOvUiVoxpyhvzIVJWvzrYMXQHB+W7lCI8cqiBP/Y3e1zp48UkruFQ35J9+FA
	 Ma5V0jC5HYlTijg4n0D36KSvYDk1tDUON4eyTSlUYd5XqtUaEbzR6/WwJb3hL3bsyVyQU
	 HuWN8Uqo6ip2gsEm0Dc37Yxz1E4T/L8YJ/H7ArS0Un0HCzcLq/tMgL+0JoAIGjFJpdaNt
	 KmwMMBz8ZH15XYrc0TcXIa0oJZlbvZ4vWrjAG48eX4mM1BrHoTFVqJleSwgmC+ol4ZSj+
	 2IxeQi7y8sgmO4XTKvsEM+qwS2jsQ8ngc+jMQ0GifHrG7HOBK1+nYtAAglKB0Kef5Ug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370022;
	bh=I6URauYp1m5e70eqkmvu9KzbYX3wNvq/ORjkWQ0f40Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FTKmoSyZuQAZzJYVuJynGrbq0VJumECoH2ugUpBCgFqVMXUm9v74aPkITHDJWxKAO
	 p7OQ2AKSF2/olq9ze7NheQMhq1pOxD6bZgMLxd8EhfFjhvVbl+Oxh7GNHd+pJemqol
	 kISmwywHexDuSEylJe/9AkVZdEMA3Izjk6QIs4Hx0i2BSSEgRDfp8Fh7A7NRyc3e7U
	 G3FmuSbHxtHTV0BP1URWEOotuCGjr/YZb4hNnBWvUi4sg3whJEzxf4DX1lbbo1C07X
	 kv24osyVgZRtvzVqePLbX/DTle8JH+CNVBxnBDe5wn7IvNgbkpJVcLBeTbYOJ75e0o
	 RJabuSz+F59Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0658175B;
	Fri, 30 Oct 2026 14:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFECD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5453F812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYFdv84xA6WI for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 926FC808AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369892;
 b=H3ij+sJfX+aBaLpcKM1mqTpTSJmb0vlEmluUoVkFRxXARMWpe+R+dZReruDWaSAwFftn
 Rz33/lhmvoe4vlQWubfO22ifVK8IOhNfWSl/rkmgpLj41v3XoYywGHUANeJoUin2aI8KH
 vfyBhYM6iybuEVN1Q4KqI5181/PlrQCAkxABttlnCLzO4jT9JMPtQQp5477IBltMAotLG
 2qGmNT+kPAjaK60b838EIyb0qbcI+II55o27p2z2rOscC6eG4qXzXFU3DahF3saAdLdHT
 zRZydywiFK+M6wYoYBF8zLqaK7L0LC1qbJfzTNdXJES/G4MT20vnsg9NY6Zsm7dZ8Dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369892;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=imhnl0+Rnewq4/zwShUXIu4ggvWdKYl5kpwaxFKWtB8=;
 b=Nw2S9+5cQWnJYo30XKYNzVtDzRtrylkcAsFV1xerjaqFoni2Sn/cQIx7Cgn/XHrjO3K/
 b7sdmtAq/IjQFQSfRyrMOkYUAW3LxJoDnA24wk0Kw3jxi1cbIglQ3OZDs+SY2d9d44Ck2
 tD4ojaf7X/5B5QbuJU2PfegMvMilkjNJK3Sw8xhQkwyK4Lw04blBtQSWqzm2lwG5vPY5G
 eoPjWdGe8HkU9cqatylt+ncEzBxECtx2ny2wEqhdNXLUfaZGl9a6wj9q9/Cy56TuQDY0S
 3S7xnepIMHDSnomjZ3x8kkdGP+CfVw21I4a9CLZKkMvBUYbad35gTvePUQpketx6Tcg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 926FC808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4EF49D389; Fri, 30 Oct 2026 14:16:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 03b8378638f86ad5c43c485d6ca9de18d1240900
X-Git-Newrev: 5c286c6f1560621330aca83d2ce21aa00e1693cc
X-Patchwork-Hint: ignore
Message-Id: <20261030141644.A4EF49D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-pip:
 security bump version to 26.2.2
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
Content-Type: multipart/mixed; boundary="===============0946874354919196290=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0946874354919196290==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c286c6f1560621330aca83d2ce21aa00e1693cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576/3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b3a0ed2cb245e7873e7fc6d792f8ee18e02bafa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0946874354919196290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0946874354919196290==--
