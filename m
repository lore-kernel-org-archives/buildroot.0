Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ECEE95A7A
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB9E460B39;
	Tue, 30 Dec 2025 10:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9pJf46HyWI2; Tue, 30 Dec 2025 10:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B3E60B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092260;
	bh=9aUMSXcxNnVpseasr+7BPfe35qU6KDhecvEFdRRDosY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oR2Ss5dDKEVd5c5WsHDNsj2t/wV3O4M5zmeyI2fYYNsY6orYYOL5Z9s1kbVcGt6PK
	 bgIwuoRPXNWwoLkH3vGwYiPjl5jkfdSVEXNV5cn+kibU4RHLbmRX6QMwD5TB/jjzXb
	 F9tygBKqpKgm7+IAGRm+unmVwkdbkjDAWeGotU4pZfoHmAHMJmEsx6TfZWAW9LhrTy
	 4R8LhtaiMLFhXeMd6FwFoA+lxAS890dppIfzOzGJWc9DfkpgAV3DwHB6npF8bTreXl
	 G8OqGAADB6Q6tQryIYFmS7iQ0cEDgwrJmYlLMUBmNzxXkjWvjS3hZML+Utdn4+uoMp
	 lsP+1V6UHYtGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B3E60B15;
	Tue, 30 Dec 2025 10:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76B0A35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D4F608C1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJ1RSpHvhtp3 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACF660802
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AACF660802
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A878C87BD1; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5043af53edea237dab1d5334b263cc9245d44404
X-Git-Newrev: 4aacd22a856d31517dec88f9677693af9e60e030
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.A878C87BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aacd22a856d31517dec88f9677693af9e60e030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The entry was added in commit [1]. But since then the NVD database
updated the version end specifier.

This IGNORE_CVES entry is then no longer needed.

[1] 51b1e1daf5 package/libssh: ignore CVE-2025-5318

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 2be9013454..3c7e77a206 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,10 +17,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# NVD database is missing an upper version specifier.
-# This vulnerability only affects libssh<0.11.2
-LIBSSH_IGNORE_CVES = CVE-2025-5318
-
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
