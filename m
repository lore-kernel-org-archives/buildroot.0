Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31877C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1749435FF;
	Wed, 10 Jan 2024 09:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1749435FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mz4_-FyzVJ8; Wed, 10 Jan 2024 09:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1EEA4366A;
	Wed, 10 Jan 2024 09:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1EEA4366A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7628B1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C8BD80BC9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8BD80BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJDf0h-4yRFj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:38:58 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 850C080BC8
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850C080BC8
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bed8fee278so71324539f.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879537; x=1705484337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/EY2M/STFB9YI9jvhxipL3X+NWTgnGKZO8OaIWOCyg=;
 b=EXrbjWX43IpHtkrphWaKDz4WabqMNSSGmO1ysUEecKU7k+0H++an6YVZ4Xxzc5V86J
 suhsvoWITjAlnfjASOcX5BhVaiWWHuCako4vYdVYipucMYz4NmD6fXEyIFX+hBZt/8sP
 ypw+jBZ8G3ipxa4G4ad+J1aeTFO0/oY5emurqfGiQKGwSJ/nAnuxoCrss0nDkQUfjgnc
 VYevYWIr65hNqE5vHszCieU8mt1wQROTENeoiT6Fl/FOoDuTgp290xojt/t65bJKIpSo
 qMRG1p+kluWdDRSKcMae9QbvTvHLN7vl17p9yONm0pwJVsGXTmSkgP4ZGJ1Z56ESURV4
 eY8g==
X-Gm-Message-State: AOJu0YyJrSKvB3jE24/G+S8+XkUGMn7Zb6GQXG5sDn6hQaU/+jW1KJxF
 RRyv8lG8A5igdvMrKzx7GMBpnC7sOoiYlQ==
X-Google-Smtp-Source: AGHT+IED9f5yWnjxwhfnK7Z6JXdRc7BG6t/M5c9wtsw20Y02j4du7u4L+WykT8ITgPgLDSb5ixBrRQ==
X-Received: by 2002:a05:6602:3b94:b0:7be:f2f5:8466 with SMTP id
 dm20-20020a0566023b9400b007bef2f58466mr501295iob.29.1704879536759; 
 Wed, 10 Jan 2024 01:38:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:48 -0700
Message-Id: <20240110093850.2302133-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110093850.2302133-1-james.hilliard1@gmail.com>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879537; x=1705484337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/EY2M/STFB9YI9jvhxipL3X+NWTgnGKZO8OaIWOCyg=;
 b=e8O7/47d68ZlUSxzsjh+gewFw7iWaUoBZSanr3Wq4U3bZj8ogsxtUOZ15uQkhHZB5y
 cyZRhOHECCWCW1mvPCTGwl6Jc92MKcNMixRxTxT0LDR+cphy2VPawKX7/IyU8tKqMIjN
 zpCfrVbXNcRJDQsZc6+o6fC5LfzYHeO4Au0+g44cwCz6ZLmq+ivJ0UqdDAUolGqz73HS
 UbGtmdjPVjUdJfTiBVmswBrREJD36bQAbwAzdRL2U4FfY4kPgt1qOIbma7Z3P+F+YIev
 k5iZhCJ6CDdF0kfmtjlfcwTVEbKygSKdxCLEUIMMhNVVMDCziMWveoNuGfYrahKZyGES
 Ioqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e8O7/47d
Subject: [Buildroot] [PATCH 4/6] package/python-swig: new package
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-swig/python-swig.hash |  5 +++++
 package/python-swig/python-swig.mk   | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 package/python-swig/python-swig.hash
 create mode 100644 package/python-swig/python-swig.mk

diff --git a/package/python-swig/python-swig.hash b/package/python-swig/python-swig.hash
new file mode 100644
index 0000000000..d60477f602
--- /dev/null
+++ b/package/python-swig/python-swig.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/swig/json
+md5  c2bf820a545f333d47b7be513baaee3c  swig-4.1.1.post1.tar.gz
+sha256  5cbf2d4dfc413f74cac197704296a9ef065a3f81c7b3792ff11a56d312c4f652  swig-4.1.1.post1.tar.gz
+# Locally computed sha256 checksums
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  LICENSE
diff --git a/package/python-swig/python-swig.mk b/package/python-swig/python-swig.mk
new file mode 100644
index 0000000000..89ede170c8
--- /dev/null
+++ b/package/python-swig/python-swig.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-swig
+#
+################################################################################
+
+PYTHON_SWIG_VERSION = 4.1.1.post1
+PYTHON_SWIG_SOURCE = swig-$(PYTHON_SWIG_VERSION).tar.gz
+PYTHON_SWIG_SITE = https://files.pythonhosted.org/packages/da/b8/d1bfba3d7f75eeca60ecdcb2c214e5cdebb7477437d45db77b6dafee80f9
+PYTHON_SWIG_SETUP_TYPE = setuptools
+PYTHON_SWIG_LICENSE = Apache-2.0
+PYTHON_SWIG_LICENSE_FILES = LICENSE
+HOST_PYTHON_SWIG_DEPENDENCIES = \
+	host-python-scikit-build \
+	host-python-setuptools-scm
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
