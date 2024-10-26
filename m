Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689CCD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C4A840167;
	Sat, 26 Oct 2024 19:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNreWjKS9ViB; Sat, 26 Oct 2024 19:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC667401BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC667401BA;
	Sat, 26 Oct 2024 19:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E57815C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75606058D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtjrT44LUkua for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06810605A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06810605A7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F330284048; Sat, 26 Oct 2024 19:03:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:03:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 122af7e193dce9781c41a5f79727823bac859fd7
X-Git-Newrev: 03c3083b977b4e63af531044143679f38792e430
X-Patchwork-Hint: ignore
Message-Id: <20241026190339.F330284048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: set /var/lib/chrony
 ownership with CHRONY_PERMISSIONS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=03c3083b977b4e63af531044143679f38792e430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  chronyd[241]: Could not open /var/lib/chrony/chrony.drift.tmp : Permission denied

Refs:
https://github.com/jens-maus/RaspberryMatic/blob/3.77.7.20240826/buildroot-external/overlay/base/etc/init.d/S46chrony#L44
https://github.com/troglobit/myLinux/blob/5ab2ec53d70904b1c3f2570afaa31eeaa4c4487b/package/skeleton-init-finit/skeleton/etc/tmpfiles.d/chrony.conf

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chrony/chrony.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 9ed9dcff56..11270206bd 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -24,6 +24,10 @@ define CHRONY_USERS
 	chrony -1 chrony -1 * /run/chrony - - Time daemon
 endef
 
+define CHRONY_PERMISSIONS
+	/var/lib/chrony d 755 chrony chrony - - - - -
+endef
+
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += libnss
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
