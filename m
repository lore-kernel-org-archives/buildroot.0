Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7C8CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFF941922;
	Sun, 24 Sep 2023 10:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFF941922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uO1VmCh1CEn5; Sun, 24 Sep 2023 10:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B20418F0;
	Sun, 24 Sep 2023 10:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B20418F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D771BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B593360ED2
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B593360ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47ie3xq787tL for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F5360ED0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F5360ED0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2774E87581; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 12:24:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 227d414ded61058b9cf41815b5683a84ece3aec2
X-Git-Newrev: f7ae22240bac0300961fa60c7d684b6584d7a631
X-Patchwork-Hint: ignore
Message-Id: <20230924103354.2774E87581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to 1.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7ae22240bac0300961fa60c7d684b6584d7a631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated patch due to upstream commit
https://github.com/alsa-project/alsa-utils/commit/8ed9d7607f97537ca4c8f359ee76462174c6e77e

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.9_v1.2.10#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch | 6 ++++--
 package/alsa-utils/alsa-utils.hash                                  | 2 +-
 package/alsa-utils/alsa-utils.mk                                    | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
index 97c4729bf9..145c9da017 100644
--- a/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
+++ b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
@@ -28,6 +28,8 @@ functions when support is not available.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203846.html
+[Bernd: update patch for 1.2.10]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  alsactl/info.c | 14 ++++++++++----
  1 file changed, 10 insertions(+), 4 deletions(-)
@@ -96,9 +98,9 @@ index 253539d..9bd72af 100644
 +#ifdef __ALSA_RAWMIDI_H
  	first = true;
  	if (err >= 0)
- 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
+ 		err = rawmidi_device_list(ctl, SND_RAWMIDI_STREAM_INPUT, &first);
  	if (err >= 0)
- 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
+ 		err = rawmidi_device_list(ctl, SND_RAWMIDI_STREAM_OUTPUT, &first);
 +#endif
  
  	if (err >= 0)
diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 44cd928e45..0ace406286 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd  alsa-utils-1.2.9.tar.bz2
+sha256  104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a  alsa-utils-1.2.10.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 20fe65afe6..7487e3c2bb 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.9
+ALSA_UTILS_VERSION = 1.2.10
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
