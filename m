Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E549BE9D812
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 20:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5702580801;
	Sun,  5 Apr 2026 20:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOHG6Ewtsxi7; Sun,  5 Apr 2026 20:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF4680711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775420389;
	bh=B9CK+2FBFrZL3rGjbcX6ZVbPlclx5e8Xhv9DLaG/m3Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sae1zODPXCKsr4gvWaGyz+Mo4QmweISf/65SXqDCFM6FN9jOBNviQ7acTbC2wpimK
	 0mGjK83df3EHYQHimhMaQv7wilo6e/HxrMxXJ3eKmREMbdMq+1OWsTJ44d0oakWLEz
	 V9ySUlEumnSmMyQnKNoaRNl0QWGdnUR692Rr6vu5JbQ2K/qnf8P0GJ53Cc+xxkyjtK
	 H4IL8/5k0VxLB+dpzNAGdumFLrIliE6LTlbGDQ6jjas+Z2H7Si2oxTEEuln56OaO90
	 polqLtWFeLWZROsEUgWYtJDD0ZRTLZGV5dlfEVb1BIiJxlTMgB/2YFhSicuIl93mnJ
	 03FJce4e9C0Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF4680711;
	Sun,  5 Apr 2026 20:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD65B1EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C95B7606B6
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNYZp9YXSxDG for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81FA60692
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B81FA60692
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF30880418; Sun,  5 Apr 2026 20:19:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Apr 2026 22:08:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfc1cde65b6574ffb6ed343ec525775bc577c354
X-Git-Newrev: aad52c6f2da2fbc1658d6a1c69534c427380174d
X-Patchwork-Hint: ignore
Message-Id: <20260405201945.CF30880418@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aad52c6f2da2fbc1658d6a1c69534c427380174d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.1.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 626ed7b7d4..1a366edd68 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.0.0
-sha256  d4aa312728136e3dc7c3cda47b871614ce0d12bbb19f9dcac2ea70de836dc307  harfbuzz-14.0.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.1.0
+sha256  ee0eb3a1da2c5a28147f12dff55f6c7d60aeeeb29ac7ef334eabe84c8476c105  harfbuzz-14.1.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index aef8681a13..eae671758a 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.0.0
+HARFBUZZ_VERSION = 14.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
