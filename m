Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD0E92723
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78AA40678;
	Sat, 27 Dec 2025 23:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIDcr8nLTLhI; Sat, 27 Dec 2025 23:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B223F40689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878798;
	bh=U60jOm4kzS+cqVuDUvtXj/McB1/xPU7nMvv+9bmIczY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fI9/uPG2s6CN0GVB+8h1mnrGhgbdERCDw96Q83tw0Sj12Dqhyg10I9kM3f3rWOKZB
	 BqBF70eF7T5DzzdymO6pxfxRtBmH8572nYyE8zOzSGxX0qRVhOc34IGE/QEAvLsAeb
	 NdTKy0/zLc8z9kDccliNzcHvyvuANfoDVnhJCziRAa3G21OVV1IW7c90g0fHEGh+SR
	 FCYQlUR0mT7lzVRo4q8oqPs7aPPnRz/SHoNOQl6ER/AE7SoOCtYd7O3oZUtqfYF5p5
	 JTBer6lMBkS+Q+tkZtEKEOOI0xUdUMARA7DC4id18vRF/gsxGzvYQWpz/5m4V86ajy
	 mPOET6Q56Of4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B223F40689;
	Sat, 27 Dec 2025 23:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4253ED8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264E640345
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jDck8emDjjq for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6361440231
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6361440231
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52A0F8790D; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bfdadab434d3f9100b66a783ee317d118b5623c
X-Git-Newrev: c0ab8bb2eebd0ea9d066cccfa50006e71d7b0a8d
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.52A0F8790D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-lib: bump version to 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0ab8bb2eebd0ea9d066cccfa50006e71d7b0a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://git.yoctoproject.org/libmatchbox/log/?h=1.14

Updated license hash due to upstream commit:
https://git.yoctoproject.org/libmatchbox/commit/COPYING?h=1.14&id=bd46fea025212dac5e2a218a41f971d4cba92b76

Drop patch that is upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-Define-correct-prototype-for-hash_empty.patch | 34 ----------------------
 package/matchbox-lib/matchbox-lib.hash             |  4 +--
 package/matchbox-lib/matchbox-lib.mk               |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch b/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch
deleted file mode 100644
index ac65d03b12..0000000000
--- a/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 312c04b6ba60dca0d6c4a7d1393f0ec816a265e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Mar 2025 14:16:03 -0700
-Subject: [PATCH] Define correct prototype for hash_empty()
-
-GCC-15 follows C23 standard which does not allow function
-declarations without parameters and types
-
-Fixes
-
-../../git/libmb/hash.c:76:6: error: conflicting types for 'hash_empty'; have 'void(struct hash *)'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream: https://git.yoctoproject.org/libmatchbox/commit/?id=312c04b6ba60dca0d6c4a7d1393f0ec816a265e3
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libmb/hash.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libmb/hash.h b/libmb/hash.h
-index 86f18bf..43827b2 100644
---- a/libmb/hash.h
-+++ b/libmb/hash.h
-@@ -38,5 +38,5 @@ struct hash* hash_new(int size);
- unsigned int hashfunc(struct hash *h, char *s);
- struct nlist *hash_lookup(struct hash *h, char *s);
- struct nlist *hash_add(struct hash *h, char *key, char *val);
--void hash_empty();
-+void hash_empty(struct hash *h);
- void hash_destroy(struct hash *h);
--- 
-2.52.0
-
diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index ecd02f7174..7c2d972440 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  648d7e1af82e69b79c0932ff9f85e6781584eada5da8662f70196916dd208f55  libmatchbox-1.12.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  2d0c3e827acb8f95e801168d6f7fa03497e06ff60cbfe0b8ae7c5e740295c6ac  libmatchbox-1.14.tar.gz
+sha256  8e470c16b6bc23f275c22fec5ed56ca8dceca9d34c87d76d5a0c1295553f15d1  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index b6e4584052..097678c028 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATCHBOX_LIB_VERSION = 1.12
+MATCHBOX_LIB_VERSION = 1.14
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.gz
 MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
