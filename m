Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49D606A325
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hi6Up61b
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C3281217;
	Fri, 30 Oct 2026 14:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ9D-8voeMDL; Fri, 30 Oct 2026 14:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2FF9B81223
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369211;
	b=WowOhKoWamxIFvFls4YnH5BwZp06Qabh/+1k2GZ3df4uNO95dQPQMOharE81/k5NMP6m
	 w+sCp8gHeL+uOegKUreYwpYTgyKOURkNCbWkoc5PEdNdu3lLo+BhSIDHvyEtj8ZGigHRi
	 p5n+T9VC8g0taNXCKnR1oXYMQa9Lye64y4HsTrUtkFZEVadGteByy0oljEAfVijLQgs3x
	 zNQcxHi+WMfNZ9UpTAEwM1RAE27x/Lwcjao/AYYQJkLpi1Jf14DejQNXUr7ucW7ec+XTA
	 QaGgEOIcArCxMckpBfbLBZa0fnenmWbhDe/2Vf+nlFTVpzFMIenLGosu1/XiSvrZi5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tZYPhaUmIYmUQCMYtLl3njoKV/hHsFQ4lHh94pZ5NQE=;
	b=XtFcdFHrqBOMykKHeieKj6dOSHDM0FrXaA44Eko2KdpqN+HFeKOpbKtu5vsI9zXBZXDy
	 rvFDogZJk7AV9Bw1gD58FxP7PHbPKQ/uUK/Hvz++fTkoUQEWPnjeVOUloIcYCnLMYqB++
	 PdOODYiflAdPJhfW2Da6g3gLxSkd2Gj3RgRsXOtD5Vu5uzQHevNdjteS/MzC2zHQu1pBO
	 gwKYmkRJaA5pdwTTl7K7o8MoNyPmh4R2lA24V/l0DadwqZ7mGUacDhBQDM6hevB27/TDV
	 Nfqa4CM9m2/adKNF2R9eaS8l+Dt3BOmIugPY00iWsLS4HSN+CcQMbNZOp7lkFUBeVAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369211;
	bh=tZYPhaUmIYmUQCMYtLl3njoKV/hHsFQ4lHh94pZ5NQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hi6Up61bjbtDCpMaP9gJRRbOSTvTPGmVX/6DltclbgS02koAoGHmu7U8xIDLry2lS
	 5nwlqemZTQSw+LfBjVjgXQ/lGtCiQnFZfCXiTtmTN2Us9irGIr8/GaJVt/voTwBHa0
	 uYJSlbq753G+Vqly15l8IV8RnQsIidqhDmrUPb8GXyBpvWL7sbfWWVVxpBZ2eyJBN9
	 7oStgmLp6O9pGpjD7wow1FnkYr2+Al0q3g2bt7zeuegEgCfxhg0scLDNgYxaQ/YYT/
	 bET9WWvH71gnXu2FVi2TPJZpoY0rGdYsmkTiZfxxkXhtqDYkJGULZCNfDwPc0RaEAu
	 AzWDKicr3oWfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FF9B81223;
	Fri, 30 Oct 2026 14:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB16CD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC03560AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0BcO3a_j17n for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 216F660ADD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369162;
 b=BgomqwWi/pzr3OYQAQBtMipNab5ASXoHv9S3iw0MaCvraR/xdh7jf8UeVcAv8wKhwXwB
 /CTLHwyUk+Ps0a00eU0DJEtu6UyktSceU170nnx4C2KnQRoeqwObjT/Oxi/Jdqm+CRYtI
 Onqx655HIYywzIroQkId8wKAjl5NEb6WmDpQyjYC/irETC/E8rKQXcwfQgHW91cOF/oxm
 m70lQOGFZY6h9D5dDHRZXpyIY5t6nI0l8IVwbI57+MUXYK9FQ6vmbw6GmUXJkHNRQGI3k
 zv2QIWAXr0pt8qzOaZ53s3Ey3xqXAvOsYk/pQq3GdkumT8wikvT50pZaZWYfNvexotw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369162;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dVekMDJk2C5AuxFFr33qX7vwFzhP5zojMbIrkN9JeM4=;
 b=rUiScQSQ43KN82yXNp0hGvCP5gYvFQS07bPgCh//Zdr9LLMAPiUtUY1ddftbLAZB/Hy0
 fW/WxACx3U24+qG8Ho+zrNfB2CYmjFMHKStiYpgmgnr+F+idkGji1Jbzwj1OTGNDESyRP
 jH3g2n5fNkfhaIggArMIqWbY11XMDgtID7N3ckn2MS+BATRCml19Zd9/zxhKdUB5Vugx5
 w2RLtdkTUP/aooA7H3Wg7cXsC1N1O8GEPB8qxsWBHm2smrl8fnv/ipxNzD4I7CavpGFZK
 /N65xCLZYs83+vHP2bOtDwpzR3uPZ8nSwSB/YJsa4kGgCFejB0l4ZeQVP4PyUJ6M2VQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 216F660ADD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EE2E9D388; Fri, 30 Oct 2026 14:04:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6615c3ad302541a20d8c5a63074de049425ce1aa
X-Git-Newrev: 83a16590866c7c1071dab2c970e0c3aa9aa828f1
X-Patchwork-Hint: ignore
Message-Id: <20261030140434.2EE2E9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pip: bump
 version to 26.0.1
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
Content-Type: multipart/mixed; boundary="===============8441847279813512856=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8441847279813512856==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83a16590866c7c1071dab2c970e0c3aa9aa828f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pypa/pip/blob/26.0.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4326be19baf1b9fd997ee3a0bd4d4d66c04c1215)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 24d731d9e8..39a15696c3 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  31f52f428372020b80cd7518862fbbee  pip-25.3.tar.gz
-sha256  8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343  pip-25.3.tar.gz
+md5  566bd094e3a0c382ba2705349c83d55e  pip-26.0.1.tar.gz
+sha256  c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8  pip-26.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 95bdb64963..aa02a216d6 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.3
+PYTHON_PIP_VERSION = 26.0.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fe/6e/74a3f0179a4a73a53d66ce57fdb4de0080a8baa1de0063de206d6167acc2
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/48/83/0d7d4e9efe3344b8e2fe25d93be44f64b65364d3c8d7bc6dc90198d5422e
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt

--===============8441847279813512856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8441847279813512856==--
