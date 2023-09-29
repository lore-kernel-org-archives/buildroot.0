Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C83E728E5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0E982134;
	Fri, 29 Sep 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0E982134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkwhdSaXBHOE; Fri, 29 Sep 2023 20:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B341F82217;
	Fri, 29 Sep 2023 20:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B341F82217
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8A951BF2C5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7E6461632
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E6461632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PE-KQcEr3pzs for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD54A6161A
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD54A6161A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A72BC8368B; Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:11:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7906272c39744e26ed73028725787aa3a4441c54
X-Git-Newrev: c076f3f1a661e8a8c4099e11d831712c70c076fc
X-Patchwork-Hint: ignore
Message-Id: <20230929201131.A72BC8368B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c076f3f1a661e8a8c4099e11d831712c70c076fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove no longer supported soup2 config option

We now build webkit with soup3 so we need to set wpe_api to 2.0 to
be compatible.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 2ea3ddee08..9fb386dfa0 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.16.1.tar.xz.sums
-md5  1489740db6b4ea568578035c30b8b2f4  cog-0.16.1.tar.xz
-sha1  1235203085e7ccd8fc76eab6bdfcdb2e3ae38ea9  cog-0.16.1.tar.xz
-sha256  37c5f14123b8dcf077839f6c60f0d721d2a91bb37829e796f420126e6b0d38b5  cog-0.16.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.0.tar.xz.sums
+md5  9521458c72322e1b2e39e8b1cca93d24  cog-0.18.0.tar.xz
+sha1  73ec1684c31de7247ecbd5e852c16cf88416bedd  cog-0.18.0.tar.xz
+sha256  410bf70f9aa3812db72d75c25cefee421efa0391ab03dc3c37299dfaa388f4fd  cog-0.18.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index da4bfc7ac6..f41c114fa5 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.16.1
+COG_VERSION = 0.18.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -15,7 +15,7 @@ COG_CONF_OPTS = \
 	-Ddocumentation=false \
 	-Dmanpages=false \
 	-Dprograms=true \
-	-Dsoup2=enabled \
+	-Dwpe_api=2.0 \
 	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
 	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
