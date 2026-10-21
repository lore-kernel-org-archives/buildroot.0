Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0CB606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AhbQWs1J
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30AEE4068F;
	Wed, 21 Oct 2026 19:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhwrcB2Wb4RQ; Wed, 21 Oct 2026 19:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 234A340900
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792609951;
	b=RuAFajxNEDTZ7Qn9ZSC8yXx9vibKmfGKxL8rM+i6wnXHil0U6zcNrqBjwF7mVvlM87GU
	 +lBkfq1AhUxTYxeTa1H6Aps0X381ZXIK5pSsgvIAL0l8Tgw83EtkolovV7Br3CuuSVK9O
	 svVshpQ0jDNbmAor5vHLNw1rSBZsP8T7LeUac8gBz2Yjsb9DYeqcZZ2g0dp6wM+zfXFyI
	 egIvaBY/5uIRrd3RNLd+RjVlwnwsAfDML4z75scpygkHqYTLc0q8PIHBKw9kGzEnqZjdA
	 Q8ZumlnBTxTTWMkM7HyF8GiaOCRFRpVPoo48rXSlDr8MEjHymzpGYRnR40TJG1CEu3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792609951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CJ09uESSk1IlQ/qCSPMuJVn4obm7A3PilmxyW0LEjWQ=;
	b=fHwMAURHKc/6lgJLEfmjTOOKUuCGOGXEqzppg3RUGrLgWljzVt4FcmYxdqe/HmvQ4cb1
	 NfawwpbDlCludj7Q2C9dHOmpzj6Qxb7TnGvIxxE8O9QX3DwrjImSIqh3VJfahgri+rMpp
	 s/x2tvPE/q75nvxpwaGp3ECgsRcSr5mo+XBY2A3j2P5qxpOxZOI36CMqo3MnA5T51QYby
	 vdR8pqZLhW74Z87P1Urq289U9EwJu1yHKunziw/6uT5jL54vIvl/hKinlXnkmlLvcFveM
	 z4IRNXEkMnDpNWohhA/sIMEttq5q4DO57uje/J9HDKsq6FsGvYfk4FLupLvYuGhf83g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792609951;
	bh=CJ09uESSk1IlQ/qCSPMuJVn4obm7A3PilmxyW0LEjWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AhbQWs1JmJr14+FJ5MCtyMYBs6MVn0OEB0gp80d9ECRda0FdzNNl9ia7sxp53P9mg
	 NiCljSelYdPY+YQ7qskWnVaY/nhp1oENd7vcRpxC8oxgRtf517m3NXYviRJSnQfCYW
	 8iInDx31RucJRI2/nZNBCLgXZ46ioxNYvrTuuyds75HRwI4fJwZ/L2I1Z2KtqafpQ2
	 wwzhtoS6ArfcFPccfo02F7flNZqQtKlpTECAbh3PMSvD5opGXlU7uHXtifMTlhlc4i
	 UjnQa5E0WTFTTg1mibHsxn5ggljbKyA3vN7+g7P2GsgPWgBJPauctAPGngwPRz8gGK
	 OD3+s2ipL/iXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234A340900;
	Wed, 21 Oct 2026 19:12:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBA63A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C8040426
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viMgvHtx8vPl for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:12:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EC0CE40415
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792609948;
 b=q8iAzlP819rLb17hcKgG0SrBxGJ4s5fooPXJDrbEbuVMVnMu69dZKGUrjCfUnDwnLOOI
 Ntrwl6ymOGUfSHxMnFN+1d8gOePCqwIrONLHv/WSIIt3Fk78Bf6qhM8Hvxtj3a2qndmeD
 a8kd3JDpPTwhLbXvN+AuWaN5P4xaxPrIa0LGXs7/080tA4c4p+M9A7OH1SgLoU3s72xye
 IWQBH3lAhtGmNEhNGt5uS7OWPCR+mSALMaNeF1tXiFl/zzaIt4hnk8UEa5jNgbOwqEuKz
 +1aZsqDlmH+bSQnIahv9qhUIlnhRWJpZKdFKS1hkILtk0ytY9ex3+gN92s6E/y33FSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792609948;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3dPAOn4/8xO8M35e53iJkAL01GvCFKU8Ji/08H0TEl8=;
 b=nuO2tnwtmt2Jg0yz/ybSfxT3/PxiJu7MRLrH0P0RB2VPWR4uQX8wxdqgVaXlawBjHi5l
 F8W1tLd8gItNrh9sioQzhrsS90OJWF+I4g3j5htyxtEdnKqxewCxTKVGfGYjPc9fu7KJs
 iTpXWNCk6CctP7Mw8n6+u1BJOWKc7eIhkmNajf0FVXDmnfektB3wbpuEO3IabRXeBR+8i
 QpJABT4hae9dMSnHP7jNSvSX94Epv4kGMmU0zzpjdNyh+iWwPSZ3nPWnI6GUsrirOziiT
 QWSuzX+mMT6jLOqU1KVPiVoQL+YYxjK3QKQlj49Mn+15GY64pCc20g2KO/UlCnpEHtA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0CE40415
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6074999A95; Wed, 21 Oct 2026 19:11:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:11:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9b64904b6e6b08e52dd3874b6782283ae4d4d54
X-Git-Newrev: f58537fde0c6ffca56f1585fadf4f629d075d6d3
X-Patchwork-Hint: ignore
Message-Id: <20261021191103.6074999A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-nats-py: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f58537fde0c6ffca56f1585fadf4f629d075d6d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-nats-py/Config.in           |  7 +++++++
 package/python-nats-py/python-nats-py.hash |  5 +++++
 package/python-nats-py/python-nats-py.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f3e84b1484..a2be273dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-nats-py/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-nats-py/Config.in b/package/python-nats-py/Config.in
new file mode 100644
index 0000000000..96d6ec6847
--- /dev/null
+++ b/package/python-nats-py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_NATS_PY
+	bool "python-nats-py"
+	select BR2_PACKAGE_PYTHON3_SSL
+	help
+	  NATS client for Python.
+
+	  https://github.com/nats-io/nats.py
diff --git a/package/python-nats-py/python-nats-py.hash b/package/python-nats-py/python-nats-py.hash
new file mode 100644
index 0000000000..6dcee7d8d5
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/nats-py/json
+md5  a36b7917297bf3fc5a479f19bcecb43e  nats_py-2.16.0.tar.gz
+sha256  1d137ed7afc9b59033b3199324c6237df2016a5091935871344a787eba6b72fc  nats_py-2.16.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-nats-py/python-nats-py.mk b/package/python-nats-py/python-nats-py.mk
new file mode 100644
index 0000000000..77b3184ab7
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-nats-py
+#
+################################################################################
+
+PYTHON_NATS_PY_VERSION = 2.16.0
+PYTHON_NATS_PY_SOURCE = nats_py-$(PYTHON_NATS_PY_VERSION).tar.gz
+PYTHON_NATS_PY_SITE = https://files.pythonhosted.org/packages/2c/c8/739b72c9201081e48000884d476231873ac82f7247c43b33823eaf3c0bfb
+PYTHON_NATS_PY_SETUP_TYPE = pep517
+PYTHON_NATS_PY_LICENSE = Apache-2.0
+PYTHON_NATS_PY_LICENSE_FILES = LICENSE
+PYTHON_NATS_PY_BUILD_OPTS = --skip-dependency-check
+PYTHON_NATS_PY_DEPENDENCIES = host-python-uv-build
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
