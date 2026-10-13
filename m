Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB9ECC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1307A80D2B;
	Tue, 13 Oct 2026 16:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeGPMdMq-Bh7; Tue, 13 Oct 2026 16:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BEB980C73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909796;
	b=IdLTGs/RvtzDsVb4DEDO51wRIekcgi7y3f4nKlXqoCnMoxlkOAuOVuQ8Uk9b9mqblltL
	 zU5V3I4IOc5Nv7eWIZ5q+FrNQyNpZV/96N+mzbMhHmK5GZ4+RiwkoXYisXIhPSOUeSfhe
	 pAFOEA7uhsJyQ64OOspusR3wsY7NnKYZKndXFd+q0Equi3XNEAxhx9U7ZuJTcYYJFc5q1
	 8icpT1TtIFJ0AtyPFAJvfOYso0aocCsTzC+87Yneob/IPb1OQLhO/MMH+kFrt7Y2j+q9F
	 VgvDa36wTdzsNXDOI07/SZLBViUJpl7gPxltEthSY39HvWwsk+cFYJQ8WpFtrugZGfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wj7WcA+QAPfETSksJN5ldVem8pFn7qIFNmpnkpvtRlU=;
	b=L8o6T7iUPVaLmqyTGbjAAs91FBKE2fJbHrbMiRSx5HlMX3+VX63AmUEvhHYE9bUctpky
	 o+zOOu2Qny7MA7U+L3NdJ8bQIP+uwvFRw6e6qFW58yS1wfhgu0GUHYtreumkttQ9ggojT
	 hD7KYogrDoSqHIUBkyD3NhsYZkkmlmXx94oJkU7TcVd5/7wr3YPTWSMcfCOBLB3NPH4SI
	 OnfUqmSaitGOaHNP0OXrd9PAoX7FPex+EodlWxeXUTmklzamyEYEW9yZQKrRdTnHDozJm
	 ypu1a/uA9CY2JLqt4d19bOlOgg6NsxJPdQf2cXajBLcV5Z6C2cyoq6qUsuDc/SH488w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909796;
	bh=Wj7WcA+QAPfETSksJN5ldVem8pFn7qIFNmpnkpvtRlU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mkTQPRcShm+RH/yQsu1STkkEv1OeULeXFalB9R06XzCGWyaORXhbwA02oLZ5SKFKz
	 ENLh6Z6SWBOBXi2MWRpVdZoI1ZJMeCJj0VAUKnQ2cH3RT2eg8o/dcS7JOZ5/+xUb3u
	 O+f0beXIvrh5nGnUAyDfvk0s2D2Ut1W5kkynEwZg/emAQz81Es0rOOuZjJwt0BtXtT
	 LrIme0wRNWh6m97REkGvGs91QVpu05NZQoCgzSsJmSHHby5HY85v2MAPFAF3JQXSDE
	 uEjzaaOhgH0U3niBntWze6EFQ+4tKGZvB3fL9BK+qHRvD8smSr78VavOzC8IhHdB1s
	 yDYG6kdlE6I9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BEB980C73;
	Tue, 13 Oct 2026 16:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 039DB1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F5960789
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkfAu7gSWgcA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC8BE60791
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909790;
 b=Ur/+XyNlxmW/QyAeIxOYNFEVxaxnRCms6dYDcBZ/Ma2YyCw9VzCgdcwoGbPRI5XwaAdo
 FbTv9xqKpwPiX6Pe/7f5LORcAXrvXYw4+IKSshggSZoFIqJ6YFEHtr1n0qBuI9S7vya/0
 yBjVJaJQSSssy6hDKLmlu4M/tTFyElxAfb0w8iCWv5WF28xlodiay2dcBv79uxqC8ZLGb
 A9A0gnWr3MwvVkQ+/+T46MPOpVWFemaHMXHlcf00dmbclKIgrP1G1aNn7K15uTB+iw4IU
 UL2VKawGTHpQUrQu3alcCfOlUyKXHlYLl+MHgmYXp/6VdmtjeOF3rJYIHi3UhboNFqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909790;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Dt22WEhdvpogBihu9+u4j6nD0J0ZppvsewRw9TWnwXM=;
 b=HmY1Uu3dHycVBECkUXX/Ue9BACyWjBb+P+Tk9WMV7gbGSZLmhfLkmlsalaNmqgTkdmXY
 ZOBAzS3gnQJSb7uaJvgE4NNKQtW3SBaa3iM4642MiCa0QWyPc61M+u1nb4IedjSHfzz/C
 mYiuuqxB8pNwtYzWfA3eeVnRIcaIG0epI01UVA53ArzcZjIEGWu3huMJ8/qG1RVh6kimF
 jU2jOL/fbbZx2JeNwlk2vb/LfyAbjIhlabbwMw++XH35Qnd9s4hyAUMdF5pZQpASe8oiK
 KxMu9d09ocaLKVRBMSHFV4dQR3vDkoHxxEE1nMCWso6qA5rIdc1CAtIRbYqDEIGqpQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="DU/0gU8G"; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DU/0gU8G
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC8BE60791
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-4877837890fso1624056fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909788; x=1792514588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Dt22WEhdvpogBihu9+u4j6nD0J0ZppvsewRw9TWnwXM=;
 b=DU/0gU8GL3Ei9To/HYVUPXi0nAzWM6SV8z23NJ96nj2nRuzaPFKdhntAm5foD/sJF7
 jWV6t3qtoHE1vIgpn2rYDY+ysR+Nnuoz5Pmj54QHAQQEqK4vWRUTwLlXhM8V3vTzCfkc
 kszQegySlHnfA9s0FfCr7Pv93LedxmB77p3ieeICs6CFQB0PIdUuroRaVGxp7msjmM1W
 eXFVFRNRGBFqjVJBz+ykANVfhxqEWoXOlW8C5AQsygYod2oJb+KNm7LBDIYBGNZAIPOb
 8PM9FpPlYEQq+GZsUqG34c7KggCeX+fpqaFdQ1i3FbfaEl+pvcwKTuwmTylAzd5C1kh5
 5RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909788; x=1792514588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Dt22WEhdvpogBihu9+u4j6nD0J0ZppvsewRw9TWnwXM=;
 b=ORMm3ejlfSnk/0Npx2CsLOrXnMeaIZPZvnHhgw6GZYrx/HVENF0tEwrKsPlThMYLZB
 ufqctOMHCoHeAzkLcoCVldFyIRaKS37aXjGgYtqhNODvbDD7BqoamZhYRLpnufexgIgc
 VFFDp5rTc65fTVZ3mb3DYnzbJZI8posbhvn+wSyEEV9rDezvbHnk08JuQ1OEKd8v48yy
 mLXUoFEEuKisr2slZBq94Wguf/7UgadD0V8D9NJZZGmnXcF05UFpBZceWg7WgraMwatr
 UYZIRMODEwwAM+/AZsAxjLU3RdukSZ8tMxuYdmB0JjnJj5WPWQwJG+n2OJ6cVTSAgl3G
 YMyA==
X-Gm-Message-State: AFq9FYK7wgLHC6p6Xf+csc6MQ2mWbhnpqp37vouaZDhW5g8rvsqXHp94
 Wcs5vRgd1jgNPRKDHQg1pSKy0QwTgUgIZcIfB1qqhO5AuDo174/MtdValWIeKw==
X-Gm-Gg: AYBFou1nhT4DJzAEbftyEniHZbnEyMNXAr9X2f4mXq5h8krrzt58xlCfK7tp95b4AdA
 L1BJGRuPvlMHro9bukbpwI9kYHqJsxicIK5DvU2vMYG0kKm6TMpqHnBdkGXOAMazMtvaAUt+qfT
 wEKkEFcmu/gxI1ZwljD5J1ltYUpFrxoFmkRBzyDUeSYUyOxkdee26ERICVMXB0NEsHY7j5H9mKt
 mw+7YsOcQ9en3tRTJ8I2GsuyFFm2UCa2m1lOZtWVjQRxPMdd7FMOXhAKhwv0aYS5wOKU0Yygbfg
 HNDytjr9DutW3FFWHEvu6yWKuU6v/Tec8Lmgro54X9mZy+wD6tDKNyu8N3fq3RiZYHXqJPdcO0t
 2FJ31lInX1QzykiEfJRIA8ItveiBjiFPw7QyDUNy8db9GULhP+r58ouP4TVFqOl5jpvJOKZUM/o
 qm2RJzCOSokoQ9KNWrG3ujDuzp95E+5zPTwBf25w+sP7Yy/jHNyiwBtcwJj06/r+lQDAqHaeIfe
 ngZGAXPo9WCJEmRz9Y9YaDoKrire5WWfdCZOGSTg71fHOiz1dk2++kzlKZBw+OW/CaG9zL9ouow
 0xrLdyMjAJYHkkP/zvm02HARNNfeeTJcUGQBQsdxNOeD0t46ALqwsdVzBv+zyd0PoDE8c4uyHN4
 Ep6DMIMO0QJ4V5D+DGi8e1KWxy3QEp/+0yCEiDPDdWzxW
X-Received: by 2002:a05:6871:418f:b0:46a:8e29:4a03 with SMTP id
 586e51a60fabf-4a2a8937eb2mr10362230fac.13.1791909788388; 
 Tue, 13 Oct 2026 09:43:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:55 -0600
Message-ID: <20261013164254.1476592-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.143.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index df667dca2e..c59c623df0 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  8cfa79d6d32628b35a90ad95d4ae14aa  fastapi-0.142.2.tar.gz
-sha256  06366626f2e70576367714d9ab2fe8472e6c8456dba69b399f9f797ab5e92570  fastapi-0.142.2.tar.gz
+md5  1bb72b474ca0981a837e4237a0ab402d  fastapi-0.143.0.tar.gz
+sha256  1acffe48206a80917cf7dac21992b5c44b25384e8902bf745c1fd9dabcf6c51f  fastapi-0.143.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index aeed93022f..7bda802199 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.142.2
+PYTHON_FASTAPI_VERSION = 0.143.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/56/4f/f7c30a73127e0a8bbffe788369b8359e530b01ae06e2757936fa35bc5e6d
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0b/d7/6a8753ab6c1d432dc53703c3e1b92974a94531b7d047c32bbaae461ea844
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
