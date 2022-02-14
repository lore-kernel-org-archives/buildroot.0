Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C0DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 10:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B81360E9D;
	Mon, 14 Feb 2022 10:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28OH3tYt5g2M; Mon, 14 Feb 2022 10:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B777B60DB2;
	Mon, 14 Feb 2022 10:29:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 636A81BF402
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 10:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB56402A6
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 10:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1oOlmV-ajhN for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 10:29:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 245AD4025B
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 10:29:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c192so9341591wma.4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzb1FB3cI7IHar+R2mCGMI7G54BnNgPg8UDcQ/imPEk=;
 b=A9X3KpbTSiY669b0MRB/nY5A5j52sIDiaCFiyX1Q1gC+KapzIsSL2PtfpzpC6gqdJu
 laACgLmJGTLUS8O0VUc9PF9ECQ8oGx+o3BJfMcOteBH2TTXkvDeqDwnmLNktnrS6xofu
 7VxzhPSkFqPAGp2/JCBQSAHVVPYDqhk6vNemgKA0c3xs38qh174BD/VenZE59hbWy/Y1
 qXzM4J4ZJ7ZYnvBTjxFPs09kvpnI3Nm+l7xyNnJ+z8wF7NqOkt4jj+BUefODcbe+Z3y9
 9tmdSYBplUq8mtbSjVWQ8mR0iZ5S/a0BiHeSQqoVmfpyexN5MwZWoKrEwy3tz3uUqKeT
 6Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzb1FB3cI7IHar+R2mCGMI7G54BnNgPg8UDcQ/imPEk=;
 b=Jkxz1H+q09ci3D6Z+t3evKUk4DrnOVdSW9L1k5rYlTH8vry1voasdFxJB3Fsvg1x+8
 1I18uj61WbD56TQUEZmgsszvMHRz6Wsd+HhhMjIhEHpTLhE86FelPrs1Mn+1ZxBcbwyB
 MPGXlOfAYoAHHatMF0N0H/wraBoU7fUIWriWza1wZFykFEI+YeedfRZWcj9KbKroohBM
 yeYNU9R+bn7dTzNIT0zZIDUoeCEr5QB5bjpGJGszR04oHSOpni16pVB/g3hSgt9SzcmY
 RRVF+9bcYGSl4G15Blo7sPUs2+4y4ZMXro1uUCJbBSDybRKb0ndrZxWmQCYQSz2ET2LG
 OznA==
X-Gm-Message-State: AOAM531Cof0MfOBOJiBVmBDLsRRVZkD7NqJf+lnJEbQlz/yQtbuUYCQZ
 U10pkTFCWJTT1lk4VIAEatr5H+tANec=
X-Google-Smtp-Source: ABdhPJwZTcc0vgJAhwZb9wHhqdZosANg0yu8sui/1VQcRHF9JN13sJp9TKhM/UApb04qgd7o1SglYQ==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr10584904wma.144.1644834580916; 
 Mon, 14 Feb 2022 02:29:40 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b7sm18143370wrp.23.2022.02.14.02.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 02:29:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 11:29:59 +0100
Message-Id: <20220214102959.1740165-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libgee: bump to version 0.20.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version) and so autoreconf

https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...le.am-include-Makefile.introspection.patch | 40 -------------------
 package/libgee/libgee.hash                    |  4 +-
 package/libgee/libgee.mk                      |  4 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch

diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
deleted file mode 100644
index 0906275ae3..0000000000
--- a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Nov 2021 23:57:33 +0100
-Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
-
-Include Makefile.introspection instead of using a custom rule which will
-result in the following build failure when cross-compiling on buildroot
-because of missing --includedir:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
-Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
-error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
-
-Fixes:
- - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
----
- gee/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gee/Makefile.am b/gee/Makefile.am
-index 5634bcb..e0d950e 100644
---- a/gee/Makefile.am
-+++ b/gee/Makefile.am
-@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
- 	-l $(libgee_dlname)
- Gee-0.8.gir: libgee_0_8_la_vala.stamp
- Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
--	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
-+
-+-include $(INTROSPECTION_MAKEFILE)
- endif
- 
- MOSTLYCLEANFILES = \
--- 
-2.33.0
-
diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 72d2c21ced..54a46f954c 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.4.sha256sum
-sha256  524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e  libgee-0.20.4.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.5.sha256sum
+sha256  31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518  libgee-0.20.5.tar.xz
 
 # Hash for license file:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 64beef30df..7d8d3d4863 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).4
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).5
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
@@ -13,8 +13,6 @@ LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
 LIBGEE_CPE_ID_VENDOR = gnome
-# We're patching gee/Makefile.am
-LIBGEE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBGEE_CONF_OPTS += --enable-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
