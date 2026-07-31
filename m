Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A59EC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004A041096;
	Fri, 31 Jul 2026 12:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k36PFlM66oX1; Fri, 31 Jul 2026 12:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E67A41097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500453;
	bh=vAlXjanOnFfQHP/m8zp0AeRqZzwN2lKcSMbd37dcDKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CylToq47op5rIKRlUjWL7cJbB8aFFm/mT4NtWw6ALDgrviteiXFmAPr0JKVfyqrXt
	 tcKzB6aAX2CYmP1NRgMSwlg3CLOrQHGUNuBKZU6oVpAWnrHXxSzTt1jt2A0lzNfnIr
	 3VW+ZVYyjDdUgS/dW9GWZoBfSutqBTRfbB+RUnPM4r1QyP6i8qFF6LYKHqXLv6o5WO
	 hcoLXhWBYXUfgFfFAxEkLRnbEOFD/tvZNv3o35u47TD0sI4q2NtvM/X8+dZRwHqt7s
	 OCLJa2WcFsxdL3uaOel7jE2jwt2zLHM9BRw+gLwydhDQz+BCa+sTYb4lEAECxGeTG4
	 jjzgI/CmXEu2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E67A41097;
	Fri, 31 Jul 2026 12:20:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB92381
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD51E4105D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TM0nWblzYoF for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B4241063
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0B4241063
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF67C8B742; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:14:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 01beb2c14d05ca78d6d47992535cf14fb5fb1202
X-Git-Newrev: b46e9ed92f54bdb193489e4fba7c05431ce6cf76
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.CF67C8B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libass: security
 bump version to 0.17.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b46e9ed92f54bdb193489e4fba7c05431ce6cf76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/libass/libass/releases/tag/0.17.5

Fixes CVE-2026-61626 & CVE-2026-61627.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f6ca8d4f5f27232f439bb3e68ace6f7baf20d5cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libass/libass.hash | 3 ++-
 package/libass/libass.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f4f718813..467c9b3816 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libass/libass/releases/tag/0.17.5
+sha256  2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc  libass-0.17.5.tar.xz
 # Locally computed
-sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index ff42c6d621..3675a75f93 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.4
+LIBASS_VERSION = 0.17.5
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
