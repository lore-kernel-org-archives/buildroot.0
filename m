Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753A3C87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2720961043;
	Sun,  3 Aug 2025 14:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utwAJBdGf3yJ; Sun,  3 Aug 2025 14:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD2F61027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD2F61027;
	Sun,  3 Aug 2025 14:00:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2768118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C240761016
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoq1irz-gnit for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 262686100B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 262686100B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 262686100B
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8qj-1uCYMB0zyP-00aLdN; Sun, 03
 Aug 2025 16:00:18 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:00:10 +0200
Message-ID: <20250803140011.186274-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803140011.186274-1-ps.report@gmx.net>
References: <20250803140011.186274-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AHLeiK6fyXtgAedl/FNIpnsjQ+Kp6HVZNDj7nGf/7hsL5pgkLR5
 PuAT9At8702ZW4JzbEj2BdoZ5CjQIHSM4fo2xRkoq2bbA3XHz2H5lJfJBVRhvIwCdHG3VZ4
 GiLuSjxtkrza5H9VBCojwELXblJu5H0evHsUQqTbjIHficFwSe6Ez0bHlI0TmGjonURJCbE
 dDVsNitfxelk+H+BultZg==
UI-OutboundReport: notjunk:1;M01:P0:n3tB4jeIMgU=;Aez1sM7AyJdY26WugtohqnZQ52U
 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
 J3Vvru/Fz1FSOKPgOYtXtQk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754229618; x=1754834418; i=ps.report@gmx.net;
 bh=im/XnQJyUvb8RREsKW3AVfGaT1xCqxiV+YRKMEyxWu0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uCC63sC0whAz59p9V13hOWFGo9Sa0BHbbiun8fTFJ2a4fZf9Sg00wdWT13UOiFY7
 0i0j+XaqQQcR31AemO8+SMrHSwaH8nLL8BE2j25yatQLA/H986AYu7/DqrurDdtlt
 KacOFScvd0V8ulxbG7gY85IflEykkYFfevkdMs/fXrpA5l3vhMHBClnGdeIBWezJU
 RvDGunXuwhvXulvs/wYn3y0ajPsROgK5o4vyd54ZZ9W2Pp7K+iKQ+XdHOAs7q+w7Q
 jdqEHRLGqhSokiquHD2xTQcVbudsNWpuRq7zlriortYOBSbhlly/NypbNsUazjThB
 6UpHdfGKQYCqdRRO6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=uCC63sC0
Subject: [Buildroot] [PATCH 2/3] package/iwd: bump version to 3.9
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (see [1]):

  ver 3.9:
    Fix issue with Access Point mode and frequency unlocking.
    Fix issue with network configuration and BSS retry logic.
    Fix issue with handling busy notification from Access Point.
    Fix issue with handling P-192, P-224 and P-521 for SAE.

  ver 3.8:
    Fix issue with handling unit tests and missing kernel features.

  ver 3.7:
    Fix issue with handling length of EncryptedSecurity.
    Fix issue with handling empty affinities lists.
    Fix issue with handling survey scanning results.
    Fix issue with handling duplicate values in DPP URI.

  ver 3.6:
    Fix issue with handling blacklisting and roaming requests.
    Fix issue with handling CQM thresholds for FullMAC devices.
    Add support for PMKSA when using FullMAC devices.

  ver 3.5:
    Add support for option to disable blacklist handling.
    Add support for option to disable SAE for broken drivers.

  ver 3.4:
    Add support for the Test Anything Protocol.

  ver 3.3:
    Fix issue with handling External Authentication.

  ver 3.2:
    Fix issue with GCC 15 and -std=c23 build errors.
    Add support for using PMKSA over SAE if available.
    Add support for HighUtilization/StationCount thresholds.
    Add support for disabling Multicast RX option.

  ver 3.1:
    Fix issue with handling OWE transition BSS selection.
    Fix issue with handling oper class 136 starting frequency.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index b0a72efd7a..22e5ac3335 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1c0393325309f8a60  iwd-3.0.tar.xz
+sha256  0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d7799da66df5cad45  iwd-3.9.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 3a178795da..de90b2d346 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 3.0
+IWD_VERSION = 3.9
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
