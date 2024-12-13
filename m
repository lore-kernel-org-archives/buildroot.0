Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD77E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813CF80BBF;
	Fri, 13 Dec 2024 22:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id splY8HpE6f1V; Fri, 13 Dec 2024 22:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810F180BC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810F180BC0;
	Fri, 13 Dec 2024 22:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA4EBECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A740A60B4B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsZ3G10HsacO for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E8C60648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E8C60648
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE59186F2C; Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:39:19 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: b14d727c068d6b4afcbabf0903c2064394c645bb
X-Git-Newrev: d47b41bbf6319c25ce15a81ea3376e964fac29bd
X-Patchwork-Hint: ignore
Message-Id: <20241213224226.BE59186F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] boot/grub2: update _SITE
 to use BR2_GNU_MIRROR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d47b41bbf6319c25ce15a81ea3376e964fac29bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The grub2 package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

Note: Commit [4] introduced the grub2 package using BR2_GNU_MIRROR.
Commit [5] changed it to use "http://ftp.gnu.org/gnu/grub" without
providing a justification for that change.

[1] https://www.gnu.org/software/grub/grub-download.html
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/c24fdb3680019d18f0cb7c02a90975ee9fe9613c
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/5ffafd2353f5d67dc74c7f3784dfe48d4080435e

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 51858c4a34f73c52ac9ff36ba7facf8a8ab9b711)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 4df12774a3..0896029322 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GRUB2_VERSION = 2.12
-GRUB2_SITE = http://ftp.gnu.org/gnu/grub
+GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
