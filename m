Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316EEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855C460BCD;
	Sun, 16 Jul 2023 16:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 855C460BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZerZHgK3xpi; Sun, 16 Jul 2023 16:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A8160BAA;
	Sun, 16 Jul 2023 16:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A8160BAA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9CF1BF35B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E566440315
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E566440315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWgP6G7gpvjW for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1896402DC
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1896402DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E0E786B6A; Sun, 16 Jul 2023 16:03:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:00:49 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ca87e434b2f240c43f6cb6d9a94cc51004693c2a
X-Git-Newrev: fb5ced59149369d88ded2c44905b8a71dc8597a5
X-Patchwork-Hint: ignore
Message-Id: <20230716160313.9E0E786B6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/syslog-ng:
 disable python support
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb5ced59149369d88ded2c44905b8a71dc8597a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Upstream added a list of python modules declared as runtime dependencies
https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace9c652621
most of them with fixed (and outdated) versions.

Disable python support for the time being.

Fixes:
http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7df35/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 227c42b8c3e0fada026e17a2b6e8d0d7a4450a3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
