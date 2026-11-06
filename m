Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643B606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LI4mjDbO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fy741cd5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEB9981416;
	Fri,  6 Nov 2026 19:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaQL2VY03xTi; Fri,  6 Nov 2026 19:16:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEEC281338
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992591;
	b=lGsnWWY0NTUVp2LU67TlFd1f3F9ogkk3opTPTZKie2ewRDhSe5oWarznrD5glBG0V2M6
	 t70HSBi9REIhzJ4CnVafFfGEl4YKKOu+WBVDHNLSH9EP8f4TlL23OwP44PGsQsqKi2rVp
	 4Or3USaFqGM04YZcybllW878jhcZiaK4BAG2k4pCDr1zbT1RoqpHPRhx4oDBgu3NkLUG+
	 /b2x7OdvoX2FPxvNtTjPvWGzXolFAUt4HFqVuLULbOjr7gnEHX7iIsdeOS0mK0tYtOyWR
	 1qRiGGvEkb1eA2bktKu4CBySLPVdcesv35MLj6gIMwvB1Rxn/w3xF4XRutjA2B2GqPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jb2SNmhk0TYmAriye172ud3HoB8kcP0JyFUKV+Ymb5s=;
	b=WiH7bhiEEvzpK4lnnEk203RLFkINkU93fWWLFFtsvrrtqxYlBYRL46F5/SagQujNuZGk
	 PCp49i5KvareWDS1BqAI3D1Qjczy1qmxzJAgu4D4JqHrcQNtFvCVN86rjIXXK8dtb1AEC
	 mxwxMnN/ATf5mNXyzO+R3GlJl/bRM3EJdhc3pHCnskmyNf6RWZ8y+qvra09czJheOXAL2
	 xNKwz/TEChLaGrfgchTXnzKzXtxYDH0gv2BJ8wqiEi33rxsIMKupFuKaqvzwmKzsceow1
	 sDyKoR7AXLf1PPEfTRBsI78p1T6cKGvQdIql1fxybPR2eu/hZbo+SF84Rdv0E1XH2JQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992591;
	bh=jb2SNmhk0TYmAriye172ud3HoB8kcP0JyFUKV+Ymb5s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LI4mjDbOUe9TGZoKHdsmYBIxybgAFSuPvfoZ+q0RtAke9OrYAkqW/2Nk/4k/Ejas6
	 ecRWTzwbyTxIr453iRXIuaOcewKyIZ0avf2FZ+GomG4zTMVoHR3wDCAlbNJagqtt9x
	 ZP1VqV7syD5rMra4SItRxoRzoNgt9823lPvnR747vAczIa6/jOGMjO1pTvWHwc5Ci4
	 Pw1FPU8JPfoKyHkkEklDsg3AQWOmFgeA8+KvKwb6LFgAG9Frc1bzUGM5eD+CIV0woN
	 z79kr8nsFQ5k39nAxFV9R8a7d/skgtlleOoygz5zcOlhPo0q2jO9PyLSYplmpdGQQA
	 2xC1W/QZcjRbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEEC281338;
	Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 378EC4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DA2D403FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Z8RXFlFJUJq for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42083400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=fy741cd5
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42083400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:24 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7f84a55cc06so695194a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992583; x=1794597383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aUwyx9VLprMZBLu8u9GXQtTndYA9301yV6oDLn+tdqM=;
 b=fy741cd5py18ZYxpACYnGBfACEEPtJODzU6Avp0ysJlphySglbDoYL+3N2LtGrqghp
 ujVJ1HY5CjItAWrGL3K5Q9xfWQCGIbK1pPEbgqYgUMrXJDFe/C4jUwBFdGdZUxiLcqc9
 lxl1H7oUSvj3BXu2I2RYTlnvqzUORFYGE/FYSUAVQ8mDWVMTZB5pD7S20hUFuO/Pveh1
 hzrZRhr2qRNE8f83GKeNbAYRH4LA/QImXEJWyr0AXDUm1XfmbMOmdg0yGAhxOCXTyJbj
 2bqcBDH7Cz6sbOTINMSKFPfdsw73VdG0fGp67OQuArLTYVspxEOW9z3NCjPwFfoUWn6B
 IpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992583; x=1794597383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aUwyx9VLprMZBLu8u9GXQtTndYA9301yV6oDLn+tdqM=;
 b=ZRB7LUZozh1gqu192JcGjDRTOdBtNWnoWbwiOOCdc95xr1zl2XGMMNgNU7I1VM3Y46
 NOMPoKSmkSMYLkq1y2A6bQnSdrxzTqepB2ogiP0S1pYf8SUy61Wg6sMfdHsgVgJXvYTa
 pAAfIgfKLlC30GHocbrBqNvKiUL+/r1NqpsS+lvrTIkAT5bZ/rVYYrs/+pVEK6P8YkWV
 cWDooGq173aNeI60WCjPEl1VEfjELj+K66hVi9pcokGFXstvc9oJ8nqak1oxhGWCz5O+
 4Fr4v3VS3y/eJzrXpMFJwQbl9MwlQf82GLpclY5RO4VogFxvTIIVXPsGxOk7IjYhDuUk
 +lVA==
X-Gm-Message-State: APuU4Z/ZlhOIJWFiEnJSBlQWJkEbtGoV8uZEfJHhVQeJe98tViZ/kGwF
 8UVif16BGeZwmQJ2L3EE9ZR1u3Dv33HAWEx4buN71r8EhZOaS/Abe1Q+f8/Lzg==
X-Gm-Gg: AYBFou02eQOUEZE5lsncRTEcAtjV+cjvdA02WieRXvaGpIp7xP04YATFu9Eudul6NSx
 O51WO/0pTKhO8VGfdfsjbYGemNgbOq43sHpDs+GW23s07j5dxW54o5A7NhIVtHj/OxiCE8ejjsK
 pKaeZbkzTJecWrshFzaUUX9ZZXTgIxt7vXCvWG3gW64ayIOU3miNTdO2Cn37I1yWEmuuW50Md2s
 0SzqEz+N+VQ8H8eBpIL3qiNSMXCh4kD3AC9Z8QgwAxsuJlsNCwa+v+XiSoznpIKqD+GpOdFoMBd
 d/+7X17jEgKp/optNJD7tBfJ/RHjL10jQDLUunbL728k9FMyZsYQ9wtA/XHqzED2ypXt2ICNtRY
 uuku4ek1J7dxPCFGmUUtiUOerpWmARPQy26CEu40VXO5esJ/ZVeg+z9gTrkYI5XoKs2nbphpWCp
 vVc6qQ+oAcUi6eMDYMcynzeYwWdRnEPGyrA82FxBHYagvmcyI7SNwB4ANgsuiitQHtA2OcnR79H
 WME/oYaErsfigyt32pF/FoNY0rWOZQf9dRCGznX4itS7IigX29BKhtSbALMG0AvpNZVtl42UuOq
 T75/HYaeFBYgV26WmqWdHavucsVrayOSWnwTB7pxdBbp6krDrQ1trTQuvS2DCA5GtvUGpOSdH1w
 vchLvyotOjv6e70SljdTWm8zStP5J8N4jpJfbjMzxPpCscL+3OqbvIPOcOu65/DRKOaZN6q+C7S
 YgBa09zaz7NTW989+0U2nYkTPf1t56ivX9y7fqtG6Ri24NcBIkrk1ZJSahj58d3ZddXOzwl3VKQ
 A==
X-Received: by 2002:a05:6830:3488:b0:81b:9d18:761 with SMTP id
 46e09a7af769-85f1cfe1fc0mr3115202a34.12.1793992583178; 
 Fri, 06 Nov 2026 11:16:23 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:49 -0700
Message-ID: <20261106191536.2120153-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pymodbus: bump to version 3.16.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 2e05002a8a..d0de4f0614 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  41a9113d266bc1839563a681c57846ab  pymodbus-3.16.1.tar.gz
-sha256  19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33  pymodbus-3.16.1.tar.gz
+md5  3b5cb50df8ca176257ac699393b802e4  pymodbus-3.16.2.tar.gz
+sha256  64057981fac117ed4b75ea8ef6035369f6ae803247700a5efdf75d76a2be8aef  pymodbus-3.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6f87d54c61..d79451b478 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.16.1
+PYTHON_PYMODBUS_VERSION = 3.16.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/65/ca/2552fdc467e87a04654af2b6cd994a29653cf767e371792810e15f4715f6
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/44/e8/910c866f041769d323df554835965571b054b10e1a3265427d246c4d2ccb
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
