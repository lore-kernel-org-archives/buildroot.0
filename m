Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F28ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 12:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFFBD60D60;
	Sat, 27 Aug 2022 12:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFFBD60D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnQhPNCA8XpN; Sat, 27 Aug 2022 12:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7D960D4E;
	Sat, 27 Aug 2022 12:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7D960D4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025DB1BF44A
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 12:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D128C81777
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 12:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D128C81777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEpMDr3FeF82 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 12:05:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F3281776
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 12:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F3281776
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3200987DE5; Sat, 27 Aug 2022 11:50:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 13:50:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89d764720db365f55f725db1e2beecd134276c21
X-Git-Newrev: 6fc91c4359eab23a9f4a655392a40fb79d482a48
X-Patchwork-Hint: ignore
Message-Id: <20220827115007.3200987DE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/slirp4netns: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fc91c4359eab23a9f4a655392a40fb79d482a48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

slirp4netns is for user-mode networking for unprivileged network
namespace.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                    |  1 +
 package/slirp4netns/Config.in        | 20 ++++++++++++++++++++
 package/slirp4netns/slirp4netns.hash |  3 +++
 package/slirp4netns/slirp4netns.mk   | 15 +++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4bfc12d1d1..57c0e7959a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1939,6 +1939,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/siproxd/Config.in"
 	source "package/slirp/Config.in"
+	source "package/slirp4netns/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
 	source "package/sysrepo/Config.in"
diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
new file mode 100644
index 0000000000..22414dfbc9
--- /dev/null
+++ b/package/slirp4netns/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SLIRP4NETNS
+	bool "slirp4netns"
+	depends on BR2_USE_MMU # libcap, libglib2, slirp
+	depends on BR2_USE_WCHAR # libglib2, slirp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_SLIRP
+	help
+	  User-mode networking for unprivileged network namespaces.
+
+	  https://github.com/rootless-containers/slirp4netns
+
+comment "slirp4netns needs a toolchain w/ wchar, threads, headers >= 3.17"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
new file mode 100644
index 0000000000..e3115c1be0
--- /dev/null
+++ b/package/slirp4netns/slirp4netns.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
+sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
new file mode 100644
index 0000000000..7ff594cc44
--- /dev/null
+++ b/package/slirp4netns/slirp4netns.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# slirp4netns
+#
+################################################################################
+
+SLIRP4NETNS_VERSION = 1.2.0
+SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
+SLIRP4NETNS_LICENSE = GPL-2.0
+SLIRP4NETNS_LICENSE_FILES = COPYING
+SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
+
+SLIRP4NETNS_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
