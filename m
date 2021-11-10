Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F96C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E48560F46
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E48560F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24994048C;
	Wed, 10 Nov 2021 19:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmF2VSZ2R6pu; Wed, 10 Nov 2021 19:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A2A4049A;
	Wed, 10 Nov 2021 19:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 138421BF4E6
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC0B4049A
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zR913WigBuC for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 19:37:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 708A74048C
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636573049;
 bh=2I72aW8Q22HB1FXQRwbkwQOlyqx3xGuAjHvQT205DgA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=A2t/XQ828FCCRx0VF63ooBdX8pGDT/pUqHpG7ZOtORAgX5ATKLZoWQn406gcmh465
 9ixBjfxxTi1tGw63xDFYOK78OXUKeR0RNlo42wsIUIfuRr/yEbWWfEUZVJQl02a2Yg
 7cu94h45HqCS9VI+ioYuwIGJHty+BrBmKJ5h/a9M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b6l-1mmEib3G85-0085AP
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 20:37:28 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 20:37:28 +0100
Message-Id: <20211110193728.28746-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:N88XWULwZIkqfmwKTKC0iOTPDJKwrtznQUtsQj2FC5XmICETNwC
 BwLsmo2Fnvw+umARlYggeHhJAYg0fyu09PLMvvjP9TzZWp5KqNLoOBaKuAEC5Ya98S6Mxq6
 ilFp+5uJTYr3nVEfgqW1GFwk7qSIPqpJwdGewq9MQM9JLkj2qqC1ei8157yuSIDy0iPevR1
 tjTnOxsDHKetRutleJHXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jr1dhQB4zW4=:F8UFIhDyXY2MFyhkr0Ihg2
 CCfUjVzdPfEOo58wWLJd5+fMUK5Wx/dYEboVB3rj0TWAPu38VGEYcV64qhctFXX87YcY4tV6U
 ZpyPhZCXqFTfnJYoEZyeihsCIJcB+/M88xyPXlbSNTM0mAsQfTp15YaNh2mRQgNMvUX5a8YbH
 7Vg/WOA5b/g6L3yBUQmvVLE69lneEF9C5RYSK+R1DjticsSxGwp7mdVI15Yb93ls+hwKHa3L2
 zTSnh/rnEij14WTNU0R4x9H0dvS+Go7P+fPlL9ZgLfeF3FB/Z5RxpwSLITVoLohVJZQu/tQus
 uIIZmlT3SH35k6lrYFoPlk5t4gp87COh0Hc5rxOyNneDlFwEEjm1VxOKYhWdGPB6SiaSdS7F7
 PhFHjmkzPDApH+9eaznZ1ZLDrI1rEEoy8ehO6wERfRre4QtrN6DylNRzV4l87VhLmKF55ljrZ
 myPjyMjLZLR/XmoyvvgH9uv2hz/qHr1WDV+zwZ7oYnEB02nEC0j/fa+pO9dpeNF+dEc0IeDWy
 9Hze5dUMo69v+tsr8BMhoeN5KXciZD99hgaZrTXv+ErhvwkAuy2JqfX1i/lcuu42Q0+LDVmm/
 4zR8Sn6TjnBC9LAlGrOPMhl1X/UMulYV51yTOK4+qqmm2sqCxrIanTclDj4HYgt86KZPTgmUc
 NOhzHyJbnIidZm+xuPs1A1ekbNCnWBiXNanEiokQBrdWXldGWbbsXf4zUmkcbecFTsd3QfoF4
 0aKsUQ4Q54KgksWsmqB9LODfrSIVRErKfYQVfaaBXyN7duK/D/4rVgo8LPnIqEA+P7z3vRzRN
 AHd6dJFMEMVQbjRplms/INbMERFjDseiZ0cL24koDF5ucR96WEIEHtaI2nUXsy/gndsTKctIN
 LkGtn6lSxmLuKLIqxlFELm8kb7aQv18hjDkcOcZiHPtwjBC9L7+jENfhkNlmqNj2CKhYDqKYB
 DyjEn3Z1+y+eIs5r4bXbM9tV/ENjvaJkIKNRvRjbnhZsJORg/TM4HcXizjiznyKfLTGaySrS/
 xWwIUGAwp0VQB3Jpu/1qPH0vmtwXsjW0AMwFGfv57mpg7ZYJPiV6tkxHEJv9qkfBjOVtogXhd
 +8BODqAVENHhAg=
Subject: [Buildroot] [PATCH/next v1] package/ntp: run ntpd as ntp user
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

- in case libcap is enabled use the now enabled '-u' option to run nptd as
  user/group ntp

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ntp/{S49ntp => S49ntp.in}             |  2 +-
 package/ntp/ntp.mk                            | 15 +++++++++++++--
 package/ntp/{ntpd.service => ntpd.service.in} |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)
 rename package/ntp/{S49ntp => S49ntp.in} (96%)
 rename package/ntp/{ntpd.service => ntpd.service.in} (85%)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp.in
similarity index 96%
rename from package/ntp/S49ntp
rename to package/ntp/S49ntp.in
index 66c5f70a5f..11c03b888f 100644
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp.in
@@ -6,7 +6,7 @@
 DAEMON="ntpd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-NTPD_ARGS="-g"
+NTPD_ARGS="@NTPD_EXTRA_ARGS@ -g"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index ff23cdc2b6..3ffd2b6fc5 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -44,6 +44,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NTP_CONF_OPTS += --enable-linuxcaps
 NTP_DEPENDENCIES += libcap
+define NTP_USERS
+        ntp -1 ntp -1 * - - - ntpd user
+endef
+NTP_DAEMON_EXTRA_ARGS = -u ntp:ntp
 else
 NTP_CONF_OPTS += --disable-linuxcaps
 endif
@@ -109,11 +113,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
 define NTP_INSTALL_INIT_SYSV_NTPD
-	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	sed -e 's%@NTPD_EXTRA_ARGS@%$(NTP_DAEMON_EXTRA_ARGS)%g' \
+		package/ntp/S49ntp.in \
+		> $(TARGET_DIR)/etc/init.d/S49ntp
+	chmod 0755 $(TARGET_DIR)/etc/init.d/S49ntp
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system
+	sed -e 's%@NTPD_EXTRA_ARGS@%$(NTP_DAEMON_EXTRA_ARGS)%g' \
+		package/ntp/ntpd.service.in \
+		> $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 endef
 endif
 
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service.in
similarity index 85%
rename from package/ntp/ntpd.service
rename to package/ntp/ntpd.service.in
index 9a0f4c6dbf..b7db4a2878 100644
--- a/package/ntp/ntpd.service
+++ b/package/ntp/ntpd.service.in
@@ -9,7 +9,7 @@ PIDFile=/run/ntpd.pid
 # correct time to work, but we likely won't acquire that without NTP. Let's
 # break this chicken-and-egg cycle here.
 Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
-ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
+ExecStart=/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntpd.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
