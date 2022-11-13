Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022AEC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD8442ADE;
	Mon, 20 Feb 2023 21:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD8442ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zEskFWXOPgG; Mon, 20 Feb 2023 21:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675B142AE6;
	Mon, 20 Feb 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 675B142AE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113C31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DF32414EA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF32414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fF6NR8pK36g for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9752B40C29
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9752B40C29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F3886495; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:12:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4f5ed5a7cf035d448c49edd8d106a09ce945170
X-Git-Newrev: 2f0e82c4ef8bc02bf8b2ada7bf5daf940d4e4cac
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.92F3886495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dbus-broker: audit
 support needs libcap-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f0e82c4ef8bc02bf8b2ada7bf5daf940d4e4cac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since v14 in 2018, audit support has needed libcap-ng.

Fixes:
    http://autobuild.buildroot.org/results/43abdb85cc2f386d427cec1cfa876e20e3509cb8/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-broker/Config.in      | 1 +
 package/dbus-broker/dbus-broker.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
index c7206232da..aa6584c392 100644
--- a/package/dbus-broker/Config.in
+++ b/package/dbus-broker/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DBUS_BROKER
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	depends on BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCAP_NG if BR2_PACKAGE_AUDIT
 	help
 	  Linux D-Bus Message Broker.
 
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index c0a58de9ad..e82b79220d 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -28,7 +28,8 @@ DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-DBUS_BROKER_DEPENDENCIES += audit
+# libcap-ng selected from Config.in
+DBUS_BROKER_DEPENDENCIES += audit libcap-ng
 DBUS_BROKER_CONF_OPTS += -Daudit=true
 else
 DBUS_BROKER_CONF_OPTS += -Daudit=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
