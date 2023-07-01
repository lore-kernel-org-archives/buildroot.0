Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F15EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C807560F5D;
	Sat,  1 Jul 2023 14:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C807560F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utA4fZZKbJlt; Sat,  1 Jul 2023 14:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1951B60B46;
	Sat,  1 Jul 2023 14:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1951B60B46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EBFD1BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7871560F37
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7871560F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8YGQEk5u9Xe for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C84C60B3C
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C84C60B3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1823185FE5; Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:37:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d68f6e3042d50139f773950d679a0f83f9bb94c0
X-Git-Newrev: 227c42b8c3e0fada026e17a2b6e8d0d7a4450a3f
X-Patchwork-Hint: ignore
Message-Id: <20230701144050.1823185FE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: disable python support
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

commit: https://git.buildroot.net/buildroot/commit/?id=227c42b8c3e0fada026e17a2b6e8d0d7a4450a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added a list of python modules declared as runtime dependencies
https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace9c652621
most of them with fixed (and outdated) versions.

Disable python support for the time being.

Fixes:
http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7df35/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/syslog-ng.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 1c4cec6adb..ecc8eeddce 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -16,7 +16,8 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 # We're patching configure.ac
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-	--disable-java --disable-java-modules --disable-mongodb
+	--disable-java --disable-java-modules --disable-mongodb \
+	--disable-python
 SYSLOG_NG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
@@ -39,15 +40,6 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-linux-caps
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SYSLOG_NG_DEPENDENCIES += python3
-SYSLOG_NG_CONF_OPTS += \
-	--enable-python \
-	--with-python=$(PYTHON3_VERSION_MAJOR)
-else
-SYSLOG_NG_CONF_OPTS += --disable-python
-endif
-
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 SYSLOG_NG_DEPENDENCIES += libesmtp
 SYSLOG_NG_CONF_OPTS += --enable-smtp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
