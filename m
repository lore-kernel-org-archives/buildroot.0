Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C580C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C916281FB7;
	Tue,  1 Aug 2023 20:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C916281FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeErYYpcvIDa; Tue,  1 Aug 2023 20:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A7D81F8F;
	Tue,  1 Aug 2023 20:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A7D81F8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA331BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A435440A66
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A435440A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amBvyMC3CWUp for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:21:58 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFF28405D0
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF28405D0
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A18F7A4C0FAB;
 Tue,  1 Aug 2023 22:21:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48442)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQvsD-00065H-1O;
 Tue, 01 Aug 2023 22:21:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 22:21:39 +0200
Message-Id: <20230801202141.2957846-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801202141.2957846-1-bernd@kuhls.net>
References: <20230801202141.2957846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690921301;
 bh=0Zm5auxhDzMPPPs/I83EyOFZZSC3muIB70At33MxsQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWytTPGRsuXBL7cXHBIeYU0WxAjP7pvq7CNFju5OE6S2bdTCQl5xXBPE5MBQiHLtE
 I5BYTkU2G/cdx2xHerkgzpqs2JFehlJP38XNgofjup48btrDXEHe2hK3f++kGaGHeG
 PbAMGJezi6BcREvx/SZLFHmkdvz/D03sIUoeUOybBadN8D3J8y6bS2oGDJP3ChY2rp
 C7WSnskTsh8HO3aUhfYi3MlNvJgxvFrpnGbgmM4rCkGDkUzk+eOAmz1pXAl9TSyoBH
 9zY+pPD/jWuguzDTKaDTj+kDgPJfGQ6akzNAla29jW9I7FihGrufyfv6xm0xYj3vWt
 4orXpynO+M2nA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=PWytTPGR
Subject: [Buildroot] [PATCH 3/4] package/binutils: switch to 2.40.x as the
 default version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that 2.41 has been released, let's use 2.40.x as the default
binutils version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6d2b436d6b..7a54660c46 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_40_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 48a036651c..ecb00077d6 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.39
+BINUTILS_VERSION = 2.40
 endif
 endif # BINUTILS_VERSION
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
