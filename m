Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE834C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A2160BE1;
	Sat, 22 Jan 2022 22:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFZVakyRU4Yv; Sat, 22 Jan 2022 22:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 767CE60BD0;
	Sat, 22 Jan 2022 22:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D67C91BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D367440296
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LI-2z5iWXBzr for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:33:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E01B640247
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:33:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 39A8C8296B; Sat, 22 Jan 2022 22:26:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a394c17b79fbdd9d7f441e858e280c2cf225bfd0
X-Git-Newrev: e043719c9747cf3a62780827deae5c08a5c7553f
X-Patchwork-Hint: ignore
Message-Id: <20220122222619.39A8C8296B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: security bump to version
 1.4.64
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

commit: https://git.buildroot.net/buildroot/commit/?id=e043719c9747cf3a62780827deae5c08a5c7553f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-22707: In lighttpd 1.4.46 through 1.4.63, the
mod_extforward_Forwarded function of the mod_extforward plugin has a
stack-based buffer overflow (4 bytes representing -1), as demonstrated
by remote denial of service (daemon crash) in a non-default
configuration. The non-default configuration requires handling of the
Forwarded header in a somewhat unusual manner. Also, a 32-bit system is
much more likely to be affected than a 64-bit system.

gdbm, geoip and memcached options have been dropped with
https://github.com/lighttpd/lighttpd1.4/commit/86c2d3093686c4f945086c90af9b8a7900925b6b

https://www.lighttpd.net/2022/1/19/1.4.64/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 7601745fd7..ce026b9b4a 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.63.sha256sum
-sha256  2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9  lighttpd-1.4.63.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.sha512sum
+sha512  8e2ad0830ff80fcebf0c33600caafb5ab4e9ff6b5073c12572f88a44fdfe85f777fa8b22b2fc2964fecbeb556997ad660867dcee80efb224d63329c8b18ea936  lighttpd-1.4.64.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5d53767263..f0974dd5b2 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).63
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).64
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -16,8 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_brotli=false \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
-	-Dwith_gdbm=false \
-	-Dwith_geoip=false \
 	-Dwith_gnutls=false \
 	-Dwith_krb5=false \
 	-Dwith_ldap=false \
@@ -25,7 +23,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_libunwind=false \
 	-Dwith_maxminddb=false \
 	-Dwith_mbedtls=false \
-	-Dwith_memcached=false \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
