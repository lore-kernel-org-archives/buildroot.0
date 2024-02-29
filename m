Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190DC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 14:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E01D417BD;
	Thu, 29 Feb 2024 14:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sjn46RjOKCx; Thu, 29 Feb 2024 14:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88647417DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88647417DC;
	Thu, 29 Feb 2024 14:29:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 921C01BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C33F417B6
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vn2CpVe29wZ6 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E818417B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E818417B4
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8796D87D12; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 15:17:35 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 67c3c1894343323aea4f6ce6e65fcfb34cefb621
X-Git-Newrev: 0bce31469d27e90e14b63ec21e5e32c9a34b91e9
X-Patchwork-Hint: ignore
Message-Id: <20240229142434.8796D87D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/dbus: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bce31469d27e90e14b63ec21e5e32c9a34b91e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index d610846ddb..097b89205e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -12,7 +12,6 @@ DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
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
