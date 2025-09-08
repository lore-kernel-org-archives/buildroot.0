Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FCACA1016
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C55680A67;
	Mon,  8 Sep 2025 19:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yb5Ms_lLI6Cy; Mon,  8 Sep 2025 19:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A524E80A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A524E80A79;
	Mon,  8 Sep 2025 19:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7411186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4B3A80A67
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laQikwNB4kl9 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2140680978
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2140680978
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2140680978
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhThunOan; Mon, 08 Sep 2025 21:24:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:35 +0200
Message-ID: <20250908192435.214306-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI91JVxf31JyvtVlFGtcy7PD1RiyzdtWj4t5othCyAEAKTRBBA9u/Np1rp9nwKQ5tuQSNTrCKKLDly5UHhzoodJNnxyKHa4FLbhriO4Xzy5W1BgaVHXn
 QKqB13j6gFp+52jmwkKIuHh55PCcFhKpO8sa7wfds5Yw0crCLaRn/CYXEDYpBaHV995smfCqDIqARmJ13P6fDWtpyBA4hNS+/0uS0MJ3R9oL5bVnPJVc93uB
 bxF65eVqNW6dwR35GBKe1Ig+Y2qIF/lbe1wHhSpM5fHE7evsbF1N5hWGlCnuXnWQDewQhMFxZzaDDyMZHbhGf5PuiGK89rQtermdu56Gm6e/vwHY+olwz37w
 ezASyjjBKlFTJIt9x0AxtQippTH9sXDbEN2JMn7Tjx0AIKSKLqDVkefgCU/kHoyecTHqrNzM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757359477; bh=aM8OysNTiLKcXm62AoNJH/eWR9dc7T9IhsBiwrpMGXE=;
 h=From:To:Subject:Date:MIME-Version;
 b=SsnbJc15iDqicbhh12G8DNshM5Vk3JOtYJo97zzIDIiLFbGguH2NahfusHXGJOxzf
 p7beH0CMVGmkMypbLWLinyWFNNGrlX1szCqy3wSeaqKG+TDNVOripTIxMB2fw8b1R7
 9QvFz/96t5k5HaVnP0zVqdqaloUleX5jBeWYnPI1Cg+VToKTBBSVWe1KHRL0dkKVs6
 PqL67pJ/5bcHqsSv1VRkaNjP0xr3w0KIdHKS16gyMHcsvo9pQfzgZTK63wvPsn/JGz
 iQeOctmOZKuQmbitRgnsivvHNoLv1LfCLHKWKadq1zLoZw66/nVW32XWTxpcBkb6qk
 jVeCAngSjyj0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SsnbJc15
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2025-08-08
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patch package builds with Linux up to version 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 3189b3b7f1..fe91d856ec 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  049849b0821e5a41a3f7ce291caf216775f8fa2060de6d49351165cc4e6aa7f3  xr819-xradio-506fbc323f1c675d037eaf7ee928939394761aee.tar.gz
+sha256  c06dd87948b4a4c1bee070bbc3ce07b8711ec027e78ab9b83ea1c7350472105d  xr819-xradio-d766844ce8307e5902b3ab461f06bf8ad06891dd.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 5315ab0ef0..93fbdacb38 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 506fbc323f1c675d037eaf7ee928939394761aee
+XR819_XRADIO_VERSION = d766844ce8307e5902b3ab461f06bf8ad06891dd
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
