Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC718C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFD561053
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FFD561053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27452407A3;
	Fri,  5 Nov 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUHq3O82yeFC; Fri,  5 Nov 2021 21:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C314079E;
	Fri,  5 Nov 2021 21:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0A941BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFBAA61579
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bwp3Yh0sb6Lo for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1567A60715
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C253D8B360; Fri,  5 Nov 2021 21:05:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 22:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7485f5be0c460649e7406699cde82bb492aa23f1
X-Git-Newrev: 0f1bce7b73204a7abb85aa629e8704e08cbd0ce9
X-Patchwork-Hint: ignore
Message-Id: <20211105210558.C253D8B360@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: remove launcher-libseat
 meson option
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f1bce7b73204a7abb85aa629e8704e08cbd0ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option only exists in main and is not in a release.

Fixes:
output/build/weston-9.0.0/meson.build:1:0: ERROR: Unknown options: "launcher-libseat"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 69ee11d23c..6dd5439291 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,13 +26,6 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WESTON_CONF_OPTS += -Dlauncher-libseat=true
-WESTON_DEPENDENCIES += seatd
-else
-WESTON_CONF_OPTS += -Dlauncher-libseat=false
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
 WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
