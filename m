Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BE8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DCD41527;
	Sun,  3 Apr 2022 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYkwhFPQR8aA; Sun,  3 Apr 2022 22:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B32441507;
	Sun,  3 Apr 2022 22:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6780D1BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD7060E97
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QN6XMjvE7mPS for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 260ED60E90
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:22 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id kd21so6196697qvb.6
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TV/oflorMBCcl0ew99g72GIyr13HsULm3/tuJnK+jh4=;
 b=afD8dmKzY7hokVnq+Ok7+0kGnt5S2tbYAc1kZvZyecyj+lOqxQy5ItBAmBPXEH05Cd
 DqD4mQ72aa0ICieo8XccwILOwAhl79OJR73yen1PoH4JWZMzgLNOuZ2d/dKZRlQGqaDc
 m5FcrHCaX7bZEmFqzA6gU6Ibtm7PHXScBuf3L0tJ1+6hKmlFbYZlAoxfDrwrYKV1umGu
 ZNuuOqX021oNAx64nlmrxRhxOiZmt3bbc14ZvIaRH1oXiqj3dpHHSYxdU2IgFCEtgiT9
 rYR0IFq9JXF3U7X2SR8R0NMTWQbnIdYffuhVNQYE4ixLuLqlCNMgJqj/iEyG34z2lrwu
 im0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TV/oflorMBCcl0ew99g72GIyr13HsULm3/tuJnK+jh4=;
 b=amDtw/58US/AT8QDVu5uPEl6eBj42bdFpcsru6f5iAtz3fVhxWtdV8MAJ6z9sEI335
 k5vhNs/JFit/V9G/bVaSTliHzqO6TcXXj2bqzOGPrl1BsTRoXs3uLNSoKU39cM3XIzM0
 Ox+Z6RWSD3XUjlqfUHallYI3COyAkLxTO1ePvyZrscNwaaFaFj+l6SKknt1XlZ0CflgM
 eOB1ueyvJxLWScWAdvOO9rjX8Vhq4eeEosNyXyCLeMH6EsDq7Um/IV/BOcJBQ9Zwgb3J
 ULhGkF3zedesXt2ODlOPCKrjK/9OfARwddJRzliDsc2Mid0XyayGoZnEIm3uSmlDvdjg
 8sUQ==
X-Gm-Message-State: AOAM5321G/wgcdZjcnu+gnrKHAogTdSfDx6+mze1DKeZUW0Scrbm+BBo
 JBbXp8s3JnxexeBU+xong1Ti2nomNgg=
X-Google-Smtp-Source: ABdhPJycC0nRw4019+sE4sxOXALK92Sq4Eohqvl35OvrTf3KG3pTtKUTyECHWK2V56YoZOoNIK6+8g==
X-Received: by 2002:a05:6214:e69:b0:441:75c6:92d with SMTP id
 jz9-20020a0562140e6900b0044175c6092dmr15232073qvb.99.1649024420963; 
 Sun, 03 Apr 2022 15:20:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:20 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:48 -0300
Message-Id: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/python-snappy: bump version to 0.6.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

Required by python-crossbar and python-autobahn[compress].
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index 1e0f96054f..32df2bea48 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5	82e09ffd44204096fc70d6de14d0ea2f  python-snappy-0.5.4.tar.gz
-sha256	d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2  python-snappy-0.5.4.tar.gz
+md5	fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
+sha256	b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256	d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index d087c83b10..e80aa861df 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.5.4
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be
+PYTHON_SNAPPY_VERSION = 0.6.1
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
