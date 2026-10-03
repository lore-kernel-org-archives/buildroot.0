Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8343CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B382541014;
	Sat,  3 Oct 2026 07:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgXDGYczYhIV; Sat,  3 Oct 2026 07:17:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C061D40F75
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011839;
	b=nrvn5EmUfvxfB/qeEAUi2wfIKJuSQqSEin3G1xtcJRtLBlXO6bPYb3UqLSc8IIWY8uWc
	 mBC+xM6ar0EJk30ofnoRzqYs1ItbenjTN/M+Pf5vPUffIOn9zwanwAX4bTN2T8lDdfIir
	 XtDhsRe6fVDejHNDEKU05mZjXIgxCb12ecOQivmxaBm81Z2Z73eKy66Zv5eXJUHShzfPX
	 jw0IX/5TYVg+BfAe98mfnMT4uaradzE3N+D100K5F7oq5UycClnmFkSXqb7ZTSp2ugDV+
	 EgREvmQZ4kZJl3hENO4hiPOJC6EdJ1P3bNDe/a/XLdtRhVrVqftWm8fEe8lotuTBveg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7yzQKZGdJmL7dCxm9zgejSRx1oU9qdztfIRjd9BQXAY=;
	b=boCjKky4LzB1NFJ5Sy45E6CDC7p3QtxUCjTQZdBenZvE5ESrHRAkKCs0XGg9FYModxkp
	 ZPis+ZP6607+4AHIysGAE7SOKRco9VwPZHu9je0ZCzx8aGzME/vJr8Iy2hCjWEGBiAdS1
	 34A+Bwk0W9knr7t715diPxw2YBccKNer3yMbtLo55FYAZh5ff5GdozqTLOUUV+LLb8zjl
	 N5Nqbq9B/EYIQFcYxfkPyyOcx81haOWgKgMq2i5HdnjemUz31Gbfo9cHu+AQehFe8kkVV
	 559eZM2Zynu90QSbCBU+ZteFm5Yu6gphRFiJ3GNlQt6ahHWUJnpkLeQmEw5VIDUJG4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011839;
	bh=7yzQKZGdJmL7dCxm9zgejSRx1oU9qdztfIRjd9BQXAY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DfG6+Nnzbt4UeAs77SvIOTBInt4QUnEySIVdWybKcWdCAvtyIv6GRY9QyrAM0yP1H
	 qD2bnfzOTeCFtby719yMk1kiePXqidAqCZZbCEsJoF1nwwKSbkJ2zRiOdrsVMwuL8Z
	 XABQM5gCsGAr4bBlxrGpWkTGAPXSq6c0MIhXEPVNfbmfYza9zNrXZtIyjAHf1v2Tn/
	 /8+LlsdNQz7tYV9/QTmhDJi76FY83V2zzkQnpdYUdabFRL33P6cFJeVNAdYfUaC2RI
	 OwKg2Qaxk+AETd/dydtT2GlT0AeULLR7uxyf3vcYUJSfI0mgPwvHCh4L5mkCyejuyo
	 9VpvHFdgXLfuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C061D40F75;
	Sat,  3 Oct 2026 07:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C381D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E406B40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pu541HjIuWzf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D051540050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011837;
 b=T7JcHcME6DXo2tlsfNpWIfZb38MzwSjOPG83czs+2dAzr+fieRRMAkCaxEhd/ujbEzgF
 kV2Cu+WV8tL44Q2eGZB5KESxbinUplvziCvmgbpO7vWatFIjpMXAJ75/7MK9XqWlDqJyK
 ZRin+d1GswpVub5O0ZNCpqksTcYr1HlVmbOi8VNrsjABTy1h/FvEcSyG1la1CupdZ2E+h
 PdvEwMsamzQEA0lWzyiY2nWePyQ+3OJWjNI/188+NTbzHm8zzwlitBoJpFaRMqv3fxo60
 dxRscHVK7f4q9vw5gabvV1i3AW7p06XFnbXxARv3E6GkFI/uGEAqzpEu4mj6cnD/Osw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011837;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=I1xgVuFHSbm3kqq61Bc2bIWjIoJuH3AdBi/GhBIwOOI=;
 b=UOjPv8efHfvhRpffiuWEVusgDkaXz/PhIEZ5Id1ox3x8I9yVUK+SUUsurh7D8ZGZNtIy
 YQ9bmoL85i/BsAVJUCSIRzZmy5O0Z6LiM8kc2Y5XHEB3pNMGo26p5hum16/Ec1QGLKHev
 Vq9VsRIaomN3+1pymEHyLfhjnK2U6KOkYcA2+Qf6DhGGpsA347fsg3HAu/eIx+GxwC2R6
 qDFP+Z7u8g4FplZWpNqnfpaUYKFXTNNPTvK1ndAz+Rwes08M5q1AQERmkruJBwAPIw9CL
 kiS7DKcZn+gkGEcAgM1IMVA1PfwnGTZwke4MrwlYoVV5nfE2FTX0Cf9XEIaY8kXrEHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lm5FYzwc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lm5FYzwc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D051540050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010936;
 bh=I1xgVuFHSbm3kqq61Bc2bIWjIoJuH3AdBi/GhBIwOOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Lm5FYzwcRoYpqNShFg+DBhewReoP2/iDDS90461FMK6eCQ+7EZz2QYth9+ZUBTAqK
 xs7OpBVfaQxXTAcJwU+IQjWWSHDMDTe5IZbjDirr/NN7nRwDVxokUFc7BLLbJZdSbX
 xsbp1/rYiIwJ9aBj/dQRtHCEAdpvS7zaJVeQ+CUPc23WZ3dCLsT4C661JLiab/1Emf
 Th/Ifb22MHcl3pr7vfEr/0ygjba3OO/BdzkCrXlohvKtTeiETZqOKzuw+/zII/Wr40
 vhkwsC0qDd8sKN10II4Ber5Ae+byDOpP9EaFc7EwHy4RFUxQiDdDf19+ly0mWU1sUg
 /8MaHNMLqIw1w==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 r7PJTquD/cOAJINtECvVQ3RDdYbf3LP7qV/bC8g01OgQhudl3/WX72b7I8a0bv2+EbYe0Oj+zAp
 rNEXTqk8mdYh85MVqxb8Iu06XoXTKwVR3J/9d7bPNxf1dUvoX842AvEyDpt40G+p7bkmVmZgFp1
 sW60J1Ka7oNLNNUqHK5Th4iGErGTXmdmCv/wJaDkJSjTpQSIFAp6A6p7veL9qSG53mz2QUROAbZ
 QGFHxKeB8X5L+L8BOSsi5Aq/dQWII5BVvkLgtvPjM+vT7Sd9SHd0EwrYeC4ck/z5L1o43e/+d/w
 LfIr92dD+9Pn9vQzJaEXgvKZR/b8/9Gj2syqEAgeiV1f4uwJnzd5EcI7V8YfmSqaxI9xVxDXXSi
 /otbbaN9zNdDkjLSJtMuWsLPQvdX1Ux8dJubQHkn4qYq4YURxDb5tzRy84d8u4ZyRGtc52M8E0E
 g2VtBfAVrNHMMuMDkVpM6JcSNuotOMqetzzfTtqPERx2WS0GbI4UuUE6GdWZuiiClH3k3R1TCD7
 HhoShFBgsscMXw0alzUwUaP/XI35J7vzbW+yszA/a+sdq6/H1AEv9c7RQB2+h+oliGQ9OoJsIDY
 D36f3Rw50VcA1yMNxh2ch30LdL4nI5N34hkBtFuFpXR+GyGNXCP0X9cUTjh8Vrb+pFpm9ECxgbV
 xZMNAPbh4TgyzRvNSbA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2353AA4C546A;
 Sat,  3 Oct 2026 09:02:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-36Zb;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:41 +0200
Message-ID: <20261003070128.1295458-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 009/114] package/python-cachelib: bump version
 to 0.17.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cachelib/python-cachelib.hash | 4 ++--
 package/python-cachelib/python-cachelib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
index 0ae8e5f10e..f71be417c9 100644
--- a/package/python-cachelib/python-cachelib.hash
+++ b/package/python-cachelib/python-cachelib.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cachelib/json
-md5  4159f620b8800fbe104f20ea4702e16b  cachelib-0.14.0.tar.gz
-sha256  73fedcadd0ba818fb2bb9f3c7cd5fcc2a71e86286f1842f55f28d500faee17f1  cachelib-0.14.0.tar.gz
+md5  e57c5f1465e91fc49c91ef315fda545b  cachelib-0.17.0.tar.gz
+sha256  f3c7dc8d3c1132ab699681ffdf8a52d341d9425ac1401c538cf0b1d87b1677c8  cachelib-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
index 937925e1e3..ab51cb586d 100644
--- a/package/python-cachelib/python-cachelib.mk
+++ b/package/python-cachelib/python-cachelib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHELIB_VERSION = 0.14.0
+PYTHON_CACHELIB_VERSION = 0.17.0
 PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
-PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/66/a5/5eb041dbee71766704d44cf5dfb6950ab018be0fd02cd763ade09869e33c
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/c6/f4/b20875916b83f68775093554ce2544b12255396ba69abd93d8903cce0feb
 PYTHON_CACHELIB_SETUP_TYPE = flit
 PYTHON_CACHELIB_LICENSE = BSD-3-Clause
 PYTHON_CACHELIB_LICENSE_FILES = LICENSE.txt docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
