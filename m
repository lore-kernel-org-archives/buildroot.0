Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F9C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 16:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BD24B014;
	Thu, 27 Mar 2025 16:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DEgnxDbY_HJ; Thu, 27 Mar 2025 16:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F2747661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F2747661;
	Thu, 27 Mar 2025 16:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 846EC12A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6351E70354
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oMUcd-iNnY2 for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 16:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E31C6FCD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E31C6FCD8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E31C6FCD8
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:49:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1t2uHe3q9D-00uRbf; Thu, 27
 Mar 2025 17:49:25 +0100
To: buildroot@buildroot.org
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Nayabbasha.Sayed@microchip.com, Peter Seiderer <ps.report@gmx.net>
Date: Thu, 27 Mar 2025 17:49:13 +0100
Message-ID: <20250327164913.13610-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1wVzh0p/Dd2v5poYCqeaXAExmiYzKZ1nDl6gEJmw+fnj0g+zdAa
 AA5hsJJaZIV7OUj1EUONBfCoY0hrtrslvTeMFJU0f6EsBbyWCykdzs6GHiiJ+Kon24y81W6
 +6EdIUwvZMFWXNHrXiikLHCjx8c/ghCDh5wckhqAl4CUOBCGVXD3gjEpOByLqgtuTkY7ys4
 17hzlqTdZ+mlnMeviac4A==
UI-OutboundReport: notjunk:1;M01:P0:MNi1PDbTnjU=;454mqS3y9e0DK53U9d8GfXNx8xb
 SqAEKbmV6/RYUSXNJu9yo5n2T7Cq5GhMUe8alXeHjH6plLtoKOxSAvwYH5MyecZKYDQn271b5
 Yj+penU+c4Vl/EJHGwtcekOrWL4bT0aaouUVLJJWG6cHEdgWFAC+Ro2PxN7zCssT1nLPi9sog
 uVDoN+igKTROx8e0eLRumDjkptGSOb41/5Y0cxvZyuUNJekV8xnOAVyjFZGspcj2wXeUent+Z
 NmFG/jgfCcgy+J4nF5nIxFW/k+1oMJDKpEf+bVmUa4zU83w9DNqzhS69rHEoucu3SwkjvrUZY
 Lawiz+lxVd5IuBZ5+eDgk6geY93HjMhktsbeAygHhG7z4tr6gtE1ADy1kVnlZCGtj4vHUA4gU
 vJmoZHEf5/iqkZgRvWMn3hsSziSdy/Y0lL9MbcdnWKlA5yon5aP7Bv2Rt4UtUYwA0D/0dwi0L
 OzA2KA3tJBUD8Pmcu5+HznRzS2ga8S5RjFGA4oULwqfUhWJI6GCQP6KETWjUc3QQGWwaMy+Xk
 RdlLxwxiGMTfiSOc+J5THkRgUkq3xvK5ex6h2TeWWXP/xj8S/I2TByIDlvbW4SCETf+NxBoIn
 vey31TKkq7EICbP6iL/xVTz9E9Ts48qy3hLiy3qfnine+69PDX8JulIaVXNQnfDiPDxsmjoSP
 1sy8HB8JOlbs0ewGCMOv+WaKj4HNhe5I64H4R0owZWLr88TE+/6I48kyH5lISpUMGzoErfc9d
 1Klarm6XpXG/Xmzagth8iN2rsQsZscYmLSW9cXYyFRHZ1oxgnWTwk66MBRAr8y+rdwhFQebKg
 p5ExhFk3Mj/HuCNKvFtBjaduF8zpU0n1/jpeBIllYLU/PGnIZA5KXDIF4kF6T9t9jdyJhmeIR
 Rx0DEh49o4bfjlg+/QyGwr9DHKZy7RcYLpdo+WV+x3Dp0fKOl2wLbIixv8SM7fG117psQ92d1
 rZ0jzqXtDGC1yYEPW9ze3DmJghf8Zv1sEpqp+owwf7OQRoI0uyIzoq9IkNkJg2DbfdYlY02Uo
 irVvB7vGY/QkOp9Rmy29zwQZ7gJ8YOn/FBpa97l8dTlItKJjLeecEQUATv1Lpystuw6lZ/dW7
 P+KzJM+Fi5fnXe5LhAWrmPx6Gqm8uUqKW9YavLWvlbijKhvSXCua90shnAcGEHD8QnKf1g7Vr
 vqQZ8kLgyy9LW8Q1yjB5JjayiJqg3dZaAg//xS1LugP6ffPRos6EvBZdj0JznhWU0UHTWwjFN
 q4unciRsjdM2b40UMC7tqq8dU3BsAbxjk92AIqF8dppvc3XbE09E0rXZQZKPdwjhUhk2ZH0vl
 TCww/VjZswUjTkB4ZXssX9COmyJ3xwXz/oJPYp5am5Ajps32V4T0SEUX0lxvPS0Cc6I0S6myA
 UeBiTRp+GqScvUxtK8mqoNucNMnxrQSXYjb3Wjbu1QC9QLjVHu3gOOD+Fp0itT8tUnwdeSh5x
 M9HmqRQKGYsBYkLvmcLt5DjcTlasjg1j0xjS8eZGSCbZv24/kvBIyrUh2q1kvTrO+Usemsg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1743094166; x=1743698966; i=ps.report@gmx.net;
 bh=cc7jznxJKhM7QBs/PpBGc8+3znYhFXEOGDNjAsXRbNw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NRyPwX2oF1a5PnmddZBv4siqIHAsKJnwCAJnraq/+gO2p6VmPX8TDav4nrb4XMpR
 pYJ5Rdkml1RqJ4938Ykyu2vV1sxUe21jZhjLCCI2D4FIyCmPDCvIhn4Gm6TNRtFf5
 puxOb6SAzjbZAO2jzpnPIS1QqpM5+UHiUMaAgTa0UDEke+Z/SV+0gJ5z8ll1Gc8/P
 OykTpa+s3mDPgNo6zzV8Qr3LUkOJoD0a41Rkho4G8U/ZTRs4TJkc98FyaS2a6bk+p
 ML8tRrajRtSm6vIv4lCvpD7iIkAScYkoEUrwlNb/2ybHd2vDyTeiAI81k51UvrTGw
 h/47f3cS2hyfNrY7kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NRyPwX2o
Subject: [Buildroot] [PATCH v1] package/v4l2loopback: fix v4l2loopback-ctl
 compile/install
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit [1] the original v4l2loopback-ctl bash script was
replaced by a C version, so add a proper compile step (and remove bash
runtime dependency) to fix '[help] v4l2loopback package build fails for
raspberrypi5' [2].

Fixes:

  /usr/bin/install: cannot stat
  '.../build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl':
  No such file or directory

[1] https://github.com/v4l2loopback/v4l2loopback/commit/33922fa4e9965d400edcc2761e55fedf84bbb22a
[2] https://lists.busybox.net/pipermail/buildroot/2025-March/775911.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/v4l2loopback/Config.in       | 4 ----
 package/v4l2loopback/v4l2loopback.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/v4l2loopback/Config.in b/package/v4l2loopback/Config.in
index d8ca31e577..4bfa9a4fdd 100644
--- a/package/v4l2loopback/Config.in
+++ b/package/v4l2loopback/Config.in
@@ -14,10 +14,6 @@ if BR2_PACKAGE_V4L2LOOPBACK
 
 config BR2_PACKAGE_V4L2LOOPBACK_UTILS
 	bool "utils"
-	depends on BR2_USE_MMU # bash
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	select BR2_PACKAGE_BASH # runtime dependency
-	select BR2_PACKAGE_SUDO # runtime dependency
 	help
 	  Install applications to interact with v4l2-loopback devices
 	  ("virtual video devices").  Currently there is only a single
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 0e1d20c0cc..a4ddf5e2d9 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -11,6 +11,10 @@ V4L2LOOPBACK_LICENSE_FILES = COPYING
 V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
+define V4L2LOOPBACK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) utils
+endef
+
 define V4L2LOOPBACK_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/utils/v4l2loopback-ctl $(TARGET_DIR)/usr/bin/v4l2loopback-ctl
 endef
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
