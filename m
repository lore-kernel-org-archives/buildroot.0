Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8935EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 08:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3136160B31;
	Sat, 24 Jun 2023 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3136160B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqwaIHYi5F_D; Sat, 24 Jun 2023 08:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600CE60AE7;
	Sat, 24 Jun 2023 08:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 600CE60AE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FBF31BF401
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AFF82136
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59AFF82136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKYcBwBs8-Lm for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 08:13:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED52E8212C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED52E8212C
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 08:13:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9750EA4C04E3
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 10:13:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48892)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCyOK-0001wF-0n
 for buildroot@buildroot.org; Sat, 24 Jun 2023 10:13:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 10:13:08 +0200
Message-Id: <20230624081308.1883140-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687594388;
 bh=zX1P2YKjwHHBjt1+8DGBoqKueYksxLOdzxGNExSfU8k=;
 h=From:To:Subject:Date:From;
 b=RPUeTIVjOMVaBBNO40v2KLyKsyZnUIvg/9UVVoe4Ld6A+MA3Mhtpko2q1MW3Dkqqp
 wo2b5dvWRLF9x0imIVCUNwo8H6+DOg3jOr+aFnjuDWHl7uSJyGKQm3FPemAJ25GANl
 +HdHx3e8GomZ1O3PLYjnWltGHI4a9ui7enWpoxsTojys6LsxsLeerCx2Rbn844KmmX
 HUrgh7jcekrejfoFDeWNMLIUWBfQyDG1MIoDo2JuGao7Z9LcH7L9PfcQJjbd29ng1f
 aYskE49z+XSp4XAp7nmSkvVZVodFSVIC/t5uyOVX5gL5lcRDIWxdpiHOPVC3lc8XjU
 x8Gw7AGXPPuog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RPUeTIVj
Subject: [Buildroot] [PATCH 1/1] package/fftw: bump version to 3.3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: http://fftw.org/release-notes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fftw/fftw.hash | 6 +++---
 package/fftw/fftw.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index b07aad8f18..9e7364d76c 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,5 +1,5 @@
-# From http://www.fftw.org/fftw-3.3.8.tar.gz.md5sum
-md5  8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
+# From http://fftw.org/fftw-3.3.10.tar.gz.md5sum
+md5  8ccbf6a5ea78a16dbc3e1306e234cc5c  fftw-3.3.10.tar.gz
 # Locally computed
-sha256  6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303  fftw-3.3.7.tar.gz
+sha256  56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467  fftw-3.3.10.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 279244a5dc..1bb537aeb8 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.8
+FFTW_VERSION = 3.3.10
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
