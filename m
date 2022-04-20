Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1C9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D2F583F6A;
	Wed, 20 Apr 2022 21:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dH3cDrlqQ5GZ; Wed, 20 Apr 2022 21:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C8B83F25;
	Wed, 20 Apr 2022 21:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC201BF20F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CFB5414C7
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUajphEDcay3 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 21:30:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC9D841061
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 21:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A3CAC83F77; Wed, 20 Apr 2022 21:20:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 23:29:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db3e2e4da88a10e8125b8e343c0ece106613b5b5
X-Git-Newrev: d1d289174eb1e4a34ca70a99e9a655a115b724a1
X-Patchwork-Hint: ignore
Message-Id: <20220420212014.A3CAC83F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.50
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1d289174eb1e4a34ca70a99e9a655a115b724a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable legacy-rtkit which we don't support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index e6fad56698..6f65a6b143 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
+sha256  68592ab5852c46ee3d743f429f9d6b6c82171fa37b4b3854eb0da62b08b49d14  pipewire-0.3.50.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 80246cc8d0..9d4dc45f02 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.48
+PIPEWIRE_VERSION = 0.3.50
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -29,6 +29,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
+	-Dlegacy-rtkit=false \
 	-Dlibcanberra=disabled \
 	-Dlv2=disabled
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
