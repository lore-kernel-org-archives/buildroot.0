Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62694C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B45781131;
	Fri, 10 Jul 2026 13:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efnlB2evnLrk; Fri, 10 Jul 2026 13:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7306810F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691123;
	bh=XUBtEdaXdQYC1nPnz8tCAh2PjLWDoNq6nX/Eq2ynPO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aFRJkvwxZYoPIt1SFUhvrtScMTZXbAgSpkzp4wqnT7wAx2Um5d+AMHrojqlMpYbh5
	 jj98Tm9+z+BYGtK5EaJlaaYKc9VEZlNsf2x0nMQu2pO1O8nY6HYfSCCCrr6IZqHFZC
	 V7NexHjb75exRt7Bs8MgD971d2U7/NZO534hr844M63IBw/t2soonosrg6HTG2Gg2u
	 U2MIppUhqplhrYGf3qEY7uXi/ztMX43w81Zc1M5HVvUy5s4gqK1gjuWVfWtbnClHvO
	 C7FwkZ1bMdBOq/B/QmpDG5aqK5H79+1y9FUCbo7T+8YG9i9zi6C7DvzCKSpohLJ381
	 WwVKCWpwY5J1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7306810F9;
	Fri, 10 Jul 2026 13:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6C82FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 866D4606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEHrBp_3QHeo for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5924606A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5924606A8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9F7C8867A; Fri, 10 Jul 2026 13:44:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:56:11 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c7f0268cd1ea17eee4d9b72a68abb4cb069e4ded
X-Git-Newrev: b8deb2b794815871a09f6a56e32871f48c3f0a7c
X-Patchwork-Hint: ignore
Message-Id: <20260710134420.D9F7C8867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/clamav: security
 bump version to 1.5.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8deb2b794815871a09f6a56e32871f48c3f0a7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://blog.clamav.net/2026/07/clamav-153-and-145-security-patch.html

Fixes CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
CVE-2026-20217, CVE-2026-20243 & CVE-2026-20244.

"Upgraded the Rust tar dependency to resolve the RUSTSEC-2026-0067 and
 RUSTSEC-2026-0068 advisories, and upgraded the Rust openssl dependency
 to resolve CVE-2026-41676."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 31cd41c84b7d76800c85df4433dc280e713890e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index db50d77194..be5a2ec5c7 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
+sha256  89af57a45bbf13de4dc91ed7f20b435388c88428eb7dc30639a02b2f0fc2dad1  clamav-1.5.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7f8008ab5f..9467174e93 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.2
+CLAMAV_VERSION = 1.5.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
