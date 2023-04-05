Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95086C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BFB8215E;
	Wed,  5 Apr 2023 20:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BFB8215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTPY-lHthMwe; Wed,  5 Apr 2023 20:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CED182179;
	Wed,  5 Apr 2023 20:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CED182179
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 787981BF34C
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5251260F3A
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5251260F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVGkrqTu2hdV for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:05:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D4260F34
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0D4260F34
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:05:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.40]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYeR1-1pxZoS0TSt-00VdqE; Wed, 05 Apr 2023 22:05:35 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 22:04:44 +0200
Message-Id: <20230405200445.50475-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:WmRdiaRHV3WoQFW0kwsFVasABb9HB1lgbJMjgd2CSOK8QgXlLeK
 QwRNPgEHUSOiDL+O2teKC6/L35TKDHxnOFyruopVwMEvzVqjhnofym/o0XRWvnp5AsXF+XC
 07fdR/DZXxXoML709eJbwmM26275mO3OHpw8E+L/2aVAJw7tHr0qFXWXNwudubJfM38FRW6
 HCWYdTywtJhN/r5uCE/+g==
UI-OutboundReport: notjunk:1;M01:P0:XBiEzXt3rWY=;M2lqRSBn5Yml+ZlVPyjLtB1yZ+p
 8YKegVutRhSOVCMKnuGnnJoK4uvRQqNyAc1+0+tLWDap6cqFXuPnRTgaKoITCOcMuNS9F5NTt
 7nhguFiPyyvuCh80W4QX6LifNB9OLR/lWg6U4XYw/iBWgWG35VVRRJ7cLBgpPx+n2Qdke0QLC
 kSkYFNLW/I80xa+qnQwdXjx3WmyDNAQbiFDrO57r4NyZ5A5hYXrZRse0hRjXcqQMjbkXdImov
 Z4+EP7incwZ5vciA6IkRjjigS3V46TkOsNe0BIiTNn3htnkWKlhTIReDxNfZXlBHhpBjhoDJl
 zoXbG0cDyA+XnLjhuqKXoSdr+e42/MpMwQToVRkprjK1wOkZFmaEnB14534rWCE4f67RjCbWA
 w8/ql3wp3QQBqA9ON6B7IYc+E+umqd/oD8XIVTTU4ZU4jWuzX2FJk88NpZMB9Z68GUX9Q+aOL
 XwjM43LWPhOccllx+H7FRR8BfgmzuZKpBXaruRWR203L8Mi4gIutg2XA0UYyD11lKzRmE8P3J
 Sj1Ujll0qRj8RvBkRlsMrIsidyF2BUw99uAUBYBK0UEi2uoIPKA5XavKSCJZrbAgVx5R1Ez0V
 nEFtI7gJzOoFvTeoFlB1Hxd/8cbpCrJ7WkAgiYD0ydy0JI8oXHFDph6mAhycpnme7MARkO51j
 Bj9YeBYAL0AAHWwma/KRV+HR6k6zNb+44nb4NCqp4uvaDRvreBhxKEBY3bW36IkYsYtkm0P52
 d7s3cQdByTqBqBGvrtdkAKg7ytw8JuIgbtFtCckwMwuY39BzRPP6hZO4fVYX58GoWy39sTiQX
 uf3Q3e2tJagvJ+K3Pck8yCAwVJtWbeYLsLZh1GYr3J+xJgk9k1rl39Ol9mE5RTStTxwvL1UBx
 RVpPHvlR21OTYeOswsL2onasVp8hbkIPQfmyicHc/5evvttu9ErQ1pKyMXFOQsolg1FCC24Iz
 DE7PignfmzMgQodSTXnnwULhZ7Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1680725135; i=dalang@gmx.at;
 bh=SSnP5eTwdp1hV6dZCH+4DCsK+QHCUQt1CSSWK2BhPXM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=pING0hV0ums9+ZSxSz/+F0LulgfuPAqW+jvXArIvWq937YwEgMBVWlLjVd5ZcdmaA
 pZjRDzPf0iqHT5E1KQS4rSbe/0U7/z6nfHco0jJsuee5lgCoNPwTEJmkaPsBzOTcTn
 i5PkIcILzliGRu4J8bjP72xCWRrQRv/oWe+7M9UhQV9mrzKRyV43GuyCSX4yqjWiJD
 yIHxJI1uq0k9h2vceCOut3pZkqakVnJqjS6SA7INknN2rahZI/ThrmrPcrZ2OCifXN
 Phb4fON9KXhHFsPcooCtL4RuoQR6OU2hJkYMVpSvh4K8x72CCTGG2T+Djt46CV24SD
 49NuP5XoA1IIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=pING0hV0
Subject: [Buildroot] [PATCH] package/libmodbus: bump to version 3.1.10
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stephane/libmodbus/releases/tag/v3.1.10

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libmodbus/Config.in      | 2 +-
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
index 642b57cd8c..2e93fa4bee 100644
--- a/package/libmodbus/Config.in
+++ b/package/libmodbus/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBMODBUS
 	  according to the Modbus protocol. This library is written in C
 	  and supports RTU (serial) and TCP (Ethernet) communications.
 
-	  http://libmodbus.org
+	  https://libmodbus.org
diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 83b0c3a012..a7b7e583a8 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b122f2bc29f749702a22c0a760a7ca2182d541f5fa26bf25e3431f907b606f3c  libmodbus-3.1.8.tar.gz
+sha256  899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253  libmodbus-3.1.10.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 2f8c1735da..2fffa1e0e9 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.8
+LIBMODBUS_VERSION = 3.1.10
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_CPE_ID_VENDOR = libmodbus
 LIBMODBUS_INSTALL_STAGING = YES
-LIBMODBUS_CONF_OPTS = --without-documentation --disable-tests
+LIBMODBUS_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
