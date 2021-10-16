Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B1DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E616108E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82E616108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 527014033D;
	Sat, 16 Oct 2021 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wbcm9mqxcBUN; Sat, 16 Oct 2021 21:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C439740325;
	Sat, 16 Oct 2021 21:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 729DC1BF962
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61DCC40325
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjjeNQhTc6IY for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:54:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9953A4031C
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634421242;
 bh=JLBg1Ah3+ldmCY6w4fj9+16qHjRhsBLjpfxTzoGrPfU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=glKzXxOW6rAem3FbkLh66NFxwt4MpyfOf9Xo5h05vbA+tJQpiG4Osn+4pOwBrkazj
 8PuWDCBYU/G/0f7KHheSQMrycI86AEskMGR5IsCdYT3X9s1O9Z6tr2EfKf6SL8CvbP
 d11gLIj4wzeY0w+wQaVRzwvgNReGSt9WnEUsSTSI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M7sHo-1mfjVT3ZAo-0054LC; Sat, 16 Oct 2021 23:54:01 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 23:53:59 +0200
Message-Id: <20211016215400.31415-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016215400.31415-1-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MG6Fe6uyU5SkbOFjXW6Rams6VHpM8SLrSl1jGCu6prxYyLpOn1s
 mDhmVX5ybCB9Cn6GqwncmNfg3Gox0mVCNb9LEygoj0+m5zXVlmaWL513LMbsHWciLhFkccC
 03UGdvvhsKA2ad6THaOmwKtplo12oRNnYLBkTOylN/6IOyaDEWccbgMjDP1mt5jQ23goebz
 JtBNRGyEGx1rxqKg3YYOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:crW1+nf/3HQ=:5Yz5yn8ZlExXEI0unh8TWN
 bjtAPuG0yE+KaBwcn32GcbokXDSZHDRYtuS4um2YdZlP0Fop95tPXVSQuB5F6oq1o6dPOMnOp
 bOKdWB32r1vS3rXWhflybVFAxvTB9APf4E+ClodOMWX2tT8+VfmAn5S/BpcmqJz8gkHcrYmi1
 rK4uIIP7QLKFqeI4XVdJMIAzHdtejfiIR/jqc7wRWBcZyL7nExb46UtZsxsgNotlh7qQXE6g7
 Dav+XbZtNe9Xf6jbUYhOfUSkG8ujnqj77PALsnVIZDcye/egCShGHS/NATd7KNaKtJr9vbqls
 EAaf6ZCZP/XSyeo/8koYpGx5ZMnzh622vEs8cr1+6T9fELzpbACEYOrVIR8r5UXtsav5T2OD8
 VVMEIUoiw5Hd5dNmrfi5Aem4KFYCiuGTIzMplDwdZtP83DtzO+zOPaH99uDyFvMotspBTqJXF
 ZEoutU4iI4CL8HksyXQqftcMbBMJVEW5QYQU9QEFzRG9hzJ6kYwBPg/cOU5z0NmcvlD1Lud84
 WpeIeJEOv4l6N73cwSxhLWAfLUg5YpOolm/Ct77m+p0M26OMJwaqM9k94K2UzKynARpZ+sL+E
 5zF2A+4qjtrTYKyB9utBQJ+yJaShWBCO3oS7c+D3HQTgV+S4PZQ7nl0y0Djix0gKiNsJCE0nu
 3yuC/4dp1UJlOJYYpdwqMum9CgFjC+Ex+rGKi7Cd33Ry3Ejogp1lnO0PzjZasUyjLhCVtoB89
 cusNFPVJFzkMvm+ZHcEVBn91iF5Ao4KX4G90Vc09z5a1fkMeLmudiN3JvlT/WWTF1+SKnRTFs
 wZS5gnL4y3zf3yYOohGeYDZBl9KeOLcSCN/bz70sEd0JmT8ZVZTrNBU2lnpJPAZ7dBe78o/BE
 LlC5SfY+QiU6DuivaHDaI/Vf0uTNPgdo0HkPni/ZP9NPHJ3azW53x9WsrLdI71puJj2paVeWd
 qtWodNHPn/Wr9OXQAfy6QhSgKqcvkHuWmE/Bvue8sx9bL8hKBxI8KzWIDyt2GpgJu7N94i65/
 bY4XO3qsa7sMjvGEnPNgaLxJIAfhsUx1waZT1Vzm1BNlmCLilYmiHc90biLC3M1ex8TgFSrFM
 ZWPPyxonWf/qBY=
Subject: [Buildroot] [PATCH v1 4/5] package/uhttpd: bump version to 15346de
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - 15346de client: Always close connection with request body in case of error

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/uhttpd/uhttpd.hash | 2 +-
 package/uhttpd/uhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 6f8b4a60f8..1e37b2b251 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a537a377c8dc1abda147a1e3feb3fe3e3633a9d30e4e37d378cc6309dace2f0  uhttpd-f53a63999784bcb7dc513e221f3f25dd3de2f35e-br1.tar.gz
+sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-br1.tar.gz
 sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index 355a266d6b..ba8e13ccb8 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = f53a63999784bcb7dc513e221f3f25dd3de2f35e
+UHTTPD_VERSION = 15346de8d3ba422002496526ee24c62a3601ab8c
 UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
