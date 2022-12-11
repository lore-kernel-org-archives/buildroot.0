Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF9EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94464ECB2;
	Mon, 20 Feb 2023 21:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94464ECB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCilzsLmcTtK; Mon, 20 Feb 2023 21:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF8F4C5A3;
	Mon, 20 Feb 2023 21:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF8F4C5A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 805031BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8BFB416A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8BFB416A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ds4VHjASxTBw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3FDD416A3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FDD416A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0A8286494; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:19:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 61f03109c7d6b2a66462d920ee5f4b9f7530ca7a
X-Git-Newrev: 6fc4b59ffd3007ca9e436d33647acc5dfff62970
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.C0A8286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ulogd: bump to version
 2.0.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fc4b59ffd3007ca9e436d33647acc5dfff62970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Update configure options due to
  https://git.netfilter.org/ulogd2/commit/?id=794f0385ab60fd8c52ff3ce498c8aac78b58ac20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-ulogd-fix-build-with-musl-libc.patch      | 32 ----------------------
 package/ulogd/ulogd.hash                           |  6 ++--
 package/ulogd/ulogd.mk                             | 26 +++++++++---------
 3 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch b/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
deleted file mode 100644
index af6e13648c..0000000000
--- a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 675e762091380590f78ff07a94a25caa459b786b Mon Sep 17 00:00:00 2001
-From: Cameron Norman <camerontnorman@gmail.com>
-Date: Sat, 27 Oct 2018 13:05:45 -0700
-Subject: ulogd: fix build with musl libc
-
-The attached patch fixes building ulogd2 with musl libc. It is being
-used on Void Linux right now.
-
-Closes: https://bugzilla.netfilter.org/show_bug.cgi?id=1278
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrrieved from:
-https://git.netfilter.org/ulogd2/commit/?id=675e762091380590f78ff07a94a25caa459b786b]
----
- src/ulogd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ulogd.c b/src/ulogd.c
-index b8bc57c..9cd64e8 100644
---- a/src/ulogd.c
-+++ b/src/ulogd.c
-@@ -65,6 +65,7 @@
- #include <sys/time.h>
- #include <sys/stat.h>
- #include <sched.h>
-+#include <limits.h>
- #include <ulogd/conffile.h>
- #include <ulogd/ulogd.h>
- #ifdef DEBUG
--- 
-cgit v1.2.1
-
diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
index 0e07a714ee..35b518b9ce 100644
--- a/package/ulogd/ulogd.hash
+++ b/package/ulogd/ulogd.hash
@@ -1,7 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.7.tar.bz2.{md5sum,sha1sum}
-md5  2bb2868cf51acbb90c35763c9f995f31  ulogd-2.0.7.tar.bz2
-sha1  f2d90469e2842e2bfbe19c55cf6d56ac107aa4b9  ulogd-2.0.7.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.8.tar.bz2.sha256sum
+sha256  4ead6c3970c3f57fa1e89fe2d7cc483ba6fe2bd1b08701521e0b3afd667df291  ulogd-2.0.8.tar.bz2
 
 # Locally calculated
-sha256  990a05494d9c16029ba0a83f3b7294fc05c756546b8d60d1c1572dc25249a92b  ulogd-2.0.7.tar.bz2
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index c00a53f3d5..65280a2ba6 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.7
+ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --without-dbi
+ULOGD_CONF_OPTS = --disable-dbi
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
@@ -18,39 +18,39 @@ ULOGD_SELINUX_MODULES = ulogd
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+ULOGD_CONF_OPTS += --enable-mysql
 ULOGD_DEPENDENCIES += mysql
 else
-ULOGD_CONF_OPTS += --without-mysql
+ULOGD_CONF_OPTS += --disable-mysql
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-ULOGD_CONF_OPTS += --with-pgsql
+ULOGD_CONF_OPTS += --enable-pgsql
 ULOGD_DEPENDENCIES += postgresql
 else
-ULOGD_CONF_OPTS += --without-pgsql
+ULOGD_CONF_OPTS += --disable-pgsql
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-ULOGD_CONF_OPTS += --with-sqlite
+ULOGD_CONF_OPTS += --enable-sqlite3
 ULOGD_DEPENDENCIES += sqlite
 else
-ULOGD_CONF_OPTS += --without-sqlite
+ULOGD_CONF_OPTS += --disable-sqlite3
 endif
 else
-ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
+ULOGD_CONF_OPTS += --disable-mysql --disable-pgsql --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-ULOGD_CONF_OPTS += --with-pcap
+ULOGD_CONF_OPTS += --enable-pcap
 ULOGD_DEPENDENCIES += libpcap
 else
-ULOGD_CONF_OPTS += --without-pcap
+ULOGD_CONF_OPTS += --disable-pcap
 endif
 
 ifeq ($(BR2_PACKAGE_JANSSON),y)
-ULOGD_CONF_OPTS += --with-jansson
+ULOGD_CONF_OPTS += --enable-json
 ULOGD_DEPENDENCIES += jansson
 else
-ULOGD_CONF_OPTS += --without-jansson
+ULOGD_CONF_OPTS += --disable-json
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
