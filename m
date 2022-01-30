Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 09:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E1182B24;
	Sun, 30 Jan 2022 09:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtXiuiMzmfRD; Sun, 30 Jan 2022 09:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1430C81AEA;
	Sun, 30 Jan 2022 09:05:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80F641BF2BF
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE0460B37
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDaeW_VGEPFJ for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 09:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BFE860B15
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:05:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id x193so21120039oix.0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 01:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uuTQ5JlkN0134f3ju+Yk0puApDSLdgx1pvqqFMZ+ho=;
 b=iTz2kfSu5VbVdV9HoeKf9Rzg9yLFBj365jkVbFg0JrFvNMib/9cyREHF0o2NV+/YTf
 eO+7m9+mylS9oUG23sBn4HIIXjD7Sk0zQhQwJ7KOvWp7So5osqssPFZUe1Z8G5DY0IYe
 FaSXcQ+Zeasj8PZRghi/CxS2ZPjSMTXK57tLpaMuDxq3LNd/ehTX8+dkbmel9gammpll
 C3x+xo6QPNDlQuxqchb0/A7NMaXH9uVvd0NPpVXejKFlFDfnrxk1F22w+gNmvQOI+4l6
 QMMSxZOdKT8gLZVhOYVAPnrbDp8XuXfX51dOf+8jZFG8hyxkw1WaiCQmC/hjXN/VqqX0
 GJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uuTQ5JlkN0134f3ju+Yk0puApDSLdgx1pvqqFMZ+ho=;
 b=Pw2ZQ289Q5Y+9CKeOd+DhqKaV9FNc5UGPkS0Pq4XD2Wbo8RmcK9toCQezT27vjRMCv
 cYEcWHH3fvMqqXmc3SUXa3cMJdZ8rFrTkvlt6gw6SkKn35DzZ4q0i9Gmrw/8F4JIQXu8
 sQAiup9cE7LAU3NHeZhTLk4vdWNHS62djQ4ZrKGPvFMl5ZE7usTyn7jmcuixeCi/atWb
 Y1IYlw6wcO5mY9X8tglNckf7kedIO40cZEIy6HPhGof6RDZ5u3WAPCVvH0tTvvancqkt
 F50oODxakQf960wmenwCOlQdWr0MvGMwTCrEwFe+GMZF7vcn7d6asx71T8c18nTPmpld
 Jy6g==
X-Gm-Message-State: AOAM531hfYLXr91eRJAK54rqdFGIv6sIlgmCQPr99yd27E45fBSUt0zi
 s/E3/t9SJYixaW9hdKE4j14Z8lSGwEY=
X-Google-Smtp-Source: ABdhPJzDpM5pJW0B7DURyS7PfZCdJIQd/6w6FXOevmMrIZlS9PxT5Bp5vHNkqZAJje7GKYTxfrliXw==
X-Received: by 2002:a05:6808:14c1:: with SMTP id
 f1mr15054624oiw.129.1643533545093; 
 Sun, 30 Jan 2022 01:05:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id h9sm4396700otk.42.2022.01.30.01.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 01:05:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 02:05:35 -0700
Message-Id: <20220130090535.404853-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: fix get_platform for
 target builds
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

Replicate the logic used to set _PYTHON_HOST_PLATFORM in configure.ac:
https://github.com/python/cpython/blob/v3.10.2/configure.ac#L441-L446

This should correctly set the sysconfig platform for cross builds:
https://github.com/python/cpython/blob/v3.10.2/Lib/sysconfig.py#L704-L706

Not setting this appears to cause distutils/setuptools to use the
wrong build directory names for c extensions, however this doesn't
seem to cause build or runtime errors as the installation paths still
appear to be correct for staging/target installs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 22ea77352c..d751311791 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,6 +20,13 @@
 #
 ################################################################################
 
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+PKG_PYTHON_ARCH = arm
+else
+PKG_PYTHON_ARCH = $(ARCH)
+endif
+PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
+
 # basename does not evaluate if a file exists, so we must check to ensure
 # the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
 # an empty string if the file does not exist.
@@ -33,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -60,6 +68,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
