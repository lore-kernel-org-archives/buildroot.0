Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3682BCE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 11:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC91640C05;
	Sat, 23 Sep 2023 11:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC91640C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8djjCY_kUaut; Sat, 23 Sep 2023 11:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E40C6401A4;
	Sat, 23 Sep 2023 11:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E40C6401A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 210141BF5E9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE1460ACF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE1460ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHdhg5GUwwLb for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 11:47:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3FC060ACD
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 11:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3FC060ACD
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A5327A4C0E06
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:47:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36908)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk16P-000177-19
 for buildroot@buildroot.org; Sat, 23 Sep 2023 13:47:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 13:47:13 +0200
Message-Id: <20230923114713.1466381-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923114713.1466381-1-bernd@kuhls.net>
References: <20230923114713.1466381-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695469633;
 bh=T3wxaDx26Pa3Vi+yenu9mwT95DhvATYrl5zUNj7eW9o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A5DYzYb9gKstR147lmO2IC0+LkdeQ1ygBq5xN36fhUj6DAqPIGKyY8UBhYAjfPmAZ
 yHlhsNi+/RBVrYfg3+vqjfrXg3j6dlLKexC8iNEHiu8OWbPKrlogOeTaFpVH9T4UNt
 Wpo7ornz+EACzGQH1XsxXQZbaMspFnjXZNVjfCcIeQI4iSIXBdlaF/GdCYQ6qSc+o6
 L6U+Z+iMxjMVNyMx4/tH5KVGT3oDQGVSkixj2spYh4+k+zRwuxZzbb1c7+O9PR+kDv
 zbJUrOvTaZEHZFZLqznpcjJ5adpw8T4ZhlRQ+h7dy/J70GEQqPlTSGzYSIwUZDL9gs
 l4LJ2dXtHHeIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=A5DYzYb9
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated patch due to upstream commit
https://github.com/alsa-project/alsa-utils/commit/8ed9d7607f97537ca4c8f359ee76462174c6e77e

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.9_v1.2.10#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...sactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch | 6 ++++--
 package/alsa-utils/alsa-utils.hash                          | 2 +-
 package/alsa-utils/alsa-utils.mk                            | 2 +-
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
