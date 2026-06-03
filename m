Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECD5CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351FF85956;
	Tue,  9 Jun 2026 13:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL2JB3UDaeKw; Tue,  9 Jun 2026 13:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC2B85881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010177;
	bh=OLUi0ANrI4adPMYqTGQFci8V3IMF8iRvnLB2snapJe8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EJ47dqmglLUEbvWz8dIkSGJheysLXbUjUONnFZPYg+HmOQrtFq4z4USYs4kyK/KLK
	 pnlqNdNMqIn0MD4cpA3L3GtIMfNVi2ZoJ0gf7wKM1KLWeYswA0xK9NKE2tA1B7u5TT
	 vu/n0ZRsPBIjfyvdlL377E8WzGd90CL9zmzxFm7Jv16NlBd20ZB6FvnbAAbFJIp8oe
	 tfdvjTGu6e0j6IyByhjNidL+EFY5EEnJX8nPOjGj5GNDtBIK1Pn3OJ0kVRxleHJAe/
	 0qw5HboILgC/CVPs3I9c/F892dmNGJZIYLCd1BF07ZQbW001ox7tgL0lAkOJ8+E+OL
	 1E45XtOqneUrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC2B85881;
	Tue,  9 Jun 2026 13:02:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B9F190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EBD6F67E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qakrzDV3CMXA for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DAD66F690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DAD66F690
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D26787E7E; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:52:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da85ac72997ee2638cb8af1e8705a22fc02036c
X-Git-Newrev: b20c9b35681904579c11130bdbe1a9203c0eae77
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.5D26787E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycompress: bump to version
 1.2.16
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3797549698122752216=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3797549698122752216==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b20c9b35681904579c11130bdbe1a9203c0eae77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#tinycompress

Sent patch 0001 upstream and added Upstream: tag.

Added patch 0002 to fix musl build error introduced by this version
bump:
https://github.com/alsa-project/tinycompress/commit/cb3340621f73bb2d0b939461d8e22835d8c4b845

Added dependency to host-pkgconf, the build fails without it due to this
version bump:

1.2.13:
checking pkg-config is at least version 0.9.0... ./configure: line 16805:
 /home/bernd/buildroot/output/host/bin/pkg-config: No such file or directory
no
checking that generated files are newer than configure... done

1.2.16:
checking pkg-config is at least version 0.9.0... ./configure: line 18346:
 /home/bernd/buildroot/output/host/bin/pkg-config: No such file or directory
no
configure: error: pkg-config not found

This behaviour is caused by the usage of newer autotools to create the
configure script:

  # Generated by GNU Autoconf 2.69 for tinycompress 1.2.13.

  # Generated by GNU Autoconf 2.72 for tinycompress 1.2.16.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...-wave-add-time.h-missing-header-inclusion.patch |  4 +++
 .../0002-utils-sofprobeclient-fix-musl-build.patch | 42 ++++++++++++++++++++++
 package/tinycompress/tinycompress.hash             |  4 +--
 package/tinycompress/tinycompress.mk               |  3 +-
 5 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 684921535c..ce04f5078c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -894,7 +894,6 @@ package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch lib_patch.Upstr
 package/ti-sgx-um/S80ti-sgx lib_sysv.Variables
 package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
-package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch b/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
index 4068a54074..75b6a1f36c 100644
--- a/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
+++ b/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
@@ -18,6 +18,10 @@ This patch fixes this build failure by including <time.h> prior
 <sound/asound.h>.
 
 Signed-off-by: Julien Olivain <ju.o@free.fr>
+
+Upstream: https://github.com/alsa-project/tinycompress/pull/38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/utils/wave.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/package/tinycompress/0002-utils-sofprobeclient-fix-musl-build.patch b/package/tinycompress/0002-utils-sofprobeclient-fix-musl-build.patch
new file mode 100644
index 0000000000..9eeee6c8d4
--- /dev/null
+++ b/package/tinycompress/0002-utils-sofprobeclient-fix-musl-build.patch
@@ -0,0 +1,42 @@
+From b0361dc7fef630248310db1cdea1ee89f68ead7b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Jun 2026 20:20:01 +0200
+Subject: [PATCH] utils: sofprobeclient: fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With musl C library, we see following build failure:
+
+probes_demux.c: In function ‘parser_parse_data’:
+probes_demux.c:321:9: error: unknown type name ‘uint’; did you mean ‘int’?
+  321 |         uint i = 0;
+
+probes_demux.c:386:25: error: unknown type name ‘uint’; did you mean ‘int’?
+  386 |                         uint data_to_copy;
+
+uint is defined in <sys/types.h> header. It is usually included by
+<stdlib.h> but in musl stdlib.h doesn't include it.
+
+Upstream: https://github.com/alsa-project/tinycompress/pull/37
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/utils/sofprobeclient/probes_demux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/sofprobeclient/probes_demux.c b/src/utils/sofprobeclient/probes_demux.c
+index b11f702..be0a2e0 100644
+--- a/src/utils/sofprobeclient/probes_demux.c
++++ b/src/utils/sofprobeclient/probes_demux.c
+@@ -16,6 +16,7 @@
+ #include <string.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <sys/types.h>
+ 
+ #include "probe_dma_frame.h"
+ 
+-- 
+2.47.3
+
diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
index 1a2b2c0203..65388cd3c8 100644
--- a/package/tinycompress/tinycompress.hash
+++ b/package/tinycompress/tinycompress.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# from https://www.alsa-project.org/files/pub/tinycompress/tinycompress-1.2.13.tar.bz2.sig
+# from https://www.alsa-project.org/files/pub/tinycompress/tinycompress-1.2.16.tar.bz2.sig
 # with key F04DF50737AC1A884C4B3D718380596DA6E59C91
-sha256  0efe6cbd7bff31983e0d416df0436767665cc4cd70d278c06ce0e83e0eeab5db  tinycompress-1.2.13.tar.bz2
+sha256  2662336a8e583b9acb005350ad36edf13f01bc39ac8cb05347846c783273efb0  tinycompress-1.2.16.tar.bz2
 
 # Locally calculated
 sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index b5764ea293..d514eab7a2 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-TINYCOMPRESS_VERSION = 1.2.13
+TINYCOMPRESS_VERSION = 1.2.16
 TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
 TINYCOMPRESS_LICENSE_FILES = COPYING
 TINYCOMPRESS_INSTALL_STAGING = YES
+TINYCOMPRESS_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))

--===============3797549698122752216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3797549698122752216==--
