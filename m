Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D55C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 18:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761C5404F6;
	Sat,  8 Aug 2026 18:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ_AJ-tLVt3b; Sat,  8 Aug 2026 18:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BEEF40505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786213691;
	bh=VmHx5krX7BZ+zWrvNaBveH0wTzq2eXsE/xNyieZM2yY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OKLMMOp+NE1pbdy6j6novh0a60CKjr0vZIn0hATNUndrRCdeA+fncPI5MxAN1lrGf
	 NRGlO3C23EEjPL8cAE99/F66Afj/Bc/3cKteES54yXymIvdhgAU4lzppogLCH5Yugm
	 Olm46BPwkqImbroysTmEjxqky5KozQl5ep7fnMs4bha7O9pmPyZ4+krBQSIxc+AtYP
	 PVPNNPrbYwr8nQgPxldhgcBrUuVeAv5MhxElrx+qGxNOVeZNwX0ELBYumZIYk90dK6
	 2t2v7wdlucqvdP1YlbxWmVdUuOYaqLTWx52K5l8OKPyIwGBbcJQBmS07UZKmjubQZf
	 z5Mibr58o4NTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BEEF40505;
	Sat,  8 Aug 2026 18:28:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1783C282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09DA940505
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6KVW-OGW6wT for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 18:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D259404F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D259404F6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A518CAA5; Sat,  8 Aug 2026 18:27:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 20:27:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf95721d0049e994068ab971f4bd62a465dfe041
X-Git-Newrev: 8af01adda19b0d410072d7494b52448e9296f03d
X-Patchwork-Hint: ignore
Message-Id: <20260808182722.00A518CAA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: security bump version
 to 1.6.43
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8af01adda19b0d410072d7494b52448e9296f03d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/memcached/memcached/wiki/ReleaseNotes1643
> More likely critical security fixes and less critical bugfixes.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
