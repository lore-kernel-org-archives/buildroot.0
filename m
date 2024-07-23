Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732DC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 14:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03BF404BE;
	Tue, 23 Jul 2024 14:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Pr2o02rW2zV; Tue, 23 Jul 2024 14:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFEB404CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DFEB404CA;
	Tue, 23 Jul 2024 14:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFAC1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CB8F6069A
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn9tcFi11B1n for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 14:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25CA60654
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25CA60654
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDCF687312; Tue, 23 Jul 2024 14:36:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:33:46 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: b16821b9e268804d190e4f71143b7cb4d7a530f2
X-Git-Newrev: 7e2f295681a359b908ef0448c9b36f1ccfe65041
X-Patchwork-Hint: ignore
Message-Id: <20240723143616.DDCF687312@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 package/rauc-hawkbit-updater: add systemd optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e2f295681a359b908ef0448c9b36f1ccfe65041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Take the systemd into account if present.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4aa7a4ad8a6f729ad6ee6baf16f01d657559b3e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
