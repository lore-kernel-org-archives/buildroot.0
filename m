Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B07D5CCB3
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 14:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF41460ACB;
	Wed, 30 Oct 2024 14:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_Zx0_1saJkk; Wed, 30 Oct 2024 14:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE65060ACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE65060ACC;
	Wed, 30 Oct 2024 14:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCA1A5E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA14740DF0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8urj-s8TJ6Kb for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 14:59:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3EFC40BC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3EFC40BC9
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3EFC40BC9
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:24 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2e2e2d09decso794898a91.1
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 07:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730300363; x=1730905163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFna2wT81c67sJEKh5tFfgiO+YONnsdkETkdoYhxS78=;
 b=iVgnySpbBAFiGFYfHY1EEw4g7aNxptqIuAkoKpIENZ5HDEyDt0/aWlDoyaZynBdFKs
 g5xcvLyosIJIvPGxl7MV+IgKiPSBBScOuUwpkB0UN483CEceyAkm6uoxHcHED03zfoxM
 8XkftikER8IUxPbNVX2Kd8qQGC7T29RhLW+I0mez6Bl9DjavMKiSslHN10IMQonghOEX
 kI/qKyHH4PORM3kVJfWhGsVlW1hVqaMCZ+YUh2zCQtGMERx00nRO9GjE3roV8T3eI2H5
 QcYjJwEwdoZYIO9XU6EJ5Pdsw+sH4SYFYelB1ShB0uw0Iw0SQBE+3AwmSDh4uUkz3Pg7
 esng==
X-Gm-Message-State: AOJu0Yy0AuEp55JHm/W/Gb7tJQwVT7Fgj7FFV6Xtnw1NX+xbIkiEqXUI
 SyNC3jwp3k7Pn05zMrcl4SnQVzZYsdj4f0iB9bX8vPrnLBJM4AIYu/QgpXtJ
X-Google-Smtp-Source: AGHT+IFOkPcgg9DCUSQIrgoXS5LZybEbOFN9CL02xzu0+pcU/u8nsZnOyMUNMs5R+y2Xt4reMbsVSg==
X-Received: by 2002:a17:90b:1810:b0:2e2:bdaa:baad with SMTP id
 98e67ed59e1d1-2e92236bdedmr8901665a91.7.1730300363480; 
 Wed, 30 Oct 2024 07:59:23 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa3dbd2sm1870237a91.20.2024.10.30.07.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 07:59:22 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 22:59:03 +0800
Message-ID: <20241030145910.2523465-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030134339.2482614-1-fancp2007@gmail.com>
References: <20241030134339.2482614-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730300363; x=1730905163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFna2wT81c67sJEKh5tFfgiO+YONnsdkETkdoYhxS78=;
 b=PpXSOrvc/CdYuTG5qTmoT1hwArvgfQqWGOlPBi37LwPKbXF18d30pPWCGUVCcaUgf3
 WZenlq/x9kT/Lk5wbG0u+BS/Jw9XApZFBSIRViDpgaWMr5gA3vjXej/CpdE5t5+fFP+F
 362Lf9QD57SWkha/mRT5KARS9vcrQqN91L0XsrZqT0FMC3AALGiitRF5JvkOV7PXrVZj
 mdUUEXfRHvZ5GEx+9QcRFqql6MfNmPD5dZ0hoNNEXqL++/LBuX9Jej6FEkVf7ZDY9jiP
 I6v80FBXp/pdoZWfNkO6sW2JzcATSOFRgBjZ78L0B75VBG1TUWENo33KOqBMxPLthBRK
 9byw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PpXSOrvc
Subject: [Buildroot] [PATCH v5 1/2] package/python-psycopg2: add config
 dependencies from postgresql
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also update site url to https://www.psycopg.org/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/python-psycopg2/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 4aa86c7690..d70a89a6aa 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -21,10 +23,11 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  customized thanks to a flexible objects adaptation system.
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
-	  http://initd.org/psycopg/
+	  https://www.psycopg.org/
 
-comment "python-psycopg2 needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
