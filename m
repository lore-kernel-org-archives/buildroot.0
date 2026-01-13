Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A52AD30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E45C834F6;
	Tue, 13 Jan 2026 21:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIgkJuF2e2po; Tue, 13 Jan 2026 21:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3526B83F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338020;
	bh=pwSh26rZnBn/OpbwRH+Y328tNSMp6qGKcgSv5Gw+Gro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kATpqWZsOAVk2I//pbD6vzxuFzCtYmCmUB/suisqgFLiwko87nGN21PY/u8w51xBj
	 TQiCzCIFcgjoNrH6iM4cXClqe+RDYDE0Tdyn0l1DHJjGwx9zL/CPG/1egSlZsJXC7+
	 kTYpcxBfY8RLHdxevnC6aUpdKJ4MqE2RXOpT80sEk6vAwDPlTVHTC2bSvmmV+/G/4j
	 TlOzylYGYlSt5WjY4q1z9mg1UHtIiUA1asnRlUCIx+WpB55HZ5xYjjvVRNQSU/xCQ5
	 kEryj/hOhdB7nNz/2J5SlXyv/oF0Zu9hyePYoUreukzMbhQns2irj0aN0V51+Tdvzd
	 Z9snDm4c78nCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3526B83F27;
	Tue, 13 Jan 2026 21:00:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 100BC231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17DFC40766
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4seut7191DIL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9856407CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9856407CB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7FEB81124; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77a2eb944159795f853e5e68b2f3c253196a33e
X-Git-Newrev: ff31dba5f781a4550fb2c32c5d696dfb628af00a
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.E7FEB81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXdmcp: bump version
 to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff31dba5f781a4550fb2c32c5d696dfb628af00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003467.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 6 +++---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 83609413fd..e11058dd08 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003260.html
-sha256  2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00  libXdmcp-1.1.4.tar.xz
-sha512  83b384d43bfb034c395f83f97d1c6e73aa3d5faa8f8756b08e697c0b9c3c87189651b51e8213fbd1f5f9cbc2d8136cbf143627481744345d78cfe0ff2ad074a9  libXdmcp-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003467.html
+sha256  d8a5222828c3adab70adf69a5583f1d32eb5ece04304f7f8392b6a353aa2228c  libXdmcp-1.1.5.tar.xz
+sha512  d7a1d70a58b7d34ddd01a91d3ccbc086a36626b7081cfcbb150d24288c6adad612b042ba7ea63a218595afb2ee04384c0f8ba84ee3c6bd29913724b54e898d83  libXdmcp-1.1.5.tar.xz
 # Locally computed
 sha256  8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index a79e2615db..28b2f9eded 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.1.4
+XLIB_LIBXDMCP_VERSION = 1.1.5
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.xz
 XLIB_LIBXDMCP_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
