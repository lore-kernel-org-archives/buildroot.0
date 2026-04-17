Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF50DF436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD3060E27;
	Fri, 17 Apr 2026 15:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDiPCCTQbl_7; Fri, 17 Apr 2026 15:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40D460E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439386;
	bh=9XH4WbLkxDr3TN4QO2/NcreP5j6oBzWWoIED5ZIzTLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jnrC7+H5WUU+MHGM6lQL9bfnL6iDiGml874tvqGKQBFSkeHn7MVrLfObUsWlCP/sH
	 WKHFFQ/tY8a4WQqHR7AzwbFcuD7l+78+1MCmTi3Rx3a867RO6AKnzTYw8z3rx/aynE
	 VGbap+D6PYg7+lgViAmS0PgTardpp8wpSwTohWU0A8Lv1zbUSoi1Q8qsD2NCVge+ol
	 nZgZmwbKT/1bWDSgzuRsPYgsIdBt7CnfNgFoXDaIUMhzm0YL1q58D9nYIYm+RElfd/
	 rstWJmx79qlJ5E0vvRqiQo505q6kJhfF9kxstuQd/meKBY91VGmmcgB+xkyRgoTGKJ
	 SPXProZ6IwKGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40D460E42;
	Fri, 17 Apr 2026 15:23:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C66396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2701440DF3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlTC-JKYO6Ne for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60AB040DF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60AB040DF5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D1381DDA; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 60748b81afe881b3eed0a7183e4c28b60bb68ff8
X-Git-Newrev: 6b8cb03a4ab86d2a3efef9421716f8c4328862b6
X-Patchwork-Hint: ignore
Message-Id: <20260417152247.10D1381DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libgpiod2:
 security bump to 2.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b8cb03a4ab86d2a3efef9421716f8c4328862b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Bug fixes:
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool

See: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.4

Note: this commit is marked as "security" update because it contains
security related bugfixes, but no CVE or advisory are published at
the time of this commit.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add note in the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6ac53518a0ceb0611ee08adef500fc8d2994d21a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 157e605ed5..a12752261a 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
+sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 8803a282fe..d83fdbd94a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.3
+LIBGPIOD2_VERSION = 2.2.4
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
