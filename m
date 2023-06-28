Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5985EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 06:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB75A40298;
	Wed, 28 Jun 2023 06:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB75A40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kzol8jjIo0hQ; Wed, 28 Jun 2023 06:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3384013D;
	Wed, 28 Jun 2023 06:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B3384013D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEF751BF855
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9554F60AF4
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9554F60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_-gyVFvuH3T for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 06:10:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC93F60AB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC93F60AB3
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 06:10:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17DD8A4C031B
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 08:10:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50894)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEOOC-0007Ox-0j
 for buildroot@buildroot.org; Wed, 28 Jun 2023 08:10:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 08:10:52 +0200
Message-Id: <20230628061052.15804-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687932653;
 bh=6F27jFH3AkZB+2aCLaRwXViXuuMPzVsaTDb4SmHURQA=;
 h=From:To:Subject:Date:From;
 b=o9Tb/TXoe4NswcmbLDmoHTbij1A41ngSIE8QdYddIIiHkMhSdebQi2uVOX2SXWqKE
 Q2j7QAxtrZI3oNvIjW4BQFEegNyROgnJ+WyU59QSpvWt1e93dNMstauE0p+uY4UEBF
 wvyeE00yFMddye7ta/NVgCGmkpa+tp2O22qV+bcX+Jnabk2x8R1dXc6na3sShr6T1o
 UwrSjPHt+hZDjbtde4pP3Ya97cxV4KBDjV3TnkGdpegDF+ATBlEsobhq5NPZHW5HE5
 1pKTNKqy16m3PbDE5U7nRPdY5EKmVcBYiIgpmeZkn3OZRNhXjadxmO3OlDc7EIIE0D
 UGEsnL/OE2ZSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=o9Tb/TXo
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.40
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

Release notes:
https://sourceforge.net/p/png-mng/mailman/message/37860896/

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/9923515ff441b4c07ce3f8c9985a547fe582c4da

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 8 +++-----
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index c1f65c93af..d864850b06 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,4 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.39/
-md5  aa1ae92e172417039bda072b702f6326  libpng-1.6.39.tar.xz
-sha1  3f2386d61eccae211ec4f57899e4ac2ca60d390b  libpng-1.6.39.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/37860896/
+sha256  535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1  libpng-1.6.40.tar.xz
 # Locally computed:
-sha256  1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937  libpng-1.6.39.tar.xz
-sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
+sha256  5c0bb4b05b1354ae7c173532b6702ea68b611047ff9b91c4d3af77da39c195d9  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index a18c36fe78..b7bacd9217 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.39
+LIBPNG_VERSION = 1.6.40
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
