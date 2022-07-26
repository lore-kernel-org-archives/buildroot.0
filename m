Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D076C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B84607B4;
	Tue, 26 Jul 2022 21:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B84607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKktM88romrV; Tue, 26 Jul 2022 21:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F31607D0;
	Tue, 26 Jul 2022 21:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F31607D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F18D1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D6A4013F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D6A4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ltqWkFul7Oz for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:32:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D1740012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D1740012
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B839386335; Tue, 26 Jul 2022 21:19:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:32:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 235acd628a6e23e3ec79a758e1ae4a7558ecf07e
X-Git-Newrev: d51d4378ba7fd92b7374b029efd9f6e4cfefd4c9
X-Patchwork-Hint: ignore
Message-Id: <20220726211901.B839386335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: install systemd service
 file with correct permissions
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

commit: https://git.buildroot.net/buildroot/commit/?id=d51d4378ba7fd92b7374b029efd9f6e4cfefd4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index cb81b89b44..1788d29281 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -145,7 +145,7 @@ RSYSLOG_CONF_OPTS += \
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0755 -D package/rsyslog/rsyslog.service \
+	$(INSTALL) -m 0644 -D package/rsyslog/rsyslog.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rsyslog.service
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
