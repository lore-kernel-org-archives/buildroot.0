Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79523C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B20F8177E;
	Fri, 21 Aug 2026 15:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4SBoP8KQBDg; Fri, 21 Aug 2026 15:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325098;
	bh=qxIJKRasyGsO8hMSvZU6XKVfA3534n+kce+JtrTPuE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M618jOqB0axHgNxlUWoUV2JU2KNPyvZE7d2425mbjiG8dFyLUX/QCQ4fWzvWu3aDj
	 LtZrAbw2SDvQ/tw8I3CFKAaeXdUhJDLI6ErRdtF8jX37ylVFBC5w1eAIgTbyXzEKVt
	 NEWy/9Ai683ZQkq1c6owLBl8SXIgadGOrfa8z8B/dOWP/je2Uyn+kueT3r6az1P2IB
	 wxxRUJoMba2uLi/GWbUDjOBOmaxNf5X5YCwlt5b6+ruA87NeVtoajSrLEszXJfqOxc
	 fG70g6g9zT4cPQG5FQjgsuo4vhfwC49CRK0KXbG0R5Yk2U1GaMtYGoXYytcA6LsKqD
	 rGiCCIbO3MQjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E668B81761;
	Fri, 21 Aug 2026 15:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED78029B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD2BC60884
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKsjLa0zPn_y for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 236C660A75
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9562A8DBE4; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:53:56 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 314bd8bcda22aa264fe9c30b3b6fc00640695d0f
X-Git-Newrev: 1817abc750da72bd3d24ecaf3edf187e7a80b704
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.9562A8DBE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/memcached:
 security bump version to 1.6.45
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1817abc750da72bd3d24ecaf3edf187e7a80b704
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/memcached/memcached/wiki/ReleaseNotes1644
> Hot on the heels of the last security release is...
> another security release

https://github.com/memcached/memcached/wiki/ReleaseNotes1645
> So this is a lot of crash and security bugs.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b00c3b58b9ae37e239cb782a5e411e6ea4be9178)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 93480d338c..6a3de856e9 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,5 +1,5 @@
-# From http://www.memcached.org/files/memcached-1.6.43.tar.gz.sha1
-sha1  37307d13528f355fb282bc8841ca033272e44ac9  memcached-1.6.43.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.45.tar.gz.sha1
+sha1  45038980ea7045a548b9b5b5125ef7116312a768  memcached-1.6.45.tar.gz
 # Locally computed
-sha256  8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435  memcached-1.6.43.tar.gz
+sha256  d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd  memcached-1.6.45.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index e297ca17ff..f86bd56006 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.43
+MEMCACHED_VERSION = 1.6.45
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
