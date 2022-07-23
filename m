Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C2C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B471984C01;
	Sat, 23 Jul 2022 17:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B471984C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_JXG9_2AgYi; Sat, 23 Jul 2022 17:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B4D84BB2;
	Sat, 23 Jul 2022 17:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B4D84BB2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2231BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4710184BEF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4710184BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMx3NBtFfprU for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D0C384BB2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0C384BB2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 272258267F; Sat, 23 Jul 2022 17:38:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ad0000827dbe58d499ff8efc96158600e23edb6
X-Git-Newrev: fbc17cc59dfe253a61d646fb592842f16493b50d
X-Patchwork-Hint: ignore
Message-Id: <20220723173809.272258267F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdg-dbus-proxy: switch to the
 meson build system
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbc17cc59dfe253a61d646fb592842f16493b50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.1.4 introduced a Meson build system, and upstream seems to
have the intention to abandon the previous autotools based one. Switch
to Meson for future proofing.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index b07cf787ed..48f49dba2a 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -12,6 +12,6 @@ XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
 XDG_DBUS_PROXY_LICENSE = LGPL-2.1+
 XDG_DBUS_PROXY_LICENSE_FILES = COPYING
 
-XDG_DBUS_PROXY_CONF_OPTS = --disable-man
+XDG_DBUS_PROXY_CONF_OPTS = -Dman=disabled -Dtests=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
