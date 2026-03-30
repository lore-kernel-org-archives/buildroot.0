Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099541061B21
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 19:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAFEF60E26;
	Mon, 30 Mar 2026 19:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLoQBNQZ3KIx; Mon, 30 Mar 2026 19:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E196E60DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774900307;
	bh=z36lPPKmxfHxNQXdcNQQAISxSzBEDNSuQBl3gIajuTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=daKRvsc2yoMgog06A47B+ZvdL/zghXNdMPArXFFx4RD62OQ8TaXs76MwO4aP8DG3N
	 mRDHKfFD3g64PMzkCu0JLpZvL6Cahx8YYsXJJsPEIaL0cEe7I4b5mem5jTcKDMVQB7
	 Lboi/8mR59nW3diOS/LU9+Q9jcbzErXiQF7wLQTuIJKT8Fovr7XcLKT4IeaMg+V+oD
	 o2W3q+Uft93LwUbAe3v2w8WfUZTqdnofj7fvfa2NqhNgd7guyZpu+d6/zRKPy6MevE
	 jEKg4DXRZiBafN33IAQx6JzhvXuX3bEZf2ECdpSWJYZeQLk8NgE2zIK+STIMSfP3v4
	 4uyoRR6y5C7Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E196E60DD5;
	Mon, 30 Mar 2026 19:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9BBA65
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C6F081B72
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mh9NpRwYxQhV for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 19:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE9981B71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE9981B71
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88BB07FDAB; Mon, 30 Mar 2026 19:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Mar 2026 21:48:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8dc265a9f0b641c1c5cd2e136234989f7145942
X-Git-Newrev: d421a5d278790f01033266fe45bdd26e10ee23b7
X-Patchwork-Hint: ignore
Message-Id: <20260330195143.88BB07FDAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: Always require
 host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d421a5d278790f01033266fe45bdd26e10ee23b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/ltp-testsuite/ltp-testsuite.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index e4e3ff8717..12db8f2d3b 100644
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
