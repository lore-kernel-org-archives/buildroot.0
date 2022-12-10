Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD1EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44CEB404A1;
	Sat, 10 Dec 2022 20:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44CEB404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W40dcMwcesqA; Sat, 10 Dec 2022 20:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FF73404B3;
	Sat, 10 Dec 2022 20:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF73404B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAEB01BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63AF40308
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63AF40308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WxJjrVCL1YA for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D12403D0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D12403D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8029B85F51; Sat, 10 Dec 2022 20:00:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 20:57:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21321a983615f8a3ca33c92599c7fc6023711949
X-Git-Newrev: e84a88e8e2ed7873fbf5362d2d8b5bcd75634af7
X-Patchwork-Hint: ignore
Message-Id: <20221210200022.8029B85F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e84a88e8e2ed7873fbf5362d2d8b5bcd75634af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea51485ee9ab44f72f8b1cc019dcb17f276d1def)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/CHANGES b/CHANGES
index 312e324ef7..6de79c7d35 100644
--- a/CHANGES
+++ b/CHANGES
@@ -530,6 +530,22 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.8, released December 10th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: asterisk, dash, dovecot,
+	dovecot-pigeonhole, edk2, edk2-platforms, elf2flt, exim,
+	freerdp, gcc, gdb, git, gnupg2, heimdal, iwd, kodi,
+	libarchive, libmdbx, libkrb5, libksba, libopenssl, memcached,
+	netsnmp, nginx, openpgm, optee-client, python3, rsync,
+	rtl8723bu, samba4, sdl, sdl2, swupdate, sysstat, systemd,
+	uboot, vim, vlc, xen, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15131: Target GDB uses internal zlib
+
 2022.02.7, released November 17th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
