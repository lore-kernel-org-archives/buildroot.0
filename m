Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04376CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C904152C;
	Sun,  3 May 2026 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QUO4ns9fKSe; Sun,  3 May 2026 16:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2DC4141B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777827414;
	bh=vp+ixQtE0XZjnd8ee7vxQoYH3lpkk/yqhgZrJVHDITY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NQDLkNmj/jiSHfUveozltWwSODmBaas8R6Xg4mBtU81muzeN7AKxpBxjOc4ik00K5
	 lVtnWG6l+UYc57+sMdhXJzP7d35ETKi9j1dFX5fUdZ/xxAQ0Bx0aKq5zd8gPk1GiiO
	 q7ib5jy36x6jNSDNhHgM+ugEL8W8XvYE2358toRGPHDE6ECS4CZsrSsEH+oAtLH5aR
	 rzcIyIc+mCsMOC9wNw8TQ9xebSjfUGDfv0NINDpQF+Sg3DK7scNZGURCpwYh6/Uy7e
	 rLppHMab8RUPG0JavxxpACGG474XNQ67mS/ex8M1G5viOv79KEPPBp6L0NjRhPObBF
	 q4wBpSjDZwE/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB2DC4141B;
	Sun,  3 May 2026 16:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C58204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30834071B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tV7aGnhmHG4u for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B38402DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6B38402DC
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B5BE84074; Sun,  3 May 2026 16:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:49:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df72fa9cbf87a0255c727e1d8244233bcc5ffe16
X-Git-Newrev: deda2e8e204d3dd527abc339e99785de0eb29dbb
X-Patchwork-Hint: ignore
Message-Id: <20260503165651.9B5BE84074@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump to version 7.5.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/deda2e8e204d3dd527abc339e99785de0eb29dbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Fix dos2unix error on empty input
- Add new option --error-binary to return an error if a binary
  file is skipped

For change log, see:
https://dos2unix.sourceforge.io/dos2unix/ChangeLog.txt

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dos2unix/dos2unix.hash | 4 ++--
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index c48f70d574..720a457ce0 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.4.tar.gz.asc
-sha256  f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21  dos2unix-7.5.4.tar.gz
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.5.tar.gz.asc
+sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
 sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 8794aa46bf..99454aa2a3 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.4
+DOS2UNIX_VERSION = 7.5.5
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
