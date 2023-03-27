Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514A9C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 19:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6576109C;
	Mon, 27 Mar 2023 19:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6576109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBFo2FiE743s; Mon, 27 Mar 2023 19:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E5F6109E;
	Mon, 27 Mar 2023 19:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E5F6109E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 034EF1BF409
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 19:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0F3440BAF
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 19:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0F3440BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn-9Ej5sNywp for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 19:26:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6000E400C1
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6000E400C1
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 19:26:31 +0000 (UTC)
Received: from localhost.localdomain ([146.241.97.239])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gsU8paR4AMFtdgsU9pkxdZ; Mon, 27 Mar 2023 21:26:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 21:26:28 +0200
Message-Id: <20230327192628.566995-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAonFYfXnxeOOpNARPCkaZij7iXpCU62k8sD765+MNA/CB00Cu5vMa9cyA0Ngv43ynjvPnPbMfnnkDsA6lsCvTqvhnCMZGdlXLhz1iH9Q/2yMLJPYcmc
 4zlPMO29ttctLtDvfmgfJkeUlFAp5SZ/f6KsSocv9YFLGSnZ6zoCL7PijLg+Sg12UWKcfKYp1KhK6YJG76fDELHKMRkVKEHE7KFL6cp2dm4RU6i3CzzhO+z6
 gyYAKOcN22TmBaIfemWu0gRaUPQWSIjlfFAjNEh5saZ39Fhz/2zPfToPLByy64s4KhN+Vb/8rlc2QDIPjHoDkw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679945189; bh=MuigX68mFEowZguyQRO99ntTe+wE7WzxQUJpNuzap74=;
 h=From:To:Subject:Date:MIME-Version;
 b=Npl3NfB8LTqyaShrfSvdjldqAxh1EaJhNFKs5L8JXPd5CldTJeimxETar5Dlyeab6
 asY6HyJs0PRGP9rxeK71QRdjEJ4WPznDuwISWbYTOzVsEsQQu4B2mxJ0m/bLJjysUO
 oSEiuDl8ThM1+HmZuLhjqKHKOWrszyruL6KxiGPLDAkZtvy1KYcYJXwyUECE+sa6Km
 f0cfFzQDywSLxUY2wt4gGCq61JSugcXYGFGPnCMWMfAa4QKygap78wUjXJQy6dFwr+
 hpli8QfkGDtgBu/0eTnVSHQDoM1KOKco4bBZEYTp/UODnTFIN90Yac03Y6/ToMjywW
 zAqgSgYGreDBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Npl3NfB8
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.14.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream[0] to fix build failure with uclibc.

[0]: https://github.com/libfuse/libfuse/pull/753

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ix-MS_LAZYTIME-not-defined-on-uclibc.patch | 48 +++++++++++++++++++
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 3 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch

diff --git a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
new file mode 100644
index 0000000000..58f9747d77
--- /dev/null
+++ b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
@@ -0,0 +1,48 @@
+From 56038446952516da5d4cf09e1192824031082943 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 27 Mar 2023 21:08:57 +0200
+Subject: [PATCH] Fix MS_LAZYTIME not defined on uclibc
+
+[Upstream status: https://github.com/libfuse/libfuse/pull/753]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/mount.c       | 5 +++++
+ util/fusermount.c | 6 ++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/lib/mount.c b/lib/mount.c
+index 1f1ee86..84e5c73 100644
+--- a/lib/mount.c
++++ b/lib/mount.c
+@@ -27,6 +27,11 @@
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ 
++/* uclibc doesn't define MS_LAZYTIME */
++#ifndef MS_LAZYTIME
++#define MS_LAZYTIME	(1<<25)
++#endif
++
+ #ifdef __NetBSD__
+ #include <perfuse.h>
+ 
+diff --git a/util/fusermount.c b/util/fusermount.c
+index 6e72f0d..82cc420 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -25,6 +25,12 @@
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+ #include <sys/mount.h>
++
++/* uclibc doesn't define MS_LAZYTIME */
++#ifndef MS_LAZYTIME
++#define MS_LAZYTIME	(1<<25)
++#endif
++
+ #include <sys/fsuid.h>
+ #include <sys/socket.h>
+ #include <sys/utsname.h>
+-- 
+2.34.1
+
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 2d78153c81..df4df524d0 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  b14f7d97abc11a5a70a37955021a7a1d8eb1d3dd5b6abec66af093eae3168c62  libfuse3-3.14.0.tar.gz
+sha256  99688d68a753ee97eed51d536b216b8ae5d7fe0236c1a45d439357903bfd4d88  libfuse3-3.14.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 8c306ba187..61523820ad 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.14.0
+LIBFUSE3_VERSION = 3.14.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
