Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F434EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38695408AF;
	Sun, 18 Jun 2023 11:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38695408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsY_YeJnsxhi; Sun, 18 Jun 2023 11:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 594FB4054E;
	Sun, 18 Jun 2023 11:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594FB4054E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 110AD1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6949A40534
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6949A40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gIeJjc3wlGH for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:20:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B545405D3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B545405D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B25483BAD; Sun, 18 Jun 2023 11:20:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:16:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13f3b8e124c4978cc21e780d68219ccdb20b73e5
X-Git-Newrev: dfe1ca7872a45bcdc825ff0900d7fd929097a635
X-Patchwork-Hint: ignore
Message-Id: <20230618112054.7B25483BAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: bump version to 2.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfe1ca7872a45bcdc825ff0900d7fd929097a635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.0.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.1.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.2.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.3.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.4.news

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 37030bdfaa..f3650c5ec5 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.4.sha256sum
-sha256  ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45  libxml2-2.10.4.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.4.sha256sum
+sha256  737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7  libxml2-2.11.4.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index cf26a36cc4..9f7774f719 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.10
+LIBXML2_VERSION_MAJOR = 2.11
 LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
