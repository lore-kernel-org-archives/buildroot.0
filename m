Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831FBC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 330EF8206B;
	Wed, 11 Jan 2023 09:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330EF8206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zRjw4iV0Sjh; Wed, 11 Jan 2023 09:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39BC582091;
	Wed, 11 Jan 2023 09:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39BC582091
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CC311BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A7540104
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A7540104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tQdCSDn5JSx for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F1B408C9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F1B408C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A04B87818; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:23:58 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 57d8c4a220a3e6096d092bc709f5e9d2f25721cd
X-Git-Newrev: 435e194e35633dcc8fb31d89edadfb9a59e4b550
X-Patchwork-Hint: ignore
Message-Id: <20230111092534.5A04B87818@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rhash: drop
 dangling RHASH_ADDLDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=435e194e35633dcc8fb31d89edadfb9a59e4b550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "ead2afda13 package/rhash: bump version to 1.4.0" dropped the
only usage of this define but the define itself was left dangling.

Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eae97036f34e69e2ca197cd31fd87c673f2ebe37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 8c33de1862..1f7456e4e7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -12,7 +12,6 @@ RHASH_LICENSE_FILES = COPYING
 RHASH_CPE_ID_VENDOR = rhash_project
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 RHASH_CONF_OPTS += --enable-gettext
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
