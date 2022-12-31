Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1FBC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A5740308;
	Sat, 31 Dec 2022 17:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A5740308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nOYaGWejoqT; Sat, 31 Dec 2022 17:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB6240382;
	Sat, 31 Dec 2022 17:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB6240382
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC0A1BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644C760615
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644C760615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-jeHF4FnJXK for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7681605EA
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7681605EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9061B86FC2; Sat, 31 Dec 2022 17:21:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 18:21:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76e610ef59f2c25577265a103dc37dce79b3e856
X-Git-Newrev: bca2c28fc9ed2ebca91e6f1347d947389997a4c7
X-Patchwork-Hint: ignore
Message-Id: <20221231172149.9061B86FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: disable man pages
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

commit: https://git.buildroot.net/buildroot/commit/?id=bca2c28fc9ed2ebca91e6f1347d947389997a4c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 5b8b9c5576..f1fc17523a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,6 +13,7 @@ MODEM_MANAGER_SELINUX_MODULES = modemmanager
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
+	-Dman=false \
 	-Dpowerd_suspend_resume=false \
 	-Dtests=false \
 	-Dudevdir=/usr/lib/udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
