Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2F0C54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 14:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF4E418C7;
	Thu, 29 Feb 2024 14:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLKBYMc_3cC6; Thu, 29 Feb 2024 14:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B59B418CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B59B418CF;
	Thu, 29 Feb 2024 14:24:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 578841BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D7160A99
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPyziees8oXf for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 14:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E0760A6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E0760A6C
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 459E687D07; Thu, 29 Feb 2024 14:22:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 15:17:56 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3f2145c0848e9114bbd5412285cd300d802d7a0f
X-Git-Newrev: 8778f7b6b6ff6b9ac992d69f09ccfc074f7bb9b7
X-Patchwork-Hint: ignore
Message-Id: <20240229142228.459E687D07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/dbus: drop
 DBUS_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=8778f7b6b6ff6b9ac992d69f09ccfc074f7bb9b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 363b4ebf1aaf4821c0c49713eba71937bd5639ca set DBUS_CPE_ID_PRODUCT
to dbus but this is not needed as DBUS_CPE_ID_PRODUCT will be set to the
package name (i.e. dbus) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b878e7bbbc7041c8fd0ce2e410cc7fc9428bb93d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b4d1cdc6b6..7ddeb0e325 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,7 +11,6 @@ DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_CPE_ID_VENDOR = freedesktop
-DBUS_CPE_ID_PRODUCT = dbus
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
