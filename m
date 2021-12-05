Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D061C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B3060598;
	Sun,  5 Dec 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HI7B1Qe2Gj0; Sun,  5 Dec 2021 20:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27CB6072C;
	Sun,  5 Dec 2021 20:47:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C95F1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E59F582F77
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kom46Ou2F1N for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 20:47:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F932827D2
 for <buildroot@busybox.net>; Sun,  5 Dec 2021 20:47:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso8951620wml.1
 for <buildroot@busybox.net>; Sun, 05 Dec 2021 12:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9GBUMLV+ySUyybGSXnjeWqZ7p0ZjIfGIB+TRQC6oeI=;
 b=dnQRnYOtUnnjDbTeNVmN41miSAV99bZjp1ljTkK9vJm7wAJJJliwCsipyTv6riUnYe
 wp3c9SHnI/P14ZLS/lQy9QfemDwHmiGy/1XpYE4ptuUbOlkR/ASBvKmPzWLDSxEYb3wZ
 eG903GQ2xpXNrIcGONAq9BTzgVhVJ9JkMRrDVljd885Y2HFVBqiSTF+nIaQETdTuknbU
 lO9f/8uBEpSC/WxnZbI0U0Qb2HEyEteplVDZ52OtgUKsm8cpJBK/2/Iuuasz3vAVDxfj
 xXIBTLJa2o1QT23rRx9e8JCor3KE/knG80eVXGWzI7mcU3i/8HHixL1ZbnwvKynCyz8D
 oHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9GBUMLV+ySUyybGSXnjeWqZ7p0ZjIfGIB+TRQC6oeI=;
 b=FqM2U0VoKYt7F9P/WX7lobeDo2Z9hnG7uKAJSPoz0sSS9AhGRyw9muJfcx2JAa/vuP
 qlcrii3XFpdp7oTBhYQRktH2KziFf1RMOvOwi2IHhmvzL4x4Ix8YJUrPXUTqr8JK28PI
 9NLRVucMkhXx45Up20A5tBDwRetXI664CmsS1XTMmFYrw8IcXguZfyuZQCQF2+zMZ4Du
 mJs45fq56HcTBxEKdVERtFpqMomNXzdiCh1eGZh9XmdKYgtqyDXpH8EYO19dpC55anGk
 gdUUiClj9DKzeAaAVNO8ubS4JNeFfbTAevt/HMizqJvO9xEaVEweoQm1F6V+gSQ+nQMl
 7sOQ==
X-Gm-Message-State: AOAM53207HK99O9GMOqefQz9Z3y/wkl6Xz91Ul+MspoESVWcY1sKBZmu
 mOR9COZvku9y6D26yz8FOcfWM29M3aAy4Q==
X-Google-Smtp-Source: ABdhPJz1ixkkb+7F/lGWrpscmuOraaOa+JFC0MWv9AR8OuWVQ+pTtCMBGj4z36NtakWugrSI5mKz7Q==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr32882412wmi.107.1638737253329; 
 Sun, 05 Dec 2021 12:47:33 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id c10sm10420080wrb.81.2021.12.05.12.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 12:47:33 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sun,  5 Dec 2021 21:47:19 +0100
Message-Id: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pybind: fix upgrade to
 version 2.6.1
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

The python 'setup.py' script needs header files
in $(@D)/pybind11 to work since v2.6.1, and these files
are created by an internal minimalist cmake build.

fixes http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
fixes http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
fixes http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
This remains a python-package.

'python setup.py' actually hardcodes a system call to cmake,
which seems dirty at first.
Fortunately, if we have CMAKE ENV, all BR variables are retrieved.
I think they made this cmake call to make setup.py self sufficient.

---
 package/python-pybind/python-pybind.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a6a1bdb976..080586a877 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
 PYTHON_PYBIND_SETUP_TYPE = setuptools
+PYTHON_PYBIND_INSTALL_STAGING = YES
+
+# every single 'python setup.py' call actually calls cmake
+# to populate $(@D)/pybind11 with .h and build requirements.
+# If we have a HOST_CMAKE_ENV, then installation paths are properly defined
+PYTHON_PYBIND_DEPENDENCIES = host-cmake
 
 $(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
