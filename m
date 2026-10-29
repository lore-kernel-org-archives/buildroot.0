Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67D606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qfy3Vvsp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428BB60B54;
	Fri, 30 Oct 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7be3hVdLt5qO; Fri, 30 Oct 2026 14:06:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50C8B60B0D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369217;
	b=nm6Z53ne5BNeWbQUqjsOzD1yNnrD6s3cmmkUvJXYqbU4i6hGf6s0KqE5T7Dk2qmm/fKW
	 v44RJK+7nUTqDqCGBatBObgbCGGYryCLQP/LS5uAp6yWOFCbxZTS/dNVQoZn4n056PU5C
	 xstdCriNihB5oQL1+Ttrorcrthpe6+vrNR/fEIsF5UlOok7zZfkC+B3Curta62cTyY6DG
	 +yl6JEQgasrLU40LHu98ksxfZGXUice4AEZwUwnwVo4Ow5JZqr5esnLCapexYmrJ5llLP
	 e22cv+iCIFtc36wS0kbp5/KWtykYXNcWajtEH/vCdxT8O98/RAYQnAVkZnbht6Bur2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+VGbGFHDeLSbMb6f5dLmzdCCIxT2nk3wRx/cj3DiYAg=;
	b=olzaA2fRdOdmK85yTMiG4f9tSZTI2+2mH5DIraQkAjI/nQ0h8FafCVsbbfcSeG1gJ+zj
	 9M+TlTwtetXCHO+RlzJk9YzZzLdoY/Jv+wf+LIbIch6PHgSGnwbDwP5U6MluJupX2mGA7
	 ovkngv+o6amdC7FVHPWo3616Il4XiPFnAVNftJAVwJmcPUoPBDVxk8QU7VVaPfuE5kp7H
	 je9/RL8OaE0aVPQUSIqrgmzr/gfAydfOiDex3GTGl1dIlwYDrBnFutQ4nxU/Dw3S3FT0P
	 KzqYcz0g1znoQVevS9kTDxid1HJKGbJC+0fZAKLfYp6T6j3GjvWjQpqaL/+Jy11d4sQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369217;
	bh=+VGbGFHDeLSbMb6f5dLmzdCCIxT2nk3wRx/cj3DiYAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qfy3VvspiMgUEYylK885/fPaFO/9jXHwCVo7dYMoNiytv5KaFTo3By3Hi1NEEaubZ
	 XwjX4NbBIKSy8+aycHR50LDe0E+VKw6ilA04klgbIe0YRyuPVKtqp2JCDx5KH9F6ht
	 aYgBtI4SAXJPz+CLw50Ge7SwW/gjPB/qh8tkC394eNPUt7Ts/BCp/Vu8ssqxZcPoz5
	 mOrNtovbMxtadlGgn4edFo7OumS8QS8y0/hc5Sj1I5kJKRcS/0uaFkRg4BiTwlrQlW
	 TJJet6pIXNtZBOWnPUs+Cq82H6xrvX2d/I48SkxLeuELBj1zSJzYKqVFnnwo7USFAD
	 nZHvd9M8DP1Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C8B60B0D;
	Fri, 30 Oct 2026 14:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFA4362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD5BD40B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsK2qiXDd1zn for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F0C8340B31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369164;
 b=fyhAY1e4jcfBuCVcKLnhpKY1Sxya/SU/G9eBnh02qE/tfQBBfxtZ7aK7bCHc5aZ7kQm9
 udJ6gdzzX2qVsrcZWCb8yZZknTDxCLjgWpQd1dqpMtZ9bzz6HL446cvP4x0gy6ZaQwG3s
 Ojw4eTsmu0WlLWCAN/f6py3Cv0wMKeBIFD/6CJXUFIacQHMhFjhnUNifEuQRgwSyXCgjA
 4fNPsngvSFIwCIwWdPfygJoF1wAkHKX5Qqq2QepGcAHEwfvhOPq4QzuJkLleEERXK7sv9
 x6apIA0gJLprOHMwSFV+FImJ3Sz3W73ZBDWJcyGY97KLHlT1xQocA0IfZE22yiNZHxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369164;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F131tviHyOy4W5hJX9dID0kHRc1J6n+gs61LtV0VwTk=;
 b=pRnfJ9QOjs2Y7c6YaJ41nZU/qD8ELgf45THcp+AL4t5HwB68Q21CxaRlMJfMVvh/966v
 9t3xyA5wQ6C3T1fkJortvfvvQXQBQiCTt3GaMLOTlxA3C/ccNHbvXHI0OmTGNp0cyp4Xz
 raFJWOu2VJocyj0XyY8R3bdQ97cE1I76g8XCz9+4DdYF+FGxsqGUsTBbG/qrip7lgTQk5
 FxdkUUfoE7Fxocnxc9E6vxaJ3On+8ZLSe/pHmfGHAZH3m+IfhqXGxDmpDfM/Y9Orx1aEY
 oT60cDxUcsplFFU+mCw5/Jv9MTHwN4NfwQnTYiqISdMjRz1N92RPLzpWRnWxMILLB3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0C8340B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FDDD9D388; Fri, 30 Oct 2026 14:04:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c62da4f51a4262d9db5a748dad92ef70146aa8d6
X-Git-Newrev: fcd8af927c954aa963a812fefb874bc8143ed8c4
X-Patchwork-Hint: ignore
Message-Id: <20261030140436.0FDDD9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pip:
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
Content-Type: multipart/mixed; boundary="===============8414284752402325223=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8414284752402325223==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcd8af927c954aa963a812fefb874bc8143ed8c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8414284752402325223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8414284752402325223==--
