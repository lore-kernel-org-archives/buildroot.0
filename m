Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5126C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B3BB613F5;
	Sat, 28 May 2022 09:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f96TM81N4gaD; Sat, 28 May 2022 09:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FBB1610AD;
	Sat, 28 May 2022 09:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D40901BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0FB3610AD
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q07vmtdKRUiR for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2E22610A9
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7B46684278; Sat, 28 May 2022 09:44:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de77516a2b3f8435df066cfc611b0eacfb61b02e
X-Git-Newrev: 45115ea557f0c6b8a522cf222351a650160391a0
X-Patchwork-Hint: ignore
Message-Id: <20220528094442.7B46684278@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: download from Github
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

commit: https://git.buildroot.net/buildroot/commit/?id=45115ea557f0c6b8a522cf222351a650160391a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some corporate networks may be blocking access to Russian servers.
The server "strace.io" is in Russia, which will make it inaccessible
from some networks.

Use Github instead to download the sources.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index cbd737e124..4eef43a419 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -6,7 +6,7 @@
 
 STRACE_VERSION = 5.17
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
-STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
+STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
