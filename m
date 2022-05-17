Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD84C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4880C84058;
	Tue, 17 May 2022 20:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8I9Ey7hFXpaT; Tue, 17 May 2022 20:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5079284051;
	Tue, 17 May 2022 20:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A70A1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B3341620
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXhQebzTMUja for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DAB34088B
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:09:26 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id s23so20445093iog.13
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkWnU3LA4jF3x7unqpmtYJRzgBagJ0nMg3c1mbPQwh8=;
 b=CuMUV/SgYRk3pg5kKnmHchMmRuSNBKzQBUay4tl4MdX/M3XevbaiNet5k6nOJINVQR
 rRa5Q/vAbls8qWDywbjD1sciB6iXKHgADXnH77ew9JyYpuuTnljEuzekZr/gt90FJVbX
 ps8mUYu00IUhXQV95kgtv6Pao71UCBqJ15LF8hhA3RPQNs5nuUDkrY0E42Eus+Z8gT+m
 N8Flus4l9/4M+WPZPEx+cXftdKkADnNM1LkVYqotHLWradw1VirwZNisXttqL3n6b+Ik
 u8KARUIDGRNwSByIUXdSFmy5WcQthfORfJtShHtw8Q0ydqRJgsoujSKqFVYAAqce60jZ
 XRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkWnU3LA4jF3x7unqpmtYJRzgBagJ0nMg3c1mbPQwh8=;
 b=PN8svAh5cN8Q9Il1JzV6dhlMqJFpbX8NNdue0pk1ERTpiN2K26zG+0yhyRYH0lhYhc
 H+nOVyecfFXi6XA9gxTon7V6GxE/NA1tzg4Nwyr0OZrirfGnXwtXCIOeS9j4GcJ0ZFos
 BO9nfF2sFIu8eocwsAr8WxrGEfMPzCzDeqKTY6Mr4vKPYhJbeKPqsJzKiE1Gv9ZRdp7a
 yZhA3KBYjxbXu0Jq7gTUg5KNdOjr3Etzm9hHHZ2xY9ePijA9k4gZwhCniZTEvMWkw8aK
 LgE7CPBMbz7GuVzgKITCiet816himfAJ+qQTlFPFSplveW+J0wl50VXTSLDq0rDDvqbA
 x4WA==
X-Gm-Message-State: AOAM531ledjptc/idUKKVSVYMtDPj0VEoUMbXCizDro1ziApOfStDZSg
 IL3dZal4OUS1wScrZLYmOoCwNDhZNaE=
X-Google-Smtp-Source: ABdhPJwQ5F0FMh1v9Zt31mKmAKprsCY0FAOFK1kGwalvrSin5wbpG6SNDt+KJuXhd/TDv79huRodOA==
X-Received: by 2002:a5e:df04:0:b0:65b:1cb:723 with SMTP id
 f4-20020a5edf04000000b0065b01cb0723mr11489557ioq.203.1652818165893; 
 Tue, 17 May 2022 13:09:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 w197-20020a022ace000000b0032e1f965cbfsm4262jaw.134.2022.05.17.13.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:09:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:09:23 -0600
Message-Id: <20220517200923.1516695-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to license title syntax change:
https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06dd83a189

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask/python-flask.hash | 13 ++++++-------
 package/python-flask/python-flask.mk   |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index c6ccd633f8..5f19a450a1 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,7 +1,6 @@
-# From https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980
-md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
-sha256	4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060  Flask-1.1.2.tar.gz
-
-# License files
-sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
-sha256	0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150  docs/license.rst
+# md5, sha256 from https://pypi.org/pypi/flask/json
+md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
+sha256  315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477  Flask-2.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 077aa600b8..b684aff480 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 1.1.2
+PYTHON_FLASK_VERSION = 2.1.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
