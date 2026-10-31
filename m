Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F23606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fp0rBTqX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9wDFBhV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E223E40699;
	Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDL2SPe-sEgb; Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1732D40676
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477969;
	b=AUZBKjS+fX44LgZmcvWU4j8LcDqjw5OJ7kZ8IFXfd5c8OoRgn5kvaeNuWrvmI9mUmq3Z
	 KhbZD69T3S2Bo12mhgwPQ7qgH3ivHAFbv3nx73EFFBSG9Us7LGLRtT9fUm0dZYGbvXTtc
	 yp/h25RPKZDs0VcBLtzickLr9lQcCT1UTxthMtPhS1VavT4mi5A01FPN2gVK5JC+cFsKg
	 4piu2rWtv68EVXSQMagJSC19gYX0hVPxpX96+QteE8xOtAmXdtt+0PErz1krc43h4tf3E
	 RkbsgL7PIjXOzeCEYVlcNuIw8kTblyg9hL2i/IWcfWbgN0IL+EXx4d+jFOQICsnno4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HtGllO/uT7xN60303t5JrbLTmyOswFLJZdl/eIulyQQ=;
	b=cxryO1IMT6lpu5XjqGVCu8rgUf2LBlbb6VWzmOBJKgnoo+DNTPzJDg+fp/RzRkJDAoj2
	 6eJNOyMsyCUnZXqOiQVUijD8+8F30gx6F80PH7fQo2r7lDO1HfyoOyw4toiknDI2QhA8j
	 mH4jTf0FE+6aoRi2EwwkLVhSjEoFZnV8viKoxqJsoQQOYoYUBu69b3GMsOZxO9GES4QnX
	 kyR8rHCQ/HtySTcRqOE+6t79aUkzDFday+cBrjf4XNmmhdH+i7cEzoGd2IPkcNHZ4PVHT
	 fX8YsYaeaSOp8k8rfyVRb2p7+n0Wcv/CdoRs2yy2MFali+3mS4BD0WS7ygkKZAjOdVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477969;
	bh=HtGllO/uT7xN60303t5JrbLTmyOswFLJZdl/eIulyQQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Fp0rBTqXve/v1JRLYHOG30OIY1mqANrnA0UUaNJiWO/sEgU2QIM0JhA03XciV44J1
	 QsV9O9/s8nBbhI+y3xINUlOebxc9ICkpYSLwWjXyuj5J5mzDXySrXp2K/zvVAxqvY5
	 eSy+5zWe008xOdVhiltt5c1i65X8FrNvednhyWScyD4PQj7zWgyKpJ6oAOcrpCYLn0
	 FS5U5XRKNxUlR+OT8IoMQgOCH3msm/cwRLjK8nAG59ygULDf8cCCkrCokJ47O/MN8/
	 quB1iqsxi8lDwGNBxTAMdvdCj+70hlvLFjX/mRZJI2Noy3USAhQGK4n3oyfVy0xHg6
	 EKLe+y3Oz8bzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1732D40676;
	Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2D3380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD9E80E42
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4Vj-LSd0bK7 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3FDB580E37
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477964;
 b=ifZmR8uty1Jkn6ryfACHxPxb2I90mdgoKsk+isit7PHl7enzZXWivXrxpkQyZ0r0aLhV
 z5KAI6Rp5vtIZpEDdkLpObguZMvePcNANabIn1WXgUa3Kf8wLNrV4GfQvJyTHw4Drc07K
 zkDBH9sPEPbXu1SwUP9rtcbIaHjHFZ5ZkbvZ3+BYsSFDWjL0ZOwckYz3/YSVCKCae1fzN
 YeCNyXr7eCyiCBEcpi2cz8Pfo4p90pL4g12/GgAG9MvkMqVPXLWxBq1zvM3gia1uLbTca
 gdRZmE0nXzfJal6IxxitoUw/2GZxs2r4cFYGcxO8+ipHeeO//YXs48vt8FFHoUuVeKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477964;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=h60DGIblbs0EL5ORzWXp3Nc0ypGsI2uz/cPGSVM5tng=;
 b=F1qP07V5Qj6AQWuHexWTZjzaihDK/pp/vx+/UvyGDWKz77855vZhEtDY5hwaRYcQ7woH
 VJgSfpYrdpZ9Q/rriwjhXRfFzlW1gGOzK9f6SEqZSV3kwWC3jQJMeMK825JhH+Fbmpgya
 Xk3t9qAlr5Hz7kqI1C8smBk9u7IiOxVbyqDsyadrfrSaeql41hP+e/ll/obkzWJE08Sya
 a9iYaNEYH4YFPf+D3jB0E5AY8+rtK0alNHO8zGlikYIDPxCv22OJjGtC0kYuOPQ26E9Ls
 I+4pEtJWIkGSfPxIeLNLlx2KWeYJxXyBO+u2D+JebxlykLe3b7Y0yFM0KZo4oDKe3Mg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=g9wDFBhV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=g9wDFBhV
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FDB580E37
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:23 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-85ac281604dso1068456a34.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477963; x=1794082763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h60DGIblbs0EL5ORzWXp3Nc0ypGsI2uz/cPGSVM5tng=;
 b=g9wDFBhV30WVbGtkt/QW40AVBYMRFLJeEjMEBFM2SdwznIcrRDbFg2HlmgEhQ9zg+6
 mORQNa0xOsmIxefBZeBjV5qc0AaluWUUAyjcSXz4cdBh3Ixtpijr885KQA87tAd1U/hk
 kHxWVmW+vHX67hmBdQLyvC/3XzzbtUAvV8lSdBw6oJhdOAmknPW1/mq3aFbLxDj/bn71
 a/5PmoInoQSm80wnOrDrojXklyS9p7bOZe3XmECyqyEzH90msUvhBSFeV5WcNqhsWMnH
 fEmgkyV+SWIuWL/P/rIz3+RSP+v2otJNuI1MbEi/vfa+0+FO5W6PqiHJlO/p9P//2Wnz
 ovLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477963; x=1794082763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h60DGIblbs0EL5ORzWXp3Nc0ypGsI2uz/cPGSVM5tng=;
 b=IToJtVCBwXjrrTxKPDsccTH6K30zwAKpzZdy/uVYj40dwGHsaItGfgpFFGmd79bkLU
 iOMqF6AKCynP//qZJYQ5UYVr+mxG35QQttblbLwxWLG/iXf8Aq87zi9Y0kR93Mh03coo
 2BppyVFoboWsVBboDM3dCdcXNyRoQaoCBulGbDzVhvQRxmkB1QYSqD2R3tIAhhXjOABI
 yShg2Cwx8D29m03Vllnut9U4ne+fczYF1CKMiHCSH9fYhzrFM8fJHVpV1Gw0RNmnf2Ji
 RIyGFiIy7ZZUmhORfzFmCBX9yPfdn6fcWKXD/3I8v0z9YWT13owSpLgKy1azPFYbXULZ
 Yqvw==
X-Gm-Message-State: AFq9FYKdZGYtoYSDnjvwcbGpre72C/dR+ve1wrToPKS1qEy+RM+hWSr4
 cs8N4K4J+Q7byVTJawvwq/p6Gdbu0ynZJ8ofoNsukW48BvbPFPhIVpwcBxfwlA==
X-Gm-Gg: AYBFou3pP2Poytxs/hZjYctwBTFwJiqzYuLBCzIhNvRE3sVWHlO7woSJygASbK0ilAX
 DJPnsy2ntFo5nhuMCGuSJKPx7Z6k5ZRs4RQJE4rbnb5XAWpAQkBwb97uwMNYlp9vqXsNROt09DP
 D6T2sCAUdvRdUl/v+Aq4GXuOB7QN7ixXfAstxUfI66GE+MHNNyTZNt8Bp2gK/hv+m0PJTprgEnm
 QJMwYLWGPTgIGaNXaRcGuerJTxd3yIvn1EwFYz5HKDwYt+Xyfk/VEf6lu/8gGvLJ69iJIlL3nJ/
 w99v2dUIAofG9wj049+R1B0MrpwuCQUYUWKRcEsAZA8HLb41mtivne6Yho8DKzSQXesui66sxMt
 77bANvwdYU5uFKuyM0XPUNpKqntg9tLHzE4ZhTljkBOU2q7W++2HJDmKdj8AfMLHWxGoeuaCQas
 46LggQoDwyOd+xuI1X2rCzfWkNTJFPTX6UPVwM/RJKL2OEalcR5Qv8+uO+6KytwGWvStzo69f2s
 Dvltt8Itw9CEDGyn9UOpCBXbfycCeAZZfjk1Kwl9uggBGHUrUALPNG4CkTgWQ9LR4XhPuUBF+Ek
 7a+0FzRcTrsuHXjEtJya7eZF424T833LdHLUGpwBMNRAWA27I1BM+nqePAFhBeluVu9lItMEL/P
 QhwOnU+XwZlihopvNhRhHQVUyiRsHdoUdEXcdAK51sgqHunNDsXmZxPlLbf86Fz0sYp8GdudXu5
 dbgGECQKotu+HnESerN4aKioEyZ0uY67oe60K3daQvEWnhu9vGB2uCfT9GJgPL597OD0DDdNd6Y
 Q==
X-Received: by 2002:a05:6820:3401:10b0:703:3ff5:ddc4 with SMTP id
 006d021491bc7-714f24f9ac5mr2344282eaf.11.1793477962714; 
 Sat, 31 Oct 2026 13:19:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:04 -0600
Message-ID: <20261031201918.2850153-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-dnspython: security bump to
 version 2.9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix CVE-2026-114605: a crafted DNS message can cause excessive CPU use
while decompressing DNS names.

https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m

Switch to the uv_build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 01ef94b889..b5ed1a16a6 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  5f2ceb19b1c269f9e1ccef8bf2a1e8c5  dnspython-2.8.0.tar.gz
-sha256  181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f  dnspython-2.8.0.tar.gz
+md5  264d7e3c65df17a3a23c52b64fae6c76  dnspython-2.9.1.tar.gz
+sha256  9a6d30e55f8dc63e6052597666112bff0586b95a2474a9deda03afbbf820d37a  dnspython-2.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index da3cf223fd..404676275a 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.8.0
+PYTHON_DNSPYTHON_VERSION = 2.9.1
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/91/21/7fcd6780f61e9756aafaea760560509bb4111375daa2e23c1be7a89f33f1
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
-PYTHON_DNSPYTHON_SETUP_TYPE = hatch
+PYTHON_DNSPYTHON_SETUP_TYPE = pep517
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-uv-build
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-uv-build
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
