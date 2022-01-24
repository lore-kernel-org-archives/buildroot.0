Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FE9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D958A4159D;
	Mon, 24 Jan 2022 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFhhWBtFgLS1; Mon, 24 Jan 2022 22:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9534159B;
	Mon, 24 Jan 2022 22:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C69F1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 387BE84C35
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53p-La78GFqa for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:12:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BC4484C34
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:12:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c23so571512wrb.5
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0vLPMUfl42W6XtWC9BRCba5prfmuKlFOlxG09puKNM=;
 b=Kdy/XBF4M9bkqiPZMeUneDUlrQbWlSmALdNvP0xgeOBLukvVPt0+by4uusTrE8bvcM
 88Ax4JgRY7mDsWVgA1A0bSx48GkMFgDNv/8pBgy3tBstaXMTd3vP80IVBDKWYY14E8vr
 LJG8MWglw8dYUVNGcKuDLA579OWP0jpIZ+2uLj+Pt99MBVFPPLZPYExUYPBGuN390AD0
 uLK/cfUdRRJWD+tsyf8S2iHMULYUCDXcaSrnI+E+0mzvQ02HaevaZYIuV3IaxBf2mOo8
 v/KHGzTLkQmt16JAQWV395+6WjyH+UmT5/w08TnlVlK+NWLvtHFvkQlWn+nQ2tar0ZjL
 WUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0vLPMUfl42W6XtWC9BRCba5prfmuKlFOlxG09puKNM=;
 b=AC34eZ4RBxJsTcq5c00xmSbQTlbIUAvgfPfM4Tzxn8ufTmWtbQ6jKnQRL1wA8M+T4l
 i/JLizDBaDCBfNaYJckXwDd0uWRnVERk6ccNX/bcVLDKUjRPvcC+2zNU8a1kTzVCwfU/
 PK9tWKXUmp8ND15ik+b4I/xWrN8gTng+GKZfY8Xs1TomIHlnZkc6fB0B6tCc5E7d/qgJ
 crknrvqilXyAHTDXDfPNavW0VAAKAgcrtTLoUGLFzR70DtPr3sWO8unIGIkl+HG1ScrK
 2qC26Ek8NKNjPY00wOGCdtgudo2Ct1/aUimCIPxaEw0G38X7u30wvrzDt0gPaUr29Ear
 2KeQ==
X-Gm-Message-State: AOAM530lDg8kydBtf7SNKie+T0GRRaX8P5bpGJK1aQZQ0Ioz8wJLkskw
 ZdZHiwg45VZkYMqY2xzEZMrMhLvXKaQ=
X-Google-Smtp-Source: ABdhPJw1I2f2FWhoFsNE7FE1GEP+8EAOpCkLt+L3QXHNTbx5IBgC/yGqBORNoFiByvkgzwqwYEeNJg==
X-Received: by 2002:a05:6000:102:: with SMTP id
 o2mr14851589wrx.600.1643062353393; 
 Mon, 24 Jan 2022 14:12:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-1338-205.w86-229.abo.wanadoo.fr.
 [86.229.185.205])
 by smtp.gmail.com with ESMTPSA id p26sm561462wms.2.2022.01.24.14.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:12:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 23:10:47 +0100
Message-Id: <20220124221047.2597699-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump to version
 0.103.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ClamAV 0.103.5 is a critical patch release with the following fix:

 - CVE-2022-20698: Fix for invalid pointer read that may cause a crash.
   Affects 0.104.1, 0.103.4 and prior when ClamAV is compiled with
   libjson-c and the CL_SCAN_GENERAL_COLLECT_METADATA scan option (the
   clamscan --gen-json option) is enabled.

https://github.com/Cisco-Talos/clamav/blob/clamav-0.103.5/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index d68b04af76..73f4ff88f1 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  def0ad15500fa6aff81d8e68b9f83aa75ee5b607a01335c1d26dbcc959932f85  clamav-0.103.4.tar.gz
+sha256  1e74b1e1d2a8a9056449c313f48a6983b9d5ba0d6fb5ef0b2be6ad3c841a5426  clamav-0.103.5.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 94b589b975..cd2d06e6b3 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.4
+CLAMAV_VERSION = 0.103.5
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
