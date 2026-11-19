Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD6606A33C
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mSIkje25;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raP3RMIZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B6540A37;
	Thu, 19 Nov 2026 09:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o1YUZ8BKHxl; Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FA98409D2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082201;
	b=mWrxnfnAudTqAfk1W6JgCESw31nlEENsMT7GNPKJlHK87TZfeIOsyf7+KD8ljgZ+a+Wh
	 GkpO/79uhNSvxR9jkLAEBkLefltvm02+J1HQoNxU4Gy5t8zfmrtFXElY5Ye6Qg9TcI5md
	 jb49LBYOboIRpuN7FNLGgESopCI/c86QevlBVfi4OrNL68ds3KjmnKS659uSdLsNUUKAY
	 vZJ5Xo07VlhYFzY8CFyNFjS+XtFvxf0JgDlnaAMW9qmMY0Oy97vcH+e6xfTQkMWciTYcA
	 0ZT9EfqNXBEpiBsEuv5C2XYa7ZujeRMv4TQSOogX43NT+p/9X+dKLuchRcPfWEUZWwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=THDkzLVSQ0/bqpXZzga9QM13b/pC0zZiWKMWruNi1QA=;
	b=pEin5U0jii4wrZJ3efusKdcnX4u3P2ZZNAbRkK/qBp4Mu9RupI0D7ns/LcgOqWbcmPtO
	 w+z4gVDCFPqBI3PFXCCBzxRkzA0JPAIykUKWVjwtBspogm3XNpglYKnlBDg7g9NE103uf
	 0o7+XSXFlrmOWye5V4H4KWG4tR6AveuodcyUfYfizufqTuOrXqX1fecaIF2uvfew12mqN
	 H5pN5ZWp6K+buoUINQoK7+/F5ZC8DYwm1PW7pkns9qSh4kHQHhn9Bbx7u3ldZ6B/Kq6nK
	 WYVcaDEqbvJZyRRQEMqDatezFrNASXlM/s9v4avBZZ33aWPUebK84Js7rOHF7gZmuKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082201;
	bh=THDkzLVSQ0/bqpXZzga9QM13b/pC0zZiWKMWruNi1QA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mSIkje25rDZ8YEL1ThIUvEmF/thZpqkIFWvXQSe41sYM+C0cCpAfZTsQkR6sCqP0S
	 i2VQNyoMCgIicJCYpls0iy4C2o+sPeVhw3DDccBaR4NJsn5VhIYz1ShLSW768lZSeN
	 hdc4xmnrXO5WlyF3O7Up+tC5l6tlR3UoReP4sENoCvihFVfkQUg4/0NjrKxFhyZCIp
	 ZNN/GQlFIVVZnUuBnvOa/EUyXKAnIarqbWCx7tnlgGS2hX/IJHKi6Jb5wmjMJ6w6TL
	 0/JSNXrTkiYhsm74d89gGztyM0/K567hHbAjiR6TNWwAqao1L9lZHf7tGsMZDqYpbf
	 HpeCD4tVXj+Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA98409D2;
	Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBEF01C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDDEA60A94
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5B4pPD7aqge for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 77CCB60AD2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=raP3RMIZ
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77CCB60AD2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-49a92144733so937787f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082194; x=1795686994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f0bYu6GlwyhMQcKXMFGBSGcCBaZttFU+p0HMIq0eCHA=;
 b=raP3RMIZ2dEYmRIVyXfro+tyLZ14TlrPZvM9HEzBtQiFKjOywCDruS3q4+yc/AO+uR
 ZCRnBrXjfD0ArJn3TkSTb4VYosmD/DT0ILzJ8aa0DZ9ELdwfW0rUzOOTnHdFmHH3TbnP
 jcJoNyVjYA3fZ63uMdshLKwuhhTRs4u9jaX5zGdc4hwqBwBviZMIO1RifSRK30h2vKvr
 dpSn7aaTecFv3UHMqZ6YRqK1E5m0q09G4uFaNoygRkPQTNddNOXhZU65kOxXeXhuVWtC
 XQClzcXRXGGF/OVdPbkrW6J2LPLTLPrPawaHCTteG3HYv1z97fwGYQsJUl0gJkDxwvKf
 Yd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082194; x=1795686994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=f0bYu6GlwyhMQcKXMFGBSGcCBaZttFU+p0HMIq0eCHA=;
 b=Tvf5uWRwefs47FjujPWCPyTKa4RjfI8A5N8we+yJLps9KfzzLTQsfD0QVRwDEUiPZv
 NwB+uS87pp1rnZKVB/puuqFeRWB/U9IBNsW2fytQW6a+4KVnE2Bv8xtRyZBHZPLjMZRl
 GyQDPcrCQ151FUQnLEw8iTkRVRAbXlf7UX7C+bQqnDUEXXlkUGOfaQV0vGlSwbTGqXyW
 R+6JHZvd9BEaRdz7QomGBf4ou7H5TY3WH58d+3RyC+akktEbkmdbQAU0JvS1KPJvpow+
 5754vrKchzi8TxmLx3rl7OiitqVYx85ugphxx17/8R1CmpPFmh1ElSfuWUqWEOObXJ7O
 0LMA==
X-Gm-Message-State: APuU4Z8kY3n8ZqTHcfLwd2OjtywIAiMISfyDIHdjnHeFgWKZLqyFLtX2
 R28aFrK/Xdggh+75CfpoVH1qhI63RkFYZIjgIn94cu32UnGrkrp6tIv/j7kZkQ==
X-Gm-Gg: AZFdTZfaeXBeRe8sTWLarj2oGBAjDK9xY5GZcNAF+jaAJzawp0d3SRnnVaPSUe7i3z4
 LZkU422Gp61Kc7L28E7+z13+AiA3aiwlI2h3B3diQvMb9s6m3CNy8UAHJlgVGBD7rqcd2F5aHgp
 49sL4q72I0DYKkCZgzqImod8Icgg4aN94jnHY7qZrke06cLzO9VMCcFPKi3it1/m1q72yffolHj
 AzcWrQ4ZfJefFZ/+ydGIDoBB1YBqhyBJQIrMvc7dmqSrzA6BweDbz6yPEI/5H8nsxg8xVuEW+hA
 hNHbSSjlwcWtsNQjXLT5GEZLOnrtwxs+F2N3lUEIiDwfwA4HRiIiCYyfJkDhnQ/ntot+emFj0Ky
 D0NHbhuDcuB9KIPyu4Wd7C3A6c82OavE+4I6+Lel8C4SKk0ou843TND3kTVAthqvw6UVMyf0FVb
 VtMIg1uTzhU++b3VYfBpss34RU1HbAXZ2v4Yd2PBGor7o4TJz8PFISUASoBq1wM0ZYysCNHuJyQ
 8cSNqEH1JT3rCedKHf80Ck54cBAb9UrFqcCrL3lPnyJQaatEI2vTNJ3aLJJNCcRj8EjWikSK4x+
 iUQKsVnJdkytPBrEtb4SvgxvSh5BWe7YdTo28VKtlk3LsbguM2iLzoBAQhT8xqFBh+EbtA7N/3l
 sBbILrO/edUZ0uoO+z38T2zux+5GRyZh66i5Aoua+
X-Received: by 2002:a05:6000:460c:b0:48a:f0cd:8712 with SMTP id
 ffacd0b85a97d-4a63cb24650mr10891572f8f.50.1795082193635; 
 Thu, 19 Nov 2026 01:56:33 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:33 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:26 +0100
Message-ID: <20261119095629.1990220-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
 <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/6] package/python-pydal: bump to version
 20261107.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pyDAL does not publish release notes. This version reworks the
internals: pydal.adapters, pydal.dialects, pydal.parsers and
pydal.representers are replaced by pydal.backends, pydal.compilers and
pydal.backend_base. Code that imports the old modules breaks.

python-web2py 3.1.1 is not affected: it uses its own copy of pydal,
from its git submodule. The next patch bumps python-web2py to 3.4.1,
which uses the installed pydal and needs this version.

The pydal runtime test now takes about 8 seconds on the emulated ARM926
to import pydal and run its sample, more than the default timeout of 5
seconds: set its timeout to 30 seconds.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch: python-web2py 3.4.1 needs it

 package/python-pydal/python-pydal.hash             | 4 ++--
 package/python-pydal/python-pydal.mk               | 4 ++--
 support/testing/tests/package/test_python_pydal.py | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 22d0114dec..5aa2279597 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  21ca33debbc8a022137143d4b04dbaa4  pydal-20260520.0.tar.gz
-sha256  a1a01d28655231b7e0893ca13e9c92084549f7761042e1ae9ef70d37146737c4  pydal-20260520.0.tar.gz
+md5  75a3be58cd1337e95225845ac7e42d21  pydal-20261107.0.tar.gz
+sha256  db02ac001d3cd1dbd4eb40d4267aa4523f60b450572c3574a3f586712489e663  pydal-20261107.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 45ccb2e888..ccfadc75f5 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20260520.0
+PYTHON_PYDAL_VERSION = 20261107.0
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/20/4e/1d576fcb6857f56cd0aeb413c387044fd609140628d1c401b7ae29ee6190
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/00/17/5f6065b22a6a3d4f3b634a77683d7a1b891a927207135e03d5cf8b1e9fd3
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
diff --git a/support/testing/tests/package/test_python_pydal.py b/support/testing/tests/package/test_python_pydal.py
index b0166c7a8a..6a6573eb88 100644
--- a/support/testing/tests/package/test_python_pydal.py
+++ b/support/testing/tests/package/test_python_pydal.py
@@ -10,3 +10,4 @@ class TestPythonPy3PyDAL(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_PYDAL=y
         """
     sample_scripts = ["tests/package/sample_python_pydal.py"]
+    timeout = 30
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
