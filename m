Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937BD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA698025C;
	Tue, 13 Jan 2026 20:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFRp8U_TI5iu; Tue, 13 Jan 2026 20:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E198041C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337959;
	bh=acjVJ5FTPthIerLHHFmdp1/vTA7FchsPR9FUBhZYGOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jVob3udYtH4UWOEdMuQpWx8qHK0qTDJs2RmWE4hD/hvacZzzf0dNgccpeWGTkGuEC
	 ENu8/VfKmB2LCHZyaNBAW2Fkbp2O2TYhDjP7KjOmCEc57uIuZOfetEZ0DGgw7bGKln
	 QcPk9skry8hr7kutHH+ivkLNa415/0NaIeTOFOWw57/VC0dDeJlFgsSdjQpYq7WypB
	 IlYH9EqzbPkzjyu6NPyTylhKkZoK61eCAw4eq38Y3Iswqd6rOi3fr6TR8nBzYM5JYz
	 gZfBQ2nwEYBxiic0C8dl67DPPf2kDxbTGQn0kRSWjvbD4zPaS1Rz5gzpNsqEQMiFlq
	 kJU4RaZTSmbQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E198041C;
	Tue, 13 Jan 2026 20:59:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07CC9231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC999407B2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5xRzdyhXjac for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF20240789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF20240789
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD2B284685; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3ac5de613d021a0f899fc6c47d6989195a3e32c
X-Git-Newrev: 22890ed8f0e663688f5a2e9faeb08954bfed1fbf
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.AD2B284685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinit: bump version to
 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=22890ed8f0e663688f5a2e9faeb08954bfed1fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-March/003593.html
https://lists.x.org/archives/xorg-announce/2025-January/003577.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 6 +++---
 package/x11r7/xapp_xinit/xapp_xinit.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 4b7d8feb5d..624df77d7a 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003268.html
-sha256  b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23  xinit-1.4.2.tar.xz
-sha512  4b62c2edd97b40133577cbba88b3f31b36c5634b4eb667ef0c302e8358dc1c55a255abe42aaadc910d8aa9ea0e3add157a12a301382f1cdbe091df4e1215fae0  xinit-1.4.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003593.html
+sha256  40a47c7a164c7f981ce3787b4b37f7e411fb43231dcde543d70094075dacfef9  xinit-1.4.4.tar.xz
+sha512  387285c952bbe074d2ed2dbbf745d1634763bb71f7f7edb22b3306b9e96ae4e28e59ecd6c48cc646b12dbdbcc68d42036bd127da75ef3c16fabdae87794ad6d1  xinit-1.4.4.tar.xz
 # Locally computed
 sha256  c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7  COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 795a1b541b..772342ff6d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.4.2
+XAPP_XINIT_VERSION = 1.4.4
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.xz
 XAPP_XINIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
