Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2039CCD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 08:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F51840BFF;
	Thu, 14 May 2026 08:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G53GiyLncDHX; Thu, 14 May 2026 08:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C666940B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778747972;
	bh=WoVbiqIdZ2Rc+gi32skvFz3DWILJt6IiyCnLcdMEOws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ovqFLHnOZqSxo6EoeDrMkOp9RR3Cee9v1Fp1+VlEcIMLB0lYMHTQ8B6dquJ1INqd+
	 rAZg9K8r05Ejla1WGUZzfGxi0ofIorsYiM/RjucZNVdR1bcrtluK897jYLLDO1zxr5
	 diMmmo0VJX06u80lxm7iM7w4p+o2eRnSYFldpfZ9fyF7QVy/WzXL45BcztWuzBeUe8
	 a4rMymdwLrr6xa2M06NdiklQQ/ZrYTXcrDiTBMRgdtUGRiqWSo8ah8hcSTUyU8/TTf
	 6fW5MJKiYx3DPlzla5iBK7QLW2nQlH8kDmvvAR5QVoZU6yj95Sti5+MAS4J7WtvUnC
	 DiZaST1VA678Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C666940B5E;
	Thu, 14 May 2026 08:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C26F36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799A940B5E
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD52NqhgL5hD for <buildroot@buildroot.org>;
 Thu, 14 May 2026 08:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A5B40B33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A5B40B33
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87835861D6; Thu, 14 May 2026 08:39:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 10:28:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dfde73b678dfab6e147a7420442cc42ba48014d
X-Git-Newrev: eb496bd63ef4a4466f9482fa4b3226e20cfb7f7b
X-Patchwork-Hint: ignore
Message-Id: <20260514083925.87835861D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sed: security bump version to 4.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb496bd63ef4a4466f9482fa4b3226e20cfb7f7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnu.org/archive/html/sed-devel/2026-04/msg00027.html
"'sed --follow-symlinks -i' no longer has a TOCTOU race [...]"

Fixes CVE-2026-5958: https://cert.pl/en/posts/2026/04/CVE-2026-5958/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sed/sed.hash | 4 ++--
 package/sed/sed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 10e2c36d8f..1f1a578813 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.10.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
+sha256  b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7  sed-4.10.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 8165083658..cf6d263b06 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.9
+SED_VERSION = 4.10
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
