Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF49CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DBD56F5F2;
	Sat, 30 May 2026 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6C57ZdxtZmE; Sat, 30 May 2026 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6A560F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176814;
	bh=Ct5ARca58bU2J7IePwoHFPA9mlYnaY1cLBuQ8O/oo3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rLl4Uxt6jsTusYndBCpdOj5xIz5n7jwQileEh9eZBkO9jUweZvEf/OfGY5G+QzTdl
	 t4C45CiUCLL4paT7Q3WXuVmp61XoSDpgTtjozLOfKa/q51+n8jyhHUDoyvKB9ViiBG
	 L9azjcsmWBXKZTo29aZscedTdbjhLG8p2zGc0rsQ65FZijvOUhRXUV+yHAZZuCtvHh
	 tviWFF0dqPTG3JyfZA0BKfr9XChkjqoyb+Qf+nCX49TczvGETg4BX+HkjSNBi8bOHA
	 fbpNcYlbv0RtO8rd4hcQwrPu6GBqMbG7Oaj2DZNHjeORtZ07e/Xk+Tjj8WRJGqSy8L
	 oZxIs6XPou07Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6A560F84;
	Sat, 30 May 2026 21:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B57F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07EEE60F84
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqweRrvWM1ui for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C6E60E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C6E60E98
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0FA7875FF; Sat, 30 May 2026 21:33:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:33:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e60515bbf51998a1ce098d7ea1683a67aff50de8
X-Git-Newrev: eec319cda6a8032372435ef43ca7e55c58c1c0d7
X-Patchwork-Hint: ignore
Message-Id: <20260530213318.F0FA7875FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: bump version to 2.19.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eec319cda6a8032372435ef43ca7e55c58c1c0d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
"lcms2-2.19.1 is a hot-fix release"

https://github.com/mm2/Little-CMS/blob/lcms2.19.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 0ff881158f..f9a64b9527 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.19
-sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
-sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19.1/
+sha1  b66f8317db40a775cb46cc465f66eb841c11aebf  lcms2-2.19.1.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
+sha256  bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8  lcms2-2.19.1.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 32a78a4f35..6f99e3b454 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.19
+LCMS2_VERSION = 2.19.1
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
