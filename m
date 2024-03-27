Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C97C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98B6F606CC;
	Wed, 27 Mar 2024 16:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUnGVH-dIaVf; Wed, 27 Mar 2024 16:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E1F60B9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E1F60B9A;
	Wed, 27 Mar 2024 16:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD431BF342
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 16:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B624057F
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 16:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9k_ri_Dk5dW for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 16:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 744434056E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744434056E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 744434056E
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 16:22:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-341cf77b86dso3007247f8f.2
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 09:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711556530; x=1712161330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4kYhxb8ZKi4UXVK9ZEkKk3PNBA/L2/8rC5LWT8aoL0=;
 b=Mb00JNrgrHXU4KSVObfJAfOAg63+dRqMsxysDlub4UxU3pQggGY07v2NSwaZ/zzL1F
 drznejwYbbDeglvHapgw//DJAEGeS34nuLm7MoJj0ryA1LISblTqSrwtox8MXmfFVFUd
 +HxvjmW6Ij2sjf9d7AC19HquaE8eIWubIpTwVNqZHq+EyEqQfek6qr0sqM//Oaf1WfTJ
 9vi1DCeXCjj3AqR5KM1Ssb/4G4yYqrtSpR/8mU7D11B1k9ftYDCaEnZfdEUYs8mrBnS5
 kpuqDyiyepM4mA+bU30T/F6jcH2QylN5aRTTr+UDacT3pwmFzxCtcCj9KbhgtNMFL5/V
 YFKw==
X-Gm-Message-State: AOJu0YzBbr1vAn5BC72AcPjCk0zh0qFYU1NcyWzcsFqDb0fRsNfnHYBy
 6ayMkO6auRVJLHinPCVTiBMZzwAO/QnR3uYcLH1jNSkHVGItvIiKJbIvFYSjEl6q2wE/CxftGic
 o
X-Google-Smtp-Source: AGHT+IGpAjlF3JvooczigbqGfQ/hATBYRJhjovO6wGciIgwnr04PKz3gt/NXDOiRWpBEn1YDNdKCJA==
X-Received: by 2002:a05:6000:1201:b0:33e:777c:3899 with SMTP id
 e1-20020a056000120100b0033e777c3899mr438563wrx.38.1711556530425; 
 Wed, 27 Mar 2024 09:22:10 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1036:e822:923a:5222:7523:f9f7])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056000054700b0033e7b05edf3sm15244776wrf.44.2024.03.27.09.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 09:22:10 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 17:22:07 +0100
Message-ID: <20240327162207.148920-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1711556530; x=1712161330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4kYhxb8ZKi4UXVK9ZEkKk3PNBA/L2/8rC5LWT8aoL0=;
 b=Jw1SfvPBlIPOdhxhxa1o5W8OVaTI1uUAFcI/lOytV9KU5z7JD18rdhtA6379NYWF+D
 rHOYy7Kb+PGDEXlqXN+NUPIDYwJ+OC6ENxQ3VFwVDEHiOyrl3rQhZM+yIziywIIVkDas
 kBxFa1D0+2L22uKb8Ucug0kfEZWawTrr3w9EayRBvfWQyq746NIohfuiqrco3oKp+0oa
 s+pP7jyECcXkAa782nFwpDEeT6453T8J7Zs2coKirZZROmGyjkUZNHc1H1NXbdKKPtm4
 Pb03emobLIZeVeUnII+msuzd6LzsbsmypKSSv1Uss/1ancfVd2anixtQxgCAg5wYpjju
 0tOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Jw1SfvPB
Subject: [Buildroot] [PATCH] package/python-service-identity: add missing
 python-cryptography dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last version bump removed python-pyopenssl runtime dependency but
doing so also removed the python-cryptography runtime depdency [1] that
is actually a direct runtime dependency.

While at it, update BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
dependency comment.

[1] 6008f2b1b901be1374ac201b5e560cca61b4b61e

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656983 (TestPythonPy3ServiceIdentity)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-service-identity/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index dccd8f37c0..3bb5c08c6f 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
-	# python-pyopenssl -> python-cryptography
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	help
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
