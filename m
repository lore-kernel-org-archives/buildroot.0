Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F34C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 045F94052B;
	Sun, 11 Dec 2022 13:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 045F94052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcRvxW8frOKW; Sun, 11 Dec 2022 13:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DBC24052D;
	Sun, 11 Dec 2022 13:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBC24052D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 228BD1BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 069B440925
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069B440925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a7WXZultoyP for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2360408F1
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2360408F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3462863FB; Sun, 11 Dec 2022 13:42:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:42:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de7850f9464a686fc7f37a8c1f8880f47ebffb00
X-Git-Newrev: 65e0351adc5075ac679557d7e41a02815f979e90
X-Patchwork-Hint: ignore
Message-Id: <20221211134259.D3462863FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: indent with tabs
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

commit: https://git.buildroot.net/buildroot/commit/?id=65e0351adc5075ac679557d7e41a02815f979e90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit eb2f2886b2364e5b6a0867f55106bf83acb064e7 ("package/swupdate:
add staging install") has introduced some commands indented with
spaces, which check-package doesn't like.

Fix that by using tabs instead, and while we're at it, wrap the line
that is a bit too long.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 54ae03f238..1cd60d1b8f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -230,8 +230,9 @@ define SWUPDATE_BUILD_CMDS
 endef
 
 define SWUPDATE_INSTALL_STAGING_CMDS
-        $(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
-                $(SWUPDATE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) INCLUDEDIR=/usr/include/swupdate install
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
+		INCLUDEDIR=/usr/include/swupdate install
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
