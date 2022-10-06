Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C2CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 09:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8CC418F6;
	Thu,  6 Oct 2022 09:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8CC418F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsR9NGt84MOx; Thu,  6 Oct 2022 09:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CEA418F4;
	Thu,  6 Oct 2022 09:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CEA418F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1C21BF957
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6736761034
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6736761034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUr0OFoM2Tg9 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 09:58:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D8F06102C
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D8F06102C
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 09:58:53 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ogNeV-00BGvz-Gl; Thu, 06 Oct 2022 11:58:51 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c741a62d;
 Thu, 6 Oct 2022 09:58:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 12:58:31 +0300
Message-Id: <20221006095833.1116173-4-aperez@igalia.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221006095833.1116173-1-aperez@igalia.com>
References: <20221004133057.2003750-1-aperez@igalia.com>
 <20221006095833.1116173-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=76Wr7I7bTdpSGHFyzsWGTYVFFf+rAQnFs7AloKJUiHI=; b=FCGOBsTEnhw8XXz30zu9qcKZX0
 kboMw2iOiufiJeOoXhA5ktWULOuq7PNr6/a2TdnAnLnzyuIZa0+oJPOURL0cKCCxkmRXojS3AOmVA
 feS7/znyyxIJJovEUta1gyoqaXz/Ix58hoejeH2rbdgefjZ0T0zi6XpwdCNXf7lhHPELTd0swaBzF
 mzlEFO1sCQiyYdAIh7gpHzYJz3YizAbrKSN8qMsdGmPARs+pFpaE8nLiiL1P6dDTQrmHmlfFBNPw4
 OSoZyhP+L7uooa6hJGjeX3hJBD8M8s5xFgpPw6Lk2DEPHVPIl4AXh9OMLLepHTp1LMDbwDpEJEA8u
 bDU1nmvQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=FCGOBsTE
Subject: [Buildroot] [PATCH v3 3/5] package/wpebackend-fdo: bump to version
 1.14.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new version contains only small fixes after 1.12.1.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 49c60fce0f..e2f2c6c89f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.1.tar.xz.sums
-md5  494f4a5b2bd89dacef37b69534b2e1ce  wpebackend-fdo-1.12.1.tar.xz
-sha1  72a85e4615e085926f7ad8fc8414f9c6a878ef28  wpebackend-fdo-1.12.1.tar.xz
-sha256  45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629  wpebackend-fdo-1.12.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz.sums
+md5  ea62dfa9ecb366598a837d7446ed48ac  wpebackend-fdo-1.14.0.tar.xz
+sha1  1500be9212381a404f4a46b22b90a9880ba11c01  wpebackend-fdo-1.14.0.tar.xz
+sha256  e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155  wpebackend-fdo-1.14.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 2e2bdee94e..afe37b086e 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.12.1
+WPEBACKEND_FDO_VERSION = 1.14.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
