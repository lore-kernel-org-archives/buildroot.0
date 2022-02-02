Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 23:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB8341615;
	Wed,  2 Feb 2022 23:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaWNJYQ0QL3T; Wed,  2 Feb 2022 23:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D306415E9;
	Wed,  2 Feb 2022 23:50:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF86E1BF3EF
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 23:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E6C40136
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 23:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndeccrXers9m for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 23:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B60D3400E4
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 23:50:31 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id y17so763542ilm.1
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 15:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmWVTu9MQmE2w8PxoMjgEFMIbDXClq4UIa96GdvCV1w=;
 b=hARNoqRwGfbHlIFTJUAloG86F9uHyVdv5nuP3U/wsbFJRYGM8KgKjxM5v29oDSnLEt
 gaPkau/vU/HL7pTHFLiEd4jUT5nkLX8k8VC1XimGp2hy+9yCuSIZLQFFaraufbItDfVG
 SB6/p2umcTmaNz8M12olm6Uu6EaEUy90zr1jQ5LiP5PuSJSJ4TDUEoBCmDIWj+z2rHXJ
 3iEeHDWFe2WGYvmBTYpPoYQ6b3tlIRQ1OQarTU///vhZuKa3FR1W8G0r2oorphrPw2Dl
 9SkGfYI4qtcdglNFZh7ej0pxA8bzNLU0aqbFbdyWLF5IBmJnpcHCv9hWGr3V3R77lCFH
 xgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmWVTu9MQmE2w8PxoMjgEFMIbDXClq4UIa96GdvCV1w=;
 b=C0kkPlM9OzKrGCqecAjepftDFJ1uTsMTlgbLCI0dy527snpU0N5CDzA65prIj03noE
 cbyOPyK7vVxLMVpcVkcvSASmXiyR0Ma5NZuahVDYpzwdt4nDe5/kqPRJOwmg7fadBT8Z
 3KW59h7FpmrmTbKwk6E4c8kfWV7BUpomcfozqaBbmTz9/Rtc5bm6nRI2SbY2CkLaDLCN
 aMbTrqyofzQrt29yXG8YNzVbcyH/f9Jymm0BM2NFbMAnPgJ/iUZd479He0l+T+mAJoal
 rgxONz+hsRzhcUmPBr8H6Xxywl8L1+KGZ43M9AwItmrSX9aGTRtxu5+Fc4Z92Fvojpy0
 tfyw==
X-Gm-Message-State: AOAM532SBeUFUjQKczu74kba2HoJ423pB7MfPR3NhdYJFHGyrKmtQLte
 gj7fuImdvNkD4pL6CwYo0WUvENKSg1g=
X-Google-Smtp-Source: ABdhPJzbCD8Otq8NJ/jZMXfHa+sfMPVJwJLOF9umBKJSOfGbq0dCGPX2DzUh52ZsFDEPsjQ1OmU79g==
X-Received: by 2002:a05:6e02:1545:: with SMTP id
 j5mr19276396ilu.318.1643845830396; 
 Wed, 02 Feb 2022 15:50:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id n12sm3426681ili.69.2022.02.02.15.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:50:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 16:50:20 -0700
Message-Id: <20220202235020.782745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: set _PYTHON_PROJECT_BASE
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This variable is supposed to be set when cross compiling and is
now required by setuptools to be set correctly after the latest
version bump.

Fixes:
http://autobuild.buildroot.net/results/2e8/2e8093e68d04e8cbb20b095068b24c8bbe5f69ad
http://autobuild.buildroot.net/results/9e3/9e3cfddb651a59d7f2d04bc88e6fff2a06e9b465

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 22ea77352c..00bdb9150a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -33,6 +33,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
+	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -60,6 +61,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
