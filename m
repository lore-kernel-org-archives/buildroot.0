Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4EBC43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D0A61120;
	Wed,  6 Jul 2022 21:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D0A61120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVFzY6oTKYJo; Wed,  6 Jul 2022 21:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72DD61135;
	Wed,  6 Jul 2022 21:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72DD61135
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6861BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEE261128
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEE261128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuxJ33Wbl4ty for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E6861011
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E6861011
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0F81182BD6; Wed,  6 Jul 2022 21:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:24:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb8bef884bcb8dbf0b51f165e6b3e39e62d973ad
X-Git-Newrev: a3e0bf8509de3be4fd280374a6ff2f2fc241c01d
X-Patchwork-Hint: ignore
Message-Id: <20220706211543.0F81182BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsamplerate: bump to version
 0.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3e0bf8509de3be4fd280374a6ff2f2fc241c01d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest release
- Update indentation in hash file (two spaces)

https://github.com/libsndfile/libsamplerate/blob/0.2.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsamplerate/Config.in          | 2 +-
 package/libsamplerate/libsamplerate.hash | 4 ++--
 package/libsamplerate/libsamplerate.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libsamplerate/Config.in b/package/libsamplerate/Config.in
index b394fdb0ac..5cce287f81 100644
--- a/package/libsamplerate/Config.in
+++ b/package/libsamplerate/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBSAMPLERATE
 	  be useful is converting audio from the CD sample rate of
 	  44.1kHz to the 48kHz sample rate used by DAT players.
 
-	  http://www.mega-nerd.com/SRC/
+	  http://libsndfile.github.io/libsamplerate/
diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index 73722563ef..c5e22ba57c 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
+sha256  3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893  libsamplerate-0.2.2.tar.xz
 # Locally computed
-sha256 2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
+sha256  2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 49b42fb26d..2844fde33c 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.9
-LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
+LIBSAMPLERATE_VERSION = 0.2.2
+LIBSAMPLERATE_SOURCE = libsamplerate-$(LIBSAMPLERATE_VERSION).tar.xz
+LIBSAMPLERATE_SITE = https://github.com/libsndfile/libsamplerate/releases/download/$(LIBSAMPLERATE_VERSION)
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 # sndfile is only used for examples and tests so it doesn't make sense
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
