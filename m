Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518CDCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2217D84166;
	Fri, 29 May 2026 08:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldW5j54KZSP8; Fri, 29 May 2026 08:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CA8684148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043304;
	bh=iw8o4e934rHjndXq4fWOVYtCURUMclGsT3Hyscmqaao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hca8DgW4fJmAVSvwP+wmhd2ACv4OwL89zbsTVtIIbXFgcnJTUKqcRgF9Pg3rnsiU1
	 /q/OYlIFZA/Kz9alYUpzs2+GT3w9Nfn8SLkdaPlbJIyuqHG+qYPrmzJRoy3/4lW7YI
	 dTDVXDKnLZdZb6rilnZtI3Onrvs0aGDyWDxUi9CdAW7ev+BlZCYV5KNrpNAkmizZ3B
	 T2B1aZBt03UXlJwIT3SYovmVQxv72hNSBqe+0pRpXnpCSdoSt1kX2UzyhMF7hpogFf
	 tStqbiuOeWesyiU/dCRDsSpa/9sk/IwQee7adRP8jzg93jFgEIFm8u2fxaHVxJpRAv
	 j+tPJzLCoYb3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA8684148;
	Fri, 29 May 2026 08:28:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07088288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75ACE6137D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e92w5AbKFskN for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4EE61444
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D4EE61444
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF0D68732F; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:32 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 18dd343da4383ccf8cc9c8e31669a60855c0665e
X-Git-Newrev: 83b09ce2a34b497ad81d1dbca1dc3355f89b4162
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.CF0D68732F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/gnupg2: bump to
 version 2.5.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83b09ce2a34b497ad81d1dbca1dc3355f89b4162
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

For release notes, see:
https://dev.gnupg.org/T7999

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2078ff1c32d13d8177dce96d4f3be4e116ff82a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 07eb84a8ee..d607e9bb86 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
-sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
+sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
+sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index dd2fd0b0f0..1f7ff43e07 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.17
+GNUPG2_VERSION = 2.5.18
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
