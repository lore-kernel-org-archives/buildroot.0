Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E3A380D8A;
	Fri, 31 Dec 2021 21:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnvDgFAQa62E; Fri, 31 Dec 2021 21:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9139980F50;
	Fri, 31 Dec 2021 21:11:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C54461BF30D
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4D2F40336
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 21:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyvQTFNBh0M8 for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 21:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D7740282
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 21:11:06 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 2so24708753pgb.12
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 13:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbeEcg3VWROtx3A7GTiy1+17cn3b5/BbEpTIWBgHdx8=;
 b=JltFTgq5cVvyH4DzYFrTPcdtPXTsWwKzf4TSBUmp8RDeNWKRzrcQJpY/CRDpVEJ7gN
 TIPo7UuToivW7T8XKYPBvf6KqMY/lHwbiHWuUrbugCwYC6b5TEWsfQW4rqIA28spO6K2
 BbZc+LL9FFa7ztOfFN5A91PR8IwE4twBBJMKvr+KdmA2PbPwi9q96I4bPID41W1+QJnk
 aUhENuJffqMGIfthopuW30iBkDgHRaXnpvwQPzIbKkj2LN1Kzk/n6FYMPSGIGE6RmtWU
 tZCP9aUEREZ2ONmNFcxlrHxeSRJA92uDtnlxeaIiBgNjLALFKclpmAwqqgo0KLxuiXTa
 ax7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbeEcg3VWROtx3A7GTiy1+17cn3b5/BbEpTIWBgHdx8=;
 b=kQ6a7zlH1+kT1nx4GMjFcx5qmy6f96msla21w9fmyzmuB4edYw+cEh/IKxv3ZATdol
 K7a4x2KR1XdU7LVdG4IVToJyfNhE7x65lAD0YKDPxGGule3Y9+wyHIW1O+qXqVPkOb1f
 PZ5lwAycN+WlD9HC1eeMPMppwNdY3TlOO7pLrnFfMNn7PXgO631csIghAJvXrhA8MNFW
 MpZOOsrpi7u6OixmTmFFWbyUSUkcjcxjrFzstG8DhsvgMXCD2uBUUhT7oQ5Pb2nuhgwt
 fVpEY5IVa3iCWYnCzKyccvKiFKIaZSg+moMLDmyahressOT6oZ1673Qc2xnmwz49uTMf
 rFFw==
X-Gm-Message-State: AOAM53193sLNfZwxzlxbLM5Ea9lBQM2ae4jaOv80bRW2idOBpQBO83Ef
 XQdUYlj2SP9xyEV2I5lciBi0K8OP1sM=
X-Google-Smtp-Source: ABdhPJxkMpFJuPBP3616hsXjJLmxnCUeuYt8pXmnm1rifj2cyyXLTSIGC7/v48aQMXNgGwdVi2dTRA==
X-Received: by 2002:a63:9242:: with SMTP id s2mr4920266pgn.316.1640985065887; 
 Fri, 31 Dec 2021 13:11:05 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id kb1sm31932067pjb.45.2021.12.31.13.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 13:11:05 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 13:10:55 -0800
Message-Id: <20211231211055.3996590-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libdnet: bump to version 1.14,
 drop python2 support.
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Change the url to the github ofalk repository.
- Remove upstream patches
- Rework python-makefile.patch to adhere to git formatting and refresh for 1.14
- Update License hash due to year changes
- Depend on python3 and host-python3-cython for python bindings

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libdnet/0001-python-gcc.patch      | 20 ----------------
 package/libdnet/0001-python-makefile.patch | 27 ++++++++++++++++++++++
 package/libdnet/0002-python-makefile.patch | 16 -------------
 package/libdnet/Config.in                  |  6 ++---
 package/libdnet/libdnet.hash               |  4 ++--
 package/libdnet/libdnet.mk                 | 12 +++++-----
 6 files changed, 38 insertions(+), 47 deletions(-)
 delete mode 100644 package/libdnet/0001-python-gcc.patch
 create mode 100644 package/libdnet/0001-python-makefile.patch
 delete mode 100644 package/libdnet/0002-python-makefile.patch

diff --git a/package/libdnet/0001-python-gcc.patch b/package/libdnet/0001-python-gcc.patch
deleted file mode 100644
index ea732e4358..0000000000
--- a/package/libdnet/0001-python-gcc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/python/dnet.c	2006-01-19 18:08:23.000000000 +1100
-+++ b/python/dnet.c	2008-09-03 16:30:47.000000000 +1000
-@@ -2726,7 +2726,7 @@
-   PyObject *__pyx_3 = 0;
-   unsigned short __pyx_4;
-   Py_INCREF(__pyx_v_self);
--  ((PyObject*)__pyx_v_next) = Py_None; Py_INCREF(((PyObject*)__pyx_v_next));
-+  __pyx_v_next = (struct __pyx_obj_4dnet_addr*)Py_None; Py_INCREF(((PyObject*)__pyx_v_next));
- 
-   /* "/Users/dugsong/projects/libdnet/python/./dnet.pyx":634 */
-   __pyx_1 = (((struct __pyx_obj_4dnet___addr_ip4_iter *)__pyx_v_self)->cur <= ((struct __pyx_obj_4dnet___addr_ip4_iter *)__pyx_v_self)->max);
-@@ -2738,7 +2739,7 @@
-     Py_DECREF(__pyx_2); __pyx_2 = 0;
-     if (!__Pyx_TypeTest(__pyx_3, __pyx_ptype_4dnet_addr)) {__pyx_filename = __pyx_f[0]; __pyx_lineno = 635; goto __pyx_L1;}
-     Py_DECREF(((PyObject *)__pyx_v_next));
--    ((PyObject *)__pyx_v_next) = __pyx_3;
-+    __pyx_v_next = (struct __pyx_obj_4dnet_addr*)__pyx_3;
-     __pyx_3 = 0;
- 
-     /* "/Users/dugsong/projects/libdnet/python/./dnet.pyx":636 */
diff --git a/package/libdnet/0001-python-makefile.patch b/package/libdnet/0001-python-makefile.patch
new file mode 100644
index 0000000000..5f641302be
--- /dev/null
+++ b/package/libdnet/0001-python-makefile.patch
@@ -0,0 +1,27 @@
+From 298cd8eaa21a21eee85f9551a26ad294347b1d5a Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 30 Dec 2021 11:14:15 -0800
+Subject: [PATCH] python makefile
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 1.14
+---
+ python/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 1a74ef2..59fe0f3 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -11,6 +11,7 @@ $(srcdir)/dnet.c: $(srcdir)/dnet.pyx
+ 	pyrexc $(srcdir)/dnet.pyx
+ 
+ python-build: $(srcdir)/dnet.c
++	CC="$(CC)" LDSHARED="$(CC) -shared" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext -I$(PYINCDIR) -L$(PYLIBDIR)
+ 	$(PYTHON) setup.py build
+ 	touch python-build
+ 
+-- 
+2.33.1
+
diff --git a/package/libdnet/0002-python-makefile.patch b/package/libdnet/0002-python-makefile.patch
deleted file mode 100644
index fb41e43e35..0000000000
--- a/package/libdnet/0002-python-makefile.patch
+++ /dev/null
@@ -1,16 +0,0 @@
----
- python/Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: libdnet-1.11/python/Makefile.am
-===================================================================
---- libdnet-1.11.orig/python/Makefile.am
-+++ libdnet-1.11/python/Makefile.am
-@@ -11,6 +11,7 @@
- 	pyrexc $(srcdir)/dnet.pyx
- 
- python-build: $(srcdir)/dnet.c
-+	CC="$(CC)" LDSHARED="$(CC) -shared" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext -I$(PYINCDIR) -L$(PYLIBDIR)
- 	$(PYTHON) setup.py build
- 	touch python-build
- 
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index e7ba3a21af..f853e4e12d 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -10,11 +10,11 @@ if BR2_PACKAGE_LIBDNET
 
 config BR2_PACKAGE_LIBDNET_PYTHON
 	bool "libdnet python module"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  dnet module for python
 
-comment "dnet module for python requires python package"
-	depends on !BR2_PACKAGE_PYTHON
+comment "dnet module for python requires python3 package"
+	depends on !BR2_PACKAGE_PYTHON3
 
 endif
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index d2e820270f..d322a1cc29 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0eb78415c8f2564c2f1e8ad36e98473348d9c94852f796a226360c716cc7ca53  libdnet-1.11.tar.gz
-sha256  1e94df12cb3701fa64e07eeb60284bb16a3544815d5a39860dacff7b86610584  LICENSE
+sha256  592599c54a57102a177270f3a2caabda2c2ac7768b977d7458feba97da923dfe  libdnet-1.14.tar.gz
+sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 3d3fcbe605..e9a57d6ed2 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.11
-LIBDNET_SITE = http://downloads.sourceforge.net/project/libdnet/libdnet/libdnet-$(LIBDNET_VERSION)
+LIBDNET_VERSION = 1.14
+LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
@@ -15,10 +15,10 @@ LIBDNET_CONF_OPTS = \
 	--with-check=no
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 
-ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
-LIBDNET_DEPENDENCIES += python
-LIBDNET_CONF_OPTS += --with-python
-LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
+ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
+LIBDNET_DEPENDENCIES += host-python3-cython python3
+LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
+LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endif
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
