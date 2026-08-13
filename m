Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44830C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C241813EA;
	Fri, 14 Aug 2026 13:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxIbACR_QrrV; Fri, 14 Aug 2026 13:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DD881423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713719;
	bh=y4e0mG5JpcAv/auBOc13xJ67Ti2JTWT7fF+IGJJz6dk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DUKRff8X69hwm1MLodNhS5ctQKzzp8vcoPCL260yQ5Sutovl30ZKVDe+P39oMqCkE
	 7XAvhm/Mv1nsfUMn150yvuTTEk1cAY3I6biroDwtEqbjZX58GFS3cQenG+Djtki0mv
	 /DRGOEPhtlc0bCl0Nbkbw6UUYseGs/un/tN3AMuXwhCGPp0pAAZggosdqbEnRjg2Ov
	 aU4FHW31jzoICUXBRKb1QZ1LWUqicEO0JbETF874RMYew2ZspRTWsbxKLpng7iajCL
	 TXXTaklVKNz7LruKYj112Yxv8GpelRhuCBfTSCQsjsHzeqwjy0alvSsVLO79ObOFl6
	 MCkHHZOBqeYwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52DD881423;
	Fri, 14 Aug 2026 13:21:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C586E14B0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE85608B0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3q5Mohabj8ga for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C64D608DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C64D608DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90A8A8D665; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 33bb1b8c9eb51497913fcc35148d29f8cfdd4b6c
X-Git-Newrev: 00c1e5b98c2a24639eb7251c247e9f8941fc5dcf
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.90A8A8D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/memcached:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00c1e5b98c2a24639eb7251c247e9f8941fc5dcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
