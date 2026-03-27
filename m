Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD3E10F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EAC7411FE;
	Fri, 27 Mar 2026 18:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Hu-n9zmsDS3; Fri, 27 Mar 2026 18:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516D8411FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774637854;
	bh=CdVnWv/QJekwRPO9vAjF2jCbbUuj77viezAp4GLQpUk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z61J47eKvVPNANoE2n5VvVRufbBKEQpwa5rq6hF0FNETs8soBslSXXZtPM7PRmPya
	 Jz7qcyeSUDyb/sHaIVVfp4p6Jro5RMaVwtMupQZcGSWG/OW2WdXMbqsDqIWLLHHfYJ
	 vwmjeP4xwQlWGVgU7SyRigXsx8ujOE37e/FczydYLzbt+L9BIos4isLe7PVazXNMQ2
	 Y7d2eRQVeZMQRDLn9kNpv5xbFdksE0K68MLsU0vb9Nd9IyGZIt4kGUi/HwHDsN9RWG
	 fiQ4bPY06GumoPb1IIifLT2SoegLaIOZaI+BG/x6jmWmo5e8HN0bt6g/cFhQlbF1L4
	 1dIHCsdyzvacg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 516D8411FF;
	Fri, 27 Mar 2026 18:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B3E2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73BC283E53
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuJwaZqoGMfJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B749883E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B749883E4F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 170C37FB6C; Fri, 27 Mar 2026 18:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:52:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef01d4fc78ffcca51380ba1d46ffe63d6d63d479
X-Git-Newrev: 22e4440eaed6330401ac4c87b2eee7e0f0d19ba9
X-Patchwork-Hint: ignore
Message-Id: <20260327185731.170C37FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: security bump to version
 1.6.56
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22e4440eaed6330401ac4c87b2eee7e0f0d19ba9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security vulnerabilities:

CVE-2026-33416 (high):
Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.

CVE-2026-33636 (high):
Out-of-bounds read/write in the palette expansion on ARM Neon.

For more details, see the advisories:
https://github.com/pnggroup/libpng/security/advisories/GHSA-m4pc-p4q3-4c7j
https://github.com/pnggroup/libpng/security/advisories/GHSA-wjr5-c57x-95m2

Release notes:
https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 7901f82c3a..ae28eee087 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
-sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
+sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
 # Locally computed:
-sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
+sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 01c1cbbec7..7c5bc35a77 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.55
+LIBPNG_VERSION = 1.6.56
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
