Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31060C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22A84206A;
	Mon,  8 Jan 2024 22:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22A84206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ig1kwPQqDofG; Mon,  8 Jan 2024 22:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C8A041B61;
	Mon,  8 Jan 2024 22:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C8A041B61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB891BF8B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7433D60AFF
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7433D60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkxKLphJoFwE for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:19:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C376D60EFF
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C376D60EFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEF3884E01; Mon,  8 Jan 2024 22:19:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 23:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 620bd7220a6e30eb8bdcc346a4584783d45953e1
X-Git-Newrev: bfe2fe22697f2fc95749d20603cf3eae51453ad7
X-Patchwork-Hint: ignore
Message-Id: <20240108221948.AEF3884E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftp: security bump to version
 5.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfe2fe22697f2fc95749d20603cf3eae51453ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update site to avoid redirections (HSTS, etc.)

Version 5.0.3 - 12/17/2023
  A memory leak fix in the prior version wasn't applied correctly, resulting
    in an invalid memory access causing a crash.  Bug fixed.

Version 5.0.2 - 11/8/2023
  Fixed bug that caused crash when a CLIENT_KEY arrived out of order
  Fixed option handling on Windows when an argument is missing

https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index e47cba9394..d4d3450d1a 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256  f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61  uftp-5.0.1.tar.gz
+sha256  cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080  uftp-5.0.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index ce865c20ec..3dcd8646c0 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UFTP_VERSION = 5.0.1
-UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
+UFTP_VERSION = 5.0.3
+UFTP_SITE = https://downloads.sourceforge.net/project/uftp-multicast/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
