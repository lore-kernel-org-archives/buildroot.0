Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35750C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C07084F227;
	Mon, 20 Feb 2023 22:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07084F227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGgsKDTKRmUG; Mon, 20 Feb 2023 22:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F98E4F229;
	Mon, 20 Feb 2023 22:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F98E4F229
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A249C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7109D61242
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7109D61242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ahmc9jdbAR3Q for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A452C611EE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A452C611EE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2A7E828C8; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:42:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: de7850f9464a686fc7f37a8c1f8880f47ebffb00
X-Git-Newrev: 65e0351adc5075ac679557d7e41a02815f979e90
X-Patchwork-Hint: ignore
Message-Id: <20230220205206.A2A7E828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: indent with
 tabs
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
