Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED06BD2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E822608AD;
	Sun, 11 Jan 2026 21:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aZMQXV1Lh22; Sun, 11 Jan 2026 21:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A1360709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768167308;
	bh=X/eGjhNNE6z9IKNw1nLy67c+naocIu6JN4sgCunmodE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T//xTeAXaFSde1UCLC0EJyWbJAY2VgAwZ9ov98PoR09roBi1varbmWR1FRGS2454n
	 wRjaIvAqWv5QVD4nO6K33YB5p5UJFwh5dSg4iUSsxoB0zt+JU1DSLgKLQsLq84FMZV
	 MXP19rRUjRFhO5Zc/6+qXF6dTeVLgVmDQLyrg8yYvjUFi/OQR1LaBRAYneYmkCecX/
	 n8MQn1CXWTODzdTXKQ/z9ic/DQb+aVrlqjUmGPevLQDhEynhIz4nz+GbzlZuhklSpA
	 SDVtvV+zSgW4gRqQjHV20zeCG/qkxFc1zRXkIWAZYw79mjbN/PDbgAfs9kR6oVKY9L
	 FRSLbYJ+Nt8ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A1360709;
	Sun, 11 Jan 2026 21:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 293641CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED3A81191
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eud37IRefThe for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 21:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB2080F54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB2080F54
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06ED4884CC; Sun, 11 Jan 2026 21:35:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 22:33:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ff4256b19c2880e6fdcae08d9317b6f70397162
X-Git-Newrev: d3e863987140487135316cb1187c7fd3c0c289d5
X-Patchwork-Hint: ignore
Message-Id: <20260111213504.06ED4884CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: fix systemd install
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3e863987140487135316cb1187c7fd3c0c289d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit e859686460a30af0868d68810645c2208562039f bumped alsa-
utils to 1.2.15.1 including upstream commit
https://github.com/alsa-project/alsa-utils/commit/f047a8a66917960ef5a9ff0e41de507f0e58f381
which moved the systemd files to alsactl/conf subdirectory.

Adjust ALSA_UTILS_INSTALL_INIT_SYSTEMD accordingly to fix build error.

Fixes:
https://autobuild.buildroot.net/results/31a/31a409308924fd7f60dd94db3c10e2a25c73020a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/alsa-utils/alsa-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9eeec1d50b..5a5f18b64f 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -85,9 +85,9 @@ ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL)$(BR2_INIT_SYSTEMD),yy)
 ALSA_UTILS_DEPENDENCIES += systemd
 ALSA_UTILS_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
 define ALSA_UTILS_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/conf/alsa-restore.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
-	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/conf/alsa-state.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
