Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BBC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C225608DD;
	Mon,  6 May 2024 14:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2MWAla2hx2i; Mon,  6 May 2024 14:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 737E8608EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737E8608EB;
	Mon,  6 May 2024 14:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 983C71BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8407A81E07
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUcLk8NGGF1C for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0105082024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0105082024
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0105082024
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1rtmBi4BTP-00Bq7t
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:58 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:51 +0200
Message-ID: <20240506144555.31709-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OIvm8XKQS6s+akRTjexoab6DbIYou30Zaicmycv0oTkwcV4257b
 LPctLjXi0H+yDbXsPv8OkSNiZP72Cu3x4eg1KWZJCQfAO0W8g/gSgPQyvrJk8EAR0i2LAwC
 7PklRxoEMUgtrNKGkOIaead3ucpelwtyrLXvESBQcMMlYvkSdmDxhFvvEsNBqLrBhY6gkO1
 HYFgqkpunbuqHFY8VDYjA==
UI-OutboundReport: notjunk:1;M01:P0:F/fFtoeug28=;jhG3YB9bSDfU/GtG1JKrqF6h1yb
 0D9WaU4ZsuBsJZwSDZ24p5e/89ds2teTC39pvRrt+buKa9wQkj6UgW6tPVwDas/x1ewTSHgiS
 SSD5cLz5OARsRaRXpmZq/HbSrs8NYpHDMrKCa8NRJNsW6JHi2GtRmxcSwL4ZQ8d+b6jtuaztP
 S3EhaUQ1er8Pg1AGRaXvbgahNfZeyiDPs71g6MWOYXKAJ/xiMcwVbnh0d2ytnFNTvxsCN58h7
 VVn5V4VUfvzchFT7IZ0YeCJD+sEdWPImn4a2DHeXwSPKKyinS0ylXjET//wpzp/Z3JmsmBY4Y
 Xny6bkjFoMbk6UUpnfnnjIllq5m2MuHgx/X/ZocwFuP7a1XNoYCSVxr3OFEgvX6kQigmo8e3+
 MI12NRo2BqYT5fcBHbAJ9xFT7dlQBJ55C/FUag+Cc3csjcPbREZACz+zYZnSDafS06VmJPmWX
 xuVZmsqHFm8/Ev1fl/kj5DLKNqn3WDhvfKZJvFPW37cnnas8j77xUWitn1XrbBwRtQIFMfe8W
 Fjt3GYRlCrzEgrvUsZp7iccM1yDbzOxHwQ2NBCFM5QXv4ItMHPjZsXdrC0TfyEPoq4NlfUSQI
 qWlf9VK6nNi1IlTP4vFBKp5dHncdJJ8MUFlj1Vy2kBNJD53Spbfo0surSl9HG0mcO9gkx7vHI
 P5lLpUM0cTpqjejlO3W/gL3zBm0ajPy6jqunthyeFw81aSzIY0Z7Ezjg3Fc2csyO/5bw4OyOY
 oa4LPb4hsZCnSwZcvw9tA0VSrfXEeEdbOcCOcnVOcTwKo46ZKurNojrKTGWSq/sf46GHuJ5Fw
 1sZYGX1qKDmesssfEWThBVR3xIQsXWgsqP7iydhC+W1AY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006758; x=1715611558; i=ps.report@gmx.net;
 bh=Yjxb3cWqfv9ZVMz2IYJrLNjRDPp3o4lOys7eKyhvmhA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FqMAk/wareTZXet4PIozH9xu5Qrrt8zx9qAwxdB2fTNeAxNyDHZvXbFVJvvU8H/o
 ayoEUGdQBQrG6OwdSW357Z7pdMDEss392kdrFTlZUhLMed4ivTWWG2BaIp3kHiY+w
 AIBojHgjXkyPnjN3lSyg/Xm4DfbAdPniOQgXxkaJjqRSVoUvTGYVW8wa/sN6LeH0+
 uyiXL4AEqEkbvtbUk33p4WdU7k5/YjdogbpBVZS8UtJ8ZSn0xtWNmA5ExCAlwJ7Ac
 UGn2rv5ksnMgQ6Mhzr1kVl8Nh5Khuf6YUGLsr0GEvUt088W2HEHlEOMisx5jzE3jJ
 EeOa57mDwKRo0r0MeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=FqMAk/wa
Subject: [Buildroot] [PATCH v1 8/8] package/openssl: move
 libopenssl/libressl source statemetns outside of the choice
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/libopenssl/Config.in:5:warning: choice value must have a prompt
  package/libopenssl/Config.in:7:warning: defaults for choice values not supported
  package/libopenssl/Config.in:15:warning: choice value must have a prompt
  package/libopenssl/Config.in:18:warning: defaults for choice values not supported
  package/libopenssl/Config.in:19:warning: defaults for choice values not supported
  package/libopenssl/Config.in:20:warning: defaults for choice values not supported
  package/libopenssl/Config.in:21:warning: defaults for choice values not supported
  package/libopenssl/Config.in:22:warning: defaults for choice values not supported
  package/libopenssl/Config.in:23:warning: defaults for choice values not supported
  package/libopenssl/Config.in:24:warning: defaults for choice values not supported
  package/libopenssl/Config.in:25:warning: defaults for choice values not supported
  package/libopenssl/Config.in:26:warning: defaults for choice values not supported
  package/libopenssl/Config.in:27:warning: defaults for choice values not supported
  package/libopenssl/Config.in:28:warning: defaults for choice values not supported
  package/libopenssl/Config.in:32:warning: defaults for choice values not supported
  package/libopenssl/Config.in:33:warning: defaults for choice values not supported
  package/libopenssl/Config.in:34:warning: defaults for choice values not supported
  package/libopenssl/Config.in:50:warning: defaults for choice values not supported
  package/libopenssl/Config.in:54:warning: defaults for choice values not supported
  package/libopenssl/Config.in:58:warning: defaults for choice values not supported
  package/libopenssl/Config.in:62:warning: defaults for choice values not supported
  package/libopenssl/Config.in:66:warning: defaults for choice values not supported
  package/libopenssl/Config.in:70:warning: defaults for choice values not supported
  package/libopenssl/Config.in:75:warning: defaults for choice values not supported
  package/libopenssl/Config.in:79:warning: defaults for choice values not supported
  package/libopenssl/Config.in:83:warning: defaults for choice values not supported
  package/libopenssl/Config.in:87:warning: defaults for choice values not supported
  package/libopenssl/Config.in:91:warning: defaults for choice values not supported
  package/libopenssl/Config.in:95:warning: defaults for choice values not supported
  package/libopenssl/Config.in:99:warning: defaults for choice values not supported
  package/libopenssl/Config.in:103:warning: defaults for choice values not supported
  package/libopenssl/Config.in:107:warning: defaults for choice values not supported
  package/libopenssl/Config.in:111:warning: defaults for choice values not supported
  package/libopenssl/Config.in:115:warning: defaults for choice values not supported
  package/libopenssl/Config.in:119:warning: defaults for choice values not supported
  package/libopenssl/Config.in:123:warning: defaults for choice values not supported
  package/libopenssl/Config.in:130:warning: defaults for choice values not supported
  package/libopenssl/Config.in:134:warning: defaults for choice values not supported
  package/openssl/Config.in:12:error: recursive dependency detected!
  package/openssl/Config.in:12:	choice <choice> contains symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
  package/libopenssl/Config.in:5:	symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC is part of choice BR2_PACKAGE_LIBOPENSSL
  package/openssl/Config.in:17:	symbol BR2_PACKAGE_LIBOPENSSL is part of choice <choice>
  For a resolution refer to Documentation/kbuild/kconfig-language.rst
  subsection "Kconfig recursive dependency limitations"

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes/ToDo:
- with this solution the external support needs to be splitted into
  two imports/lines...
---
 package/openssl/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 3d14988d99..fcf996f03f 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -28,8 +28,6 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-source "package/libopenssl/Config.in"
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -44,13 +42,14 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
-source "package/libressl/Config.in"
-
 # openssl from br2-external trees, if any
 source "$(BASE_DIR)/.br2-external.in.openssl"
 
 endchoice
 
+source "package/libopenssl/Config.in"
+source "package/libressl/Config.in"
+
 config BR2_PACKAGE_HAS_OPENSSL
 	bool
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
