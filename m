Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35976C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC62B60AFD;
	Mon,  6 Feb 2023 13:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC62B60AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VG4Wl6qd3ymA; Mon,  6 Feb 2023 13:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A4D60AEE;
	Mon,  6 Feb 2023 13:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A4D60AEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89DFD1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 202C5403B8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 202C5403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lvybp_0h5cyj for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B490403E7
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B490403E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 296DA83C28; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc3a4a7b1de7b158354c650d234339e8a969a730
X-Git-Newrev: f043f928674e94687d1d3173394142271ca3d397
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.296DA83C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: use explicit build options
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

commit: https://git.buildroot.net/buildroot/commit/?id=f043f928674e94687d1d3173394142271ca3d397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit upstream 986b7ffd01aedcd4f2aa16e78e4cad9313b6d7b2
"Add Cmake options for pugiconfig.hpp" added feature toogles to release
v1.12, including PUGIXML_NO_XPATH and PUGIXML_COMPACT.

Commit upstream 5f49f2c6575cc2b7d343f8d41581fe92d69d7b52
"Mark advanced options and removed redundant ones" removed CMake
specific support for PUGIXML_HEADER_ONLY and PUGIXML_HAS_LONG_LONG, but
they can still be provided using PUGIXML_BUILD_DEFINES, starting from
release v1.12.

So use the explicit build options PUGIXML_NO_XPATH and PUGIXML_COMPACT,
but keep using PUGIXML_BUILD_DEFINES to set PUGIXML_HEADER_ONLY and
PUGIXML_HAS_LONG_LONG.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 1a915980a5..c8d59f0864 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -12,6 +12,18 @@ PUGIXML_CPE_ID_VENDOR = pugixml_project
 
 PUGIXML_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),y)
+PUGIXML_CONF_OPTS += -DPUGIXML_NO_XPATH=OFF
+else
+PUGIXML_CONF_OPTS += -DPUGIXML_NO_XPATH=ON
+endif
+
+ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
+PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=ON
+else
+PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=OFF
+endif
+
 # Pugixml will automatically enable 'long long' support on C++11 compilers,
 # which means gcc 4.8+. As gcc always supports the 'long long' type,
 # force-enable this option to support older gcc versions. See also:
@@ -19,12 +31,6 @@ PUGIXML_INSTALL_STAGING = YES
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
-ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
-PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
-endif
-ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
-PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
-endif
 ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
