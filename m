Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8119CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBB881DE4;
	Sun, 15 Oct 2023 20:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EBB881DE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1BK0mK80ST4; Sun, 15 Oct 2023 20:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4ADD81E19;
	Sun, 15 Oct 2023 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4ADD81E19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C32BC1BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C6D04179F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C6D04179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBLmBbG6ruxg for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60F024179D
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F024179D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DB7385AD9; Sun, 15 Oct 2023 20:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:21:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 560f9dbc88f1dc68ba8dc4db8b9459d902786993
X-Git-Newrev: 0455f957a363e9b6a522a0f13b81715f27af11fe
X-Patchwork-Hint: ignore
Message-Id: <20231015202416.4DB7385AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.44.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0455f957a363e9b6a522a0f13b81715f27af11fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are now upstream.

CONTRIBUTING.md hash changed due to text various text updates, most of
them outside of the section about licensing. The only change in that
section is:

@@ -39,26 +39,29 @@
 new contributions already must already agree to that.
 For more details see [RELICENSE.md](RELICENSE.md).

+Do not use "Signed-off-by:" lines in commits for NetworkManager. It has no meaning.
+

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...-add-option-to-set-the-mobile-broadband-p.patch | 60 ----------------------
 ...-fix-build-failure-with-Dmodem_manager-fa.patch | 38 --------------
 package/network-manager/network-manager.hash       |  6 +--
 package/network-manager/network-manager.mk         |  4 +-
 4 files changed, 5 insertions(+), 103 deletions(-)

diff --git a/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch b/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
deleted file mode 100644
index 4336472e45..0000000000
--- a/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 03ba04d4784fa4fc7ec31455070fb5ecf25ade23 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Fri, 27 Jan 2023 22:38:42 +0100
-Subject: [PATCH] build: meson: add option to set the
- mobile-broadband-provider-info database
-
-When building network-manager in cross-compile environment meson is not able
-to detect the right location of the mobile-broadband-provider-info
-database by using the pkg-config module.
-
-By adding the option 'mobile_broadband_provider_info_database' to set the
-correct path to the datafile this can be solved.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-
-https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1519
----
- meson.build       | 6 +++++-
- meson_options.txt | 1 +
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 0adc42f738..84ce52c736 100644
---- a/meson.build
-+++ b/meson.build
-@@ -584,7 +584,10 @@ enable_modem_manager = get_option('modem_manager')
- if enable_modem_manager
-   mm_glib_dep = dependency('mm-glib', version: '>= 0.7.991')
- 
--  mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
-+  mobile_broadband_provider_info_database = get_option('mobile_broadband_provider_info_database')
-+  if mobile_broadband_provider_info_database == ''
-+    mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
-+  endif
-   config_h.set_quoted('MOBILE_BROADBAND_PROVIDER_INFO_DATABASE', mobile_broadband_provider_info_database)
- endif
- 
-@@ -1054,6 +1057,7 @@ output += '  jansson: ' + jansson_msg + '\n'
- output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
- output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
- output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
-+output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
- output += '  ofono: ' + enable_ofono.to_string() + '\n'
- output += '  concheck: ' + enable_concheck.to_string() + '\n'
- output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
-diff --git a/meson_options.txt b/meson_options.txt
-index 8b1d32e645..4e359f9e92 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -32,6 +32,7 @@ option('ppp', type: 'boolean', value: true, description: 'enable PPP/PPPoE suppo
- option('pppd', type: 'string', value: '', description: 'path to pppd binary')
- option('pppd_plugin_dir', type: 'string', value: '', description: 'path to the pppd plugins directory')
- option('modem_manager', type: 'boolean', value: true, description: 'Enable new ModemManager1 interface support')
-+option('mobile_broadband_provider_info_database', type: 'string', value: '', description: 'path to the mobile-broadband-provider-info database')
- option('ofono', type: 'boolean', value: false, description: 'Enable oFono support (experimental)')
- option('concheck', type: 'boolean', value: true, description: 'enable connectivity checking support')
- option('teamdctl', type: 'boolean', value: false, description: 'enable Teamd control support')
--- 
-2.20.1
-
diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
deleted file mode 100644
index 648be027e0..0000000000
--- a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 Feb 2023 13:03:00 +0100
-Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
-
-Fix the following build failure with -Dmodem_manager=false raised since
-https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
-
-../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
-
-Fixes:
- - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
----
- meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 84ce52c736..b79240efc0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
- output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
- output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
- output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
--output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
-+if enable_modem_manager
-+  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
-+endif
- output += '  ofono: ' + enable_ofono.to_string() + '\n'
- output += '  concheck: ' + enable_concheck.to_string() + '\n'
- output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
--- 
-2.39.0
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 895351a537..0196d68c55 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.42/NetworkManager-1.42.0.sha256sum
-sha256  2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4  NetworkManager-1.42.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
+sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  cfb6c71f6df5898e1724be3debe9adac48c115b903915406c1e7dfd362b57892  CONTRIBUTING.md
+sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9188af29eb..f6ef923d55 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.42
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.44
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
