Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A1BD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A6B83E05;
	Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8E8g8HJSMUZ; Tue, 13 Jan 2026 21:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B38983E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338000;
	bh=iVNRU9NaKMPPG4I6+MkdzJAYB5v9jeyyqvU6yHMnGR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1WlVbhJ/EXNGTvsJWl2YcEmMt8aCgseV9EIbjf7FK6F/mfnrnO1VKNcGcOhBLuxc
	 YGk0Q3MyPF5x9UFp5pwceRWQ47enkNN6FFzFaZz7J3dOS36xJHoTMZGC0nY4a3daj8
	 eqZAF06mGil8t/KxrXT0CGp0k2/q0vrekp7j73hWyf69TZrBxtYpcQ6hY1APTqEXrF
	 NEP1YLZAGHMZ3HdqweFhO1i0/vpWIhK3aeb69vx6uTdG5URhbIZ8dT+H4o215HU5rP
	 TbDnnCFrWrYQiqQRG3ZPheRm7KZuHewpRC4MQvWNMUwTF5oLOQqX1c/+6VSSECHHWr
	 4QQM45lFRwOvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B38983E86;
	Tue, 13 Jan 2026 21:00:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6BA1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA70F407B0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duBC3QnmxBnN for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1260240797
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1260240797
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10DF381382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87b18e6308a030375e58c150d4bcaa84d295a830
X-Git-Newrev: 4ff5dd0106cd9b80f3880217a61b31bddff969a1
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.10DF381382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXmu: bump version to
 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ff5dd0106cd9b80f3880217a61b31bddff969a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-April/003508.html
https://lists.x.org/archives/xorg-announce/2024-March/003493.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.hash | 6 +++---
 package/x11r7/xlib_libXmu/xlib_libXmu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
index 58d3545156..2fb3923d3c 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.hash
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003224.html
-sha256  210de3ab9c3e9382572c25d17c2518a854ce6e2c62c5f8315deac7579e758244  libXmu-1.1.4.tar.xz
-sha512  3cf90cb3ff380aafefbb39297bdd95b9e1e6d6618cecb53ff09faf38f9b9c54599d28367f07a9ec77a20214c6c3e661b8d0a12b38082556790a79a59942039c1  libXmu-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003508.html
+sha256  fcb27793248a39e5fcc5b9c4aec40cc0734b3ca76aac3d7d1c264e7f7e14e8b2  libXmu-1.2.1.tar.xz
+sha512  05a30e5961e00e940ad7ec4eb94ec482b5cbe808585972bf70c849333af3fddf4ae4bd87895d706507fb3a94ed0fb73ea161e0e27dc2840323a1a1af49c0e8a3  libXmu-1.2.1.tar.xz
 # Locally computed
 sha256  8f0f2ca7a05cfd10bf9e307a272182de7cb52d7a603feaf17b9943c2c9a4838e  COPYING
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 051968059b..f47d943e65 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.1.4
+XLIB_LIBXMU_VERSION = 1.2.1
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.xz
 XLIB_LIBXMU_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
