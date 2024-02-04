Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95565C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513EF84F4A;
	Sun,  4 Feb 2024 10:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513EF84F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZwvpwHf1jEz; Sun,  4 Feb 2024 10:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C08384F40;
	Sun,  4 Feb 2024 10:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C08384F40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8EEF1BF909
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEBED60FE4
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEBED60FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oNksXMT_0-Y for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D6B360FCA
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D6B360FCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1778868D8; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c438422d4972f41c0c59d1b701eefd3028abee43
X-Git-Newrev: 363b4ebf1aaf4821c0c49713eba71937bd5639ca
X-Patchwork-Hint: ignore
Message-Id: <20240204101728.F1778868D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: fix CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=363b4ebf1aaf4821c0c49713eba71937bd5639ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:d-bus_project:d-bus has been deprecated in favor of
cpe:2.3:a:freedesktop:dbus in December 2023:

  <cpe-item name="cpe:/a:d-bus_project:d-bus:1.15.6" deprecated="true" deprecation_date="2023-12-27T16:36:56.510Z">
    <title xml:lang="en-US">D-Bus Project D-Bus 1.15.6</title>
      <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/tags">Version</reference>
      <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/issues/457">Advisory</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:d-bus_project:d-bus:1.15.6:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:freedesktop:dbus:1.15.6:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dbus/dbus.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index c41fbcb4dd..d610846ddb 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,8 +11,8 @@ DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-DBUS_CPE_ID_VENDOR = d-bus_project
-DBUS_CPE_ID_PRODUCT = d-bus
+DBUS_CPE_ID_VENDOR = freedesktop
+DBUS_CPE_ID_PRODUCT = dbus
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
