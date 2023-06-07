Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6603BC7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 12:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C673D6131C;
	Wed,  7 Jun 2023 12:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C673D6131C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Yj0rWqzTHRC; Wed,  7 Jun 2023 12:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79ED6130E;
	Wed,  7 Jun 2023 12:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79ED6130E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAF71BF3DB
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D4341D62
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D4341D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3yPEldfM0cd for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 12:31:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29FF441DA6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29FF441DA6
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 12:31:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.200.222]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MSKuA-1qZMUa31tg-00Sdgu; Wed, 07 Jun 2023 14:31:28 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  7 Jun 2023 14:29:16 +0200
Message-ID: <20230607122917.21827-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oEuIYNxbdtXnLBNMUVXgI29ad8srXbyhlDY/9Qt1FTD6QhmCyoM
 J4rFUDZYud2V993gBCtTt3TqG5nknfK0dSGK26T4E3pvdR6xYZqtXvQz96j0UJq9W6Ha01W
 ZkabH823zV+yKcf6DJxOAWhxKvvNAK61ENGFuJGhncABxEisN0tPLstzUK4OM2JmYQRTHTt
 2qmgnKsdoVJ4tCDD6tjHA==
UI-OutboundReport: notjunk:1;M01:P0:RrSK2UBsjcM=;vVpK3nqudcL8kwyCIVRSJmdMnh+
 f4uDEHHudmqLR8hHQXU32AK28NAnI4PYLX23DNs4WH228Sn52WUiIAkUpNf/tKxWaryv9wmAU
 cnTvEgugdArfu2oZbukfBF3gIlCKdHPPAX96UuB18nYaIlt+32xkw9xS/oBOLCdmRpp+PR4nO
 CIQ+EOMVT9EUYm+kvgms56PUBMCt0gdmssYQ0b27UuTB/6g8rDRzsJ6IHfdpaMVgdsBXAfC6q
 9VY0eTHxYCbc6Eb0L9CJKlrb8h0Z0lS9Uqm7TWAvSSFKCYOf8T1wB0GXjPdZm5RtgsNp0AYcT
 g3RbspD6Tcho6mV13U75etOHJQNriSCvo9ip/gVzP36zRD2gIWNLK30bj+AF4Nc1lW0hVsF4b
 Dav0PkhQkz6fYOsH5J9Ix8fe2+zpfZ8JdpNs/VFlcj3LudELTSYSlzen8PbB+U4vYIaECIIfl
 6mUatMhGiEFUNpVBe/5UVm2JczUSm4R3991umOuOCfBa+PPNwsJJJJ0htUecl8tzuntQ32Frx
 jAbjcRnubM2OkP8AnkZGMNecYQ6d35bBzAgMeXAQCklXk3E6C4iaymDUV7Yzm4aiRnoayfViv
 9NAtGgSrPjHk3X57x6kO4VFwSKi0+M4zXIHypxh6NIskdY2PRSD6zWG2T+DMvclD22uA7zYi6
 yr8CDlyFNR2bf1woUOuongzjRUG1Cfh0R4iCxxu10YWEg10chbdLsuG68VIKz3SpdtY5CVpdD
 en1q7rH9/pJ2ZqwIXN8cxQ3Pg39jMkirw+PP0rpLZOzRIIb0aRAcjQS6IyG1byMh46yBliXsu
 ywBHouwDqPFTdOc1mbbWwwZM4t1bfCchdMwRTLwcEmfY27yRCjAUOvv0RbA670P0NGij5ak4B
 At4xBMvgpmHEHrLJGcBatHTjm9XR3LRbpcai1ne82pBlu3L1yfwOFDs9u5kQbm/IzMgVu7AIc
 FluTrG9o+R6U7+hvS/pRdAu1AZw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1686141089; x=1686745889; i=dalang@gmx.at;
 bh=hfml8e9cC3jO2aj4xY4lfN2JyKrlI8hIVNeMzXfKyZ4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=OcbUfNk44QWe2FRugYuVD8g28Jgu2vKTHLcVE6DSbar/BRPVMiCu9Gx6PdQxNPjoIyZ0M3t
 ejTtxB+YB8pTwhdnYYmXE+wL1E6yaiUEyJad/dAsf52WqWoADQ1j7nQZbrNJT6ZbYvc55Gm+4
 p+4XIt2JC1oskAZLo2vcnKqNozuL4UaQ4ZusmlK5Jld4i4GS9XbUlRHgClk0UyhxVB2oEjy/Y
 Q2+TH9eYj2bm60v+slXR30H62mIisC41xu6l9xgzhAuFwyDfTuSDIEfJLIA6z80hUbPFeWxNH
 ZfrmE26RU1Sj9CWSdfO0ZUaXtiL3hwykelEAq9l0AmQsIO/Y/V+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=OcbUfNk4
Subject: [Buildroot] [PATCH] package/at-spi2-core: security bump to version
 2.48.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_3/NEWS

Fixes a couple of use after frees when finalizing devices.
Added systemd option to not fail if dbus-broker is detected on the host
machine.

Fixes:
- http://autobuild.buildroot.net/results/a4908a2c8cb75b602794e890fccb8dd42ef6ff41

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index db3ea7096e..8f856e1cac 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.2.sha256sum
-sha256  86ebcb55f678381d7ed7825736add42dfccb70ad3b981dfd65d72e58f87828ee  at-spi2-core-2.48.2.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.sha256sum
+sha256  37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55  at-spi2-core-2.48.3.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index e9a93b3eda..0ca5bc1817 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).3
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
@@ -29,6 +29,13 @@ else
 AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+AT_SPI2_CORE_CONF_OPTS += -Duse_systemd=true
+AT_SPI2_CORE_DEPENDENCIES += systemd
+else
+AT_SPI2_CORE_CONF_OPTS += -Duse_systemd=false
+endif
+
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
