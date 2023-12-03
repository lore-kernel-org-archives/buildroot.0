Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CD5C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E7E415A6;
	Sun,  3 Dec 2023 16:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E7E415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Itq0rbRv-ydf; Sun,  3 Dec 2023 16:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187FE4154E;
	Sun,  3 Dec 2023 16:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187FE4154E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE3C1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04D8640900
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D8640900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAHu6Bc8ZsKF for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DBFF40913
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBFF40913
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 209488770C; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:21:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35059ebc37283d2fee5cdd9264a9d5c640271359
X-Git-Newrev: 4cf5d91d8bf1dc48af612e785bde869e47048ec3
X-Patchwork-Hint: ignore
Message-Id: <20231203162610.209488770C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump to version
 1.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cf5d91d8bf1dc48af612e785bde869e47048ec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-43887: Libde265 v1.0.12 was discovered to contain multiple
buffer overflows via the num_tile_columns and num_tile_row parameters in
the function pic_parameter_set::dump.

Fix CVE-2023-47471: Buffer Overflow vulnerability in strukturag libde265
v1.10.12 allows a local attacker to cause a denial of service via the
slice_segment_header function in the slice.cc component.

https://github.com/strukturag/libde265/releases/tag/v1.0.14
https://github.com/strukturag/libde265/releases/tag/v1.0.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libde265/libde265.hash | 2 +-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 168b5db395..9bb3f20a71 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62185ea2182e68cf68bba20cc6eb4c287407b509cf0a827d7ddb75614db77b5c  libde265-1.0.12.tar.gz
+sha256  99f46ef77a438be639aa3c5d9632c0670541c5ed5d386524d4199da2d30df28f  libde265-1.0.14.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 208fa24e27..8624d2f949 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.12
+LIBDE265_VERSION = 1.0.14
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
