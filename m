Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDB2C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EAA820F2;
	Sun,  7 May 2023 10:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88EAA820F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IhHgrpJLOey; Sun,  7 May 2023 10:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E72982181;
	Sun,  7 May 2023 10:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E72982181
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D42B1BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 760194029F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760194029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbqVkb3oBjB4 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3C740273
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3C740273
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 841A685EED; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:28:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b516744fd1eb2621efb676561460d817de3a1d04
X-Git-Newrev: efa3bdcdba716e1a3370f08e8c8cfc4c1f1e2093
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.841A685EED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=efa3bdcdba716e1a3370f08e8c8cfc4c1f1e2093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependency to bento4 needed after upstream commit
https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755

License file renamed
https://github.com/xbmc/inputstream.adaptive/commit/b555973d98e15bb40022dd1ab704d8d42efd7686
and updated upstream
https://github.com/xbmc/inputstream.adaptive/commit/4b62e9e3257526e0359e0b797902ba9119633c16

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-inputstream-adaptive/Config.in                      | 1 +
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 4 ++--
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index f0a24b7043..3efe3aa114 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	# wvdecrypter/cdm/build/build_config.h
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
+	select BR2_PACKAGE_BENTO4
 	select BR2_PACKAGE_EXPAT
 	help
 	  Kodi inputstream addon for several manifest types
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index a36095c38c..18df044c62 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b208313fd50442cabd339a16a3beec8cfa41c1b6bf19617ffeb269144c5f65fe  kodi-inputstream-adaptive-19.0.7-Matrix.tar.gz
-sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
+sha256  907915228335eeb9217e6f069cbb210fffce01095a6326908015cd89165a0328  kodi-inputstream-adaptive-20.3.6-Nexus.tar.gz
+sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 9da87e0e38..1f3e86bb27 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.7-Matrix
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.6-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
