Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA67C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB6F83EFC;
	Thu, 20 Feb 2025 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMZKMu9nxp2u; Thu, 20 Feb 2025 19:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A9383EFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A9383EFF;
	Thu, 20 Feb 2025 19:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1823ECF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078E360818
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdQQnV7hsYwj for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BBC360803
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBC360803
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BBC360803
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:49:47 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 17438352088C; Thu, 20 Feb 2025 20:49:46 +0100 (CET)
Date: Thu, 20 Feb 2025 20:49:45 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7eHWbet74QuCfJr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1740080986; bh=0UgYlq41zU24I4GMTJLq/l0K/3O6afhcYTcv3bm91kk=;
 h=Date:From:To:Subject:From;
 b=O8cf3+xKSSO6y2qUjtED2wCBytotM1w4wy59o4DjYnmGOzEP6HOzxEMhT0dI8Jvll
 Px2yRlgkVeuWHmLAzSEGU73bbphaoA+YgOrrIXLmZ+o/MSj6cy9GF5Ivfzl2GgAC7Y
 0JPZ/H1WbQ/AA1BGKuJPsixVhKq+Hh3rXXalk9tFen1DK0FL6jp5mE7AyHT+ElXoH1
 TRIy5X05FrezWM5yekmr73FHevf4nSGrP58XBViRQUQg0jkxPhacIvlll7SqtZx3VJ
 LG4sHMeOXotNVXG67UnnQMHAeakQaC1R9HU4lYQBHY217pW+H3eU8YpcFrYdYeA3t9
 wZ53IOH89D6ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=O8cf3+xK
Subject: [Buildroot] [PATCH] package/libpjsip: update to 2.15.1
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

For a changelog see here:
https://github.com/pjsip/pjproject/releases/tag/2.15.1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index d72e1090e3..e85d1f47b4 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5805c1171acab4af9684d7ad096dcb92f71fc42809852144e97e1413468c9981  pjproject-2.14.tar.gz
+sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8169e0dcee..69b3c1cffc 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.14
+LIBPJSIP_VERSION = 2.15.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
