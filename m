Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE40C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CCF402FD;
	Sat, 10 Dec 2022 20:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17CCF402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwHmyxu_HVQd; Sat, 10 Dec 2022 20:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34A040301;
	Sat, 10 Dec 2022 20:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34A040301
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA80C1BF859
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8554260AD1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8554260AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sRpGn5yCHZq for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F1060A70
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F1060A70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64C8985F4F; Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 20:52:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34cea39024bf8dedaa071bc5f2d903755501215c
X-Git-Newrev: 4f9f6180491c697b29aa687f378c2ab58c7f91fd
X-Patchwork-Hint: ignore
Message-Id: <20221210200022.64C8985F4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f9f6180491c697b29aa687f378c2ab58c7f91fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1fad7a933d28a17ce4064898e49e2ad4d6ba8bd3)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/CHANGES b/CHANGES
index f71e53fe4b..312e324ef7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -109,6 +109,22 @@
 	#15061: Node.js Package fails to build against musl  i386
 	#15071: RTL8723BS library is outdated
 
+2022.08.3, released December 10th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: asterisk, dash, dovecot, edk2,
+	edk2-platforms, elf2flt, exim, freerdp, gcc, gdb, git, gnupg2,
+	heimdal, iwd, kodi, libarchive, libkrb5, libksba, libmdbx,
+	libopenssl, matchbox-keyboard, memcached, netsnmp, nginx,
+	nodejs, openpgm, optee-client, python-scipy, python3, rsync,
+	rtl8723bu, samba4, sdl, sdl2, swupdate, sysstat, systemd,
+	uboot, vim, vlc, wilc-driver, xen, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	15131: Target GDB uses internal zlib
+
 2022.08.2, released November 16th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
