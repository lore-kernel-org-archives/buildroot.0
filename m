Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EAEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D4540B47;
	Thu, 27 Jan 2022 07:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZ9CQcC8KMYT; Thu, 27 Jan 2022 07:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2C440B41;
	Thu, 27 Jan 2022 07:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98E5A1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 871BA61096
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-ep6vXukLMP for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:17:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73C16108F
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:17:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 87B9E8285F; Thu, 27 Jan 2022 07:10:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:15:30 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ecaafd1804496ac853a710075e43c7d39f2c0695
X-Git-Newrev: e5e649a544da652a38683b2fd40c48cbec96fc59
X-Patchwork-Hint: ignore
Message-Id: <20220127071040.87B9E8285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/rhash: fix
 activation of gettext
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5e649a544da652a38683b2fd40c48cbec96fc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Since commit ead2afda13e5541a7d8e759f5cfec4ab38605dcc, gettext is
wrongly disabled when BR2_SYSTEM_ENABLE_NLS is set

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5630e83c8452d3e9039feb15fd30ea005bfc6b55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index d19c355cbb..02af0aa57b 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -15,9 +15,9 @@ RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-RHASH_CONF_OPTS += --disable-gettext
-else
 RHASH_CONF_OPTS += --enable-gettext
+else
+RHASH_CONF_OPTS += --disable-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
