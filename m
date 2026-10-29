Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732D606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dGLAZkgb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC2F40AFD;
	Fri, 30 Oct 2026 14:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klsUfhj9HEuC; Fri, 30 Oct 2026 14:06:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7BCF740B18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369177;
	b=jBcdWoZDjcQ8SEZ36bSaRc0hBhg1QelYgtRCJBnS72chye7AOB3aS2C5TZS7ISSMwGaD
	 FyzP5bivuBJSoxZ/rTPqtNbRk4FNdX7qUzvVHtxhkiImRaWOG2DMfpFRt4zYjNe8V0ZUg
	 XN1skLULPMl00K2MnjdSM+vaHempwNwR1D1X/j65Fr89v2B6Lt7CMLPZlbqFnrYjDX4RG
	 9xvolxj6dS4BdQrqZ/AtVQHjQ4J0SdWzlhE+JBg3eajzksLiyQp2IJZHv1CuM2MlmDyb8
	 8FZesa4shpZTFWoGj69uMtTHWVyH9MPHgr0MZNkEzci4e3EWdmr5G3GWDfJLyGPhCsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YRYiw0US66HrAlbI6IQpvhYuuzY/BkhuRTjmXVsC644=;
	b=Zz96PQGWnoes56ixDFqYZldUWv29lGI++bnhwIQEvXHwmqFyDgpVy5K1oZwqB84GplUl
	 L29aQIgsnpNizCayZbIbUc9KfP/hzWVT0CwJ+h2h7iwwdI3brCCmL2yFOAtOoOS54U/Pm
	 mg2qT/WYXN/Y65uMdw/XzZGU55wsu8sN0Uu+au8n7C34S8MBQX9KNNP6P4W9jtUkYwMjF
	 wMMYL/rOwYsRcM0ISHDTFLVDpjHqivafUKzURj3Kz2GBMZTLY6t8xDELzFTvuJ2D5VTUC
	 fu1/VTGrdreREocHR39sfTt6eUy84WPK6OwA+75nnTNlFmboaxOn/USAu4P4r8OCjQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369177;
	bh=YRYiw0US66HrAlbI6IQpvhYuuzY/BkhuRTjmXVsC644=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dGLAZkgbkeSjyjJSFfQA4RX/uFFAIreIuXyEbf6dyK9SyEM2D0iJx0NoWUM9ct6Qx
	 LTHDUkw7sxy3t52JbVynf/V6Pbrdpxa1eNYssaRwzhb5uUjJE2oApB/rVyNlFUARri
	 7rMAlq+q9vUIMLXsHfd3ySh7hbf+L0fX9d/HHABcn1GEre4ZcqYwBwnH5gnlD9olJq
	 v4eiRNHbmAIQo46XoUnLKAxCmYXU8FtmPYocWo/PA5T3KhJ2ZwwvuZK9ogTSvd4yuD
	 3FxU7MiPX9IekP6aFfwZQZnsHhVmj8IYelNMaTehefnjp7JG01oKUwobzaG8dBLbD0
	 Kcx/8hDdEsDYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BCF740B18;
	Fri, 30 Oct 2026 14:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ECF6D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CB2C40AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LksHMWEb657m for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A29540B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=MOdc0gN4ec0p+Dtp2+rJo3KRhGQBD6K8mWhvy1yPaYCV5dSBFiTdvesZKHUePu6qgGYk
 Wt0ZxpaJkYNFR3B0jDviSTsQO2Z/cJeuL2YQr/pHiFp5a7xIyVoLir/TB/IStbbxePONJ
 axKP8gdV0B9qoSnryZNlKQMTL9ohtO1osx08PXkqXTCk6Rfez1CS3abIVvcRZwzfWOM6H
 D/PQpZbOjrzwyQCxghbF36pF4Woj272JdnYL1X8m97BE6ioU6onThtFw2VjJJcZTzguPm
 4kTu+aip8jGEGO0LWeyj3Nl7S1d2yI/1hzab5R4m8m4iSvX1Dc4LW2d9vx2Ozj+PhMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BP/ct0f3E4mrSMQv0XaUQSeIyYLa1kIc0DNQWpTZkJA=;
 b=nrLvoLIH0dQaz8bzsR9W2n9UBwEXVHagHrXs0atT9hFRtsbcJ3SjqMQIj7Um6JT5Vd3+
 OQsHiL06ZCISUtZEWzap1AYqvdo1A6oEm/VFoNj36qgUWStNLr0iXue2JH+bBSE+9/9Oy
 0QMhKTyxJhXQEpTmELDynkrNebdbI1bmBhmWCRHwSHjdI2x1cLKco0BkypiwDJO2CtsdO
 zrEFSY9qM7anKxOfkqrxJr/UvU7284U5v0uXdrHkJfBpLgsr+efWigGTO828jDvKztYR2
 sCJf8vz7fbGWqTXP+54FoUiyXMmKGQE/xVVSiuayxHCnWQq1qIqMwQm92PKoZ3xhp+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A29540B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A13B9D38B; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0c598e3e8124fec52ab9f8c8438f85e277dc6924
X-Git-Newrev: 76cf318f1e82995516713a872cf3d323cf555df8
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.3A13B9D38B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add
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
Content-Type: multipart/mixed; boundary="===============6922268144848314115=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6922268144848314115==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76cf318f1e82995516713a872cf3d323cf555df8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add a simple test case that imports the module and does a simple
compress decompress routine.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 02201ecb444cacf2c76b7e452792bb8bb3674064)
[Raphaël: solve conflicts in DEVELOPERS]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                            |  4 ++++
 support/testing/tests/package/sample_python_snappy.py |  5 +++++
 support/testing/tests/package/test_python_snappy.py   | 11 +++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d4b70e0523..2b630def79 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1088,6 +1088,10 @@ F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
 
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

--===============6922268144848314115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6922268144848314115==--
