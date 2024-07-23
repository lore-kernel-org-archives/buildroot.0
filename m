Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE7C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 14:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC10404A5;
	Tue, 23 Jul 2024 14:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KSiFLeZjkgG; Tue, 23 Jul 2024 14:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6EEF404A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6EEF404A6;
	Tue, 23 Jul 2024 14:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEAD91BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB73F40112
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VogR98lzs2_w for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 14:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BC0400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2BC0400B8
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAE7F87317; Tue, 23 Jul 2024 14:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:34:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 78ea31ddd78598d449f1da8792f9d7c15cd032e7
X-Git-Newrev: 1d91c6fda4e4cc6aef3d2983c74cb65b80949f8e
X-Patchwork-Hint: ignore
Message-Id: <20240723143455.AAE7F87317@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d91c6fda4e4cc6aef3d2983c74cb65b80949f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
