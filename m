Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB461C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022E64098E;
	Sat,  4 Jul 2026 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHkbWOXAx6Wy; Sat,  4 Jul 2026 16:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA4440979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783182697;
	bh=MiQCRPVVpmaX8P8YPWT8KsNGqHKYFLf9UfQ3X4Pz+F8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VlzUeZPOfj09t/XtSCkaaMGO8zXW5zIZcQ7wAthZqkCDRUER809OH4xgoLDP9DCwP
	 7ADJtJIr7wzK/AAr8Xrbaos04vlJrn5atdXVc433VWgNaa9CL/8BGoP100f1EY8bqx
	 2Hm8Q7Gt8tIPtTP7HVtsyJYxzdtRprMM2FEMXFDxV15vNNrcibpOE4k10r8xfzLp11
	 6Ly0quNiKGz0NFFczyCLp6KWZVj3+I4D18WHkLEAI5NztQhRmuPX913oJ+AE3sg6W+
	 KPM7A5+PErPE1rkSUmTjwkwnOpqUKf3mM24P1cye/nxW8gkhyx75Q/sa1gaSWiZjlR
	 VkpaSa6WFKK7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA4440979;
	Sat,  4 Jul 2026 16:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D696363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F98480A61
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_E11atOUtrf for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB2D809BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EB2D809BB
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933B188400; Sat,  4 Jul 2026 16:31:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 18:26:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56940f0620025509d141da6dfca01a714a18392d
X-Git-Newrev: 31cd41c84b7d76800c85df4433dc280e713890e7
X-Patchwork-Hint: ignore
Message-Id: <20260704163105.933B188400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 1.5.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31cd41c84b7d76800c85df4433dc280e713890e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://blog.clamav.net/2026/07/clamav-153-and-145-security-patch.html

Fixes CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
CVE-2026-20217, CVE-2026-20243 & CVE-2026-20244.

"Upgraded the Rust tar dependency to resolve the RUSTSEC-2026-0067 and
 RUSTSEC-2026-0068 advisories, and upgraded the Rust openssl dependency
 to resolve CVE-2026-41676."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
