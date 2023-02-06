Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBAC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE48E40328;
	Mon,  6 Feb 2023 10:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE48E40328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvXBJIzjI_sZ; Mon,  6 Feb 2023 10:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEAF440364;
	Mon,  6 Feb 2023 10:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEAF440364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADA701BF4E3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94ACD414BF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94ACD414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31uXG20VqP1B for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:01:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6330D414C8
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6330D414C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD34839F0; Mon,  6 Feb 2023 10:01:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:01:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6139aeacd847487a296f1c7b8a9d302d678cd8ab
X-Git-Newrev: 3c7fece853f3def9a425eccc384b9dacb1010051
X-Patchwork-Hint: ignore
Message-Id: <20230206100111.4FD34839F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: bump to version 3.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c7fece853f3def9a425eccc384b9dacb1010051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed anymore)

https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Acked-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/0001-gpsctl-fix-yodaification.patch | 44 ------------------------
 package/gpsd/gpsd.hash                           |  2 +-
 package/gpsd/gpsd.mk                             |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/gpsd/0001-gpsctl-fix-yodaification.patch b/package/gpsd/0001-gpsctl-fix-yodaification.patch
deleted file mode 100644
index 753ff300eb..0000000000
--- a/package/gpsd/0001-gpsctl-fix-yodaification.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 72ae7ce646792b07061cbbb31ed47f55a1d2422c Mon Sep 17 00:00:00 2001
-Message-Id: <72ae7ce646792b07061cbbb31ed47f55a1d2422c.1663075350.git.yann.morin@orange.com>
-From: "Yann E. MORIN" <yann.morin@orange.com>
-Date: Tue, 13 Sep 2022 15:10:48 +0200
-Subject: [PATCH] gpsctl: fix yodaification
-
-Commit d5a672abd98a (gpsctl.c: Style tweaks.  Yoda style, braces, //
-comments.) claimed "No functional changes", but mis-treated a comparison
-when it was converted to yoda-style (simplified diff):
-
-    -    if (write(gpsdata->gps_fd, buf, strlen(buf)) <= 0) {
-    +    if (0 <= write(gpsdata->gps_fd, buf, strlen(buf))) {
-
-As one may notice, the comparison operator was not reversed while the
-operands were.
-
-This got silently fixed in commit 3219ab9f6a89 (gpsctl.c: First cut at
---ship sending commands to running gpsd.) but this is completely
-unrelated.
-
-Fix that comparison.
-
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
-Upstream status: not applicable as already fixed.
----
- gpsctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gpsctl.c b/gpsctl.c
-index cb342af87..ef59a6622 100644
---- a/gpsctl.c
-+++ b/gpsctl.c
-@@ -96,7 +96,7 @@ static bool gps_query(struct gps_data_t *gpsdata,
-     if ('\n' != buf[strnlen(buf, sizeof(buf) - 1) - 1]) {
-         (void)strlcat(buf, "\n", sizeof(buf));
-     }
--    if (0 <= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
-+    if (0 >= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
-         GPSD_LOG(LOG_ERROR, &context.errout, "gps_query(), write failed\n");
-         return false;
-     }
--- 
-2.25.1
-
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index f415c3af0f..15e1181ed9 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c  gpsd-3.24.tar.gz
+sha256  b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2  gpsd-3.25.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 961ebde649..d7425513fd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.24
+GPSD_VERSION = 3.25
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
