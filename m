Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731DCFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF0361251;
	Sun,  3 May 2026 15:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSRitymW4qdG; Sun,  3 May 2026 15:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3297A61256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777822379;
	bh=vlGx0HTtSfqVZNGKP0WqPBfrMkJJf06TCQCaTakiGX0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G4FfEyGVvA4jCxlaAt9j7zOlUwBgxuahA/7a5xIHABs8x25Ox4ci4eAN7sukzHLYs
	 QvvvuwMXsAsKIHUpZjhNWbx5Xf45yyXXVlOuLpRWrefWNLChwAbe0Igc9Qf/aV3Yvk
	 t3ZHQWJSrLUNQjog8rsTz7zWLepFdJgkmv6MbMv+6+NwWziMcBMb37FH4BSaDh59UH
	 8i3ZyMVD4VBilZCqYl6bFkJb18ERdudE0PwH6BDahan8ShGhhYXwCFA+tEyepQwwa8
	 3F/InGhmu5uY5x0WzGWdR6tDCdjSe79LOcXFEIWzRDFYpD/AcwFQU6ViJHf1rf9AaN
	 m85DERx/mcdWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3297A61256;
	Sun,  3 May 2026 15:32:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EC9190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB8140474
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBNUyqzytcz1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 15:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316E94046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 316E94046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC4C084015; Sun,  3 May 2026 15:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 17:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2853852647730be1b2777bf778206f72c93b928
X-Git-Newrev: 5b136c89ffed35c30dff1802924a4dcf9bdab798
X-Patchwork-Hint: ignore
Message-Id: <20260503153256.DC4C084015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: security bump to version
 2026.90
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b136c89ffed35c30dff1802924a4dcf9bdab798
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
https://matt.ucc.asn.au/dropbear/CHANGES

Fixes CVE-2019-6111 & CVE-2026-35385.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index b3f532b1b7..81296375a1 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
+sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e4e42cf994..beb635e15e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2025.89
+DROPBEAR_VERSION = 2026.90
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
