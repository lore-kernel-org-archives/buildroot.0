Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5246C001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 19:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7620082CFD;
	Wed, 26 Jul 2023 19:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7620082CFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thDambc06Yi4; Wed, 26 Jul 2023 19:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCF282107;
	Wed, 26 Jul 2023 19:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADCF282107
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3CE1BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FFC840A59
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FFC840A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vln3CQ4vad8l for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 19:44:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78BA34036E
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78BA34036E
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60AE7A4C0ABE;
 Wed, 26 Jul 2023 21:44:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60342)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOkRJ-0000pX-2m;
 Wed, 26 Jul 2023 21:44:53 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 21:44:53 +0200
Message-Id: <20230726194453.1462570-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726194453.1462570-1-bernd@kuhls.net>
References: <20230726194453.1462570-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690400694;
 bh=aFV3f04+GxPIqqTup1T8W4iXAk2bvl9I8SG6vHFmBCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGbp3f3vHI+FgFvCf95PvRsAeFv9DcMujF6HzvmovDM6tg7chzFNaGl987XkJPWQ8
 w2zWGpqcfVCszFswd27pXnQFCdRDSmbAGx5NXcPm6XjTBOu67yv/71kllSBWa/xQAU
 i1sPClm7CJM4+l3qXr6GCgJBwdqwN6Tnm6mDcnUY4kyAGM7O78TtEdzcZbTTOppJYy
 XYDnmMRDdl/ELF2kpfDDwbx5rDB9V0DKqnEgWhyD6wCTbtyNGwTVfFFJzE9IGL38mY
 wnoebAwH1NUm54YKW/2VnafYkGcXRHAnYUD0hAYMUt5qB6+AE9it8Hip/cKc4uJOvo
 CqahlkB4yhjSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YGbp3f3v
Subject: [Buildroot] [PATCH 2/2] package/wolfssl: bump version to 5.6.3
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 08262113a0..3407586edd 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  fd3135b8657d09fb96a8aad16585da850b96ea420ae8ce5ac4d5fdfc614c2683  wolfssl-5.5.3.tar.gz
+sha256  2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a  wolfssl-5.6.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 9f06bb1b4b..9b35a6a84a 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.3
+WOLFSSL_VERSION = 5.6.3
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
