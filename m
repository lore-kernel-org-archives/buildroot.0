Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044C461267
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 044C461267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB1C60782;
	Thu, 11 Nov 2021 10:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyUjQuUI0R4G; Thu, 11 Nov 2021 10:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3832060842;
	Thu, 11 Nov 2021 10:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4111BF955
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B974D80C2C
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TbKPsojxusn for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 10:33:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03C3980BE6
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 10:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAB0E8C5B4; Thu, 11 Nov 2021 10:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 11:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ea6eead60091587e51c38df5d2b6c0f5652a0c6
X-Git-Newrev: a7ac3f0a4ac7e51980397e79a6fc6da404951159
X-Patchwork-Hint: ignore
Message-Id: <20211111102930.DAB0E8C5B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: bump to v2.0.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ac3f0a4ac7e51980397e79a6fc6da404951159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mosquitto v2.0.13 is bugfix release, read the announcement on
https://mosquitto.org/blog/2021/10/version-2-0-13-released/

Also update the checksum of license files, which have been whitespace-trimmed

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 8 ++++----
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 2692aa1a9b..7b950208c8 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.12.tar.gz.asc
-sha256  31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933  mosquitto-2.0.12.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
+sha256  9cf83a558f1588e8798edd8647b1632af88e88ef2cd45054e903c517df5bd2cd  mosquitto-2.0.13.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
-sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
-sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
+sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
+sha256  86fc4a3f97cb769c04e8da557036c1066eb8bb22b2d0a5dd31464990fe84047c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 06b963a994..b02f0c2f43 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.12
+MOSQUITTO_VERSION = 2.0.13
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
