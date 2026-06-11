Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409E5CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180CD60FA3;
	Fri, 12 Jun 2026 11:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIUdzH9Tk39y; Fri, 12 Jun 2026 11:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1265F60F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263368;
	bh=5JLTxBp7KDevP4PQnf8lPuHoehmciZpPmJKfQZppidI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dRX/+7874OZyMObZqbVglVJi3pae+YHRDxarJRc7lQpDj2l6V/+ATCmqJh+TTkMtP
	 g/EIK9R1/dTDw+iFfdabMomQZmukdmtFmokwvBeOVKf0YY8rQ8il+wCopZcYgd6jzi
	 9plzQ5V4qFIMn6uUGhesSg6vm1kXy/lL9Nm+uvjgphRoU/zhwxreQ1XjuxQjiTAPBG
	 VCDpxpEQ7yxTfVreA3zB30dSZGPeVpeqgvRvpU1v550YSHoREk5PP7D7JaReNiTkmQ
	 VpW8k8KzQChJUOJcLRyUG6QDmSGHf35E4Zf5ijHqxxO43xNaXWf86UNfvHFAKZzcjQ
	 8kQ7jd45M78yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1265F60F8C;
	Fri, 12 Jun 2026 11:22:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CFBB321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1320A832B3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SJEQiUx44Fz for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAA982CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CAA982CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDD1A880E9; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:34:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b347285b1d8d5c9e1c07e8b138fbb5a1cd792b0f
X-Git-Newrev: 086b60705442789601a5041325095f37140cb663
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.DDD1A880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freeipmi: bump to
 version 1.6.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/086b60705442789601a5041325095f37140cb663
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Removes the patches since they are all integrated upstream.

Release notes:
https://lists.gnu.org/archive/html/freeipmi-announce/2025-01/msg00000.html
https://lists.gnu.org/archive/html/freeipmi-announce/2025-09/msg00000.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b4a52c203c4bfc3f3a26dc19fe19533647229fd9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-sel-ipmi-sel-string-supermicro-common.h-.patch | 36 --------------
 ...ipmi-sensors-fix-header-guard-definitions.patch | 57 ----------------------
 .../0003-ipmi-sensors-add-missing-include.patch    | 28 -----------
 package/freeipmi/freeipmi.hash                     |  2 +-
 package/freeipmi/freeipmi.mk                       |  2 +-
 5 files changed, 2 insertions(+), 123 deletions(-)

diff --git a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch b/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
deleted file mode 100644
index 848539e7c3..0000000000
--- a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9239a686e4bfd862145f4654017112a0f8cbbb0d Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Fri, 22 Mar 2024 21:07:28 -0700
-Subject: [PATCH] libfreeipmi/sel/ipmi-sel-string-supermicro-common.h: Add
- missing function prototype.
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: http://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=9239a686e4bfd862145f4654017112a0f8cbbb0d
----
- libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 10 ++++++++++
- 1 files changed, 15 insertions(+)
-
-diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-index 5785f2b64..be5e41d7d 100644
---- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-+++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-@@ -39,4 +39,14 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
-                                                                  unsigned int *wlen,
-                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
- 
-+int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
-+                                                               struct ipmi_sel_entry *sel_entry,
-+                                                               uint8_t sel_record_type,
-+                                                               char *buf,
-+                                                               unsigned int buflen,
-+                                                               unsigned int flags,
-+                                                               unsigned int *wlen,
-+                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
-+                                                               int *oem_rv);
-+
- #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
--- 
-2.30.2
-
diff --git a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch b/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
deleted file mode 100644
index b04b305835..0000000000
--- a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c3d1a3f5c550940577076ce2c4595b470ae963c3 Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Sun, 24 Mar 2024 13:11:55 -0700
-Subject: [PATCH] ipmi-sensors: fix header guard definitions
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=c3d1a3f5c550940577076ce2c4595b470ae963c3
----
- ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h | 2 +-
- ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h | 2 +-
- ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h | 2 +-
- 3 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-index 0b11e61ce..4ae808cda 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S2600JF_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S2600JF_H
- 
- #include "ipmi-sensors.h"
- 
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-index 0607b125d..5c6410b7b 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S2600WP_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S2600WP_H
- 
- #include "ipmi-sensors.h"
- 
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-index f4f3dc85b..204295bd8 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S5500WB_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S5500WB_H
- 
- #include "ipmi-sensors.h"
- 
--- 
-2.39.2
-
diff --git a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch b/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
deleted file mode 100644
index 8bc44165a0..0000000000
--- a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Mon, 25 Mar 2024 13:57:45 -0700
-Subject: [PATCH] ipmi-sensors: add missing include
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e
----
- ipmi-sensors/ipmi-sensors-oem-intel.c | 1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
-index 5e0f3733a..3fc022e3d 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel.c
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
-@@ -34,6 +34,7 @@
- #include "ipmi-sensors-oem-intel.h"
- #include "ipmi-sensors-oem-intel-s5500wb.h"
- #include "ipmi-sensors-oem-intel-s2600jf.h"
-+#include "ipmi-sensors-oem-intel-s2600wp.h"
- #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
- #include "ipmi-sensors-oem-intel-node-manager.h"
- 
--- 
-2.39.2
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index 2f81d90c1d..9d06be8cf9 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5  freeipmi-1.6.14.tar.gz
+sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index fbbfd536e4..0581b931b0 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.14
+FREEIPMI_VERSION = 1.6.16
 FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
