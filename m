Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE333C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 22:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665C4419C3;
	Mon, 23 May 2022 22:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN_e_Us1Yv47; Mon, 23 May 2022 22:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF73B419B1;
	Mon, 23 May 2022 22:46:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEF81BF337
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381D181419
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2y6K50mXURe for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 22:46:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590E58140B
 for <buildroot@buildroot.org>; Mon, 23 May 2022 22:46:51 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c2so14353843plh.2
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iVmII+TqQq/nw6x6kmx6KljVPRjmLlucFg1cunIHik4=;
 b=LN3iYo5TGI/alnhblOaMRUoeES0YJrc3nNgTHBIH0gV44W2iuIDqtVcE+hI2tv6Cxl
 Co5G5Z/rPmQ6+9EH7GCMbB4rGKcMFSe+7WcCppU+YCgeQrNfc9xlcDOQAsx7TxRmKYLU
 DMjuqjJM1cxdSBW6LMt/UfjRylWmTXWzNH2nkkgRvlFOdJ7JtSuroyNY7RZeFRmcqrh9
 K2SiwRvV4fP+qKBhIfJ5C2eyjJpEB8UuntFfzpYviyaMmqX0FlKCQ225d91yaIXy80qe
 nbLUFk51c0Z614K40VoxE7Sk32axUgtDOsAX9IWK7f/yCPBqbelbt5M+o5ZM73CxwBY3
 oRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iVmII+TqQq/nw6x6kmx6KljVPRjmLlucFg1cunIHik4=;
 b=EWWHlH49cepxn0UmC2O+g/rhUyy5xvjtNNeC6ujZGIrm6WjT52F2Qr9vLH0loZZBAB
 uzIO+4irIyTtBNRL+HcwAoTmuGvDVRaegR6vyoBd16uNuV5EMDT/tLbJQs+saVqGamwZ
 QIHVbS4Zx8hjjXnSfTtodTRWL6J67F3p+MnAjNr8TRLEmPkV1FGjcd8OVIB2ZiqfK0fB
 eTmrkaZwukagNcpj1rAttG/x+mfc6eNLWzkrjen0F7hbvgBDlBJXiO8l2YENJUHeaQ4m
 eInzqeFd+LJ2JcabgWGBjlkGnixU5uuIEOMMQsybGjZHgAiTFWQk15O6beXNPy+fHhPr
 NV7Q==
X-Gm-Message-State: AOAM532mlyDw5EF0VgjhNvYvxw/0l2vne3PfAuwk1+TNvecPFrfiIml9
 H0sCy9fOJy22KSPnfyNJswy9u9UfbAg=
X-Google-Smtp-Source: ABdhPJw3BmJqA/F6g5sjMZgOZs0VZdUTBoi8sfoMwLdX14PqJJ0OvgI38CHA9VZrHQK2jcTS3plCfg==
X-Received: by 2002:a17:902:b10e:b0:161:a747:7683 with SMTP id
 q14-20020a170902b10e00b00161a7477683mr25149648plr.151.1653346010155; 
 Mon, 23 May 2022 15:46:50 -0700 (PDT)
Received: from adam-workstation.rai.com ([47.153.95.92])
 by smtp.gmail.com with ESMTPSA id
 p9-20020aa78609000000b0051878e8cc13sm6166676pfn.116.2022.05.23.15.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 15:46:49 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 15:46:45 -0700
Message-Id: <20220523224646.2151739-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-sip: bump to version 4.19.25
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
Cc: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Adam Duskett <aduskett@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is the minimum version needed to support newer versions of PyQT.

Changes:
  - Update the URL as this version is not hosted on sourceforge.
  - Add --no-stubs to prevent the error: No such file or directory: sip.pyi
  - Add 0001-remove-join-from-sip-h-files-string.patch to prevent python-sip
    from attempting to copy the entire hosts /usr directory when installing.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...-remove-join-from-sip-h-files-string.patch | 33 +++++++++++++++++++
 package/python-sip/python-sip.hash            | 10 +++---
 package/python-sip/python-sip.mk              |  6 ++--
 3 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 package/python-sip/0001-remove-join-from-sip-h-files-string.patch

diff --git a/package/python-sip/0001-remove-join-from-sip-h-files-string.patch b/package/python-sip/0001-remove-join-from-sip-h-files-string.patch
new file mode 100644
index 0000000000..e7a0d606e9
--- /dev/null
+++ b/package/python-sip/0001-remove-join-from-sip-h-files-string.patch
@@ -0,0 +1,33 @@
+From 009e5cf0750134ed5403aae23ef53a177764ca04 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 29 Dec 2021 13:49:15 -0800
+Subject: [PATCH] remove join from sip_h.files string
+
+When cross compiling, the configure system appends the hosts /usr/ directory 
+to the path of which to find files that python-sip will install. This leads to
+python-sip attempting to install everything under the hosts /usr directory into
+the targets /usr/include/python directory.
+
+Remove the .join() in the sip_h.files string to prevent the above issue.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index 25bcaa7..fc8f2dc 100644
+--- a/configure.py
++++ b/configure.py
+@@ -408,7 +408,7 @@ def create_makefiles(macros):
+             # There will only be one element.
+             files, path = gen_installs[0]
+             pro.write("\n")
+-            pro.write("sip_h.files = %s\n" % " ".join(files))
++            pro.write("sip_h.files = %s\n" % files)
+             pro.write("sip_h.path = %s\n" % quote(path))
+             pro.write("INSTALLS += sip_h\n")
+ 
+-- 
+2.33.1
+
diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index 6adf44d410..0108924cdc 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -1,7 +1,5 @@
-# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/
-md5 78724bf2a79878201c3bc81a1d8248ea	sip-4.18.tar.gz
 # Locally calculated:
-sha256 f1dc5c81c07a9ad97edcd4a0af964a41e420024ba7ca165afd2b351efd249cb6	 sip-4.18.tar.gz
-sha256 accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
-sha256 7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
-sha256 63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
+sha256  b39d93e937647807bac23579edbff25fe46d16213f708370072574ab1f1b4211  sip-4.19.25.tar.gz
+sha256  accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
+sha256  7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
+sha256  63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 01ccb1ddd5..3e015fa16c 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SIP_VERSION = 4.18
+PYTHON_SIP_VERSION = 4.19.25
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
-PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
+PYTHON_SIP_SITE = https://www.riverbankcomputing.com/static/Downloads/sip/$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
-
 PYTHON_SIP_DEPENDENCIES = python3 qt5base
 HOST_PYTHON_SIP_DEPENDENCIES = host-python3
 
@@ -34,6 +33,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--incdir $(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
+			--no-stubs \
 			--use-qmake && \
 		$(HOST_DIR)/bin/qmake)
 endef
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
