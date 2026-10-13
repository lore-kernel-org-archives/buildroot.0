Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071FCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BA660857;
	Tue, 13 Oct 2026 23:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJKOVVw3Lya4; Tue, 13 Oct 2026 23:29:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F3E16087B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934187;
	b=IaAfalU1NOrK4YacEEg9BjsHrZSOxDTjGNk9TR/afX1F9rHER3O/ZIVnfIPUnhYNJwSW
	 +0aLuezHQaQful9GemcMPFqJqjG2iRH3rXwVlj5JDBLs3y+LguDiusdSi+SjckTJugDbs
	 FL72Yj9g0QaZvNVuhiEIVc8o5Voim/8X+pSou7wHL+9YW/hdybxXCtgCP14KY/+sPbqNF
	 ZXRQD86dcwqmNO7INVh5b/UCfvxtqVca6ZDuld8eAEXQVOLA8+GjLUaf6LwuP96PKfFnm
	 3mki+dvb4/OXAHE6ArArfLxxiAMwuoXBfy9aRwc9RAVqHl7lPOum7are599wTmGDlNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	b=Ya8brSGU16oHUu2OsD28wpe0LKsLU6eLLo+95Y9OdcnpRhlNnShRN8jYkA4jXn3Y7dF/
	 kDPvJvXDNGLWrQvfa1j6PTjuiyynOEk9wA42UlX44Jw8PJjz32RO6nbVKhfJFpRkur6Pp
	 Z9ZEgkYxoCmR0AUwKoArmcOa7OqKMyrwvh1WpuhzF9cnv3dzOVO+g8/qmuH0VOrnN1qYo
	 dI0DSRRd3XjwEbr+NniT2J78vQwOwyIL8DwU1ITXwVg+N7nr3CC1Grww53J7575n1IsHZ
	 ih3Y955GNlC+GQNmGIwMCjDoeUOTu9MbShjv6pfvexUcr8T+5e7FZYrPvfhwdtO4nDA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934187;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oOQoby6KyBluHpBBFixzmYrHzT5dGoVtHBmBWOzDA49+vd1kuEp51N2oYZSktpplV
	 zsnJG0nsaqYfYCPkh/ZJzkvd1HGvBPK6KgIUI0BKgGnq161C8ydS2id1YqDtzvmaok
	 C7N5IfyHSFqqTz1o9aUkbShywzJrBIrhQD5kQhMsjizMdkxJp4t6uU0HRe8rbsx9VT
	 O3UTI6dBM+JXOghq8loHTkyDbb6m9eVDsILRUQTZH5iHIpOjAiLfHWg+/B0R0vaodm
	 MJN0VD+DMnAwrwBYMEFldqOnPETQAj+rUjBfJacXpDPxGz7MnlnwKzkn0P+/6tW9Mb
	 jzETO/wcL6GEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3E16087B;
	Tue, 13 Oct 2026 23:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A416075
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95EC54070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0Fax-uGAJAW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7D6B406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934185;
 b=r6iBvd2WqlvLxEBbGQUUqBcIYfqyfT9isKxSBBfCsUHD3GWytHrlSyiYEgDDIYnay4wM
 k5XsTSyE+FDuLVO4yBJ+H03t80qhGWJF0m66N81xEz30xR9gOhoO9SbTSoj9IJW8Aglo5
 OigV+/OJNVOHsj0YnGjYzsW3Px+ozWMRjIhWa0ynjhgsN/6rH5trDJMaoEeUmxQViKOCk
 ag8jfqZxXw2pXDnUV6i4hITqzh6g9rka5YTG6U1VAGfJzCUZm3xd9CCHXBplK+Qkkgh3g
 vK+eiQnG22dqQlznj9T+3TyirA0tYjvFjZraguABivaMBkgQU8FSNTjuEsVRZpjqFyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934185;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=hriGTwDRFp3DenRte0EdjCln8sRQfkjB9MWVHFLfEJx+s0MDFFzUwyV3R4WVbtqaCvTH
 Nmt57zrwtLLkIGn1PCvyXGuNmK3W2MIWvl/vrt5jFqcREo4eAPE1jNeC9sJBDUeQ/PjBv
 LMkK2VJoCGB4Rnsfbl4EH/QG+jvuDPaDUthdQLlvvrQfJPFZ0ETKuj5hsLFlRqowB4R52
 FIBMG4DnrsUADwilw4L9h/KwyQE2yQqMONsO70XGpuoN0fZ/yTjs9vajxNInrnETRaZlF
 PkbSEVPSm+shlv2yVwynjQbBfQEFwWz292OdiMbXilLr2b+1sdN/GEkZk3XMSuNZqyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=htIW98p3; 
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=htIW98p3
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7D6B406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:45 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-46556b9e02cso2566233fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934184; x=1792538984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=htIW98p36ekBTwR3P98ntlssCTMXhSPlybMM+2hrj0IzhNL87iu8mTYZ6Hlndz4Bl0
 +Q4IuvvU2mIxXL1d8vtodKiWW9cBo2g5UkwcnQ924E79fEkVQeSNZ4aEkIJvnX2XMYrt
 YRAjO2GeMW10hfjw2LEtj/XLKEeqAVj9W6lH5KHPJbOFQwFF/htEF+1j3V5d67IF/7FF
 c2ErFwVHecmGK6JKmhiWdD8k0REFeWIgSDcGR4ukwLNYnvKgUmTHKRlagBXxgXqIKQak
 krq2dEgY8fpeymLCRXMDAuNH6l5pZgwdrWi7xGgMbxRvMw91SXqRfWcLl7QbBqq8BXYZ
 cPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934184; x=1792538984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=HguqlhJvweJO2gpkputiviNfnvmBcz5KVNpwxX//Rw3MpA30fOaonLggN94Nm+d6Ey
 7iDdjF3S/2nMWrFIP55iWq3vVEcPaVxROJafXUtnFps/vnwBC6aYV4ubu0k5MIO8KecZ
 pLkz59y59naQlhbQwErQsxFIZgNffBUnhNDHquzRK8ehwDwsYmqpCMGnPsKN/Qagr9Kj
 9goVf9Mj4jpo9a5Royoahq3nmKRSx3LkUeJ4Vf7Y3Ej3bi277j6XSSwCjlVHR8+a/b1Y
 TU1zKrsFFn1lnpeI1sYG1XHpafMo5PJR26gcP8cMJ73Wv6tqg8Gv6DO807g4zgsHV5fE
 Abrg==
X-Gm-Message-State: AFq9FYJImeozI0ck3+SM7/kHscRCbAQlezuWAABYDgcOow2ok1RiQi18
 i6KnOJSaPmlGHpxGv3oEcc+pqPxmDsR/jspjOdjWnWHLI8J1McoGTC7Tze/ead65
X-Gm-Gg: AYBFou38DcNj12ab7hO2kcq1+IRmwsIpf36+u31ij63rk1lg7q40Q6crYdgIgIvHbRx
 gASl1dIaEbulLABztb0dzfgVeRGxHsbnh9K/A66DP3QRgWCuolRjlMbcX9pEajuXBLOdTjbUjUt
 BfPq+nmMQs4CR/3Zx+rz/zfm+sen+w+3YpQjs9bA40dYiySV312EUEPCPAFoQxdmLbkrEJtSK1R
 zAxG0uE7xAyNbnj/VSOrYzEN1y0VxY//cHx0CqOZEwsw9n8/SIkiZs8vsDGgRAFkYdYWTLyqCNp
 kvrBZEghVCACfogyYcsxfYx3PvdueWYY/X/Inoho0etVb6c0PEn3HrUoiqMzSow/m0iAw3Muq9t
 ZyXA8DR6m69APChJrbXufvDi2xeNkI6ervyiWXtvjWmTvgjAb8+blbg9ourt2+emhYKOPYwDGqL
 PT1f1/ZL2aEsLoGgvuCzAb+buQZLzm3ZkMC8+BSX277aVfMv5m+t/s2L9msvSy0AJoxZzCnl3QK
 C46FL4d+YmE2pvcRJIZBpyEls322rS1Sto6O2oEx0jjhGaIqEl9RW7CHHbNlK/nFABcPRdPwYty
 Ttv8h6LBIOYg6f4ul+6pQzONeY41+nodBPiJKGTCa6nwWsQ7MVG374ZgKuBoM/P6zOsNy/IeEqj
 Cefnssjvo5W+QE1dBgSmyUZoPBRtP84d+QQLDrAuwzVTMzmchZxDT9Q==
X-Received: by 2002:a05:6870:2488:b0:470:e96b:43df with SMTP id
 586e51a60fabf-4a2a894fbbamr9339592fac.11.1791934184052; 
 Tue, 13 Oct 2026 16:29:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:32 -0600
Message-ID: <20261013232940.2690456-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/9] package/python-setuptools: bump to version
 84.0.0
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..51e7fc67e4 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  c6919a4b0862ca30604559e163a6cce9  setuptools-84.0.0.tar.gz
+sha256  f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73  setuptools-84.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..5c5a41531c 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 84.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/6d/44/f5da03a8ef95d369145c5bb53050e7877c9f3d312e128605fd9504829143
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
