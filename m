Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF67EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01BCA60A69;
	Tue, 10 Sep 2024 20:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrNiDx4W4n81; Tue, 10 Sep 2024 20:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584C060902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584C060902;
	Tue, 10 Sep 2024 20:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E49D1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43BE840B7F
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zd5raf-opBX8 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD2240495
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD2240495
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E926C86F54; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2a0ab180c13ecb41b1c1aea65c9ca69fbe8bc90
X-Git-Newrev: 4c046460d2b120816478b4ae82793e7617e80f7c
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.E926C86F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcache-tools: fix compatibility
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c046460d2b120816478b4ae82793e7617e80f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Don-t-inline-crc64-for-gcc-5-compatability.patch             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
index 1a437a84fb..bd3358c207 100644
--- a/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
+++ b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
@@ -1,4 +1,4 @@
-Don't inline crc64 for gcc-5 compatability
+Don't inline crc64 for gcc-5 compatibility
 
 This patch is backported from Debian and it fixes the following error:
 
@@ -11,7 +11,7 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
 From: David Mohr <david@mcbf.net>
 Date: Tue, 26 May 2015 20:34:31 -0600
-Subject: Don't inline crc64 for gcc-5 compatability
+Subject: Don't inline crc64 for gcc-5 compatibility
 
 Forwarded: http://article.gmane.org/gmane.linux.kernel.bcache.devel/2919
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
