Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E1D7237C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 23:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D43E860B04;
	Sun, 25 Jan 2026 23:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpldVi1Fi-Ey; Sun, 25 Jan 2026 23:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65D660AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769382993;
	bh=KPO3cMk56nPJuTSb8yzhicnkVu3jEujuIo4+uTerot8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MT9XhESzo/w4XYmLCH94DRjiGhqzwvBTi+HhodXrCeLdEbn6IIeR5YAsfAbOTfwMm
	 IZ6iJXksev7MJn4nv3ekhVDB/9KaNOvtP0sRafumoxAd8JdcA5sEkGHNbN22dcO1qL
	 mF5efcwjNtGu+kJyGNqjA25Z1waMvhQIipMl8yTidtGa+snaqQYwHSr5zUA/aoVmxg
	 pN7TE+m3GiOMl70WMJE0vDBHpg8SIDko5QgGpxzylOQVb1Ie2Ym2eUwbB7na1uP09k
	 JZsrvKKddqvQaNG46SgL/lsOX2tgVwkS6Xp+jlp2wxljBfgJdtBggIcAUZJv4XsQ2a
	 4t3Nr8iv5b88w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65D660AB9;
	Sun, 25 Jan 2026 23:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB38811B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A55EB40143
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_k6GfGxaAMW for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 23:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC13040085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC13040085
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 23:16:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B998719C; Sun, 25 Jan 2026 23:16:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 23:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38e2dc8bee4d5f08e3a7bc1826c6c73e221cd75e
X-Git-Newrev: eb63637dd0ca3fdd3c45d79525c706ee64ec03d3
X-Patchwork-Hint: ignore
Message-Id: <20260125231630.B9B998719C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: bump to newlib
 4.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb63637dd0ca3fdd3c45d79525c706ee64ec03d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump newlib-bare-metal to version 4.6.0.20260123.

For NEWS, see [1].

This commit also updates the license file hashes, after upstream
update in [2].

[1] https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=newlib/NEWS;h=99567683b27e1d432138b1f4728ed03e09fc13ec;hb=8ba4275b83ec27529f67e0d477611fa6d8d6e6bd
[2] https://sourceware.org/git/?p=newlib-cygwin.git;a=commitdiff;h=cac47030fb003570295582606f158609f626347f

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Julien: add link to NEWS and license hash update note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/newlib-bare-metal/newlib-bare-metal.hash | 6 +++---
 package/newlib-bare-metal/newlib-bare-metal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index b22602033c..69d34600d7 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852  newlib-4.5.0.20241231.tar.gz
+sha256  6ff27e3bf022666f43f7802255be680eeff722ac181b1725d21e2e8318604ee3  newlib-4.6.0.20260123.tar.gz
 
 # Hashes for license files locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256  bdaffd5fff30cb5fc7a239a4fa0b95f703590f7b3813ca7f4e76ff46437aeb81  COPYING.LIBGLOSS
-sha256  fcfb5ec69b6ab52676dcc4dab7cf4338c8000ef97812dadd35b8592a640a8419  COPYING.NEWLIB
+sha256  4ef33c7bdd57f5fa8fbe3bdc0200245ab91c564c2ef530d95bbe7fd4070757cd  COPYING.LIBGLOSS
+sha256  f3afe48e4bc6ed8466a42e9dacb6be1d8f9cbf5aac15cb8e474a5ccde8b40ef6  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index f1e54d6f9e..5881993d3a 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.5.0.20241231
+NEWLIB_BARE_METAL_VERSION = 4.6.0.20260123
 NEWLIB_BARE_METAL_SITE = https://sourceware.org/ftp/newlib
 NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
