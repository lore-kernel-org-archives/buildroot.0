Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB3BC7619A
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 11:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF38740119;
	Sun,  2 Apr 2023 11:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF38740119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3gE3GKKUWHD; Sun,  2 Apr 2023 11:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D07A40127;
	Sun,  2 Apr 2023 11:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D07A40127
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC941BF47A
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D93FD4024E
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93FD4024E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpMsISqzrxhP for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 11:04:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C1E40223
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43C1E40223
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 11:04:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so12627029wms.5
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 04:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680433495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XeFoVBzgrkXqoJ0ooWR9NkoTA8JO0D0kbznvouXMQKE=;
 b=ad0hZ5bXo+0trhBF0HibFBcLCFrjkGybxPt6us5q0hDvg2X5DcDIvdabz4jFWiNl+8
 hiX7S/zKr/pSh8tldwOKOYXfKR8qxa/yJxLkizNaANhv70nZRtgCYFjuebCTcKgA1M1U
 arPVxzJSSslIbvYW2k2UsGK4lHnE2bVndyQHEcKPKlO5cUyFZivwncBElT/WIj+4h06Y
 FHLCHGUV/r09CjwbZLF2Bn36ld3yAi6GN/FoDhXLgbe4yvFHqwFGBNIOmbbnPWzN9jRY
 lmIo+eDsc30EA1grCT+ckrlj6Zeu3MrV/Of5AcBgPmA+Au+1TsTSmc1lxmKLvvsnUAm2
 LVFA==
X-Gm-Message-State: AO0yUKXR8cvquud7Ih1V7Qwtc8HHhJBMJBHKvMBIT5ZI4d99V1HygE4z
 jlnojZmiVr8r1AfWbPztM4g2QyDUN1g=
X-Google-Smtp-Source: AK7set8RId34A2DjsXC4oxIV3/TxhryDaHlvrPGcb54QM6mOYRCYFHA1HsfQ9ybAErArWAUzqXZUwQ==
X-Received: by 2002:a05:600c:220e:b0:3ee:a205:848f with SMTP id
 z14-20020a05600c220e00b003eea205848fmr23064598wml.20.1680433494673; 
 Sun, 02 Apr 2023 04:04:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003edf2ae2432sm15384662wmb.7.2023.04.02.04.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 04:04:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 13:04:50 +0200
Message-Id: <20230402110450.589218-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680433495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XeFoVBzgrkXqoJ0ooWR9NkoTA8JO0D0kbznvouXMQKE=;
 b=RJv/F9PgqsZjJP7W8jhzOV8pmhsx6SVpOMJgoRGeNvDK9V4gIWjAB0qYm2iyJBa9MA
 0NI+5amD52bOnADQl6ux4YBYJ4EUVm8Ai8nTktB+w+sjMT2xSfP3QM9mF5J4hdF1TMCP
 Gndgl0nB7ZBkqGDIiGfSYHSjn6rSqI3WmA6FIqhSL3WIfJO548kA3Id9WJimmDfOcybJ
 1bksGRIVO+1nEVxM3ygSHZl3rVF2cYkQaom0bw9qJy8CrVt+cIrgWwzjIlVgn6/G7hv8
 Y24UGRT1Z35TTWtwoAAHsucIZbhLnndJSzE+WBnNod8smdWjeyCAQ+fbUtAnSvVjXOV0
 krtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RJv/F9Pg
Subject: [Buildroot] [PATCH v2,1/1] package/zeek: bump to version 5.2.0
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

- Handle build and install of gen-zam
- Disable new spicy option (work is still needed to cross-compile it)
- Disable unit tests (as they are now enabled by default)
- Update hash of COPYING (year updated with
  https://github.com/zeek/zeek/commit/273126a87b8f7134b81439ae31343c7b45d2a421)
- Update hash of COPYING.3rdparty (path updated, filessystem added and
  file renamed with
  https://github.com/zeek/zeek/commit/72cbc7cd13b7c1bda98658104431c3b530ff68d6
  https://github.com/zeek/zeek/commit/b77f5fa14cc1b64572b70f80366e1ba56f87503c
  https://github.com/zeek/zeek/commit/4f6f46a4043b092b40c01d91a57c5ff273ab433a)
- This bump will fix the following build failure with python >= 3.11:

In file included from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/attr.h:13,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/pybind11.h:45,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/functional.h:12,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/_broker.cpp:13:
/home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h: In function 'std::string pybind11::detail::error_string()':
/home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h:446:36: error: invalid use of incomplete type 'PyFrameObject' {aka 'struct _frame'}
  446 |                 "  " + handle(frame->f_code->co_filename).cast<std::string>() +
      |                                    ^~

https://github.com/zeek/zeek/blob/v5.2.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/43ca5fcc5b8618e6a7a65e77061f673a3c30bfc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update commit message with information about python build failure

 package/zeek/zeek.hash |  6 +++---
 package/zeek/zeek.mk   | 13 +++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
index 05e57b5024..872ef8e14f 100644
--- a/package/zeek/zeek.hash
+++ b/package/zeek/zeek.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
+sha256  511047400dd4539177542c84a5e80d7e97ad73d2a9986ffcd6cd85b4cc711fbf  zeek-5.2.0.tar.gz
 
 # Hash for license files:
-sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
-sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
+sha256  14c5057bb1f83c50db29323a9d5bb0f33db9c4d8b9806c070f5b0ca84f52694a  COPYING
+sha256  5be6b90c7a563e6ee8238354f3487206e19d8f299689ff2adce7bdd1a6919ab1  COPYING-3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
index 584bfb0778..9c599fc22d 100644
--- a/package/zeek/zeek.mk
+++ b/package/zeek/zeek.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-ZEEK_VERSION = 4.1.1
+ZEEK_VERSION = 5.2.0
 ZEEK_SITE = https://download.zeek.org
 ZEEK_LICENSE = \
 	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
 	Public Domain (sqlite), \
-	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
 	LGPL-3.0+ (Multifast Project), \
 	BSD-2-Clause (event.h), \
 	BSD-3-Clause (in_cksum.cc) \
 	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
 	Apache-2.0 (highwayhash, folly), \
 	MPL-2.0 (mozilla-ca-list.zeek)
-ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
 ZEEK_CPE_ID_VENDOR = zeek
 ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
 ZEEK_DEPENDENCIES = \
@@ -45,6 +45,9 @@ ZEEK_CONF_OPTS = \
 	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
 	-DBROKER_DISABLE_DOCS=ON \
 	-DBROKER_DISABLE_TESTS=ON \
+	-DDISABLE_SPICY=ON \
+	-DENABLE_ZEEK_UNIT_TESTS=OFF \
+	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
 	-DINSTALL_AUX_TOOLS=ON \
 	-DZEEK_ETC_INSTALL_DIR=/etc
 
@@ -79,13 +82,15 @@ ZEEK_DEPENDENCIES += musl-fts
 ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
 endif
 
-HOST_ZEEK_MAKE_OPTS = binpac bifcl
+HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam
 
 define HOST_ZEEK_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
 		$(HOST_DIR)/bin/bifcl
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
 		$(HOST_DIR)/bin/binpac
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
+		$(HOST_DIR)/bin/gen-zam
 endef
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
