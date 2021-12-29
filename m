Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04180C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42DD4089A;
	Wed, 29 Dec 2021 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne1QNrLZ6_6G; Wed, 29 Dec 2021 08:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C244087A;
	Wed, 29 Dec 2021 08:43:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 169471BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3C7740022
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ithryeU9OhEv for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE72C400F5
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id u8so25268724iol.5
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=Sj04Q3aDiGvwsEFt1jREjAO0e9ZWVBK8AObdHLCXvxLkhShMwyhG6Qm8f7F23xVwMK
 BC97QrTl6lyHTOU+HBFNjyOpbOelVBrnhE/ir8IhNHDYVpmbfnMRfvFiPRBwehhcaAcu
 aT3vZ0dVDfqMtVnRrtqk4nQ4+47HNNYeK9sPgPUVg6mEnzY8qlt9LhU66tM4j6f5679H
 rMQikt7EGTKUg0lh8X62om3gkLxFXY4Cb9NEgO42f5Mdiiw00siSiYFUmMoNh2YrNDXn
 QZlA+rFVGa+Nwg2A5ufQclN1s3ria1Ht86KVyng2Di3fQTS9rtJ72MxHJBzqQG6cwOIl
 NE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=YFurGNUawdyiHfmgeU7V37Np8asOSI+HeQEWjvs6hi9tTt15/MvNL4rtxhX94wTRM3
 +byO/VfC1mZRVFAaSbXX+NRGK5vJAGiyj3mD7zuK4R2RqUYJzR3LPDcSbNXl7PpKno96
 I5npFCNU84tV6eh1wlXKTrtFCEWF8Itl2bhNkTt9XV96Y541h7hBDEHIkk2m6w2kRw3W
 id5bCpX7IOw97oq6nmHBa9tXFCnG1IBd/rGhrLFzjKOD0VBKje5WDlXsy3VFs83+oTsZ
 5XAM3Q7k7xDSQdrDgI5IDo3JTDdB5pcVad1ty/JiAiTFzhLpLibzxVy7OZWQXgGjpehP
 mErA==
X-Gm-Message-State: AOAM531pYXbYJZIcf5PVMUtprFtcRFnHX4QOvDiVD+e2Di6IN4fivH0k
 l4iqQEguXcHddjt5hPR547ZRgDwr8EU3Hg==
X-Google-Smtp-Source: ABdhPJx31X1pUfU0gEpsftrZtZw/m+5YKxH/qmbx311vQFbD7CerzV+TFklYLCnBn4+DPmQ0PV/uJQ==
X-Received: by 2002:a05:6602:3409:: with SMTP id
 n9mr11275431ioz.148.1640767354807; 
 Wed, 29 Dec 2021 00:42:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:23 -0700
Message-Id: <20211229084223.521362-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] package/python-installer: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-installer/python-installer.hash |  5 +++++
 package/python-installer/python-installer.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-installer/python-installer.hash
 create mode 100644 package/python-installer/python-installer.mk

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
new file mode 100644
index 0000000000..68af457664
--- /dev/null
+++ b/package/python-installer/python-installer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/installer/json
+md5  cf7b8f470620c54f2d28167fc80542a7  installer-0.4.0.tar.gz
+sha256  17d7ca174039fbd85f268e16042e3132ebb03d91e1bbe0f63b9ec6b40619414a  installer-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
new file mode 100644
index 0000000000..2c1d371dab
--- /dev/null
+++ b/package/python-installer/python-installer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-installer
+#
+################################################################################
+
+PYTHON_INSTALLER_VERSION = 0.4.0
+PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d51336453e75f76b32de86b336ef26755c64119204f1f5b4388
+PYTHON_INSTALLER_LICENSE = MIT
+PYTHON_INSTALLER_LICENSE_FILES = LICENSE
+PYTHON_INSTALLER_SETUP_TYPE = distutils
+HOST_PYTHON_INSTALLER_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
