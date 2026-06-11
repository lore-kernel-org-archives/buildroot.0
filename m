Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31ECCD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C03A8236E;
	Thu, 11 Jun 2026 21:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs_h3FXDtvZa; Thu, 11 Jun 2026 21:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DA08236F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781212926;
	bh=PDTnmd3vCqRivYk/1iZSanskLMxxthD3pWSMFlgp94g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WPFpFrcHQRMPDYN3jCH/jM+NF4og7+hA2kqbpUPGC9AKx7eTQqHD6beG/Yp+0Z991
	 EoMOZ6CvM2vxafWy1WMTL1rkrj4poXnNDZEY6PemNbn+ruQgw5TqVaI8W/9hXzotz7
	 tT/B+XbQ5ndt9HPwFw06XNbfu5IPKuuzGI1i0X+/fgaa2oe+L9RBOWAoT1UeN9/DTN
	 mo42Y+30+EgzlK4KfI8lxBlnndYCVUK902SSjBiY+Zi/RfeobfR9rd+rvvpjSNrwKL
	 o/7i0/LsOVZWlLh9+v0e+2I54Dw2hcEePEOsAeS+7gZMTkJhESfnToWiSmim78sNi5
	 rOIaXtkxgQkIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DA08236F;
	Thu, 11 Jun 2026 21:22:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F78237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A8160D7F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pPzaVnhnsdf for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 21:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5562C60D7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5562C60D7E
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 21:22:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BEAD88049; Thu, 11 Jun 2026 21:21:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 23:09:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96105fef9e8d26ef0bf44627738c46aca3763e5a
X-Git-Newrev: 1bc9c830144a71c18f63422f98bc99675c34c62b
X-Patchwork-Hint: ignore
Message-Id: <20260611212145.6BEAD88049@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.57.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1bc9c830144a71c18f63422f98bc99675c34c62b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.57.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index b311fb3404..629ce4bc66 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ba989fcdc8a939e64c880208f6b491f6202f48b5d003a69f033469af91c37af1  broot-1.56.4-cargo5.tar.gz
+sha256  95f264433a7a6dee9ecbf95e62c7d62adc012149592314ebe4fb75d60fcef992  broot-1.57.0-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 4f21205bf3..50ab686e82 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.4
+BROOT_VERSION = 1.57.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
