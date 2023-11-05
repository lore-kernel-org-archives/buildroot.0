Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C446FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57D6540A5F;
	Sun,  5 Nov 2023 20:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D6540A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfiZxA8ZIwJ8; Sun,  5 Nov 2023 20:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E5E940A68;
	Sun,  5 Nov 2023 20:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5E940A68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6BAE1BF5A3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC46F40A68
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC46F40A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEYkj6ph37Z7 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A6540A5F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A6540A5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0997C8680E; Sun,  5 Nov 2023 20:53:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 21:50:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 604573a625d46eed00043fbe71215109ec19f735
X-Git-Newrev: d5bba26801b352f591451cf73e0b7509de0e6850
X-Patchwork-Hint: ignore
Message-Id: <20231105205339.0997C8680E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oatpp: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d5bba26801b352f591451cf73e0b7509de0e6850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream suggests to use it as a static library only, so follow that
principle.

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
[Arnout:
 - keep DEVELOPERS alphabetical;
 - use oatpp for the prompt;
 - add threads to the toolchain dependencies comment;
 - move comment after the main prompt;
 - rewrap the help text;
 - empty line before upstream URL;
 - hash comment Locally calulated instead of pointing to upstream
   tarball URL;
 - change hash to sha256;
 - add hash for license file;
 - reorder variables in .mk file;
 - use _CONF_OPTS instead of invalid _CMAKE_OPTS.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/oatpp/Config.in  | 13 +++++++++++++
 package/oatpp/oatpp.hash |  3 +++
 package/oatpp/oatpp.mk   | 16 ++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d096ab0449..ac277423a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -71,6 +71,9 @@ F:	package/libmbim/
 F:	package/libqmi/
 F:	package/modem-manager/
 
+N:      Alessandro Partesotti <a.partesotti@gmail.com>
+F:      package/oatpp/
+
 N:	Alex Michel <alex.michel@wiedemann-group.com>
 F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
diff --git a/package/Config.in b/package/Config.in
index a0d5339b0a..cd687a682b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2009,6 +2009,7 @@ menu "Networking"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
+	source "package/oatpp/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/open-isns/Config.in"
 	source "package/open62541/Config.in"
diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
new file mode 100644
index 0000000000..a4009e8744
--- /dev/null
+++ b/package/oatpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_OATPP
+	bool "oatpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Oat++ is an open-source C++ web framework for highly scalable
+	  and resource-efficient web applications. It provides all the
+	  necessary components for production-grade development.
+
+	  https://oatpp.io/docs/start
+
+comment "oatpp needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
new file mode 100644
index 0000000000..e6b35d8d51
--- /dev/null
+++ b/package/oatpp/oatpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e1f80fa8fd7a74da6737e7fee1a4db68b4d7085a3f40e7d550752d6ff5714583  oatpp-1.3.0.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
new file mode 100644
index 0000000000..621a549023
--- /dev/null
+++ b/package/oatpp/oatpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# oatpp
+#
+################################################################################
+
+OATPP_VERSION = 1.3.0
+OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
+OATPP_LICENSE = Apache-2.0
+OATPP_LICENSE_FILES = LICENSE
+OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+OATPP_INSTALL_STAGING = YES
+# Only builds a static lib and headers
+OATPP_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
