Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0AED12671
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE62612CE;
	Tue,  2 Dec 2025 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m41LtjHq3CV3; Tue,  2 Dec 2025 22:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C1A61374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764713801;
	bh=BVR9Qj+EHDnATNbcRTnzeFSuBRvv9SBngH8Ko+EoaRw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mnYKh82xErIGScQlMOPwAnOUNw4wGPV2TPC0SRuHaifW6+oHh/YU6omxJlxTRKqhE
	 WEd8akPFkF9dAZ/v+3tf676dh5nciLtyNcBG1d17KBIIpE0f48MdgQRIXh5FYAm7a2
	 02c+64CATvp0EEFH8fCcn4l+rZ6aNiDo8rTmEh2YrC9NK50LOR5MIayjo5qkf6wJYE
	 BKkS1v9ezs5axtGu0UciEqLneXUJ/WujId6zC5roZ3Elg+/d4A+VLUfRyW9BvJVbqE
	 2yvAK/4Jw1gVDmlCqTAag9qFt8xGl4XcHYIEKXP+c37zfstXv32t/JFupNwAhOqyWS
	 n6Kabfch9AMOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C1A61374;
	Tue,  2 Dec 2025 22:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 777EBE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52B2983E91
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgJEOJcRVQNk for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 22:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE3382E5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE3382E5F
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AF2D86413; Tue,  2 Dec 2025 22:16:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Dec 2025 23:13:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf7b7470da07ef154836833c25de52795bd4e389
X-Git-Newrev: f42fc940e9df62fdd47f9adb8ccb374886e812ce
X-Patchwork-Hint: ignore
Message-Id: <20251202221639.9AF2D86413@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snappy: bump version
 to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f42fc940e9df62fdd47f9adb8ccb374886e812ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/google/snappy/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 0439ca8a7e..a86b36b349 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86  snappy-1.2.1.tar.gz
+sha256  90f74bc1fbf78a6c56b3c4a082a05103b3a56bb17bca1a27e052ea11723292dc  snappy-1.2.2.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 21c76cd50d..57c688b673 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.2.1
+SNAPPY_VERSION = 1.2.2
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
