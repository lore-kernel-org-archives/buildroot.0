Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F50AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F2860EB3;
	Tue, 11 Jan 2022 20:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGyINm-Rrmjp; Tue, 11 Jan 2022 20:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319DC60C0D;
	Tue, 11 Jan 2022 20:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 773841BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64BF7408F0
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHNOJZt2oGBx for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:07:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C9D400D1
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:07:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 77B3183483; Tue, 11 Jan 2022 20:00:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:06:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db14f7d71505aad2ae1e4aefc5c0ece97f5eacec
X-Git-Newrev: 6c99c961629fff186849c8340a9da5da2ae85a3b
X-Patchwork-Hint: ignore
Message-Id: <20220111200043.77B3183483@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zic: bump to version 2021e
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c99c961629fff186849c8340a9da5da2ae85a3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zic/0001-remove-dependency-check-on-version-file.patch | 2 +-
 package/zic/zic.hash                                           | 4 ++--
 package/zic/zic.mk                                             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 193c263049..62adc59c83 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -587,7 +587,7 @@ INSTALL:	ALL install date.1
+@@ -593,7 +593,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 3cee80bcdd..9e17621de8 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
-sha512  5f6bf1b508434842eb9dacacc744b5f3375c35b88e401ef372b5fde80ad2f523484fe52a6e99460e402230406ebf6a9261a97efde45a610f8e8085893d55c4ed  tzcode2020f.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
+sha512  87b0335129ea41c5f42f687f548712e5da892baa8494cecf5d34851beceecf6ae52f22104696ed187713cf9e502570eb2041e277dfd3c043c11d0253bfde685a  tzcode2021e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 7529b682a2..13f3a83bce 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2020f
+ZIC_VERSION = 2021e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
