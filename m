Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6BEC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E7E84B20;
	Wed,  1 Nov 2023 17:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E7E84B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hICa0o4AQvO3; Wed,  1 Nov 2023 17:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7586F84C85;
	Wed,  1 Nov 2023 17:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7586F84C85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAE921BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD2704EDD1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD2704EDD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMhWdTwRhD0b for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:26:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B944EDCC
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B944EDCC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CEC9863AF; Wed,  1 Nov 2023 17:26:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:21:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff240cba1b496247670741e2b5afe509804faf77
X-Git-Newrev: a96361901dcc7b962a0c43f163e97a2de65687f3
X-Patchwork-Hint: ignore
Message-Id: <20231101172600.8CEC9863AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-pico: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a96361901dcc7b962a0c43f163e97a2de65687f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zenoh-pico is the Eclipse zenoh implementation that targets constrained
devices and offers a native C API. It is fully compatible with its main
Rust Zenoh implementation, providing a lightweight implementation of
most functionalities.

https://github.com/eclipse-zenoh/zenoh-pico

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libzenoh-pico/Config.in          | 10 ++++++++++
 package/libzenoh-pico/libzenoh-pico.hash |  3 +++
 package/libzenoh-pico/libzenoh-pico.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a501f45e9..c64fd07002 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -72,6 +72,7 @@ F:	package/libqmi/
 F:	package/modem-manager/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
 N:	Alex Suykov <alex.suykov@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..57e9261eea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1993,6 +1993,7 @@ menu "Networking"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
 	source "package/mdnsd/Config.in"
diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
new file mode 100644
index 0000000000..093c6d4f75
--- /dev/null
+++ b/package/libzenoh-pico/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBZENOH_PICO
+	bool "libzenoh-pico"
+	help
+	  zenoh-pico is the Eclipse zenoh implementation that targets
+	  constrained devices and offers a native C API. It is fully
+	  compatible with its main Rust Zenoh implementation,
+	  providing a lightweight implementation of most
+	  functionalities.
+
+	  https://github.com/eclipse-zenoh/zenoh-pico
diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
new file mode 100644
index 0000000000..564ecc9a57
--- /dev/null
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  752acec56236fca41dcc438307f4a76e69900383b06803d47f32c480643dc794  libzenoh-pico-0.10.0-rc.tar.gz
+sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
new file mode 100644
index 0000000000..72b956fddc
--- /dev/null
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libzenoh-pico
+#
+################################################################################
+
+LIBZENOH_PICO_VERSION = 0.10.0-rc
+LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
+LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_PICO_LICENSE_FILES = LICENSE
+LIBZENOH_PICO_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBZENOH_PICO_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
