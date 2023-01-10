Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FE2C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94E6A40CA0;
	Wed, 11 Jan 2023 09:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94E6A40CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmbBCazFmomk; Wed, 11 Jan 2023 09:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D436440CAD;
	Wed, 11 Jan 2023 09:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D436440CAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 235381BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 522F061070
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 522F061070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0zouvWTNwOp for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7236C60B30
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7236C60B30
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D4EA87815; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 22:49:00 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1d043ccba9a09fbebc9d288f970368242a8fa7c4
X-Git-Newrev: 4dcbf5732fa0759c2b87f9dfbf13b73b8372e74f
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.6D4EA87815@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/qt5/qt5virtualkeyboard: really configure language layouts
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dcbf5732fa0759c2b87f9dfbf13b73b8372e74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "170777f342 package/qt5/qt5virtualkeyboard: convert to qmake
infrastructure" changed most but not all <pkg>_QMAKEFLAGS to
<pkg>_CONF_OPTS.

As a consequence, BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS is
ignored and all layouts are compiled in.
Some layouts have different licenses (e.g. pinying), so the license
information for a build that is configured to not include such layouts
is wrong.

Change the remaining _QMAKEFLAGS entry, fixing the config for which
language layouts are compiled and installed.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 92219bdf2ece2a0ddfbc45691879a03acd5c7442)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index c31d455c4e..3fefdc874d 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -16,7 +16,7 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
