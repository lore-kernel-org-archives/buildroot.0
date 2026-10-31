Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84404606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rIWnqGbT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQQ7AeEI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5AA40A93;
	Sat, 31 Oct 2026 14:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhqs1z3QIiON; Sat, 31 Oct 2026 14:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5EA4A40A95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793457388;
	b=crBmy2VGZFiMdeTr/rdk4+VrAiMTy/C+upOm6/j04etpcwQE5aaHNXkKlyFPXoV0NStn
	 i7KvK2gmCVE9iiTB3isrRF/7+E+luP0Xt20POoTeYsnvg+WXmOemj2RmhheTk9anZrtSs
	 t0tpzfHmhFd+P0oKNOAvccum1E7pUBSC+npUE2ffvgOn2DlMFxP0Wq3ifaL3uUPJ/t3wb
	 CPHbISj8PIckR/viXzff1DDfFdCm0v6aaz2lsCg2KEFKDY1INDyjfxlR5hY3tSYPIVWwr
	 CFId6/UncQNy29Rt/AamQF+7JtVjavBmYcQhiGuOHQi2HLD4MIRQhzwek9O3ntYwavw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793457388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DsEN383pUtTuVDWApfZaXNgw4SOigT1vlXT3Y9zDeCQ=;
	b=U8vX2EY2oFmwW25r3OgZNaCx/bMX3HveLblu+OcNWJJQ9ki8CvNRaM8MN7B0+q6C2Xsi
	 gdlX6jNbFXTO6bdQrqyxt8fLtufZM4yhzEPLqc1+6oAwFqTc/T8ddfOArLy80UvL/QL44
	 1NSq4oThyMNdVIZHm3B9VuWmayZfGNYPuKba+scBoHORA4GHoEffVNAyI048WsVVCd590
	 uP2RRpdccazY5tgEoH0pGMti0GlhQ6snq7AntCGnSmqWFiwdUIRVYDV2MR9UqwgBFsOlQ
	 as2/ngJvWzFHc1SzxWto8rNMPH79/aR+3OVkih1SusRC+A3POft7MjB3BJqiCct0fyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793457388;
	bh=DsEN383pUtTuVDWApfZaXNgw4SOigT1vlXT3Y9zDeCQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIWnqGbTvmTxPWNzGTaTGU/zaQ8uSBpQAhcBPcbJLAQH2YRosw392G6El5j+arPfN
	 CP2z4VHa/3cxSL7xxoxy2odYQ7dBS3aP1MXfpk458SHC7vFTer3V+tj9cdEDoiLvB5
	 4XAo6KMXbniPw9HuWvndc9Xfw5w97XFvcNJdc38SAnlwscxrv/RMUAMzEhcoZasV6S
	 /Gur12QAwoSM08TpgHc0F2O7v8pFhfn175zP7sNOuQU1f49Ja1fprQmkgwElHHiKef
	 Vn7cg2eh9T5Rlt+w1B0rawfnTwO0QI8cRC+wLkg4BM3FAjS2tWVPGaz6ekvHXaOr4t
	 +65o/EW1P3H1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA4A40A95;
	Sat, 31 Oct 2026 14:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 806AE523
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FB760626
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVNsqpaqcuO5 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 14:36:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42E9F60617
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793457384;
 b=X34TWhkMCU1Quw4c0L0M74Nxhf++VbknNwVwknAp6GNXQZmoWFWkyYooasGTuCNZL42+
 rAMPvd5JUG3FySPDIeoXLdMNXp3tPgGtDlbnR1SgXFYU9iei6FYlIDDxpof0jRvfYY6kC
 fJpwcqnBtRoRZQHTdxap8pXENeDzSMEqi1yD9JCgJzgHsG+xXZ56Mi22mmbBaXkNAuJVs
 jCGLDhG8x0rc900o7uMai1hcOEm4YQbUhc5qxgB6B5evRaUEBtRLMvUniy8sCKZ5LQm69
 pWhBAA2qAGrtLrQ78OvugZg1WINHSamzQ1o6mydyBYyEPLkxMdD4dc8FAo+WwTNEjYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793457384;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=aVx7vPJ+Fyel6JQ1HdbuVDkfM7foF/Z5yZ5SXtBhzQI=;
 b=sY8hSEGmE1iy0ZmXx5ZkhW0/i4ocl7+ea0NPA4WtwpIX1G9Kssrmzfk8nU+XnvZMVuX0
 KadZT3Y3wghJ3gEr3Jqet4rTIijco7eK0AyA+/LFk+6MfHf74os3HTf5PN6ENBMoX/xt2
 zzvQLqPnBULMxKSPU7EFlJoGBK0LsVd36qMkZzI00bpNUIGhSVJRe5lzubrpgWU+XSw6g
 RTxL43xyjVIA7hfi2kXENwuu3GR4lRohOTKNxM4OW9pKR52qz4zhI3W03kAfV563qWqcy
 1n6CjWh0xb8nOp3umITGi75igIsVpoknkqR6QAM1g1FPrIm8/NqdPUwNfKkGXzvDIZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=JQQ7AeEI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=JQQ7AeEI
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42E9F60617
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so903304f8f.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793457381; x=1794062181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aVx7vPJ+Fyel6JQ1HdbuVDkfM7foF/Z5yZ5SXtBhzQI=;
 b=JQQ7AeEIQ7eLg9xQu3+5YQWDI30i72B2IrGsPcoRSvVfGbWuHFdCasouFXPOxzA9YJ
 DcoverlJhdIqwiG5KktXt8b5riV+FG6Yr/vhGU3b8YdRXPndhUfvraxB2BH4Tl73TXrV
 zj4I1+oxff7kvn6cEgYHEkU9hx8JKAZRIegcZI1t9FvV2IdfPLZkQo5gV8KDQIuBvaUH
 e0aLpjXmGtngHEx9IlAovMlhzDkyNSEperzvKnPj91d5LQXiCQO15GkSvIHeq7N8q9p8
 rJvNugOgh+dzCnrj4sC9pAw6YsTf4PSsYy/4e+nk6zmk+maWkZJtj5SmQYjQEMsRHCEZ
 kAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793457381; x=1794062181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aVx7vPJ+Fyel6JQ1HdbuVDkfM7foF/Z5yZ5SXtBhzQI=;
 b=kgenpBvlthObMede5B1nR2bGn6N36PdYUG29q29Y+fUTxYAz2uFMr2EoTSItJkRerk
 WYnqrP2w3ucd+Fy41XSvm7ghH1pXeRXTm/jcEB4lqFJ+e7XnauyG3GkB1bC8sGrZ5+lK
 hQISIGyBJye+7VMhdu4XCD5VXQdPp5x7LeP0E8SgxFc8sqRvFobeVHi6SoCDkAry9Sss
 qC2mSMFIiJORRBsT4I2OkNSp0IHdxId4PVSqsHWNy2YKCfPbcUDsr/cXatXHpq6+Umy8
 S8RozGTpckGpawmbA7qw4Eo6I+4UCZ4JcwT3yZTlRl2LsvZO1pjT0Pm9uQMIJpNBTR89
 SHgA==
X-Gm-Message-State: AFq9FYIgZUsIlAYv2v2aYBuBwnM/bCUQZ+DQ7n+m0uF1h7SN56C554v/
 qFad4RtdbBPhX9fLTSwvKMvbjg8k4495k03jLVvVQmRqPax7HQ0BBWbXWL7Nhw==
X-Gm-Gg: AYBFou1d0aaM5Bu8Ra3aaJTOVouXlNpuZiyvfOeuQQ7m+v8Xo7SZM21rUzwMccUqgGM
 ddXXxfNEy4kryvCBaliPFxmCN8NM3RnV5GS6sGuovC48kxiusikJd316Nprdy//D672LY3gb/k+
 9LMq/cGwUtcYd1fn5Gr22NNqiWVSq9fzcqzJaD+V2WlvP0BCk0+MYZi3Hs6J62pDCIjYD9O8Tbh
 JMndgRGM8WL2p+GtJadujVsCjw7wPoHEydfyBZAhxVdOGNCv1nS3IPsRagNGHdAAUDpGknGkuLv
 1HAJQ8wqjJcr69CA092ep5Eke5B9MHZK5dyfC+zC/bBf/KB9e0gvZkemOKc3pRBHw1rOKxTtbHI
 Vhg67UD9L0LPZVlYM0x98GYG+Gz0Wc23rZ/xLoej6E2oFwhPlgAHh3qyF7fv+ci9NIv+5+9Wm6C
 B8XHGHxYXkXrVQDqpbzzQTDlchHsHqzkfPNvMYpS83wigWC6DdVRVIRB5UZkxotF+ngbF7YMJdf
 PcDp4v9g4oF55Im6m4/rJnbHX975MppZ4tQny2QvSc2WCIdc8PLE8zqSD7q/2E1akXYzYYf2Ya/
 8WHeUUpfPaviqKgNae25ti+Ij9/00o13LAa1nBRMUD3pvQlxG0ViAA==
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id
 ffacd0b85a97d-48e6e2eb83emr13135311f8f.16.1793457380774; 
 Sat, 31 Oct 2026 07:36:20 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789c6sm9794118f8f.26.2026.10.31.07.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:36:20 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 31 Oct 2026 15:36:16 +0100
Message-Id: <20261031143617.445438-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
References: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
 <20261031143617.445438-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python-rocket3: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rocket3 is a multi-threaded WSGI web server, used by web2py, which
bundles it as a git submodule.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - new patch
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-rocket3/Config.in           |  8 ++++++++
 package/python-rocket3/python-rocket3.hash |  5 +++++
 package/python-rocket3/python-rocket3.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-rocket3/Config.in
 create mode 100644 package/python-rocket3/python-rocket3.hash
 create mode 100644 package/python-rocket3/python-rocket3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 02834f1438..a4f7df7d6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -249,6 +249,7 @@ F:	package/python-can/
 F:	package/python-minimalmodbus/
 F:	package/python-pillow/
 F:	package/python-pydal/
+F:	package/python-rocket3/
 F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
diff --git a/package/Config.in b/package/Config.in
index 933b072ae0..e4b92fe5a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1406,6 +1406,7 @@ menu "External python modules"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rich/Config.in"
+	source "package/python-rocket3/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rocket3/Config.in b/package/python-rocket3/Config.in
new file mode 100644
index 0000000000..5e7a636613
--- /dev/null
+++ b/package/python-rocket3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ROCKET3
+	bool "python-rocket3"
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  A multi-threaded WSGI compliant and secure web server, used
+	  by web2py.
+
+	  https://github.com/web2py/rocket3
diff --git a/package/python-rocket3/python-rocket3.hash b/package/python-rocket3/python-rocket3.hash
new file mode 100644
index 0000000000..b00553fcdb
--- /dev/null
+++ b/package/python-rocket3/python-rocket3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rocket3/json
+md5  4bd413cb4a6ca32fc4d27046fda804da  rocket3-20260526.0.tar.gz
+sha256  5828422badec10e45bf18f837f14d3022c98b19ac66dbb8fbaafdb17f8d4cdb3  rocket3-20260526.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-rocket3/python-rocket3.mk b/package/python-rocket3/python-rocket3.mk
new file mode 100644
index 0000000000..00e1f07ed6
--- /dev/null
+++ b/package/python-rocket3/python-rocket3.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-rocket3
+#
+################################################################################
+
+PYTHON_ROCKET3_VERSION = 20260526.0
+PYTHON_ROCKET3_SOURCE = rocket3-$(PYTHON_ROCKET3_VERSION).tar.gz
+PYTHON_ROCKET3_SITE = https://files.pythonhosted.org/packages/ca/f7/fed13d11a5c93e19daddf1fa73ce09fcdb58b43ce2ae95a653150dd3bcca
+PYTHON_ROCKET3_SETUP_TYPE = setuptools
+PYTHON_ROCKET3_LICENSE = BSD-3-Clause
+PYTHON_ROCKET3_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
