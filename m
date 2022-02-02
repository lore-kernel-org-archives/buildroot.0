Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5BDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B931B41645;
	Wed,  2 Feb 2022 03:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYqDsdScMjh3; Wed,  2 Feb 2022 03:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5A641643;
	Wed,  2 Feb 2022 03:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C59B1BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF08F8291C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 174jS5gt9o6m for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13E7F81D0C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:31:47 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id z7so15979125ilb.6
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxvCJPHbxeejGhibt9V/j0LyDvtylbQo0jGh0VSipgQ=;
 b=CKbBEte0+Elmg28MG0rQyV1sxh4EnuFyHjYIICfH/QEP0dmR8U28P1oDpZeNiXNS5L
 CPZhSqdUHPiahOL/HKy3z2yEm00ZTuHzWSgngHThhY5k9TUfPF/aI8HVUQwgAeXlRkq1
 7wKDo5B5EABRdbxi0zjGxajZVnVGlZy9+AYv3EOCm7V9qhOiHR7CQpf8P0RK9XYUao+J
 9As4Y8XfPB1sx31lBUlQRC3EcpqNCffGONRRnAylSVCtkDFCSABbTYFCsTl0NfGPjUu1
 Ffn1HD2AzDAzHobpyeWqwhlf9qY7uFAciaGlpWpFbI6rgKNRKlDu8MbC2nG2zL15Rvid
 Y5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxvCJPHbxeejGhibt9V/j0LyDvtylbQo0jGh0VSipgQ=;
 b=LJ4kINeKEghXamJoGo4oLSkTmAmhsK2AWdoYcD5BX/0mOuHhRS4mCNlZeKWmbelZN/
 xldrfE+qPGZlSCQRhGiduQommiljyOnVpGPqJ1QrGlNASTtT7HvHguOek2L3s2QhWrZZ
 yfh53YdVyRUMXrtodup+kXoANcZTtxuoT00PO6Dy7dPDdhp+GrvxED7ABG6Y97txC4A9
 xVRP2FQc069kBchVlTwU4UtT6MjMoDtxKvqKLjOO7vPMku+Ekl6WPPaPJn+6qDDIv4+u
 9PDVNd4oqE23fKvBzC0wt0PTGLiqBwJ8LFD5LBT+9bGfDHmSjup28VAV/70nXVHp8Pwl
 qoSw==
X-Gm-Message-State: AOAM532L8whpEcBtHH169cZuSTWQTo50QShinErCWUQfNF99ltgBfqJ6
 H6VkcKN1eWQOTwZYNV4O5EeIRya3CtQ=
X-Google-Smtp-Source: ABdhPJwBrr0ES60a87+ooMnWAXHBRC3GqqVQxN6UKafuH+s1f3uW11q1F4A7ZKttLHBEGB/NgbR1pg==
X-Received: by 2002:a05:6e02:2148:: with SMTP id
 d8mr16793886ilv.6.1643772706913; 
 Tue, 01 Feb 2022 19:31:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id u17sm9538680ilk.49.2022.02.01.19.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:31:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:31:44 -0700
Message-Id: <20220202033144.2187501-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.3.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python2 support.

Add new host-python-setuptools-scm dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/Config.in            | 4 ++--
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-cssutils/Config.in b/package/python-cssutils/Config.in
index 74de742c31..141561901c 100644
--- a/package/python-cssutils/Config.in
+++ b/package/python-cssutils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_CSSUTILS
 	bool "python-cssutils"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  A CSS Cascading Style Sheets library for Python.
 
diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 393daffb8b..e22dde6e56 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5	dc66d96c2d78f1687f59ac412fe9d318  cssutils-1.0.2.tar.gz
-sha256	a2fcf06467553038e98fea9cfe36af2bf14063eb147a70958cfcaa8f5786acaf  cssutils-1.0.2.tar.gz
+md5  71955999f595e4b0eb5a218d614652ca  cssutils-2.3.0.tar.gz
+sha256  b2d3b16047caae82e5c590036935bafa1b621cf45c2f38885af4be4838f0fd00  cssutils-2.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
+sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 513c3a87de..09c2ca44d6 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 1.0.2
+PYTHON_CSSUTILS_VERSION = 2.3.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/5c/0b/c5f29d29c037e97043770b5e7c740b6252993e4b57f029b3cd03c78ddfec
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f5/c6/878abb7df855938a067b762a688da3fcdfea4e41c2399feaf80369b61ed7
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
+PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
