Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31130C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 13:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8347482423;
	Sun,  7 Jan 2024 13:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8347482423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwKhT9o8iu6U; Sun,  7 Jan 2024 13:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D082482C7D;
	Sun,  7 Jan 2024 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D082482C7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 958E61BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 680AD408FD
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680AD408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6gvs9IUYord for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 13:23:03 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61C3D408C8
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 13:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C3D408C8
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C8EEA4C08C9
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 14:23:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48386)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rMT7D-0000000040m-1SsH
 for buildroot@buildroot.org; Sun, 07 Jan 2024 14:22:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:22:59 +0100
Message-Id: <20240107132259.55733-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704633780;
 bh=jny1vK/WaA4ML5v7T9UynFaD54TM8dbUsskKlZNAYyE=;
 h=From:To:Subject:Date:From;
 b=NBi93d0GFi6b6TKBTI+6W2au9jxJ2zHnvVDCpyTfONno14BagMIBq9ggINhwkl7ky
 ZZY6VXkoGHa1HWu6LBVP0WaH3KvqimhHCzfWsI2cKQB0+C7E6Jjo2kEtkHDZ0RELbz
 qbpEqANHkzbm32XP1R2ZJPFDCuDiFdz51Xh43cawR8PCrJ7hfv2wnGmhpYigDUuH4X
 x7HgCUP5r7MeolfV8eZIzPQERMOL2RAx4w2JpNzl9wSxQzhKBKrKfROlKkAWb3ij8z
 5CSX8PYXLq1mhRqMBGKdobKO4zrNn/sMzCyUBrMRs1g1+4kEy92qpmldWPbBMxqI3N
 SUrEcvuC5VJ0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=NBi93d0G
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 20.3.16-Nexus
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index ebcf32fd4a..b608c29fba 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1d7c933d05534e591e11fd204e836a3498fffc6a0717d5427c89acfd16fb9d40  kodi-inputstream-adaptive-20.3.15-Nexus.tar.gz
+sha256  4651c022395f92906be40e8c923c9f90c3e9190d9dafee9e229ca1846605c5c5  kodi-inputstream-adaptive-20.3.16-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 267541ace9..514a1a5f2d 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.15-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.16-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
