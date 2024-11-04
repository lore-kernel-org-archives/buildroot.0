Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1D9D1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1BD80AC9;
	Mon,  4 Nov 2024 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lfhZMc_vmT9; Mon,  4 Nov 2024 20:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0100B80CE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0100B80CE9;
	Mon,  4 Nov 2024 20:23:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C91B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633FD60780
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pc97MLiVBBRz for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 194566077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194566077F
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 194566077F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:23:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 83bctdk9st0rY83bct9D5C; Mon, 04 Nov 2024 21:23:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  4 Nov 2024 21:23:19 +0100
Message-Id: <20241104202319.2193487-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241026221347.22f27cad@windsurf>
References: <20241026221347.22f27cad@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEAZOzZyXali75uCv8Kj4QNyRgoLnm2pxT6IZJxZ3tfrbnDZHauZ5W+3hrMM35qPcBkLkNw9daWSHAxylJZFHspDX2H6HecJCfZSYSPERGWNuLAzYpyr
 jsT9MFEaQ54TEZe9KRUdAhTvPTnSV+Lx/94kB87cGCJVydXmFJIuge/oXEbeBP6w1IHJOZY6jpsn4RBxQHUenxN24iSrP7q3k4MORtonzGB/7MEik9zKxwAe
 UvaP+eI8LCrVcOgyQN734MAk0K8mNsFCq8EMOqSsMGYH0glQOWcd+CEa2fvVrsxQDeY7J3lL7PZiOdoOKHpDWw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730751800; bh=sFuUGT92oSfYmij3Lsj5ssh0B2iqHBnMEHNeMUKD6zQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=iMs2CULp4i3uB+fSgJ94HGVMAihw2u9UCi6DXn+yUAMSIhgfgPXa6rs44ClegHzs0
 aikeNErGCTZA01anRNLCSNS827FozrYVE9dVd0K2pfYTaEDLb+HFPI8Aai1KmumWTc
 EtbjSJRUZtFBw15FBJOTIQZzZQTaayPxvvH98LoMZa4VeP7NPkw2MBLh1zCcNqOIZC
 KSD+2tQZJfFn5q9h2fe3sr5EKM63gJF43jAXSDCs/ZE/LI6iasjkltj/jeaWyafDNc
 7Prcr1ERQDBdVPb5FG/aPTsyNKYbdIsBXvXmgKb5XScimG3ZMeGPZE4Ce7ygzxBwG1
 v+7EBCH9KBCNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iMs2CULp
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* disable junction and nfsdctl by default
* drop 2 local patches that have been committed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-reexport-.c-Re-add-missing-includes.patch | 44 -------------------
 ...d_sqlite.c-Add-missing-sys-syscall.h.patch | 31 -------------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  6 ++-
 4 files changed, 7 insertions(+), 78 deletions(-)
 delete mode 100644 package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
 delete mode 100644 package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch

diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
deleted file mode 100644
index 4f79af450e..0000000000
--- a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Tue, 5 Dec 2023 20:40:36 +0100
-Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
-
-Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
-<sys/un.h> for struct sockaddr_un.
-
-Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
-Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/
----
- support/reexport/fsidd.c    | 2 ++
- support/reexport/reexport.c | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
-index 3e62b3fc..814fb48e 100644
---- a/support/reexport/fsidd.c
-+++ b/support/reexport/fsidd.c
-@@ -7,6 +7,8 @@
- #include <dlfcn.h>
- #endif
- #include <event2/event.h>
-+#include <sys/un.h>
-+#include <unistd.h>
-
- #include "conffile.h"
- #include "reexport_backend.h"
-diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
-index 78516586..1900b336 100644
---- a/support/reexport/reexport.c
-+++ b/support/reexport/reexport.c
-@@ -7,6 +7,7 @@
- #endif
- #include <sys/types.h>
- #include <sys/vfs.h>
-+#include <unistd.h>
- #include <errno.h>
-
- #include "nfsd_path.h"
---
-2.43.0
diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
deleted file mode 100644
index 88e1a9068d..0000000000
--- a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Tue, 5 Dec 2023 23:20:33 +0100
-Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
-
-This fixes build on systems which actually needs getrandom()
-(to get SYS_getrandom).
-
-Fixes: f92fd6ca ("support/backend_sqlite.c: Add getrandom() fallback")
-Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
-Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/
----
- support/reexport/backend_sqlite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
-index 0eb5ea37..54dfe447 100644
---- a/support/reexport/backend_sqlite.c
-+++ b/support/reexport/backend_sqlite.c
-@@ -7,6 +7,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/syscall.h>
- #include <unistd.h>
-
- #ifdef HAVE_GETRANDOM
---
-2.43.0
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9d74991df1..b4ecbd0aec 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.4/sha256sums.asc
-sha256  01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d  nfs-utils-2.6.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.1/sha256sums.asc
+sha256  a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505  nfs-utils-2.8.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index b757e3e51d..d79760ab00 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.4
+NFS_UTILS_VERSION = 2.8.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -17,6 +17,8 @@ NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
 	--enable-ipv6 \
+	--disable-junction \
+	--disable-nfsdctl \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
@@ -30,6 +32,8 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--disable-gss \
 	--disable-uuid \
 	--disable-ipv6 \
+	--disable-junction \
+	--disable-nfsdctl \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
