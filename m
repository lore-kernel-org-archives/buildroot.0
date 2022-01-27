Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C622C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 366B161098;
	Thu, 27 Jan 2022 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z29Ta47VsiD7; Thu, 27 Jan 2022 07:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851CB6108F;
	Thu, 27 Jan 2022 07:17:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA9241BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C49416C7
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3CRnRUUFfRb for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:17:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2160741660
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:17:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF7D18285F; Thu, 27 Jan 2022 07:10:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:15:40 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 69a02feb789d5517e4b81eb02f9ea3eb775824b8
X-Git-Newrev: c17eeadab3aaa04ac0e97bf803b280220cd4f96c
X-Patchwork-Hint: ignore
Message-Id: <20220127071035.BF7D18285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/rhash: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=c17eeadab3aaa04ac0e97bf803b280220cd4f96c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 92abcd29b0..d15d6f5968 100644
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
