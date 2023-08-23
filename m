Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053DBEE4993
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 11:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A717408D6;
	Wed, 23 Aug 2023 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A717408D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drEhCqn-MlLH; Wed, 23 Aug 2023 11:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB71D408D9;
	Wed, 23 Aug 2023 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB71D408D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3B91BF982
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2439760E5D
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2439760E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2dKOOh6ZBRi for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2698B60E38
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2698B60E38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14F77861DF; Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 13:25:38 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e66213ee55899d1989f693ea45d501f9a5e18476
X-Git-Newrev: 623add7dae547509e83f832dd3dd07ecb9d93c33
X-Patchwork-Hint: ignore
Message-Id: <20230823112551.14F77861DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gkrellm: link
 with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=623add7dae547509e83f832dd3dd07ecb9d93c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/5df/5dffba341cfe5e4d41b3c88e58d92b0747318c07/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 36c29522ae6840eb8815a4e0c037f4cd17b1f126)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gkrellm/gkrellm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 2a68722663..27a87be190 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -12,7 +12,13 @@ GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
 GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 GKRELLM_BUILD_OPTS = \
 	STRIP="" \
-	SYS_LIBS=$(TARGET_NLS_LIBS)
+	SYS_LIBS="$(GKRELLM_SYS_LIBS)"
+
+GKRELLM_SYS_LIBS = $(TARGET_NLS_LIBS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GKRELLM_SYS_LIBS += -latomic
+endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 GKRELLM_DEPENDENCIES += lm-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
