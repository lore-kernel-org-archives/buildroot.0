Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B65CF9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E0F6EE12;
	Tue, 14 Apr 2026 15:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5owydlcCTA5e; Tue, 14 Apr 2026 15:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2456F47F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181362;
	bh=QdJ3dThlpjqnEh/QDQAttaMLuX8AHZa9linE9rawbgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ihOITO/o14DFCjbH38/X8Y79IBUwNXJ/Te2WJjdkGlR/X0Z/RyOnYvc1114yWYzHR
	 lSVThEubYaRfbJQuEViEDF/z69ZOlxosgQ1xdJyFaJRVMSJrxWVJCkXn+yJ6WaJUym
	 hOJ2aZ2kd3pB72mqoyx6LE1pG/8cuWDBiurU2tMbHUAM8yj1/8CLTM+18ptzjN7QwZ
	 HxOzLMZn3TrSrQOiim+2+wlhgZ8qPimKm2EXMFohIfjcd52M3qQ4u0FBFWFCW2HLD+
	 RSEExHn9f/uetHdMDSfjL4PMHyrUTMlRg+TPKipCleAC5ZiPCNIx2fuywPrxz1TLYD
	 +/jEezxFHjxIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2456F47F;
	Tue, 14 Apr 2026 15:42:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D01E13B9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0DF6F481
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPFhMbLJZH-8 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 865D06EE12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 865D06EE12
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 196AE814A9; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 11:59:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0114a8b497973d8ece139eb7cd04be9c103b4c77
X-Git-Newrev: 90cd80f30ff4c4c3e591133b4358acd410c73506
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.196AE814A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ltp-testsuite:
 Always require host-pkgconf
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90cd80f30ff4c4c3e591133b4358acd410c73506
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Require host-pkgconf only for libtirpc is not enough because libmnl
requires as well.

Upstream added it since 20200515 commit
553ca8ea3b ("net/route: Add netlink based route change tests")
using it in m4/ltp-libmnl.m4.

Later, in 20210524 in commit
6e17e2ba13 ("configure: Improve error message on missing pkg-config")
configure.ac required it explicitly:

m4_ifndef([PKG_CHECK_EXISTS],
	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])

This fixes error:
checking pkg-config is at least version 0.9.0... ./configure: line 7419: br-mips64r6-el-hf-glibc/host/bin/pkg-config: No such file or directory

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d421a5d278790f01033266fe45bdd26e10ee23b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ltp-testsuite/ltp-testsuite.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f6098037c0..9087ec58c0 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -11,6 +11,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
+LTP_TESTSUITE_DEPENDENCIES += host-pkgconf
+
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
@@ -51,7 +53,7 @@ LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
 LTP_TESTSUITE_LIBS =
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
+LTP_TESTSUITE_DEPENDENCIES += libtirpc
 LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
