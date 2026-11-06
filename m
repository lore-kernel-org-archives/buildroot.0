Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5C606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WOIbP75z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd682LzY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE5381426;
	Fri,  6 Nov 2026 19:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaS6tc3Zw0T6; Fri,  6 Nov 2026 19:16:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1041812EE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992585;
	b=oikzWFPZGigTrbjPTqrdPeEJlKtT9GbfzZ4GJQ+jyTMpE/EY61+s1CdO7WyJ+zrx0JAX
	 lhT/f3I9hydbDZ47Hf/HDPI3PUbRgbmtcgWaONnHn4SL4laaj5eYl6tKfHZu4Q5pHkRyL
	 nUBLQxq+zATOUQ4DevFLFSxfJCRxoP62YJJTXu6VyjIeYsBWPJDt1RyVRlMkIebxSbwXq
	 oWsmgRC3hIpNtX/Qkul3pEwWcuI9+LNwMis3myNTLWl/dtjBcq/v1Oc6YRvjG4DeXlgTq
	 spx+XkPIU1wgp8MtieOsJojMrPwtr0BjKmlcaIqvzxQuKeNPqQHvltuSVOFMikeqaCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1rGgEwUUJThshEm5UTunCf4L6f39E4rRQv6ttT0Bozw=;
	b=blRQ2nOtwB/AtK4UFbrvVS0z+q2OQ6QKA2ZOJPQiPgjfcTjnlFfmyQdd0YLBQSVuk9NU
	 wbFfGTrPe0PCLSc7qXXEv2QPPukSP64YqSCFXt/vqg5QtRa5pQwcBdeH9/a2g+LrMnLcu
	 0GoajxSYVCDsIB5yVWP9NryBQEgQezUpWGbjrRRTi+jIvo9OvVj9tYx5DM2C6VNmUJOmi
	 /DY9g04Ve21wnd2QSyqsAhi7kSy9eI8d/BGqni9ojFwaI32uy1H9yzImsA3/0jHT9eNAS
	 L5fMtNFf0sH7uZ8uBoPAo3AtCw6A4iLzI/t1DxZNv2MdhKljWsEyZEhAPZYNhd2g3DQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992585;
	bh=1rGgEwUUJThshEm5UTunCf4L6f39E4rRQv6ttT0Bozw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WOIbP75z6BpynE3nkvVF+sz4VPvdZxyyOzLRKfe8REii4qKJyJeCxG/QkJTXEDp6N
	 0Sq2B8D5tEEHnHgs04Bw1a90tCEAw6408V504Wjcn3So1pPN62xAMKspW4RCVNxyGY
	 vpHz8+TZGaDqTA7FZh/QI4mm369YDb2BGOUJi392sXBBGjq2e+GgMY5U4AaEYgk8Cv
	 XcEA3oieKqyDv0RIzHGx5pUP1RG2oo05DMTPuE7A3v/bac3PXbpcq3eQHb+joQGdRm
	 v4+EA58Hg5szI2gnUuHaSLj/LJ5M7vT3c2RYVvkzB2OYZD+Jqo+i3nkvEQBA8Aaw7z
	 rkkwdtd8U29zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1041812EE;
	Fri,  6 Nov 2026 19:16:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80FA0362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B17608FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_PMZpf_s_LM for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C484C60A3F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yd682LzY
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C484C60A3F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:19 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6b1afdf5196so417216eaf.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992578; x=1794597378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r536IlQekgdUqq5fLVoZr8Q9NTKa24PhZNGNHlawzL8=;
 b=yd682LzYNWCYnXmO/25nPOyGYTs61oeO1wdv+xSviUYJ3QQ2PtYKhA02hVyHGEuZC/
 GWyT2Do9bMsmQRHL9qFcijP5v24kpEenGaZuuUZDDG0Q7GIowLaxFaZk4YzGV7i/t9Hr
 h3qGg4XC5fTy99FBtxZ4lJtii1XTlOzPClgnq8vlyw36sLo3OZlxS/auT34zuDRwoBrL
 4g3Key6kKmDPON8Ethcd/U4SozUJVJ0sqBW/dUqQrjPNGwx9VeB6/AXJXVrIneaAHj7L
 6tgECDzoyXEP80sRtnFY7NQ3/dZ7gDuUvxqO8JuXaTI1T829AJHgvGVmUPQyYKoXKO8X
 najw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992578; x=1794597378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r536IlQekgdUqq5fLVoZr8Q9NTKa24PhZNGNHlawzL8=;
 b=Ziz4J9gpyiPdgY0gD+Xai2ZxRqyml9K4UREiwnurhQiYm5yIwm/rUfWHVFTf2xNo9z
 ffAXPfol4/1gEj98c9e+F4gPzuhaOBsL/bJ2XaBer6PlAs3XI20B2dQh3Nx1iQFLvbHd
 DhGC3jxQMxpOjAe2j1wBQ203w63psO6Po/LHmAWJxSa9kq+rx+OwBfLeQ0xnFXsidcx7
 t7O0dlJoHbxieas4pv0k5+o0Kd6bcXnfw0CouzW8zhLfns0oxGa5y2q1aNETXr6IQaIV
 ELgFyrpuhP0u4sv6xY/xf7VjF4Z9xCMoRWokOhCh0h9pJnXP7dgCOwNC/mo1pIrv1WXj
 iVHg==
X-Gm-Message-State: APuU4Z9mIPc/Gvm8/DubyqoK99NKXYNNXBegF/d80km4C/3se3wyYHf/
 il8897jzXJiLhMDA9GGxZzWkEaMp0+8ONilHLjFEyBX7/mhwiQTTYZNQIH5Oaw==
X-Gm-Gg: AYBFou21+ueP8hA2FDgV0u0Mu/BsqoGXuxqkO9dnxuOQCn4g2t17B5ZJ5fKI5/Z6wK7
 ldsLpMP6qSBtLNwT2foo+GBXJqvhnVgXgkQ9/Eo8g3xn3dJSwGTOxH8Ran/KpmeCDa5DnCAPPrt
 wPVDgUv9iFm7IW76r9TqaCXp1HMsKrNpg0lTfIXQ/anU9JI+UYYyfVebiXt0CwhnezTDo32Qwfi
 nM4q1se1lACiKOLKAidKOsHPCM8AV5ZMU0S1IeUG4bQj5mJxZqO4asnaNDggEvgbP/lU5mt21ts
 jWmkjk1vn6tUe9/xTOJOf7Z0jzCJB4JKeNBdOM55pj4HXeUTWpkk9ZtNg3V7I+RTGxw1Jk8TJC8
 B1FqkhhtNtJgp3q7c0c9wHibHKJ6O7niGNS0xKAmJ3LGAQ/gZQErVLP/DOKMoo3VUpVa3ZDNnpY
 WrotHcRnlu4gf44rdLfrbTg9eeJjXaI/FdBeJC41pap4JDrvKJJae66x+H7ORhFLmu3HnwEQ9Eu
 C8lVCHwLXqQbaHnIIqqr1aTgBoxEkNlRn4k1rcs0KfzlaBaBRZfnlwft3vHSK2VKQ76Td/gPg7V
 1k/iiGqR+hfzqfsZhNPwP5d99PLE1J/9pDHgB8r6jmU4SXWQ8XOSktHkhQgTOvSW9YHV/kbLRMW
 3CiFGuvx8dSGTR6RRZsPNUwzx7lc/FL9RJ+jwnZszTi8R4OUiId0lXKcGtYHfcCpxl/8umv+dxc
 J/lX8I8E+VJFwRwe34X6L6EuG46Dn/sV6FR8DtT9kchG+PjZngxucGXSDtWy7g5j+kP9wFm04KU
 A==
X-Received: by 2002:a05:6820:618:b0:70b:af3d:2b47 with SMTP id
 006d021491bc7-716e78ed905mr1937344eaf.32.1793992578633; 
 Fri, 06 Nov 2026 11:16:18 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:46 -0700
Message-ID: <20261106191536.2120153-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: bump to version
 4.14.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index dba740657b..5a3d25474f 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  7c9ce7098f9d717b4a0614fa8656f871  platformdirs-4.14.3.tar.gz
-sha256  021add1ab113483edbcd4694f5fbb2d688b893ea30d35e1155bb371cf4be0be8  platformdirs-4.14.3.tar.gz
+md5  512d112422d0a9d29b41e5b2d0693557  platformdirs-4.14.5.tar.gz
+sha256  32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1  platformdirs-4.14.5.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index fe8d990be4..3d10199e81 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.14.3
+PYTHON_PLATFORMDIRS_VERSION = 4.14.5
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9a/6e/886dc7c9d21e2d95aceb696f1e31271742033aeef3661f6e9c8921493592
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/d7/9a/8475be631fb33ca1466915e70fd594c42a4e84b512db650eaa14f90fe75d
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
