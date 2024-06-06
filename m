Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB2C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63AA610E4;
	Thu,  6 Jun 2024 08:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Evd50Wta_3E; Thu,  6 Jun 2024 08:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06BC611E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E06BC611E2;
	Thu,  6 Jun 2024 08:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEBB81BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D45798435D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5jsmzaRgOPC for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21CC3830C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CC3830C2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CC3830C2
 for <buildroot@busybox.net>; Thu,  6 Jun 2024 08:38:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.127]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1sFgme1AKA-00FRco; Thu, 06
 Jun 2024 10:32:58 +0200
To: buildroot@busybox.net
Date: Thu,  6 Jun 2024 10:32:57 +0200
Message-ID: <20240606083257.11283-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:DV/Fntov2uL5m/Yox+MgrG50N2J0upzokJgrOKM5d9biwliQwi1
 2APaJ3zY380UPQhEzCnzXrdWbpBs4OrtgES+J9KZ9pJ9Ln/2X0vL4/DRsECFQJDBIJ9teD6
 iwIVGisAzA/5FKG57xu9CXY5Tq0LY+s5F4/OPLHjeLLnkRIhAZhOBhkHTzU/cYuqZvstpYu
 EBlnlzeytwDqvlDRbOaGg==
UI-OutboundReport: notjunk:1;M01:P0:74bvNSbjDHc=;VIWQ9fkrsprV5gwuUZoXcHDpc1e
 2YrqRP+KhYZut9LwnD3IWGqqOVK2UDxoW5x5nAXpc/cGkAZKR2K8pOdd+ExUCGcG6rMEppNz/
 adHsoJECd4IG3TuOtFE5ZjsH7To0/iEhmXcuAyDnRElDd+1QKRcyYLPdOGjNi/8wLIT+clH35
 wxP8oPgVF2KP5NPQvz6aONqGRIO1j93gtAVufVWna2aePnpi1VsLe+k9Iq3+Bu2HBZ/j27I32
 uvssQIVl897PlnVnqmP/c8qdbFYwwK8dLg3CD0d4wHtzw8JPpkXGMFgpxdowJ7g8OYrA6kB3v
 9zi2YlvOxcsdaDDppINImx42wrv4ryjjl/Lk9Sp9ezSOkvSpJ1/RWYrpL9v6cHnSo5m5CALes
 0nhoPAQkQjuHJrKYyQHJ6Dy3puhzS3AxmEhbTuwwEn6NR31rkxh3PR6mDx3AlCM1b93FqbSLD
 shdWnCyktWilQ4CkPvkpEhIfyHBBXjdbHO9A0IVo2dspO+eSXdRTJuItbCNu0L4m8vMi/pRl3
 +1pdnuBSjql2224vzKS0nmlfzZHsAN2NOjBouPxwdKOFljR5BVrAEnjs+UV7XdiGXLZX0o7h0
 VBS9qIG3OZ6X8LaYaNNh95Y0wjwGQPiLkG17xLCX8My6kBXIVvyHFtNGSoEgMmoTiweyQAI7Z
 Wl4N0IEh8NAKFtjzD9iI/PNoGI7yGjQeLQrdkhU5U5NN9VXx92QzDniv6k6Gm+ZZbiTgKRFPO
 W0Qjzou6n529wDixj+IylonETuY+1M7CK1mcZHVG0M82WfBpXvp53foO1z8fIQwTe5LewtqOu
 3bjXCRTawHhScKPdAmRX/PfBKAhjKb+IGRio2fF65KfKY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717663084; x=1718267884; i=ps.report@gmx.net;
 bh=6wWX8SDLf+0XOq7a6qCf1GXBDCfFVAXcKicLRcOYBDI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=J8TS1F5R/LDFneXKtN7aC5vjvuI83rfTZnsjo8R0bvD01JzsHZUnR9b57zGsuH+x
 pn963mnTEap/pI7MpcXtB73boCxPZyOfg0Xp+5EnpfkrtssdKO7W5o0k8g0/vjh/l
 8wpSVr3qIkFX6RaI2ibHDsKQOTO4zm6O2JZ4tFY2TvsYkntOYXWgzq+OStVj5r4ub
 EEHlng9uq7S92pKxILC4UpwEBOjaKR/LhSphZi1wU3U4xTRgqefWrPcG00gXLenSZ
 B7ADl6cloKkgEAzl6R2MpcMmv1Q1zyF7WUUnu5Ivbr1NU+wwmXbAdQ8YYDXy2KXwu
 tHHfFHz+IfP8zKH75w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=J8TS1F5R
Subject: [Buildroot] [PATCH for 2024.02.x v1] package/git: bump version to
 2.43.5
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes "git lfs" and "git annex" breakage/regressions (for details see [1]).

[1] https://lore.kernel.org/git/xmqqr0dheuw5.fsf@gitster.g/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index f24023f2f3..9b8c8eeceb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  6b7aadda1787f0c1eaa257c1df56bb12e43d12bce55cfe7e5ade00228ee3d886  git-2.43.4.tar.xz
+sha256  8b7cc3db84c5c6a2eeb39c63686ff5cde26278e32bb0d2226a8b424488420b98  git-2.43.5.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 15a29d1f6c..01933a96b2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.43.4
+GIT_VERSION = 2.43.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
