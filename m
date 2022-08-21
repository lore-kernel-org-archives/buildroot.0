Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC63C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77BD060B8F;
	Sun, 21 Aug 2022 11:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77BD060B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVwrQdnDdUV5; Sun, 21 Aug 2022 11:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82A5760A9E;
	Sun, 21 Aug 2022 11:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82A5760A9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A38561BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EE1F60A9E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE1F60A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9Bh-1ojgYVs for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 719C16068D
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 11:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719C16068D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 93725879FD; Sun, 21 Aug 2022 11:15:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 13:29:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 13faa449e16d955182d5bac132142b7ba07c65e3
X-Git-Newrev: 3b4d8daa6d30cb09ba9d57b15299a722d2f57a38
X-Patchwork-Hint: ignore
Message-Id: <20220821111509.93725879FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zic: bump to 2022c
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b4d8daa6d30cb09ba9d57b15299a722d2f57a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zic/0001-remove-dependency-check-on-version-file.patch | 2 +-
 package/zic/zic.hash                                           | 4 ++--
 package/zic/zic.mk                                             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 62adc59c83..64587bc0df 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -593,7 +593,7 @@ INSTALL:	ALL install date.1
+@@ -609,7 +609,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 9e17621de8..c9c7491948 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
-sha512  87b0335129ea41c5f42f687f548712e5da892baa8494cecf5d34851beceecf6ae52f22104696ed187713cf9e502570eb2041e277dfd3c043c11d0253bfde685a  tzcode2021e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
+sha512  3373fa16a12007415c3dc3a75c4a0d61d6ae54968eeecedcdf4bcfd7f554020a15c4687dde107b90462b75d848eebe1e200c33322ebe0d3f1ad11bc769cade06  tzcode2022c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 13f3a83bce..bb5cd3c916 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2021e
+ZIC_VERSION = 2022c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
