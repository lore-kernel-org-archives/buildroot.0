Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB057C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8791741950;
	Thu, 29 Feb 2024 15:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKCc84SYYlIL; Thu, 29 Feb 2024 15:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406EA41A04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406EA41A04;
	Thu, 29 Feb 2024 15:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFC71BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4610141920
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PixAQDlOwUQO for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FBB41909
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7FBB41909
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3C387D70; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:24:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 75faae5b6bcffa81d44a743d3ae8cea308be81b6
X-Git-Newrev: ccf4a64464790d211800fd17fb8bd6b392d14ea0
X-Patchwork-Hint: ignore
Message-Id: <20240229153304.DD3C387D70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/domoticz: drop
 fmt dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccf4a64464790d211800fd17fb8bd6b392d14ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

fmt is not a dependency since bump to version 2022.1 in commit
adca60540f4fd271dda48b9a121986492700e73a and
https://github.com/domoticz/domoticz/commit/82043c4d5c79003792379be79b931eb85ab890c8
https://github.com/domoticz/domoticz/commit/9e02d9a79c70c36db180d3242cbd03ff9b63e3cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc3609c53f927289a9681f30ab283d190cb34e09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/Config.in   | 1 -
 package/domoticz/domoticz.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 85361eecf0..a0e69a7601 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
-	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 451021150b..4668ad8646 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -12,7 +12,6 @@ DOMOTICZ_CPE_ID_VENDOR = domoticz
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
-	fmt \
 	host-pkgconf \
 	jsoncpp \
 	libcurl \
@@ -36,7 +35,6 @@ DOMOTICZ_CONF_OPTS += \
 # jsoncpp, fmt, minizip, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
-	-DUSE_BUILTIN_LIBFMT=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
