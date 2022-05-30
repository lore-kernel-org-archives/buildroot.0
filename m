Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90A024093B;
	Mon, 30 May 2022 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnK-HM40keKk; Mon, 30 May 2022 20:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A914A403A2;
	Mon, 30 May 2022 20:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0FE51BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF22F4093B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k4-QgmYRyNN for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:28:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D19C40239
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:28:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3DE3B867C6; Mon, 30 May 2022 20:16:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:28:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc469ee6329555284b2fe9162597917122fbbe3a
X-Git-Newrev: 55d164bf5d88669bad2bc52eb38eaab06619a027
X-Patchwork-Hint: ignore
Message-Id: <20220530201634.3DE3B867C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: drop libee dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=55d164bf5d88669bad2bc52eb38eaab06619a027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extract from
https://github.com/rsyslog/rsyslog/commit/1bc60d4ba29053bd54dd11de46e985f1d34d8462:

"NOTE TO MAINTAINERS: libee is not used by rsyslog for quite some while.
However, we never included this info into the changelog. So if you still
make rsyslog depend on libee (some do this), you should stop doing so
now. Libee is dead and no longer been maintained nor hosted by us."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index ec0d405dc7..a0fb949a9a 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -66,10 +66,6 @@ else
 RSYSLOG_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEE),y)
-RSYSLOG_DEPENDENCIES += libee
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
