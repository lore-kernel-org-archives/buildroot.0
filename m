Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCEEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 06:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A167580C60;
	Sun, 30 Jul 2023 06:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A167580C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yg5MRvKy3_sS; Sun, 30 Jul 2023 06:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32DC80B42;
	Sun, 30 Jul 2023 06:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32DC80B42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFC901BF3A4
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6EED80B39
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6EED80B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKQ3iq8_NdmG for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 06:58:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D501B80B2A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 06:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D501B80B2A
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04484A4C036A;
 Sun, 30 Jul 2023 08:58:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55448)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ0Np-0001sN-2M;
 Sun, 30 Jul 2023 08:58:29 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 08:58:29 +0200
Message-Id: <20230730065829.695017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690700310;
 bh=AwHh5ulhP9c+b1vL1EzhHuq4Wenvph1jmFb7RmNSbw8=;
 h=From:To:Cc:Subject:Date:From;
 b=uh4e3ft9ixbKrfmhrihNBPtzfvlAjrGQUI224ATOVNHdDlZf79N4SKdXXeRqFDaRD
 +0uMIJpsk0LU1Cnsi7WrVO6iiS9/KefTPX0O3kkUw8McH3HIrxAMQe6jfI7q2IjZxS
 H8QVgDHNdv2h6cDhWmFUY3G8scJiPHUYI8AGmiACUv/7sjrWb7lwZ28ItCy7xBOmp3
 KHRbY1HvwTTNe1KA3zgggFiTvboBVW5uFhuYwhfho+eKVuakyAXg/0T/PQoSaLF7h6
 RAvLvBhwH4PLakj6fCz3rq7kiYJ7GaGDuPerfm8+v8WkCArmfSiuAn40jnc5EGel1n
 z8JyVzRP2QioQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=uh4e3ft9
Subject: [Buildroot] [PATCH 1/1] package/mbpoll: bump version to 1.5.2
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
Cc: Jon Ringle <jringle@gridpoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/epsilonrt/mbpoll/releases/tag/v1.5.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mbpoll/mbpoll.hash | 2 +-
 package/mbpoll/mbpoll.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpoll/mbpoll.hash b/package/mbpoll/mbpoll.hash
index d72ebee7b8..ad96d5ef48 100644
--- a/package/mbpoll/mbpoll.hash
+++ b/package/mbpoll/mbpoll.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  046fdac2d88eddb71a1091a87d0a4bb23fee39595a929cde50c546dae0fbcd6d  mbpoll-1.5.tar.gz
+sha256  7d960cd4459b5f7c2412abc51aba93a20b6114fd75d1de412b1e540cfb63bfec  mbpoll-1.5.2.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
index 4289264e0d..e35fbbe5f1 100644
--- a/package/mbpoll/mbpoll.mk
+++ b/package/mbpoll/mbpoll.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPOLL_VERSION = 1.5
+MBPOLL_VERSION = 1.5.2
 MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
 MBPOLL_DEPENDENCIES = host-pkgconf libmodbus
 MBPOLL_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
