Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AF3C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9758060B3D;
	Wed, 11 Jan 2023 09:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9758060B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6aCOWyDd9aG; Wed, 11 Jan 2023 09:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E4660B43;
	Wed, 11 Jan 2023 09:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E4660B43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 439B31BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3A8660B3D
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A8660B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwf8qPH9LLxO for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D475860B45
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D475860B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D164E87815; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:17:20 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: aee0b26141f748609ccd140c7ffc23782b27ce1d
X-Git-Newrev: 5113d1890e4cf12e095aa3ff87f8a3b181bdce61
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.D164E87815@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/exfat: drop
 dangling EXFAT_CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5113d1890e4cf12e095aa3ff87f8a3b181bdce61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "98538bb0a2 exfat: bump to version 1.2.1" changed the package
infra from generic to autotools, but dropped all usages of EXFAT_CFLAGS.
This config is ignored by autotools package infra.

So drop the dangling symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/exfat.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 282a30aa5e..c0ef77a113 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -11,7 +11,6 @@ EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CPE_ID_VENDOR = exfat_project
-EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 EXFAT_CONF_OPTS += --exec-prefix=/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
