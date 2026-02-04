Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBAE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B206132B;
	Wed,  4 Feb 2026 17:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izuGEJmUfh8g; Wed,  4 Feb 2026 17:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3B661334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224998;
	bh=bUmevVmBmGjHCF9EKEvMhUfmC2l9NkKbl/kL6rLQU6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QyS7PQ89WLVh4OCZ25wMdsa4Zc5IVNmmdAol97tupxcgJqKzvFdap5ocgGfDX8GMm
	 Rukk2AvM4Bqq02mS4th7zcOgeifBe8lxJ8yEcju5KdjGOO7avfK3x6xTJzcVow1V4+
	 KBntc7xvha4NKf5c75MPHEdUw9Novv4Gomicqyh2jxKVpOPJQDvjlzap73/MIY04od
	 BziIc/FIWmggkZzYfU64lQO5ZkhbMhhkOokvei5TgOLcwVt8T0OgvCpoUx8QbS/rTf
	 ckGJtQXMGLLBli3FPYXMYmA7lpYDOxPWI0dvwpQVA1o0hlwLgkkJH4wWgE3trlmeA0
	 z/LRuVGJIujdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3B661334;
	Wed,  4 Feb 2026 17:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50D5C173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66FF04055B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEfMssOCyN-h for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39EE4055E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39EE4055E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9897D86977; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:43:45 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 43e3b5ffb70d32bfd6c2e42dbbaa5be01afdb25c
X-Git-Newrev: aa08c742a805c8c62318a4d96f9cfcba46b2111f
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.9897D86977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tor: security
 bump version to 0.4.8.22
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa08c742a805c8c62318a4d96f9cfcba46b2111f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://forum.torproject.org/t/release-candidate-and-stable-release-0-4-8-22-and-0-4-9-4-rc/21160

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.8.22/ReleaseNotes
"o Major bugfixes (security):
   - Avoid an out-of-bounds read error that could occur with
     V1-formatted cells. Fixes bug 41180; bugfix on 0.4.8.1-alpha.
     This is tracked as TROVE-2025-016."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b16009c06d9a62bd0ad036918f0cec94ba367f25)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ea15ddefe6..eeafd49058 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
-sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
+sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 746eacd581..c0785ef2b1 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.21
+TOR_VERSION = 0.4.8.22
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
