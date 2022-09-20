Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE76AC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 21:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D501E41916;
	Tue, 20 Sep 2022 21:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D501E41916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VY4PPk1-A36D; Tue, 20 Sep 2022 21:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA32B41918;
	Tue, 20 Sep 2022 21:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA32B41918
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D43CE1BF2A7
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF26860FCA
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF26860FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7ZWrafiLij2 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 21:32:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7488960FC6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7488960FC6
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 21:32:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 24C9D240004;
 Tue, 20 Sep 2022 21:31:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 23:31:56 +0200
Message-Id: <20220920213156.740074-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663709518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+AGrBu4YQOpx99WWMCDkvVkNjg97r2DyK3M/kXFfK8=;
 b=gdsGb4MHN4OkYKoZCiit0nofgYvJK/rNIKw4xoP7BdCEtDTN+DmJIx4SQ0ofl4g0cKPLi/
 1YnxVeyHFk+V+fY/N4HFuW0QWERtnVtHNpz+lfAdPtGWwz0L4H6Y0xMPhif7igIH7dO3ot
 wr3yXp12AXmPocLtYUDj2StJ83e+tzaCL5NhznmCeV3XO3l+QfgQ+cKEteOJjrNA8V10fR
 KJquZBFyK2pikQ5j07QzBoa2Tkbkivjo94UTP6FmOEraHUTdxfBWL6PJenzjEdMzXHrdR2
 6WKog8Al61VRLlug99kt2cuMxi3yHbpxmr3UoPdCwFiNGvFlzqyNUVcJ2DeuuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gdsGb4MH
Subject: [Buildroot] [PATCH] package/double-conversion: bump to version 3.2.1
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:

    Disable quiet nan test on windows by @floitsch in #174
    Test on all platforms. by @floitsch in #175
    Fix warnings on Windows by @floitsch in #176
    Run ctests first. by @floitsch in #177
    Give shared-lib option and test install by @floitsch in #179
    Install Windows debbuger (pdb) files. by @floitsch in #178
    Add a cast to silence a signedness conversion warning. by @pkasting in #182
    Issue #184 : Fixed all -Wzero-as-null-pointer-constant warnings by @seanm in #185

See https://github.com/google/double-conversion/releases/tag/v3.2.1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index 8124ec2f82..a2ecd4422c 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3dbcdf186ad092a8b71228a5962009b5c96abde9a315257a3452eb988414ea3b  double-conversion-3.2.0.tar.gz
+sha256  e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35  double-conversion-3.2.1.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index ae46fa06fe..af1fbab078 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.2.0
+DOUBLE_CONVERSION_VERSION = 3.2.1
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
