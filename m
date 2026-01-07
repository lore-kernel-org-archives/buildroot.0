Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB27D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CC160DC1;
	Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRTZlAcpQxAF; Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96DBD60DC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870027;
	bh=9KTWqgPOw7V6Dy6yjI8oiQVHKvhx1bmkfwktKQMeQRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=obpxrNGe3VACP4Kx9ujB4W/uAOshNY8VZWdbMdLiOan3razxNr3lb9VO5BkZyvWKZ
	 sHVj7drjw+ZdIMgK6oRg3X0BvC3D8o2MuwNrITNTfcPc5lATqhPKORCZnkB1cLFq7T
	 dA/JNytbb6WMun/VGkKihYAZlFlxpme23XcSt5Hg+qdAAhQCYleTTDU+d2BEBLSxGJ
	 9KTGFAAtIqg3yPglJH2fxPpfVx9sTEwVASEoEOPr6H/WYobn74SONQRDZP2gx9C1la
	 VuKxekTbyCEZHu/4Shd1FuBxDAPG9VU9G/QXnvhxY4N/wDiVH+6XGbsFUXWFv1jEwi
	 CBxpqvrX6ameQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96DBD60DC2;
	Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D8DBFCA
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D5560A98
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZWTJfJj4JEC for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A760D607F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A760D607F8
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90C7F88442; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:28:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20843cab40aae6ac4118756aafc66270435c653c
X-Git-Newrev: 93d3d86c641372d3ef57928497c5587292cab36b
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.90C7F88442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-devel-size: bump to version
 0.85
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

commit: https://git.buildroot.net/buildroot/commit/?id=93d3d86c641372d3ef57928497c5587292cab36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-devel-size/perl-devel-size.hash | 4 ++--
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index 6a5d88af4d..8bf9d5d4d1 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  4978c07f54a730b16a705e074d7685e3  Devel-Size-0.84.tar.gz
-sha256  db2e4d65f688dbf59273b5e82101ac3f1a66f665afb0594dce168b8650a4d0e4  Devel-Size-0.84.tar.gz
+md5  1a7023c3c595a50443f9201a3081a0eb  Devel-Size-0.85.tar.gz
+sha256  292f98b13edd1aa4a544e3a5cf1d9f2d7019f75c7364d2e8fa8a35ea5451e73e  Devel-Size-0.85.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 85ee2483d9..7bab097c04 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.84
+PERL_DEVEL_SIZE_VERSION = 0.85
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
