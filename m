Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59BBEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BE2611C2;
	Sat, 24 Jun 2023 15:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69BE2611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWCghnlevLU2; Sat, 24 Jun 2023 15:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F85A611BC;
	Sat, 24 Jun 2023 15:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F85A611BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9329E1BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79B3C81F4A
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B3C81F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqmZjHX671cX for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:21:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D6881F47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4D6881F47
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:21:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E257A4C00C7
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 17:21:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55244)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qD54i-0000Hx-0K
 for buildroot@buildroot.org; Sat, 24 Jun 2023 17:21:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 17:21:19 +0200
Message-Id: <20230624152120.2879074-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687620080;
 bh=l0pQnPbI26K/f3uvUqkGwTzH3L3mdFSRPASv0DX/9mY=;
 h=From:To:Subject:Date:From;
 b=J2thsPICmXQud6g08wBi44CEONscs5lk/s4ZKxvWYgsVc/tX9EHe0YnOQAKcpmmAf
 NEy235T1Od0WSZXyTHFAZAaNqNKMbj3AOeUYQ6jm7h4vogLm5r9BVbyjtNsXtHuTi3
 9fhAO4WkppvuqADFLQGScfWiXSZUABz9DXdCE2uSFsIEt/OoBSHAhDj0vle0hveCAM
 lwJcoQsqf9pNtcpCOMvapRp9R8jMbk/SfQQc9oP0CIUPCKuiLu+jP9/ZQc+MzCG/+N
 LsrieBYqHTr3jbhPA4F58greedmiV/F4CnGQmIrHRC4l5vGduJ8TnebHP7N6zv/gSE
 yzG8g+fMn1ohw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=J2thsPIC
Subject: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.57
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

Changelog:
https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index c0f1731676..dd4722480c 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63  ell-0.56.tar.xz
+sha256  7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018  ell-0.57.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 994b0e19f0..08deb62abe 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.56
+ELL_VERSION = 0.57
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
