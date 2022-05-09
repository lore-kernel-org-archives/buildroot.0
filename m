Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 02:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE048143F;
	Mon,  9 May 2022 02:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yq6otJEcOGU6; Mon,  9 May 2022 02:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAF580C03;
	Mon,  9 May 2022 02:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 084B51BF3D9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 02:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC40680BDD
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 02:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FBLFU5f84a8 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 02:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13CBD80BBB
 for <buildroot@buildroot.org>; Mon,  9 May 2022 02:21:49 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id l15so8423098ilh.3
 for <buildroot@buildroot.org>; Sun, 08 May 2022 19:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOZFAOmlGCf2eRHeE7hw0aUaY2Cj9+3bcyyJLn0HN1Q=;
 b=IezOAwhk9+K6DUhM9Qr5dZXI/X6T17GHbTcox9FyoKCdRYRsPeLVutmXdQh8/dORqY
 jA8JI9LFxMnZ6lQx2rChifzyuStGoSqt5INB+/2ovkb9l/rHv3tRU6vV2hEtr7/spGM6
 ebf2VKAuFemxZOe2Vesq+3t6FAxWhVCSXE2xGOXAcAE7BXrnUtw+8cgx0dIzDKSS73nj
 QqA1ZW68OhaSYAWnf9zyRK+I5mMgzq+iF+U3pL/tB4/QL3j+GonuCupVyPkPCW49TMsa
 E0uYAnLo+uLNZx95wXEA0oHvlX49eGobW/nSo79oAuC1BOoXnGZae7hiAoKBDjrngfeB
 c6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOZFAOmlGCf2eRHeE7hw0aUaY2Cj9+3bcyyJLn0HN1Q=;
 b=yqattkOdKbSmhzItgGiBWfffqgYkTNHmD1D+9l3azArMeObUil8CfRObcSKPVt0PWl
 4vFhXVR2XZ+RTtykgS8oWDMFgzCmx5XCEQVDNCCjfMJJZsvhib2Gkk7xmgMYALHHgVBO
 XSGvsphNDu1ScbCAexp+QO44z/56iNynoOe2DcAwW4l3M4f+XipRVHKYdnHldWIkJkch
 6teFJDq3S4ys3Y6eQqiBIkYzgyjn1Bb4+X12ia7zAINNVERipmv/uaTGbhCCzeBUfJfn
 IRjZC56BVuzIluGT0IsogM/c8kmqzqMEnDZ6BiV9FRr9/muMjmO5VOJ0CjlvIWWyZ7Yk
 U/Gg==
X-Gm-Message-State: AOAM531QCsp8NQkKFFnGZp4bZ3HeeugvZQ51Wp7DXbaBabZAXmhHtJk6
 vb8bMLLhReJ5F15NLMU3hVKDdlJ8afs=
X-Google-Smtp-Source: ABdhPJwwS1xA5A79znL62vRN4c3vRraHL24um0YdgXOJDkLKTs47z5FZR8JLq4cGJOuJQQRo3VPf5A==
X-Received: by 2002:a92:cb4f:0:b0:2cb:fde0:b5c2 with SMTP id
 f15-20020a92cb4f000000b002cbfde0b5c2mr5189190ilq.274.1652062909039; 
 Sun, 08 May 2022 19:21:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 q20-20020a02a994000000b0032b3a7817c5sm3260147jam.137.2022.05.08.19.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 19:21:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 20:21:47 -0600
Message-Id: <20220509022147.1866712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 22.0.0
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

Drop no longer used BR2_PACKAGE_PYTHON_SIX runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyopenssl/Config.in             | 1 -
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index 1a6fbd2147..56f38f5888 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python wrapper module around the OpenSSL library.
 
diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 5a3bc5dde9..0dc9f921fa 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  2ec707d15b4e92f5ca5e46e5aab2f4ca  pyOpenSSL-21.0.0.tar.gz
-sha256  5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3  pyOpenSSL-21.0.0.tar.gz
+md5  182c9f258c431c731906ab7fdaf6d0a8  pyOpenSSL-22.0.0.tar.gz
+sha256  660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf  pyOpenSSL-22.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 2ba8c2e73d..21a3f06907 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 21.0.0
+PYTHON_PYOPENSSL_VERSION = 22.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/54/9a/2a43c5dbf4507f86f7c43cba4195d5e25a81c988fd7b0ea779dfc9c6973f
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/35/d3/d6a9610f19d943e198df502ae660c6b5acf84cc3bc421a2aa3c0fb6b21d1
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
