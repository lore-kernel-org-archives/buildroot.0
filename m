Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18D60400AF;
	Sun, 13 Feb 2022 19:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZhySSGUhoqt; Sun, 13 Feb 2022 19:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A75C6400F5;
	Sun, 13 Feb 2022 19:59:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C731BF20B
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C616460B94
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CP3Vtp9o-38B for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 19:59:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3C0060812
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 19:59:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CFFDE82297; Sun, 13 Feb 2022 19:52:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 20:59:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ee6be2bdc8882eb04b5480b61d3c369c06972b8
X-Git-Newrev: 115ad9c54874dd14fd53ece9ae4ce6858ad743ad
X-Patchwork-Hint: ignore
Message-Id: <20220213195207.CFFDE82297@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: gobject-introspection is
 mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=115ad9c54874dd14fd53ece9ae4ce6858ad743ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vapi (and gobject-introspection) is mandatory since bump to version
0.40.2 in commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

valac -C --pkg posix --pkg libxml-2.0 --pkg gmodule-2.0 --pkg gio-2.0 --pkg gssdp-1.2 --pkg gee-0.8 --pkg gupnp-1.2 --target-glib ' 2.56' --pkg glib-2.0 --color=always --directory src/librygel-core/librygel-core-2.6.so.2.0.4.p --basedir ../src/librygel-core --library rygel-core-2.6 --header src/librygel-core/rygel-core.h --vapi ../rygel-core-2.6.vapi --gir ../Rygel-2.6.gir ../src/librygel-core/rygel-build-config.vapi ../src/librygel-core/rygel-connection-manager.vala ../src/librygel-core/rygel-basic-management.vala ../src/librygel-core/rygel-basic-management-test.vala ../src/librygel-core/rygel-basic-management-test-ping.vala ../src/librygel-core/rygel-basic-management-test-nslookup.vala ../src/librygel-core/rygel-basic-management-test-traceroute.vala ../src/librygel-core/rygel-description-file.vala ../src/librygel-core/rygel-dlna-profile.vala ../src/librygel-core/rygel-energy-management.vala ../src/librygel-core/rygel-root-device.vala ../src/librygel-core/rygel-root-device-factory.v
 ala ../src/librygel-core/rygel-dbus-interface.vala ../src/librygel-core/rygel-log-handler.vala ../src/librygel-core/rygel-meta-config.vala ../src/librygel-core/rygel-plugin-loader.vala ../src/librygel-core/rygel-recursive-module-loader.vala ../src/librygel-core/rygel-plugin.vala ../src/librygel-core/rygel-resource-info.vala ../src/librygel-core/rygel-media-device.vala ../src/librygel-core/rygel-configuration.vala ../src/librygel-core/rygel-base-configuration.vala ../src/librygel-core/rygel-cmdline-config.vala ../src/librygel-core/rygel-environment-config.vala ../src/librygel-core/rygel-user-config.vala ../src/librygel-core/rygel-state-machine.vala ../src/librygel-core/rygel-v1-hacks.vala ../src/librygel-core/rygel-icon-info.vala ../src/librygel-core/rygel-xml-utils.vala ../src/librygel-core/rygel-plugin-information.vala
error: Package `gssdp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories
error: Package `gupnp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories

Depends on BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES instead of selecting
it to avoid the following recursive dependency:

package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
package/rygel/Config.in:46:	symbol BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1 is part of choice <choice>
package/rygel/Config.in:39:	choice <choice> contains symbol <choice>
package/rygel/Config.in:39:	choice <choice> contains symbol BR2_PACKAGE_RYGEL
package/rygel/Config.in:1:	symbol BR2_PACKAGE_RYGEL depends on BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
package/fluidsynth/Config.in:37:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
package/gstreamer1/gst1-plugins-bad/Config.in:425:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

Fixes:
 - http://autobuild.buildroot.org/results/027ce84895fab6fb251dd37cd5cfb7169287a2de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rygel/Config.in | 23 +++++++++++++++++------
 package/rygel/rygel.mk  |  9 ++-------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index df48918833..30e8430537 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -2,8 +2,14 @@ config BR2_PACKAGE_RYGEL
 	bool "rygel"
 	depends on BR2_USE_WCHAR # gupnp-av
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
-	depends on BR2_USE_MMU # gupnp-av
+	depends on BR2_USE_MMU # gupnp-av, gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_GUPNP_AV
 	select BR2_PACKAGE_GUPNP_DLNA
 	select BR2_PACKAGE_LIBGEE
@@ -39,14 +45,19 @@ config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE
 
 config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
 	bool "gstreamer1"
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
+	depends on BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
+
+comment "gstreamer1 needs gst1-editing-services"
+	depends on !BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 
 endchoice
 
-comment "rygel needs a toolchain w/ wchar, threads"
+comment "rygel needs a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 endif # BR2_PACKAGE_RYGEL
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index c541cdc0ed..bfcd5df3c6 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -12,6 +12,7 @@ RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
 RYGEL_LICENSE_FILES = COPYING COPYING.logo
 RYGEL_DEPENDENCIES = \
 	gdk-pixbuf \
+	gobject-introspection \
 	gupnp-av \
 	gupnp-dlna \
 	libgee \
@@ -24,16 +25,10 @@ RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
 	-Dapi-docs=false \
 	-Dexamples=false \
+	-Dintrospection=enabled \
 	-Dtests=false
 RYGEL_PLUGINS = external,lms,mpris,ruih
 
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-RYGEL_CONF_OPTS += -Dintrospection=enabled
-RYGEL_DEPENDENCIES += gobject-introspection
-else
-RYGEL_CONF_OPTS += -Dintrospection=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
 RYGEL_CONF_OPTS += \
 	-Dengines=gstreamer \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
