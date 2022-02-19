Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5D5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 16:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410DA606EB;
	Sat, 19 Feb 2022 16:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8Xlcfxd1bzC; Sat, 19 Feb 2022 16:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0FD607A8;
	Sat, 19 Feb 2022 16:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15DFC1BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 044AD8139A
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VA-CcKQ5sHdB for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 16:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A573E81360
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 16:53:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m27so7871793wrb.4
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 08:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=CEVKcuL0YeNenAe96sh1nq3Rfi0QbbxNOBUl1Ag3fx+zNILDpqIiHzY4R2TDTcyzHq
 jXkHjF6HVjbDfbw9O/EUjJIzr+qNp80CmF+61c0zFGwqMH0NZMDjuCVnYZmL+fNRu734
 6cIdePd/+RjQX7gwHSXp21/8snveQjGBMr4B2kdBbyvpfmQ6Yz5+adu0+juPa8j50SkB
 2h7OpqI4LUQRVJFV1CqX+KBngSe7eHHerZGN77XlDNsvT9DJmczPmZAvgNMCvKoB8Gal
 x0VXiKJ1Arzt82onVr/IVwsDEq+k4pGFbLXfEEp5mwIvwjjDHGtx5gRceaenGIPohxql
 xhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=LTems64x/GMrW1O3JhE399B4nHKWJR3DCnrF3kXW7Os4PCn3vE5lIY6/eiAnDg5U7T
 5IHRUBO2xdx1DA0Ywq6F17LNStYMwdN/iqKyibUjjEeXm+Ezrtf/PEBzouRKs/s5Wz+k
 O+YeKnBELCd84r0tQw9YsNbG38fPSEoluI9yJq3UQQK6Q6oCCaLVmuNrSuREukW8Encp
 kIrW9sL8wOi21C0aF6nvuzeeOsrOtsugX/hsiaXXkejSnwwGZZvh4tSQPv2IManENyjs
 WQXn9la68rrBLZVpvlSI8xZeTcCgJWMiCpcXUHVChrq/oXrIxf68ULVUCiyCKe2PCGDe
 XGBg==
X-Gm-Message-State: AOAM531kblFevPUtoutpoo5IcJ+Wo79u2i4xp1sogbhxh97c9oB1F9Ox
 7x46lnlDDYAKjURAIjOHsBYK9XD56fW/EQ==
X-Google-Smtp-Source: ABdhPJw4vlGSKpyNeCtpJ+WKmJJD7XiTQ57NHvW3oT8o7c4iI65P5EyqUvYY4jzVu+6iCCzjCyWaVQ==
X-Received: by 2002:a5d:44c9:0:b0:1e4:a228:50c7 with SMTP id
 z9-20020a5d44c9000000b001e4a22850c7mr9695349wrr.244.1645289634330; 
 Sat, 19 Feb 2022 08:53:54 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f18sm3206549wmg.21.2022.02.19.08.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 08:53:53 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 17:53:08 +0100
Message-Id: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-gast: new host-only package
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
Cc: jeanmichel.friedt@femto-st.fr,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>, gwen@trabucayre.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-beniget and python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-gast/python-gast.hash |  5 +++++
 package/python-gast/python-gast.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-gast/python-gast.hash
 create mode 100644 package/python-gast/python-gast.mk

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
new file mode 100644
index 0000000000..f16d001a6a
--- /dev/null
+++ b/package/python-gast/python-gast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gast/json
+md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
+sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
new file mode 100644
index 0000000000..e02e87fb23
--- /dev/null
+++ b/package/python-gast/python-gast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gast
+#
+################################################################################
+
+PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SETUP_TYPE = setuptools
+PYTHON_GAST_LICENSE = BSD-3-Clause
+PYTHON_GAST_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
