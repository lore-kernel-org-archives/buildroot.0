Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D658C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AAF60EDB;
	Tue, 22 Feb 2022 12:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baq-g3sTx-8M; Tue, 22 Feb 2022 12:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991F560EE0;
	Tue, 22 Feb 2022 12:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66921BF97F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF5081375
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYPia2284Iuq for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:49:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4EC48136F
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 12:49:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j22so6928558wrb.13
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=lYLP1eVSeE+NzuHSKzwGVo32IgXqlQu6KIn2ddCkNhP2l1/b/5KSRUSX0KsNmxTBB2
 JEgdYteZYh06KDImtF9QE2ak/DzftXXMW0AOCDzeIjIHjb80nMFLra4gJEPokDZ2RIPZ
 rnCgbdzxC5XS5TJpAZJAp8RU902tLyPhvNdDsE0+dqJotglJPBoGsWyO2bSHNZYAdWBO
 3M0mgbF7lrjkCNICtkdCHdIoBSMkMu28wZWzUZ0oEDGceFgwv5rK9J/yTdRQSqKK2KtA
 xNO1WP6cpGiI5z8VhjyOI0Pf5nINaplWe67SDOCxUazWWXNJXMBA+bTVfRo9ReJV7pIe
 cuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=NbAur7AvFn02Zk0pnEAwy7e54Y1LK6xWiVyYXmCRQT7rj85l0ttegvURAFwOijtg7V
 nR/6GlihAgmly8NAJFmqQxzCZTLxVvKqNqMDfxD70A/eTfk37txT61XsKzh7OKpCZ0XL
 dpbmBg6JvVhgEyefXV6BquX8ZaSrSXaXMBSiK6g7dY3jHeeMqiZANn93x+WOarBvZZ9U
 exlpKNsGtuXB3xVhqfS0pHM9E1hErDkb3pCeIhSGnn+YYHzJQVMwy8OYtDsOpw2kkxOM
 vOzcSiAIgQocQxJ89BXEz/D3JWJVDJsfegOSksXvRebcwLXM5Q3Uic5p93tjRk+HWLxF
 Eb9g==
X-Gm-Message-State: AOAM532SYnK6FVWfNx8M6Dwo+ogslRj1uJhCAAwfmNr44+iiJsWUijTr
 vtKamVlYcdlDUm6Wzh//aQ302mwAlxc=
X-Google-Smtp-Source: ABdhPJwZWwRgDuZ19Hdm96KYtnZdGxmJv8AEt3N4V3T4izQwRrb+byrdnkOJ0TzB9MIyFLVW4jzu+w==
X-Received: by 2002:a5d:47a1:0:b0:1e8:f787:b7bf with SMTP id
 1-20020a5d47a1000000b001e8f787b7bfmr18961513wrb.101.1645534142533; 
 Tue, 22 Feb 2022 04:49:02 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id bg31sm1428840wmb.1.2022.02.22.04.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:49:02 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 22 Feb 2022 13:48:47 +0100
Message-Id: <20220222124850.6050-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/4] package/python-gast: new host-only
 package
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
Cc: gwen@trabucayre.com, "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
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
