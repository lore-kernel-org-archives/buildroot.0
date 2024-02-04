Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC3C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0255401B2;
	Sun,  4 Feb 2024 12:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0255401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOEyvFNVW5fD; Sun,  4 Feb 2024 12:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C044540279;
	Sun,  4 Feb 2024 12:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C044540279
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF6C1BF36F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 12:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C21F18513A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 12:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C21F18513A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eplv9CUiI9Gc for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 12:33:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1717685135
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 12:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1717685135
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 031A3868E8; Sun,  4 Feb 2024 12:33:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 13:27:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6460074bbfef7663d5ed0ec9f9fa96a6fcc6973c
X-Git-Newrev: b878e7bbbc7041c8fd0ce2e410cc7fc9428bb93d
X-Patchwork-Hint: ignore
Message-Id: <20240204123306.031A3868E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: drop DBUS_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=b878e7bbbc7041c8fd0ce2e410cc7fc9428bb93d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 363b4ebf1aaf4821c0c49713eba71937bd5639ca set DBUS_CPE_ID_PRODUCT
to dbus but this is not needed as DBUS_CPE_ID_PRODUCT will be set to the
package name (i.e. dbus) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
