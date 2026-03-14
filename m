Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9F210854B2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03196069D;
	Sat, 14 Mar 2026 21:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtJYP1AZy3Qv; Sat, 14 Mar 2026 21:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9CA6085C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773525330;
	bh=LYdRCxJI9TOCEJJXLtFFXdASOoNk0Sv7sOmpbl2d6TA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BVpnAbTg9es5bU881h+/duRl2Ji4sJSVdBtTMVWjmhWKUTWDGQGiVMl3GjGJV2cUA
	 hqBnDi/JzfqHklcg0/kIBcpd23ffJpmmuLNNC/fecb1f29xt+ujm3xTi+dVbl2HSII
	 EYnJ10/hLhPTpdrK6ney7pEpYb54kC3VuCXdb8iZuG62ugM6JOFXN6gHIhuLegeDun
	 wjUm6V8DfPP+77FuPY6pz5qclFjRRqn0BQF0ZoTWWwgKsoxW8xtU4dX1OBpG/F0J7D
	 EKutJMFa7YBRfjtDaTpFdLuo3sbGjjax0zUqa+NLtbKsZpRob/A067LyczK0vPf76F
	 CxIy8p4opT5oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9CA6085C;
	Sat, 14 Mar 2026 21:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41AA01B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3358341098
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDMxdaAMsbYw for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 21:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9708B41091
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9708B41091
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF13B84393; Sat, 14 Mar 2026 21:55:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 22:48:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38ef052d6124aecee2803ce1b46b354437b8619
X-Git-Newrev: cc80c554154edf9aec9d65a49f72f685c5f21b4c
X-Patchwork-Hint: ignore
Message-Id: <20260314215527.BF13B84393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump version to 7.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc80c554154edf9aec9d65a49f72f685c5f21b4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Updated license hash due to copyright year bump:
https://sourceforge.net/p/dos2unix/dos2unix/ci/0ab159a6c80bd647f4830fb45059472eb1e11d3e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 3e9bf7882e..c48f70d574 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.3.tar.gz.asc
-sha256  28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2  dos2unix-7.5.3.tar.gz
-sha256  bff21c3509fe7348c8327745b2f80d8847b04868073c6d0861bf8c773db66515  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.4.tar.gz.asc
+sha256  f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21  dos2unix-7.5.4.tar.gz
+sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 4c57a4de5f..8794aa46bf 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.3
+DOS2UNIX_VERSION = 7.5.4
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
