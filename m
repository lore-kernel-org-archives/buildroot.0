Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3A1EE57CD
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1516681801;
	Sun, 10 Sep 2023 14:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1516681801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyeVpOqzpa4f; Sun, 10 Sep 2023 14:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEB4817B5;
	Sun, 10 Sep 2023 14:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEB4817B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5327A1BF255
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BC32409A3
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC32409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PK7BfBBPtAI for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 14:45:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16039409A2
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 14:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16039409A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03E6C869C9; Sun, 10 Sep 2023 14:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 14:26:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0f2709e6f9654deff5e6d386454fa389f853b5a
X-Git-Newrev: 25408f767d85ee77937bd2ec56e08a7e893d48a2
X-Patchwork-Hint: ignore
Message-Id: <20230910144546.03E6C869C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: bump version to 1.9.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=25408f767d85ee77937bd2ec56e08a7e893d48a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.9.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/osm2pgsql/Config.in      | 1 +
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 3e73572a80..c6a38f3180 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_LIBOSMIUM
 	select BR2_PACKAGE_PROTOZERO
 	select BR2_PACKAGE_ZLIB
diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index cc13bf741d..0b4eb17c99 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e3cd9e13893fd7a153c7b42089bd23338867190c91b157cbdb4ff7176ecba62  osm2pgsql-1.8.1.tar.gz
+sha256  dc30a3ad9a27f944e4169be9a8e07ee09711901536ddc8fcf4a292bd3aec51d9  osm2pgsql-1.9.2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 11f09fe7d1..44c980ac95 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.8.1
+OSM2PGSQL_VERSION = 1.9.2
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
 
-OSM2PGSQL_DEPENDENCIES = boost bzip2 expat libosmium postgresql protozero zlib
+OSM2PGSQL_DEPENDENCIES = boost bzip2 expat json-for-modern-cpp libosmium postgresql protozero zlib
 
 # fmt > 8.0 is not yet supported
 OSM2PGSQL_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
