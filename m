Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0F0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C69613D3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50C69613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2302180C4F;
	Wed, 17 Nov 2021 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1NhdsKBjaWu; Wed, 17 Nov 2021 21:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F7A80BE3;
	Wed, 17 Nov 2021 21:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCA981BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84D44024E
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATO01NsPFw3M for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E783B400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DA1D58D5C1; Wed, 17 Nov 2021 21:44:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:20:17 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: eacad2319ac6c63219b7bba04e1d96a9be546455
X-Git-Newrev: 51094c698b1e87088dd46b707e0dcef301a3d72f
X-Patchwork-Hint: ignore
Message-Id: <20211117214411.DA1D58D5C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/mosquitto: bump
 to v2.0.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=51094c698b1e87088dd46b707e0dcef301a3d72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Mosquitto v2.0.13 is bugfix release, read the announcement on
https://mosquitto.org/blog/2021/10/version-2-0-13-released/

Also update the checksum of license files, which have been whitespace-trimmed

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a7ac3f0a4ac7e51980397e79a6fc6da404951159)
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
