Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7C606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OLhDGHDi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFEB60693;
	Mon, 19 Oct 2026 17:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gYTTv7xiHdi; Mon, 19 Oct 2026 17:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 851366060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430176;
	b=pobUNOcooLeOEr/q7FAVpZsbw1u8nHPlyzMJQUWHEauXZmrRshh6CVmMY+xzxjJZZPJu
	 dFIPkZ2lqlJkb6fQ+KAH41jAgwq5Kfo6IRxNzRlLN5D53OWHfyAYjMLxOzzMQFATDz83f
	 N+h0ezxgM/OVVhdQqcrh5K/0/PwcHfSvDBwXc2PyA2hLb4IULdCrY8wT7xk/xAl5PJkBp
	 /jI6YbnMQgTKy/yr2qRNVM2bQnQRauzX+QmJmPcIa51WhUgDVqot1lVJjfIu8o4vgf/9n
	 Tanx9Yo1sBHoJ0AovM4RoMqtpqeyGj1CuwQM72NqD2KUmaNBAElVEe3/Xvq3QiqiT5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wmsT5DxTKoOCN01ENGrbMDCMJrafG6+qQ7jO2B/jpzI=;
	b=FFEUT6+5eV1ScVAGtYrKooCN0dqeOZufK6WiwtFTN98ayNepzntoL1JmGCyMrEd7jRzf
	 r9PUuIiYTGIX3ZmT7fsk6vscCb7f9xDBwfCZu3I3pphMbmXNQ0cblCFh0vrcjVOPLB2R4
	 HHBv/t/epcfqNdWlB6giIcNpMd/QRB4e9CXmscnp581r9lAxiV3jfQMG63J/6pBoCE5Bt
	 31oGZlwR+fLaCQKk/n7VZofsf0LQhEGzE4s6WqphmasbvIFF36es+78SAFO9b5XA7p6S1
	 lIkSLciNncLePeFyec/bzYrqi9cRdMmXKOwi4SavUIUmwkoABaboqGx/jhlVoOasgXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430176;
	bh=wmsT5DxTKoOCN01ENGrbMDCMJrafG6+qQ7jO2B/jpzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLhDGHDiE8T0XvtEjPWHA14CpXu1QXiJoMjRfHQVjiWCxABB2ELPwPXqDozpPwEEv
	 qO4VW2HCPAxwKCRBpjDTA36fUbGD9xqr2hs+kxllhwta3xoi+BUmUh+D+etNj20r1p
	 aMZwg1czjHRkbXVZUrHLf+Ttg0xDqN5nz+C/oLaO2dujwc/BuVT/B6V/tGuJJh/LvQ
	 bwJ1IKpYFdALBM+mH2YMTsq3WyNSmjlA/61NSUezlPWBwoKI0bLxVrhgMaEat5Tbu7
	 GNPOnPdTN3Rmih6RJiPOc55A/JEs4umdXEqneQ85Cug0iosIJhXL8NNGHXl9LpnPa1
	 Ed0Gh1uPy8Rlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851366060C;
	Mon, 19 Oct 2026 17:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0976723F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF75D40179
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzEhPT03w85S for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 468A04008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430174;
 b=C4E+DjfqnmkxeoJNvNlLvtBDj11HgdGZdq1avNv9gFj7BnUNciHmH7Azth3RTbYKBCOq
 VKpT1+/fWXhjlEvIWt552abT5/85WhuNymDV5heguRjdyMKDjB8UN6BDeRtP1XnN77loL
 m1qrJZN5Ixn9p1jJ1KqLYNfx6W0vWVxZS+VZUEP4du+VPs4nV7DdwhNtYSl3uYQ4iKZd6
 Gkr7GEu+UklIt9Wq0U29eKMx2+v/owoXmbaPZNVsfgJSp0bLwjB1Z+KhjdyTIkrKNF5L8
 4+nl2D3qOjiVNngQN4sDRwX1CViUwVHsgqQXNAI6s2+gHnHCL3izoRQ6R53wy8gV8EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bespm8uL2GzMp5nyzezQpmDOXvtT5+UZIMpC8UfyyM0=;
 b=T4oz2+24FCfpegaO1e7NXxKdFFhvyIatPYM74+FiVA6SSyqLwvYWsp4pvM3hN8XgJOte
 u+tlbvfHNr5gGp1O2rdgly4FFr2i6YnB38JiEQFz5PJDh9pVUOtAlO1yFXYvjY1b50SsY
 m60Th9f05+X8+V6JaTWa47YVF+6VTMqZXYrobceemt7b0jPSoHyoNI7HevTtT5s4JaCNx
 WQTHHMoWIrvOxCNAzofGZamk0rZPTMGAmjnF+LPOY/2PO56lucN04njO+CidHf6NCV3um
 I31W22ird8oHao81ZYFdlkTqSXDvAlItIrXRMdN3S2u3gdgry54FkZkovNys9G6M/rQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 468A04008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98BCD9876C; Mon, 19 Oct 2026 17:14:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:15:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8c315b62c0cda0045616bf81ac08ed09c343621
X-Git-Newrev: 02201ecb444cacf2c76b7e452792bb8bb3674064
X-Patchwork-Hint: ignore
Message-Id: <20261019171451.98BCD9876C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add snappy test
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
Content-Type: multipart/mixed; boundary="===============1283720704593210029=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1283720704593210029==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/02201ecb444cacf2c76b7e452792bb8bb3674064
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a simple test case that imports the module and does a simple
compress decompress routine.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  2 ++
 support/testing/tests/package/sample_python_snappy.py |  5 +++++
 support/testing/tests/package/test_python_snappy.py   | 11 +++++++++++
 3 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f10f855ac..f46d09db5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1147,6 +1147,8 @@ F:	support/testing/tests/package/test_python_pyroute2.py
 N:	Flaviu Nistor <flaviu.nistor@gmail.com>
 F:	package/python-cramjam/
 F:	package/python-snappy/
+F:	support/testing/tests/package/test_python_snappy.py
+F:	support/testing/tests/package/sample_python_snappy.py
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
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

--===============1283720704593210029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1283720704593210029==--
