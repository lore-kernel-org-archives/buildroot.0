Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA66F9D0DB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FCC6F4AF;
	Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcm9XICSHamt; Tue, 14 Apr 2026 15:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A09776F48B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181786;
	bh=N2/SlsDZrJkwNBp1f2QiCAuJ0QNaecbKEnmcRbDTLX0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZd4W36F+m1cQn7qfAn0Gf2FdOETyXN6L0/W8slVe6TUb7eV6MdYZnD00Jh8BEzq0
	 QhO+y3UwFVoPjUqZIvVnXYv08p8ic6TjdH8GpVa3Sz6XnKvjhdKfw3vKKjJ+cV53Vy
	 cZ+Xocr9mJKiTrTSsEdwtTr5WEzgHV1c3KnHk5D0ZBxKw6uG0ECym8OpQQvYhk0bwq
	 VMrBOmQjt2grhmZXDL0hO/s5v0UBfj+aZO8xz8SDRGQDwYFDZX09Y3CZ/BLUlaoMkE
	 rTIFy39Id0l7md0jVhF+w9oEhic3Awasz6Epqdd1wNHegyLdfp27rjUJXuB9iDT7+z
	 CpdBsEiJdKgNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09776F48B;
	Tue, 14 Apr 2026 15:49:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E83A237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2F4B42AF3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96tZh2bqw9J3 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76E942B02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76E942B02
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE2381510; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 11:59:07 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d75c53a758f35f8c4ea9a4605146144cd762a3e1
X-Git-Newrev: 1f3dbbaabb101d8113cc29254ba49608657dc1d3
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.5AE2381510@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ltp-testsuite:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f3dbbaabb101d8113cc29254ba49608657dc1d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
