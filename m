Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C07C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E267041E40;
	Sat, 11 Nov 2023 11:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E267041E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hla0EU7crnPQ; Sat, 11 Nov 2023 11:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F2F4216A;
	Sat, 11 Nov 2023 11:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F2F4216A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5221B1BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3767440B3B
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3767440B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gS4SBsG-9kwc for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:44:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E4F400C7
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E4F400C7
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70849A4C109D
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 12:43:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48788)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1mP9-0005O2-0i
 for buildroot@buildroot.org; Sat, 11 Nov 2023 12:43:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:43:58 +0100
Message-Id: <20231111114358.2674610-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231111114358.2674610-1-bernd@kuhls.net>
References: <20231111114358.2674610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699703039;
 bh=EN3nBYilIe7WysK0MzJxTWScsbjM70GwCfZxK69aVhg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gh9h6K1/Q0suKXnsHRm/MnBruG+ot12Sq3P7liUT1tqBujZBd1UTtrBW+79G6caC1
 BBy16pxqpKNl9Nte1ygAZsmWm54a3rFxTkwxjJVfkJkZLGPsLNT4nWf/OhyVak1pf/
 HN6Gim6efKr+inDQdnOvyGSyzeCKCEYNxfGMrOKq8R7QsNIWpsaLtktNWE3hEQMUp7
 M4roiTaRBPDNvZBb32vmPN5e17pxZs30kWaGsV+xbuTrQAj51qomz+OcRRjBjbYtPs
 jKN2CukqXJcFdFgBRAcque19Bfm/tYbcK6q1Q/YwIXEzPd/ghAjrRVhDUl2nNvkm9s
 ZKzZGQ+53YEDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Gh9h6K1/
Subject: [Buildroot] [PATCH 3/3] package/kodi-pvr-mythtv: bump version to
 20.5.6-Nexus
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
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 49924265bf..2b3a277409 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d3fc88dfdfd5e1084abab08424863dc40674472f0b48a1df7eef7c3692dd44a  kodi-pvr-mythtv-20.5.5-Nexus.tar.gz
+sha256  321559f9f46a2588bdcfe9be6d6e7439911e548a92e7820dedde6cabccbe72fd  kodi-pvr-mythtv-20.5.6-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 6763d97947..7708f37b87 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.5.5-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.5.6-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
