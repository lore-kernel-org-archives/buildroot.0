Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F6CD8C85
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208D14106A;
	Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJ28KtWbEiE5; Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCFAF410E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663141;
	bh=7wazF2bb/1NDyj1qdBgQAV6fhwD+s0ojLYPNzzI4uuU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WRqPryMEfeO8ErZ6vo2WkJrS+hUCWPCymdgzp58pcYsTD9YwiiBBcyDslrdpdAbE6
	 sdoGq4SLWxfKDJ8E0xTDfjV64lX3G8MeCYw63l//fk0vWmkrGWa1gfcAImpE9Ig4S9
	 1u3M3No8oXIueAzgUoAGTsuOpX1a3U27/ixmpbPRou/L+EzXuaKrttmz0mYzLBHfq7
	 IHDbsb7GMUQ6ak8e8Cm68chB25dmvYVg8yxQz5FLBrlkToproB6iEXcGjUwR4UTFeF
	 ecl6wJTCl1QQ3xhd11kzjGkuHH46tdmwu49RJldFtpD9A+2Z53TzH0UZaNS/Jij8D1
	 cvddyNcgAPEHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCFAF410E7;
	Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FFCF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C60381EBD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVKuVt9y4LVE for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E99881EBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E99881EBE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 893ED87B3B; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:36:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 75e9410eb8e21c9bffeaa171455ac5b57e1572da
X-Git-Newrev: 5384ec6bf50b3d80a64f816a0952da05f1dd6f80
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.893ED87B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpthsem: update
 project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5384ec6bf50b3d80a64f816a0952da05f1dd6f80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The previous site went offline, the last entry dates back to April 2026:
https://web.archive.org/web/20260401000000*/http://www.auto.tuwien.ac.at/~mkoegler/pth/

Update _SITE to the bcusdk project which depends on libpthsem and stores
the original tarball. Update project URL to github mirror provided by the
linknx project which also depends on libpthsem.

Fixes download error:

ERROR: while checking hashes from package/libpthsem/libpthsem.hash
ERROR: pthsem_2.0.8.tar.gz has wrong sha256 hash:
ERROR: expected: 4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01
ERROR: got     : 01d9027268f27aab3ca5c6c649a7f7a444db5bc889e496d80c8704e4e120346e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fixes:
https://autobuild.buildroot.net/results/0d9/0d9e957540d15302ac55bc5a2207db0c45279b37/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec687c3b5cfc8bf9b2625f44710151c7b10bd746)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpthsem/Config.in    | 2 +-
 package/libpthsem/libpthsem.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index c2856c52fd..65dd8c0cc7 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBPTHSEM
 	  GNU pth is a user mode multi threading library. pthsem is an
 	  extend version, with support for semaphores added.
 
-	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+	  https://github.com/linknx/pthsem
 
 if BR2_PACKAGE_LIBPTHSEM
 
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index dfe25af319..0ddcb3ebf2 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -6,7 +6,7 @@
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
-LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
+LIBPTHSEM_SITE = https://sourceforge.net/projects/bcusdk/files/pthsem
 LIBPTHSEM_LICENSE = LGPL-2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
