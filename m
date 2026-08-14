Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A69C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942D3812F5;
	Fri, 14 Aug 2026 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Or5asdPyh6l; Fri, 14 Aug 2026 13:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E5B812F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713608;
	bh=VMV38g8abUOj65J4tlmJSETxbGd4PxgfRvlT1kJW21g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sU+ShXDnIgRbvFHP6k+Qn02x9yt3fjnRbmTWSnGiT5JZBlzFmWq3v1yV+UoaNXySU
	 +ug2vnVtwr7qsqrKEIjN2iAa8jgTSXqfS5nsQZWM2Cb5oPxVZmyU+78eoM22hoCkc8
	 K2UYMMcVeruj53Ru+PnQ+O3pXxm/MnxZhNVhnoT1EJ+Q5UJ0ytqOB47MEo1BpzGLYJ
	 SO5W3JFttQ27tzlrGEzapjuMIbi6DeFPpQb8kMY1CnTD1viK4YlcstWxMpe81xAndc
	 m0cXX7SdTYVeJ0l5tu3jLyqy2mbKPcusWRp+CiWHc2H2Kb0QJ7dbvke0xytKnZNZD+
	 YDAls03xl2gNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E5B812F6;
	Fri, 14 Aug 2026 13:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AFAC139C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F5866068A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_hAw08ilR3n for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E5406080C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5406080C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D118D66B; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2ee35358da30557607a002f9c7afc2534028e427
X-Git-Newrev: 00416fa1dd374bd95d9c76705cb42892a970c1fb
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.42D118D66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/memcached:
 security bump version to 1.6.43
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00416fa1dd374bd95d9c76705cb42892a970c1fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/memcached/memcached/wiki/ReleaseNotes1643
> More likely critical security fixes and less critical bugfixes.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8af01adda19b0d410072d7494b52448e9296f03d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/memcached/memcached.hash | 7 +++----
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index f241723111..93480d338c 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,5 @@
-# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
-sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
-
+# From http://www.memcached.org/files/memcached-1.6.43.tar.gz.sha1
+sha1  37307d13528f355fb282bc8841ca033272e44ac9  memcached-1.6.43.tar.gz
 # Locally computed
-sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
+sha256  8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435  memcached-1.6.43.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a164e82a51..e297ca17ff 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.42
+MEMCACHED_VERSION = 1.6.43
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
