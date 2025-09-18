Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E9CCAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 06:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1053660EA5;
	Thu, 18 Sep 2025 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWE7FQVfLKYG; Thu, 18 Sep 2025 06:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C10C60E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C10C60E83;
	Thu, 18 Sep 2025 06:38:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE44B199
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F0C414C2
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMzlsDDL6WDT for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 06:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAD4E41497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD4E41497
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAD4E41497
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:38:45 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4641A31E0C64; Thu, 18 Sep 2025 08:38:43 +0200 (CEST)
Date: Thu, 18 Sep 2025 08:38:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aMuo808NcwB44GKN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758177523; bh=drMS9qczjdI8CV7qqn+YFJ+DK/pqlwOUEsotj3AVrRM=;
 h=Date:From:To:Subject:From;
 b=s4cCVpfB1HuFTlebfubSHBYKhsqfeFlWVkma/9z1ybshaaAxJD1Tx9n1rS5ZkEeY7
 LyAsWvdi1c+c6Ykwp9zB7uRLPZzs8JmqkNCgaVCXkdSwW/Rtt4jCCAmvNd2hfKTqX0
 2sFIz6OxmOYWQZzC6eHaW9qyj5BAncmgCZFjld+YILtGrciORdZJMr5GbgmPL3Kina
 AyMb7Nmare3luJ1hAMKQ9zWej6RPQVoxeLbd0l+qvbRdSA8TWbTojxMRbLNcZ07Cgy
 u4mJQnyZ2B+Q5VSs/ekpQ3OnAL79z/ha2xPTLOMUJC18l6jk50qqr3HunGINAYuVxB
 eIiQXYvvEcBnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=s4cCVpfB
Subject: [Buildroot] [PATCH] package/x11r7/xapp_xdm: bump to 1.1.17
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

See here for Changes:
https://lists.x.org/archives/xorg/2025-March/061902.html

Fixes a compile error with gcc 14.x.

COPYRIGHT was updated:
-Copyright (c) 2002, 2006, 2009, 2010, Oracle and/or its affiliates.
-All rights reserved.
+Copyright (c) 2002, 2006, 2009, 2010, 2025, Oracle and/or its affiliates.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash | 6 +++---
 package/x11r7/xapp_xdm/xapp_xdm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index daf1b0852f..13c9f3dc9b 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003265.html
-sha256  3e9bf25636797ec9e595286dd6820ecc33901439f07705eaf608ecda012c3d5f  xdm-1.1.14.tar.xz
-sha512  8ed1d2c946916c24cb4b2de9326f65629c97e53b145312c9cb9c6e4308d8b47d67d3981319fbd4feac9b3ed436b9dfb24a1c905d37d7bcf07b49c18a68c7a6e4  xdm-1.1.14.tar.xz
+# From https://lists.x.org/archives/xorg/2025-March/061902.html
+sha256  9494aef0911a031c53670725b5c8c9bb9d3f7c5ea7318b1f72ddd9dcbbeceb6a  xdm-1.1.17.tar.xz
+sha512  68499cdf73c9b6b48b974a724e5d045bb8333cfd17f1d7e36132e7aec51922c22260b361517c4f0d9fb7d28ce4909e0638e00180e93544bc7200d9bef55e822b  xdm-1.1.17.tar.xz
 # Locally computed
 sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 2a343b55e2..03b9ad58e9 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.14
+XAPP_XDM_VERSION = 1.1.17
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
 XAPP_XDM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
