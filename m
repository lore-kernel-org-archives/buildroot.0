Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398A606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=geGAfjxW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833DD812B1;
	Fri, 30 Oct 2026 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-EsKGabjepm; Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92E3A810B7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369888;
	b=jJZtfTtcqYBh/PUhlVg7UiYS4oym2VUeVW9o5UAAWTCF6WQbwA2U7ZOlu4+3kyr92pGe
	 lm3CfowyhKYvFDUqygtgGfYepLrGkzYAeU0/wUc2VU6t33MhMjf/DfP+1Cl1tb5lx6wFU
	 B6mShx87vZquKRKT2ABr2kl8GRtl9Btlpw+9nCASfr6I8vmLunkzQrypFBUwBBg64MOQE
	 vcKkiz8XHinu6A/fwcp+VBcghdqgcJj/YJj9If1QfABNGqf9q0YhTk37pswm2komkvF+a
	 OyJijbjB9tmtPqyUh122ozdOAmpF1a/m/FvYqUCqSiyxf65x9vf0GMgThWWR6zJB+bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oyRYSQ8LPQPKfSJ1r9nwrGsNUYN4EAsGFPSosu3qi/E=;
	b=j879JZl2mEeNQSlcqtbrGPGLHKFy3bDeg7ylOfnGNTee0FP5r4m9v5+wxSDjlXdHgnIV
	 5EZBF00dOqWzanpMn/WxhYGTQrS7CiwVo29rT5d4JvQYbmygk69IXlkOfaQjX9hZuk/M3
	 +Ma1m0hMLZScE7WK3M/uzLdKyQeQVe1mRA6AO9GDbyhqzeeKjIbccLymblgvg/0GnILT+
	 7LVnsV0Mkq9scIYC60VosOKHT2At9ruCmArV5jof1SI+wMEDiEn+3VnZGV3gjvumrMcpX
	 O5WXpRol/uFq8fiXn628MbhYqB0qNQZ0nNBvGNm2TGqyBeITa3sZkPA4LF/0j7CCT1w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369888;
	bh=oyRYSQ8LPQPKfSJ1r9nwrGsNUYN4EAsGFPSosu3qi/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=geGAfjxWIUvNFRINOJYeUJWYpOAPw36+2vRFe6xXTIcaEiyYL1rCBDVz2dRini++a
	 dZpq6OUv35afRpbE7v7ZbrAiXBeCGQA13WAmrXEInrl6Uh29QxW/KRqfmhszyJudXt
	 +N8cxYPZ0KQwsNoQ1P/DqdU/VZ0xBAANfROGBbAP10Gc5mFwp3u0DjaO3mzpVeHveb
	 v5spBqiRk5GY4AxJh6LAVFuSlHG2AF0JfoJRNa7r/Yaac8RqsMK5tL4knZ3yHJ+8Ig
	 hrZzSaYASziRWXlHN4EirCsXIN+9FLSY/wfcR9LXc6+5JWphbXop3yhzRswAK3KYcG
	 1Gb19d5VuCpOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E3A810B7;
	Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 653AF712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 563A0812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM7bHyBLaB_E for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FB0C81283
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=D25pXVHd1/8r1IHwWAE3bZ6+f5NtssjxaoINHZSX6MEFjRX07givwedVFahgYLjFCBAS
 jk8b+fcYCVuH8IlwpHWWGPK+5nRtjZUKQ6SqjWLHj2awsEh/9tHM+1ywgfn7jAdOSLk1T
 6kiNeG4wWJA6Lzz+p58dbcEUSYqPrbZCxqMhzoO5j/WrUwqSEO2qdhuJZ+DUobsnD20U3
 zrNDC7Z5QmBWH3oEE2JtbQNQmlPHYn5U7Ujc992Wc6mQxKO+2rW1FX33lpcj174+EfOK+
 0yJ0ftC82x1IXgPnpWyYiDKP03U5k0G3PwPlVwj8Dio/qNvCIXXjFhwzvuaro3JM60A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4FVufw00K82Wax245PyrHtUi/PpQO7mZ3mbuWYtWDA8=;
 b=M8BCYOhY6oDTQZ1an4qavJFcxTQvHuy2DKzUw65CB9caOmvHF81L9m5GBH+fQ43n1BRl
 uOgxBkGb5T3rgzRVJpOw6Q/zM+l008XsCbrThsCbqQKRveATTj/fOep9TP0rBR5TYX6vH
 S/EB+8rZbPZO+GC3i5lmL57yHvwYBb3JmUoiMYSa0rq9GkM4ZEwLrrfxHU1HUqF8mKrMz
 ETIDn0uQRyz7d1PyLu6Kc9OsHo+nyIiA8Kzgwg6+GNMime72q2CTtuX+o0EUCUUzrWzpG
 jwto9mbFVjJp2l2OVlaCX2v38yG3rybHp1KLvnZfvb0/aKrmZw67j+vwKUupzkjwB5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB0C81283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B156B9C645; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cbdf080d4c2316cff4985f00a75729ca8d4de9e5
X-Git-Newrev: 326c23b25759c5c52ff52c9446d73116e831a226
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.B156B9C645@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing: add
 snappy test
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
Content-Type: multipart/mixed; boundary="===============3936491455512643477=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3936491455512643477==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/326c23b25759c5c52ff52c9446d73116e831a226
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Add a simple test case that imports the module and does a simple
compress decompress routine.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 02201ecb444cacf2c76b7e452792bb8bb3674064)
[Raphaël: fix conflicts in DEVELOPERS]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                            |  4 ++++
 support/testing/tests/package/sample_python_snappy.py |  5 +++++
 support/testing/tests/package/test_python_snappy.py   | 11 +++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e6ae510c1e..0db657b308 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1143,6 +1143,10 @@ F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
 F:	support/testing/tests/package/test_python_pyroute2.py
 
+N:	Flaviu Nistor <flaviu.nistor@gmail.com>
+F:	support/testing/tests/package/test_python_snappy.py
+F:	support/testing/tests/package/sample_python_snappy.py
+
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
 F:	board/asus/tinker-s/
diff --git a/support/testing/tests/package/sample_python_snappy.py b/support/testing/tests/package/sample_python_snappy.py
new file mode 100644
index 0000000000..842a4e98e5
--- /dev/null
+++ b/support/testing/tests/package/sample_python_snappy.py
@@ -0,0 +1,5 @@
+import snappy
+
+payload = b"Buildroot python-snappy runtime test\n"
+compressed = snappy.compress(payload)
+decompressed = snappy.uncompress(compressed)
diff --git a/support/testing/tests/package/test_python_snappy.py b/support/testing/tests/package/test_python_snappy.py
new file mode 100644
index 0000000000..b9610980f8
--- /dev/null
+++ b/support/testing/tests/package/test_python_snappy.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Snappy(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SNAPPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_snappy.py"]

--===============3936491455512643477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3936491455512643477==--
