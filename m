Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CFDEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D1F0605EC;
	Sun,  9 Jul 2023 16:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1F0605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhHKrG4v8IKI; Sun,  9 Jul 2023 16:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88BF860625;
	Sun,  9 Jul 2023 16:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88BF860625
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4EE61BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E155401CD
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E155401CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oY9C94YD4xQi for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:28:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2826340096
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2826340096
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12BB686896; Sun,  9 Jul 2023 16:28:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:27:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ca3304276bd155d3d29fb87f227866bd7f32ec7
X-Git-Newrev: c3cee366cb23252102d26713e1398caa7733c8fe
X-Patchwork-Hint: ignore
Message-Id: <20230709162808.12BB686896@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: bump version to 1.2.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3cee366cb23252102d26713e1398caa7733c8fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Switched _SITE according to http://www.musl-libc.org/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ct-parameter-name-in-internal-netlink.h-R.patch | 33 ----------------------
 package/musl/Config.in                             |  2 +-
 package/musl/musl.hash                             |  4 +--
 package/musl/musl.mk                               |  4 +--
 5 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 24adeeb70d..7f45b6a808 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1010,7 +1010,6 @@ package/musepack/0004-missing-sys-select.patch Upstream
 package/musepack/0005-fix-build-with-gcc-10.patch Upstream
 package/musl/0001-avoid-kernel-if_ether.h.patch Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch Upstream
-package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch Upstream
 package/ncftp/0001-fix-gcc-10.patch Upstream
diff --git a/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch b/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
deleted file mode 100644
index fa3057ff08..0000000000
--- a/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8cf87b3027009c0acac591d9ae80262dc25daccf Mon Sep 17 00:00:00 2001
-From: Ondrej Jirman <megous@megous.com>
-Date: Wed, 21 Nov 2018 17:29:21 +0100
-Subject: [PATCH] fix incorrect parameter name in internal netlink.h RTA_OK
- macro
-
-the wrong name works only by accident.
-
-Signed-off-by: Ondrej Jirman <megous@megous.com>
-Signed-off-by: Rich Felker <dalias@aerifal.cx>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-
-[ upstream status: 8cf87b3027009c0acac591d9ae80262dc25daccf ]
----
- src/network/netlink.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/network/netlink.h b/src/network/netlink.h
-index 38acb178..873fabe2 100644
---- a/src/network/netlink.h
-+++ b/src/network/netlink.h
-@@ -86,7 +86,7 @@ struct ifaddrmsg {
- #define RTA_DATALEN(rta)	((rta)->rta_len-sizeof(struct rtattr))
- #define RTA_DATAEND(rta)	((char*)(rta)+(rta)->rta_len)
- #define RTA_NEXT(rta)		(struct rtattr*)((char*)(rta)+NETLINK_ALIGN((rta)->rta_len))
--#define RTA_OK(nlh,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
-+#define RTA_OK(rta,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
- 
- #define NLMSG_RTA(nlh,len)	((void*)((char*)(nlh)+sizeof(struct nlmsghdr)+NETLINK_ALIGN(len)))
- #define NLMSG_RTAOK(rta,nlh)	RTA_OK(rta,NLMSG_DATAEND(nlh))
--- 
-2.36.0
-
diff --git a/package/musl/Config.in b/package/musl/Config.in
index c1a10bdd58..f3210c5119 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -37,4 +37,4 @@ config BR2_PACKAGE_MUSL
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
 	help
-	  https://www.musl-libc.org/
+	  http://musl.libc.org/
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index e093a5358e..3b5fccc9e2 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://musl.libc.org/releases/musl-1.2.3.tar.gz.asc
-sha256  7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4  musl-1.2.3.tar.gz
+# http://musl.libc.org/releases/musl-1.2.4.tar.gz.asc
+sha256  7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039  musl-1.2.4.tar.gz
 sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 30c3c2fbc0..08706c139f 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.3
-MUSL_SITE = http://www.musl-libc.org/releases
+MUSL_VERSION = 1.2.4
+MUSL_SITE = http://musl.libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
 MUSL_CPE_ID_VENDOR = musl-libc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
