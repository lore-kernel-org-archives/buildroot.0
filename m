Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A4DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B8F641B3A;
	Sat, 23 Jul 2022 14:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B8F641B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKyyapMiJGO3; Sat, 23 Jul 2022 14:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DA1418CE;
	Sat, 23 Jul 2022 14:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DA1418CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02E661BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F7A841B9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F7A841B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mr4y-nOIwnVd for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 599168474D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 599168474D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 52D46844D0; Sat, 23 Jul 2022 14:20:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:47 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d787cc724eca010fe463d3827d922cb278e52aeb
X-Git-Newrev: 838a6e86c86ebd673f729dcf04f949eabd93b5bc
X-Patchwork-Hint: ignore
Message-Id: <20220723142025.52D46844D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libsamplerate:
 disable sndfile
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

commit: https://git.buildroot.net/buildroot/commit/?id=838a6e86c86ebd673f729dcf04f949eabd93b5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libsndfile is only used for examples and tests so disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb8bef884bcb8dbf0b51f165e6b3e39e62d973ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsamplerate/libsamplerate.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 9d6b6a5ca5..49b42fb26d 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -8,7 +8,12 @@ LIBSAMPLERATE_VERSION = 0.1.9
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
-LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
+# sndfile is only used for examples and tests so it doesn't make sense
+# to support it as an optional dependency
+LIBSAMPLERATE_CONF_OPTS = \
+	--disable-fftw \
+	--disable-sndfile \
+	--program-transform-name=''
 LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
@@ -20,8 +25,4 @@ else
 LIBSAMPLERATE_CONF_OPTS += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-LIBSAMPLERATE_DEPENDENCIES += libsndfile
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
