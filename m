Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0607EC3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A309A8201F;
	Wed, 10 Jul 2024 12:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DFPw4faCz_K; Wed, 10 Jul 2024 12:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49268200C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49268200C;
	Wed, 10 Jul 2024 12:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EAD91BF5A8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29B0B8200C
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMkAdeGYUwYD for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62FC481F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62FC481F21
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:26:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D76F84622; Wed, 10 Jul 2024 12:26:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 14:26:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee5bacaf4d30705ea7793a0a33debaa6bbbea87c
X-Git-Newrev: 4aa7a4ad8a6f729ad6ee6baf16f01d657559b3e6
X-Patchwork-Hint: ignore
Message-Id: <20240710122635.5D76F84622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc-hawkbit-updater: add systemd
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aa7a4ad8a6f729ad6ee6baf16f01d657559b3e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Take the systemd into account if present.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index 3836d3c84e..da1c020bb6 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -12,4 +12,11 @@ RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
 RAUC_HAWKBIT_UPDATER_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+RAUC_HAWKBIT_UPDATER_DEPENDENCIES += systemd
+RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=enabled
+else
+RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
