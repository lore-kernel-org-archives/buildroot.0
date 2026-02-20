Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7FCC54F9B
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF314181D;
	Fri, 20 Feb 2026 06:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjtHgXx7WOJO; Fri, 20 Feb 2026 06:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C042641788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771570527;
	bh=IH3R/yoORIf5eSz8DNJMdlDxXonOvG/U5GEtz3XiC9s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jigAZBvFiHXbHTlH6ZfidqVQZmmG2C4o76kaimf+2IWVgnxHLmAIEfERkj6uLQQNB
	 Y+PJrDf60BQ0XhCcsHA8ycGqpYdaADqIouhpKBsE+qSpWQZrmwoH0ouwkLQ55qgnkH
	 iFxd1AuwlcEAffwopGCsl7D1JIDiyxbYnx5DI7bDTfp6mZ2peo0kptmtpZsQHRJP9E
	 cKTKvN3LJeLemJNzam0xVd82vPUXBSA3e70Li5URq+SiT9RLjD3RKNED4sACgio93O
	 xmFs12xw8JQMj6xtfuBNH0jefX8hI861a4QBlhiw+8nFbQUHEnNwJRb+lQvOa61DW+
	 i2EvKLzKjhD/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C042641788;
	Fri, 20 Feb 2026 06:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F121183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444FB4008E
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCdbts6h99Cr for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A220B40052
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A220B40052
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D4188712C; Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 07:52:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a08bca31bbdcc10d2ee55c6573240868d2d6a37
X-Git-Newrev: 91a0ef51833094ed932535f6e4760b85914f5a06
X-Patchwork-Hint: ignore
Message-Id: <20260220065525.9D4188712C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to 258.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/91a0ef51833094ed932535f6e4760b85914f5a06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes: https://github.com/systemd/systemd/compare/v258.3...v258.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 193c6b5eb0..d5a97ffcbd 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  a800facc2effb509bff67700ce1224da96a36fb658e29e03c843fb74fa1edbdc  systemd-258.3.tar.gz
+sha256  5c95e54e555b21594ab11e76f91a092c6383553ed725292eb0a929bf2fe028ae  systemd-258.4.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7ed777b6e4..4b488857fd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.3
+SYSTEMD_VERSION = 258.4
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
