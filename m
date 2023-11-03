Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC95C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45679821FD;
	Fri,  3 Nov 2023 20:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45679821FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1U9_u-AVnkCu; Fri,  3 Nov 2023 20:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12F7821FE;
	Fri,  3 Nov 2023 20:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12F7821FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 618381BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ADE760B90
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ADE760B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgwV2FWvLMef for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:30:41 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A0860B8E
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A0860B8E
Received: from fli4l.lan.fli4l (p54a1b8f0.dip0.t-ipconnect.de [84.161.184.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2D2FA4C062F
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:30:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38274)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qz0oR-0002R0-1P
 for buildroot@buildroot.org; Fri, 03 Nov 2023 21:30:39 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 21:30:39 +0100
Message-Id: <20231103203039.3042294-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699043439;
 bh=cH9MYTm6hpD68ZBAF818udmUdTvzDsASkygq8rXNycY=;
 h=From:To:Subject:Date:From;
 b=yA3p6Z7oFVhc0gf/qu2hMxqOtv9kOrSNFdf48v9FKhZ5bTg0vEDbWBPqVq2rAxBmB
 vREopVr/lZ393ybMrPJbjKkY3FYvTqXmL9zZiFU7HY8fUkKkzWSBKPNZ0syX5kkBAO
 KNsFdRvpAQDBiOlhyAQ5I67bf92fwGfr/LVrKvK2PLcCnyQQQ0/lbMGkkd0SiKCWUz
 NifJLUVazRDQo73bxsUSX61bnufXXm3Yct7LM+LRlL/HA1Q5BAXmKKplM2fFU0MbYg
 5z0Wj5zz7WrdBdxQYhRs8jdXgQyrQ0UtOIDSy0awgVC9djxLLO0g3ZFgCblo1eZzKz
 wMme1v6+dBrCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yA3p6Z7o
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/security-release-0-4-7-16-and-0-4-8-8/10064

Fixes TROVE-2023-004.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 933208fce0..fc128e0fcf 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.7.tar.gz.sha256sum
-sha256  b20d2b9c74db28a00c07f090ee5b0241b2b684f3afdecccc6b8008931c557491  tor-0.4.8.7.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.8.tar.gz.sha256sum
+sha256  21bbe908cafeabff04636d26293540aa9366eb1cf389bc65dc2476c93e688004  tor-0.4.8.8.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 1b29fd336e..b054bc55bb 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.7
+TOR_VERSION = 0.4.8.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
