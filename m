Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AA9E92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265AB607A3;
	Sat, 27 Dec 2025 15:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfMWtoLq7vxt; Sat, 27 Dec 2025 15:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C7AF606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850812;
	bh=hLTdWrp8NnOPVzjQkXL6vxpiZOPx9TOdA0txzHhomi0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fXEHdmNM52uNRZQq51glfo102rgHIczJrD8D6NofIg9CVM5SRooLaCog+9MFEYLAi
	 sKfo6YgrOd7ZdvVQPmLwpXqq1N8m/ZiOaLIt4A40uwr7Xv5F2QynCvLtyBJqQW4nrU
	 nIy8YvuJ/RQBW2NQacCQVfPbnfSC2AWWDxlhQaxSYVnRh3Z2dPvchmcUkCIShGEtuf
	 sZRiNCesvwt03Ec7sDY05lh/tTQcbhi73ddGrCEF3bWY2eT0ZXxYHjkeSOD3iLVZQx
	 BoPg442zWEwY9S0fXiR2CcYy0DKgi1ptb8m5KLTBhToUp3CvDZFRaUprW+w8TCWoF/
	 0eo12FqjnPLVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C7AF606CC;
	Sat, 27 Dec 2025 15:53:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1D0119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1EF04043B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvPNpQxJzMIN for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414F74043A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 414F74043A
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B62D87795; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:53:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2774502344f35b587ea8f1a2f43ec2398c3ebdad
X-Git-Newrev: 9c9ec285796dd5bd7db39f11b74392534b028355
X-Patchwork-Hint: ignore
Message-Id: <20251227155330.3B62D87795@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libupnpp: bump version to 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c9ec285796dd5bd7db39f11b74392534b028355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
0.26.4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 5bc282f270..79b4770ed2 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.21.0.tar.gz.sha256
-sha256  e43dbe5020ed25152aaec71b325dd80498e72038da5aeb50ed7dd51e213cd903  libupnpp-0.21.0.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-1.0.3.tar.gz.sha256
+sha256  d3b201619a84837279dc46eeb7ccaaa7960d4372db11b43cf2b143b5d9bd322e  libupnpp-1.0.3.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index fc76a43a11..a1be3e9738 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.21.0
-LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBUPNPP_VERSION = 1.0.3
+LIBUPNPP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl libnpupnp
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
