Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCADACE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 15:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE3D6161C;
	Tue, 19 Sep 2023 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE3D6161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 841JOmCQhO8L; Tue, 19 Sep 2023 15:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E5A61628;
	Tue, 19 Sep 2023 15:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E5A61628
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9BE81BF28B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0616836C5
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0616836C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYxYrMxQkt2R for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 15:37:14 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 058878367C
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058878367C
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-530ea522f5eso3209413a12.3
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 08:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695137832; x=1695742632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phKY4nWc/bFR12rRk+U5V0SZn60oPdpsctfaM9uDBeQ=;
 b=h/JX4Jt6UAqnKBOOJZFVtV9HMm4ms2PTThFYssyP1QRXkGcKuTMv3uHiWcA2OsyWr5
 CeXBnPTc49u6ZokPrLQ4s6jmv6AsxyNxjnfCc6MFtQbU+5sAq7WhGwJro/S5+hOI+D5D
 whvTsa9q40FwBAFlReVrSmcVOlGo9oKmyO+VdsvrpLbH8JlT/fk3agwwc1kk3EsAnC96
 1er2+wGDqHPVWUpENcYPHX6tmEyhhCvMt8OZOIE3Yf3C8lHcixxNgZmofrylTBleQriu
 On6RMSsFNQB7wHzd1010PW+VB1Xo/8tI8B5SmHTYntC8R90J3epYPCqqMDbocvWI76sX
 /C5w==
X-Gm-Message-State: AOJu0Yy6phzyW/fU95PLUxq8sTcI8ba9Y31BnqD9/6F+9jb/9y3+3QRn
 nGqxP+XMeSkeUwn1v9kblayJgoLgKmXAPEjrnyB98g==
X-Google-Smtp-Source: AGHT+IHD1I5WDCwyKRgbzknDxwxnvQe7ds9nsm8RSup2XHDqiuW7stOC2TUgw4IKtKWfrWaFpM3knA==
X-Received: by 2002:a05:6402:b88:b0:530:97b5:49ce with SMTP id
 cf8-20020a0564020b8800b0053097b549cemr10138703edb.10.1695137831508; 
 Tue, 19 Sep 2023 08:37:11 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a056402036a00b00530c81ad54asm4752778edw.41.2023.09.19.08.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 08:37:10 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:37:08 +0200
Message-Id: <20230919153708.2804432-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695137832; x=1695742632;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phKY4nWc/bFR12rRk+U5V0SZn60oPdpsctfaM9uDBeQ=;
 b=puzYsOvQKacH9BhmtaOxGxFPqtn5JWFQlOrWoj3k6OLmLbYMWdkYtDPnWd2EJRKg/U
 SRIzuBIYMmFuhWyTJWH47Ly90Ln9B7/NMp5XdZUNBbCQbON2yD4T3xB1aI06s4secooy
 uitvJiUZcuVEA7EOUGqed+qQlyapB48jThWHg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=puzYsOvQ
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version 2.24.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index c0ce0cc352..03c71db8a5 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  f4066d76290b333bc1bb1cf4c23b612eebde712b7112e90a72e7609a14690d2c  python-web2py-2.23.1.tar.gz
+sha256  db42d52097d43fa797c29f9ce1493d7356f192dd0c2590ec56f36022252c284b  python-web2py-2.24.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 2a666cae17..91c041f6f2 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.23.1
+PYTHON_WEB2PY_VERSION = 2.24.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
