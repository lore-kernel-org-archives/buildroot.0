Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368EFC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C061060E77;
	Tue, 16 Aug 2022 08:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C061060E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV9MkNnX-Z9d; Tue, 16 Aug 2022 08:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D412460E61;
	Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D412460E61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE67D1BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6BFB81C04
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BFB81C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVOMNUbdYeht for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB06381B26
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB06381B26
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD34E87736; Tue, 16 Aug 2022 08:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:17:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d952378f3ea89f94fc163587b0f1fa639f60bd09
X-Git-Newrev: abfdae4eb263e8c8ff90a6ff8b176c365759edcd
X-Patchwork-Hint: ignore
Message-Id: <20220816082038.BD34E87736@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/netsniff-ng:
 libnl is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=abfdae4eb263e8c8ff90a6ff8b176c365759edcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libnl is optional, not mandatory, since version 0.6.2 and
https://github.com/netsniff-ng/netsniff-ng/commit/20a5e15443bfbbb7e6624a754832cdce19d462a0
https://github.com/netsniff-ng/netsniff-ng/commit/b073c8e5fd7f8c723680b659bd81afd231ef32f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c0065069a7d086d0a394e967ca5c1890749f8399)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/Config.in      |  1 -
 package/netsniff-ng/netsniff-ng.mk | 11 +++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 5d1407baac..6b043362ba 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 27bd707c84..3bc11b55b9 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -13,7 +13,8 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
 NETSNIFF_NG_CONF_ENV = \
 	NACL_INC_DIR=/dev/null \
 	NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = host-pkgconf libnl libpcap libnetfilter_conntrack liburcu
+NETSNIFF_NG_DEPENDENCIES = host-pkgconf libpcap libnetfilter_conntrack liburcu
+NETSNIFF_NG_CONF_OPTS = --prefix=$(TARGET_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
 NETSNIFF_NG_DEPENDENCIES += libcli libnet
@@ -28,6 +29,12 @@ ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+NETSNIFF_NG_DEPENDENCIES += libnl
+else
+NETSNIFF_NG_CONF_OPTS += --disable-libnl
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 NETSNIFF_NG_DEPENDENCIES += ncurses
 endif
@@ -43,7 +50,7 @@ define NETSNIFF_NG_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
-		--prefix=$(TARGET_DIR)/usr \
+		$(NETSNIFF_NG_CONF_OPTS) \
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
