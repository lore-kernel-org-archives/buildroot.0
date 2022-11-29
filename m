Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9FC433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D3C60D90;
	Tue, 29 Nov 2022 21:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D3C60D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDD6cIJXMVr0; Tue, 29 Nov 2022 21:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B2360D79;
	Tue, 29 Nov 2022 21:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B2360D79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBAC31BF855
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D493040194
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D493040194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDwP--F2Afn4 for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 21:14:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D061400DD
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D061400DD
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 21:14:43 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 07wAp5BzPTSJi07wApscTn; Tue, 29 Nov 2022 22:14:42 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 22:14:41 +0100
Message-Id: <20221129211441.807517-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBypGpMibClFI2RC3OICAb2r2KQioEzInPNCrGrUGOxyin9hsV6l0c2ffZ2YmMO3n7r5Zz/TJuQbTERhj/2iHnweVhWWPLwa9Dx7rO4AIwwNNbLGwrfg
 x/q9pT0K78N0jjLHYHgnmRIBv4t1pF3xMRrNQhqxQ4LPEeAZs8Y8vrC+Bv2YC9hEjOGGv0LdpJWzHQsWeExkriBlE7rBLPYDzkzDpFd1qYDxqeA6obTHCDjK
 H64eFo0xLC4cXR/s7DfkCkYbzkVOZVDqgTRPWa7NuzUpwSzQnI05WquCyY1Syg1LvRgc4qD2y9KjTrowItJy8Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669756482; bh=aMFd/ZAlXJE2BPjvNI3jY3uHYnWx2fKuPs4KPPXsR78=;
 h=From:To:Subject:Date:MIME-Version;
 b=Bowau0DHuWkDPW9G+eS0dsk0+isLGdixeFu+AaVa8ZIMY1jYPQLpIcn1CQjKlAQxI
 OH71qq3fDt75shApMBEkpy0shkEIJTXbl5j+twOmf/HL76L/lwtEg/MAKV6GVA/Oft
 0C7zsSrdX0l+NPzsJ/QvsJ6PxAiZWi/zPDsfz2o2UnC4phtMajQjVOBepixSBhIuNN
 a/enNAHDYKwTVex1ZDZm1X4g/zMQIJecWhPCga3F+47VPYKSG0Pc0a6481l5w5tE+2
 SdtsdsSTx87D0s/wt9FUHHhiVy0AAA0ebVhjke4H13TB2o0DHJgS2N4EgyUcfH9/3M
 Zg63rdo8xLIcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Bowau0DH
Subject: [Buildroot] [for-next] package/rtl8192eu: bump to latest version to
 support up to Linux 6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index f616def194..0cb9961345 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  75b523ff1cda54d7cd8734a043b2d145231ab81fcc13d3edcd80e00d59201409  rtl8192eu-1e15b6d451731bc4d3ffd587194dc4bd0f286ac0.tar.gz
+sha256  827e9592336744cbcfca5de988d8f4e14a62690302d3cabf72aa4bedebded2b7  rtl8192eu-94bce7798bbb18de6d8b1646dedb2511f24867d3.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 589cb7f59e..2b4740cb5d 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
+RTL8192EU_VERSION = 94bce7798bbb18de6d8b1646dedb2511f24867d3
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
