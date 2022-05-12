Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66913C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2437E83EBA;
	Thu, 12 May 2022 08:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gG5MQxNhQ90; Thu, 12 May 2022 08:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F0F83EB6;
	Thu, 12 May 2022 08:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5621C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC8940122
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esp4zaGBSMm7 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15D48400FD
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5E96E85A57; Thu, 12 May 2022 08:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 10:39:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2d3033ddcf0c497cd46744bdd2bee84d18349a4
X-Git-Newrev: b02f13cd54912f3dffd0e0863378050104430d77
X-Patchwork-Hint: ignore
Message-Id: <20220512083801.5E96E85A57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: bump to version 1.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b02f13cd54912f3dffd0e0863378050104430d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- host-flex is mandatory since
  https://github.com/LudovicRousseau/PCSC/commit/3f89340785934785cf1490d3e788eefb25c50a69
- Set --disable-strict to remove -Werror which was added with
  https://github.com/LudovicRousseau/PCSC/commit/9124a59d8f1a8536f0b46f5ef2a1b4a1711f96b2
- Drop patch (already in version)

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._generic.c-fix-build-without-lib-udev-usb.patch | 35 ----------------------
 package/pcsc-lite/pcsc-lite.hash                   |  2 +-
 package/pcsc-lite/pcsc-lite.mk                     |  5 ++--
 3 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
deleted file mode 100644
index 7e93bf5fce..0000000000
--- a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2153e165c48e541bb5a8b23f81e87db87a9394fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 14 Dec 2021 08:20:59 +0100
-Subject: [PATCH] src/hotplug_generic.c: fix build without lib{udev,usb}
-
-Fix the following build failure without lib{udev,usb} raised since
-version 1.9.5 and
-https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
-pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/LudovicRousseau/PCSC/commit/2153e165c48e541bb5a8b23f81e87db87a9394fd]
----
- src/hotplug_generic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hotplug_generic.c b/src/hotplug_generic.c
-index a0f34646..e4f19935 100644
---- a/src/hotplug_generic.c
-+++ b/src/hotplug_generic.c
-@@ -48,7 +48,7 @@ THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #define FALSE 0
- #endif
- 
--#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(__linux__) && !defined(HAVE_LIBUDEV)
-+#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(HAVE_LIBUDEV)
- 
- LONG HPSearchHotPluggables(void)
- {
diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4844606c59..10a8d92fa7 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08  pcsc-lite-1.9.5.tar.bz2
+sha256  fdb3fe8f68049019523801909b2a336d0d4ee315edafe363c30d375e3706537a  pcsc-lite-1.9.6.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index a7db105987..a5ff074b2c 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.5
+PCSC_LITE_VERSION = 1.9.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-PCSC_LITE_DEPENDENCIES = host-pkgconf
+PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_SELINUX_MODULES = pcscd
+PCSC_LITE_CONF_OPTS = --disable-strict
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
