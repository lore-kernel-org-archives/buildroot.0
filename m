Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CA7C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0181D41D13;
	Fri,  9 Feb 2024 21:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjRE_-HiAKd4; Fri,  9 Feb 2024 21:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B71E9405C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B71E9405C7;
	Fri,  9 Feb 2024 21:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341841BF3AE
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E74A84E28
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTUwzCuYL5PQ for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 21:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5349684E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5349684E27
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5349684E27
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 21:08:08 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4103be6e938so12008735e9.0
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 13:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707512885; x=1708117685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FIQb9kGhWyRdwTruQB1NLqimxJOqUcEAqtm38TBwEwY=;
 b=gZb+6ZV7hNOAEbsZwe9uaIBheWTOwDwpw62n1kfnwWFeRZNJ/pS72x36Lz++gYWWDU
 gSqfOU6vj1NKizHONupzvLzOZZfHcVRc5nIUuRniYcxMgCX+F9kS9RgW+Hx2AhyEpwQn
 jk8N5oQWbnlQMY7cFTb25zJUJwIuveLDWvfP/xHmE6J8LAIIID0uwqXlkCVM8XeFsvkk
 IcaBNUkX9HYzAkp+FA1NaCewEjj7mPsAYRw/n2yQvsz2mWWPcvLgZctYIrLMN75LSQfn
 btzUCEKAsbikFTJ/c/R00Vnou0IhzoPXQgb17qE/vwcxuez60J7LlVlHyuJvmr60N5AY
 diCw==
X-Gm-Message-State: AOJu0YxGLDzgNBZHBVwz3a3MwxoGl4KtmxmYwS/qPvTX5AHUQwRnuOWM
 FyLRu78COc0b1m97GnVlHtUSNZdsSp0xWKMHRqZuD5RyL3casl+Zj8raJFc4KQk=
X-Google-Smtp-Source: AGHT+IFgA4sXrHgSK8SBW8MEv1GBn6HfdZsXo11fpY+y46z90IjBgS5N2STsFrRa9ySVTs05WIO9lA==
X-Received: by 2002:a05:600c:3581:b0:40f:993e:3591 with SMTP id
 p1-20020a05600c358100b0040f993e3591mr381126wmq.3.1707512884649; 
 Fri, 09 Feb 2024 13:08:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzkdt1uN7Q2fB/bTetSpX5R59R+S6XgSazFFjAN3FxyTtD7kqrEQxdozgtuwlAojwWfVSeM1r9mjeFO7q/wL1Ba194phUJix//rQ==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 jh3-20020a05600ca08300b0040fc2f07ed5sm1715608wmb.27.2024.02.09.13.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 13:08:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 22:08:01 +0100
Message-ID: <20240209210801.880001-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707512885; x=1708117685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FIQb9kGhWyRdwTruQB1NLqimxJOqUcEAqtm38TBwEwY=;
 b=Qg8jHEwrEJN7TBmBdPOE9hJeq3PXDmO3G7T+PIwqMZk8sgAbHEBasUICtjq8K89+E5
 +blJI4BeGly+JWb87KSgQKGyo4AhY46sd3NeO6p3IZNgbzdHvV8wG14v4aOEYRtdwji/
 WzWMzRlKqu8pbl6b/jTarTxm2sFbAXnJuG83IiDJZoDI70RfOYahm/2PA3iKrYxfCk4O
 GwwyqQrCn64Qq9au/dDFRsESbO9V139mt1aTIvLaPnmDjQO5FWBiJ+TCECbmVUJlyPEg
 eRBBW8bidDBLYNx40xOe0IEWzLtdfauCrUHMum6o13gwIL84QwZ6ngcqan/8uoXb/k0J
 nLMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qg8jHEwr
Subject: [Buildroot] [PATCH 1/1] package/uhd: fix build with gcc >= 13
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/lib/cal/database.cpp:7:
/home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:86:24: error: 'uint8_t' was not declared in this scope
   86 |     static std::vector<uint8_t> read_cal_data(const std::string& key,
      |                        ^~~~~~~
/home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:14:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   13 | #include <functional>
  +++ |+#include <cstdint>
   14 |

Fixes:
 - http://autobuild.buildroot.org/results/cc52f2ed4fa43fe9c92713eb8561afcba29e12f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-GCC-13-add-missing-cstdint-include.patch | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch

diff --git a/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch b/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000..acf720a15d
--- /dev/null
+++ b/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
@@ -0,0 +1,117 @@
+From 3acf784e988608cbce34cd0be0a8703ba53ea515 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Tue, 3 Jan 2023 23:04:52 +0000
+Subject: [PATCH] Fix build with GCC 13 (add missing <cstdint> include)
+
+GCC 13 (as usual for new compiler releases) shuffles around some
+internal includes and so <cstdint> is no longer transitively included.
+
+Explicitly include <cstdint> for uint8_t.
+
+```
+/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:43:14: error: 'uint32_t' does not name a type
+   43 | static const uint32_t DEFAULT_NOC_ID  = 0xFFFFFFFF;
+      |              ^~~~~~~~
+/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:1:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
+  +++ |+#include <cstdint>
+    1 | //
+```
+
+Signed-off-by: Sam James <sam@gentoo.org>
+
+Upstream: https://github.com/EttusResearch/uhd/commit/3acf784e988608cbce34cd0be0a8703ba53ea515
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ host/include/uhd/cal/database.hpp                      | 1 +
+ host/include/uhd/rfnoc/defaults.hpp                    | 1 +
+ host/include/uhd/types/eeprom.hpp                      | 1 +
+ host/include/uhd/usrp/zbx_tune_map_item.hpp            | 1 +
+ host/lib/usrp/dboard/magnesium/magnesium_constants.hpp | 1 +
+ host/lib/usrp/dboard/rhodium/rhodium_constants.hpp     | 1 +
+ host/lib/utils/serial_number.cpp                       | 1 +
+ 7 files changed, 7 insertions(+)
+
+diff --git a/host/include/uhd/cal/database.hpp b/host/include/uhd/cal/database.hpp
+index b6abbb6df7..9d47febedd 100644
+--- a/host/include/uhd/cal/database.hpp
++++ b/host/include/uhd/cal/database.hpp
+@@ -8,6 +8,7 @@
+ 
+ #include <uhd/config.hpp>
+ #include <stddef.h>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <functional>
+diff --git a/host/include/uhd/rfnoc/defaults.hpp b/host/include/uhd/rfnoc/defaults.hpp
+index aa7778aacf..6c878a8d70 100644
+--- a/host/include/uhd/rfnoc/defaults.hpp
++++ b/host/include/uhd/rfnoc/defaults.hpp
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace uhd { namespace rfnoc {
+diff --git a/host/include/uhd/types/eeprom.hpp b/host/include/uhd/types/eeprom.hpp
+index 3a7605d3cb..420440aa64 100644
+--- a/host/include/uhd/types/eeprom.hpp
++++ b/host/include/uhd/types/eeprom.hpp
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <vector>
+diff --git a/host/include/uhd/usrp/zbx_tune_map_item.hpp b/host/include/uhd/usrp/zbx_tune_map_item.hpp
+index e49f49f785..ce95623de2 100644
+--- a/host/include/uhd/usrp/zbx_tune_map_item.hpp
++++ b/host/include/uhd/usrp/zbx_tune_map_item.hpp
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ #include <uhd/config.hpp>
++#include <cstdint>
+ #include <cstring>
+ #include <string>
+ #include <vector>
+diff --git a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
+index 99f2b910c6..99f5a4933f 100644
+--- a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
++++ b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
+@@ -9,6 +9,7 @@
+ 
+ #include <uhd/types/ranges.hpp>
+ #include <cstddef>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
+index 591d02d305..1577e02d9e 100644
+--- a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
++++ b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
+@@ -9,6 +9,7 @@
+ 
+ #include <array>
+ #include <cstddef>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/host/lib/utils/serial_number.cpp b/host/lib/utils/serial_number.cpp
+index 61296a9139..c07730e24d 100644
+--- a/host/lib/utils/serial_number.cpp
++++ b/host/lib/utils/serial_number.cpp
+@@ -5,6 +5,7 @@
+ //
+ 
+ #include <uhdlib/utils/serial_number.hpp>
++#include <cstdint>
+ #include <stdexcept>
+ #include <string>
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
