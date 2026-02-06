Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D1AEE20BA
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B127843DA;
	Fri,  6 Feb 2026 17:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTS66EMClo0i; Fri,  6 Feb 2026 17:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86850843DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770398540;
	bh=Q3+AtFABrcUMWose1gYB0+i0TWB7FCqCwvYovD8mZVM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YU7bXJZREXjfdmVQJ1aLtyeR9BV6OMlkBNYhU0zVryP+9cWDpqMywEvinTzQTkDoQ
	 jVA8acIsRMDxzsSzX0/KQD2iZPcz1xKX9keovshTfjlS4w3oUpfCvplHL2hthQb92X
	 2eQNl+KhNjuSQ1eVNQpGqdsY1HYetDOewY6eJ0RHOjuCKmzNXqnR9h4uvqY5nMiWSR
	 S2GiEo4Le4olPN0m92Q0aoVxO3agHM5YirJMptogrnx9hiUM/qLDW81gmeG2iVIBJd
	 1wY3Ivy+ZTvKNaM6Yu+Qh74mT2zhOjMv4TgaYEvGdy6K+sNLzr58pCXTbnyapo+wyO
	 3DsXcCpmdmueA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86850843DC;
	Fri,  6 Feb 2026 17:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C1A9378
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE39843EC
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JK6ic6ICAB4N for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E214843E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E214843E2
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B3CD86A82; Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 18:16:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94a817a58909e1cfe0c1f63b63754079f1866523
X-Git-Newrev: 63f2d211381344127b03f39eff535de5b3042a7f
X-Patchwork-Hint: ignore
Message-Id: <20260206172217.2B3CD86A82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: bump version to 1.6.40
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63f2d211381344127b03f39eff535de5b3042a7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes are available here:
https://github.com/memcached/memcached/wiki/ReleaseNotes

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 781897b6b7..fc6ad5eb88 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.29.tar.gz.sha1
-sha1  a9699aed111d86b6e37b3ce5e6ef4e7539582d5f  memcached-1.6.29.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
+sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
 
 # Locally computed
-sha256  269643d518b7ba2033c7a1f66fdfc560d72725a2822194d90c8235408c443a49  memcached-1.6.29.tar.gz
+sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a01d5aa9d6..d3ec9d36d7 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.29
+MEMCACHED_VERSION = 1.6.40
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
