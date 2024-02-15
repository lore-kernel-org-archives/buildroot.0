Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC04BC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E167418FE;
	Thu, 15 Feb 2024 20:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBhyIEf4gb5I; Thu, 15 Feb 2024 20:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D67241915
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D67241915;
	Thu, 15 Feb 2024 20:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46FFD1BF331
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 20:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412A841915
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 20:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pFyr7GmqyAQ for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 20:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EEA0418FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEA0418FE
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EEA0418FE
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 20:33:27 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so1172395a12.1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 12:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708029206; x=1708634006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WIxbTt+tFKO5NPEycht+GgKGESRIbsSMrblrcnT/AHo=;
 b=ORuHisXLI3V66tHKF9kZuLid4rcax9XPQYYBAThvrWGXSOjedYl5TzJi2b/fZaDx6B
 VIgMMl9ywsEXHyeIDg+6jHrW5eJkZMvCNxdk4Ls+wo1aJx27x7Aa5TtyrffXu/ROwneA
 UIL+04NTgo/uh3HsrFyOGax+DIMVjcCBjKlRmpU+8XfavL9e8Chk260uzLe71ZFIKVf5
 n9v4EmoSt3F4xLhlJKzb7DhYg157YYdoiLuVEpDdb0Hn0AcgXZMMCcuAXU+Cv7DafOSW
 oIYlKvnCx9AmC1wR90k11CUBOvTbLs5D952QS4x74OsMQ6Z1uQs3A3WUYqn7Up6w93uO
 wP4g==
X-Gm-Message-State: AOJu0YwfncuIs7pmTSZkXWvVrQLJZeTX1N6J3keJS0cEQO3ALfSDFpxS
 abgn3pSDwMQuXyYdSC6AAfZfiyc5nIGjOhE3XK0W05wPE6DD2Iq9fJjF+tEBgMs=
X-Google-Smtp-Source: AGHT+IGmI2iW9uuks12f1Tft05lsrEjsgD8dqMcD8MTPZdtpnK81FmrT0WQSweCKmTBnAKORVosuSA==
X-Received: by 2002:a17:903:40d2:b0:1d9:c01a:dee2 with SMTP id
 t18-20020a17090340d200b001d9c01adee2mr3290623pld.36.1708029206365; 
 Thu, 15 Feb 2024 12:33:26 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 4-20020a170902e9c400b001d78a08e8e7sm1656924plk.250.2024.02.15.12.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 12:33:25 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 12:31:21 -0800
Message-Id: <20240215203121.2948032-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708029206; x=1708634006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WIxbTt+tFKO5NPEycht+GgKGESRIbsSMrblrcnT/AHo=;
 b=DoPK/uI9/8xJ8m78o6eBdOP8d3vlDnEpdHiwyKjk0XgYsF7OP87/K0pUuTmqFyeAVN
 Xu26YshPoede73c0UJaUpwdNWNeBH/YqXLBvw45msA89KIdH0689tByInNYuuXCYTDMv
 gOH8L5vWfeKcGAaPQfVi5X04LL/Hj73Qz2Hg/AmBd305isiSADcMEKZEQ5pVnwTftMAh
 Xmkf5c3zoO6ENCvK/q6vuHabpg9wD4r/EzLMA2f4BMG4SNfEeRvb8SAOCdrxAyXsppRX
 sd+QbayuX24mXX/pZFTGzrCPp7YstFeJViYcoCczwoBjRG721I3ptHwN+X7P9nrscTXQ
 JGfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DoPK/uI9
Subject: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.27
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change Log : https://github.com/libusb/libusb/blob/d52e355daa09f17ce64819122cb067b8a2ee0d4b/ChangeLog#L4

Build test results:
 libusb.config
   BR2_PACKAGE_LIBUSB=y
   BR2_PACKAGE_LIBUSB_EXAMPLES=y
   BR2_PACKAGE_LIBUSB_COMPAT=y

$./utils/test-pkg -k -c libusb.config  -p libusb
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: SKIPPED
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index bbb0ccf5b9..8ca68f03ba 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5  libusb-1.0.26.tar.bz2
+sha256  ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575  libusb-1.0.27.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 98a4a578b2..15649a2ab1 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).26
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).27
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
