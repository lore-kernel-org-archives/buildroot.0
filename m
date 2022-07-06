Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F5CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08CC640357;
	Wed,  6 Jul 2022 21:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CC640357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QaQ3PkHjzUr; Wed,  6 Jul 2022 21:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A87402EF;
	Wed,  6 Jul 2022 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A87402EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 020FF1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7F9B40333
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7F9B40333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wdn4wzEKMGo0 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB05D402C4
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB05D402C4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0462682BCF; Wed,  6 Jul 2022 21:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:22:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ef445e84f8ad45e08c603f1334e8e9550f8e3e0
X-Git-Newrev: eb8bef884bcb8dbf0b51f165e6b3e39e62d973ad
X-Patchwork-Hint: ignore
Message-Id: <20220706211543.0462682BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsamplerate: disable sndfile
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb8bef884bcb8dbf0b51f165e6b3e39e62d973ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsndfile is only used for examples and tests so disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
