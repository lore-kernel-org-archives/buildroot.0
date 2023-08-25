Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F0BC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB8D821C3;
	Fri, 25 Aug 2023 21:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB8D821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mgz9P4SKtVmr; Fri, 25 Aug 2023 21:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13ADD8220C;
	Fri, 25 Aug 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13ADD8220C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1A31BF284
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25B1F8220C
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B1F8220C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPumIOQ1gPr4 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:04:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6C2820F6
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6C2820F6
Received: from fli4l.lan.fli4l (p5b3a06c4.dip0.t-ipconnect.de [91.58.6.196])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D90A3A4C0ECE
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 23:04:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48502)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZdyd-00026x-1O
 for buildroot@buildroot.org; Fri, 25 Aug 2023 23:04:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 23:04:18 +0200
Message-Id: <20230825210419.10192-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692997459;
 bh=qKdnwN5rWcQ4gJwR8Lay6nalPHO2lOdSKJYRuv4jyqs=;
 h=From:To:Subject:Date:From;
 b=Q0oKN3HJsU0P3arjNknmSDMx2C/z8qBdiOkZMAGRQ9y+/SA2Xk7gB8MhhcN6yvSi3
 nRgqXoms0euRoNa8WLF58zFKC/QxS48yxXDVQKsTIZR3dno8A7/h+1Kbpw2NlfBpjS
 K0MZyfGKkzejuRyoC64ajuvi7u3O6Kj9GD5bB4oxisRKwYPkslwVOmhjaEuro6nyaE
 OsoSO+eeahk4AbB9kIuIDyZ3U/2cknGJ7pa3e8istpKD3Q6IrGh81w4yovuHi7FILD
 Em+toWl/ASYMWuLeLmzSK0MPMfOvHcxwkLn7Hqh3yVVVSL+IF5Zzml/noeGkzilgee
 N5nsMrZ6KgJlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Q0oKN3HJ
Subject: [Buildroot] [PATCH/next 1/2] package/kodi-peripheral-joystick: bump
 version to 20.1.12-Nexus
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index ba9932c9e4..545ce724a5 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d916506695d71385fe32d9b640e354b895c7a76ae9a9127a76c180f2a3ed8028  kodi-peripheral-joystick-20.1.11-Nexus.tar.gz
+sha256  6fb7ed5f0054409ec907c80a0c3caf62dafed98e746044ced0a26f3060d3b844  kodi-peripheral-joystick-20.1.12-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 2f2cd05a12..eecec4328c 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.11-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.12-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
