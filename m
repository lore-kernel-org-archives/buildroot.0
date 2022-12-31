Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F1C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3B7833B7;
	Mon, 20 Feb 2023 23:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3B7833B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lIJ1PnY3QMl; Mon, 20 Feb 2023 23:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9A783F79;
	Mon, 20 Feb 2023 23:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9A783F79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610671BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42496617B5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42496617B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4hgxBE2e2cx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60540617B1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60540617B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 489F28648F; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:04:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4bb4288dd08c688072a25bf60c3a60e0047c1668
X-Git-Newrev: ed631bc7525356c2e086a307e93df7d71d2fdde7
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.489F28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/modem-manager: disable
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed631bc7525356c2e086a307e93df7d71d2fdde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

tests can be disabled since version 1.20.0 and
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/ba96ccc61587b7b6c31b94826ee7a3c44d795364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 8ef85b9b1d..5b8b9c5576 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -14,6 +14,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIE
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
 	-Dpowerd_suspend_resume=false \
+	-Dtests=false \
 	-Dudevdir=/usr/lib/udev
 
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
