Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB26FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACB440951;
	Tue, 15 Nov 2022 13:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACB440951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sr0ROFH2qBcQ; Tue, 15 Nov 2022 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450204047D;
	Tue, 15 Nov 2022 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450204047D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C96B1BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38AC881455
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38AC881455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqQVJXec0k38 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC7C8131B
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EC7C8131B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EB9F83CA2; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:18:46 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: ebe54c8ae06b815cac6d9028a733f63c7e4ca2be
X-Git-Newrev: 0f2ee83a48e1328b1b34fe482ba6feac63d42d35
X-Patchwork-Hint: ignore
Message-Id: <20221115132631.4EB9F83CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/dbus-broker:
 audit support needs libcap-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f2ee83a48e1328b1b34fe482ba6feac63d42d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Since v14 in 2018, audit support has needed libcap-ng.

Fixes:
    http://autobuild.buildroot.org/results/43abdb85cc2f386d427cec1cfa876e20e3509cb8/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f0e82c4ef8bc02bf8b2ada7bf5daf940d4e4cac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 85c3f75a3b..536ee64a71 100644
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
