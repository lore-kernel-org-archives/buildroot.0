Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 23:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B281060F09;
	Sun,  8 May 2022 23:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4uSKr7IuOGz; Sun,  8 May 2022 23:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD89F60F07;
	Sun,  8 May 2022 23:29:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486411BF3E3
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3691C60F07
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqSa-lankRb7 for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 23:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4F160F03
 for <buildroot@buildroot.org>; Sun,  8 May 2022 23:29:37 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id s14so8235475ild.6
 for <buildroot@buildroot.org>; Sun, 08 May 2022 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AOYAshBENs7wD9vgEJxrcHgHl6iok4H6fWjIC76DrlA=;
 b=Q2KaYy04aWGy6pIgwdKR7Ioa98OGqcqKmB3UbyOAr6l64bvYiTEFbZQpMvtWgXO6W0
 Q9FpgR5PrtIgBndRACmF8pQf64qq4IoUMlzawUd2fYLZ1sPntdgw+lL1j0igHetepJJZ
 MDaUHrJj+FeHGbfP3+8+KSzpb1f2xJOYi9DFpFp8WwMWtVq2EK4EHUbmCHrU9n/zqKuv
 5T2hyFpxlMaWRc4sxhG5gljNDwgKgAC4pKQymx/bQHqPltYISf3Byy0P+z5T4JtH4oSs
 EgYQNB2S99ZBkyEZYF07udn0XQzUxTV+S/SSuRV1++0gkQgismPRSL40mz4GuoxD468M
 XXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AOYAshBENs7wD9vgEJxrcHgHl6iok4H6fWjIC76DrlA=;
 b=QVsn7+Pu9izEL/sY/l944+8e197oo2cmU8APfm+kxwh6C9qxG7YAfo2SPm1QUEdWYY
 7wRsPOVbtXvNqYcNxevbTmzM6lKe7ox1jUVjnB1lLuaj/spatM0w0Y5rdt+aJqQJRfdQ
 0dZ/PHB1IQzx5zr2xQEDIByHndQ7yL9omkF51Z2xNvK9Us8x5EXzYTmivGcOvQIyxZZc
 gBE5VLGlIjrp4GaeWrAZU70Kw7cjHyBt4EIspBbHOY4AFLXnp80e1H6T2hXb5iJ3r5GB
 0xRocvMpk6j7Xk3xgqDFZEq0kgpFIYB0Pda2TNep2bFIKWIelb1CSlbD1FVoRjx/Zv2F
 HdAw==
X-Gm-Message-State: AOAM531r/QiaEzaJCrtof3MqqI8kbUuuSN559LH3ZkV7pVUR3qR6YdBa
 85teHSJYyHFa0phocjBainSk2KRyIDU=
X-Google-Smtp-Source: ABdhPJzxb4svRwR0qbRHn5ArvKI43WsCxFtXafwY2sjI4ZHgKIROKJFYs20N++p6KB8/VTaQJt1Slw==
X-Received: by 2002:a05:6e02:1906:b0:2cf:9a91:5fed with SMTP id
 w6-20020a056e02190600b002cf9a915fedmr2735408ilu.108.1652052576295; 
 Sun, 08 May 2022 16:29:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 u3-20020a056638134300b0032b93db7422sm3183156jad.32.2022.05.08.16.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 16:29:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 17:29:34 -0600
Message-Id: <20220508232934.1360876-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 37.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 0649207426..b51945a928 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  d7718568773810e42481f51f810919f5501ad252300f4d1b36bb5127b2f6050d  cryptography-37.0.1.tar.gz
+sha256  b8ebc656926a88931d1822e3060001e288ecc7712feaa9fe7e1ddacd675c0a57  cryptography-37.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 7714b9ad88..99eba3eeab 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 37.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 37.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/3d/5f/addb8b91fd356792d28e59a8275fec833323cb28604fb3a497c35d7cf0a3
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/51/05/bb2b681f6a77276fc423d04187c39dafdb65b799c8d87b62ca82659f9ead
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
