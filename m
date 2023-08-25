Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D2C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 19:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A9341839;
	Fri, 25 Aug 2023 19:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38A9341839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVlxg2j8wfDQ; Fri, 25 Aug 2023 19:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89BA040296;
	Fri, 25 Aug 2023 19:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89BA040296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 937601BF329
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 19:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3DA83CB6
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 19:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3DA83CB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF0FkFtzk6is for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 19:56:52 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AB9E83CAC
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 19:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB9E83CAC
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5922380064bso15238117b3.2
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 12:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692993411; x=1693598211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsj6k0snAXBxbgwDeHxx1GY2unSv/drW6sMq1NWPA8s=;
 b=litdAh1F1hLRVwl+/oAN7rjvhr+hgmhGpb4dSqtGBFkME18th1se5/LbRwpJix5xiO
 ZkqiiYmxN/VWJNKUp5S80FAS0+efrMXOEoy2KefMyDCzrvBOOS7MNk++5zaGoxeuT6jy
 I9AEIa+F4jMhutCChnlHgOhL4KyKsHJR9iPKrnUaiHmet1uOwBF6ZiGKynygNY2SyqOu
 5P/nN/bGmwne3dm2EpAPkWh63kZfwhIYwTJGhcshlpucOGZ4t0olCO1VCvKfidXTh5d2
 BUAvNH88AECcsgTxhCfBbNd7/XOfBR/8jcLMc6FAyf8TXDQmMb/9ngBmBkUICBKMkght
 zm7Q==
X-Gm-Message-State: AOJu0YwoU/8sgJBfGRdQVyj7jg1DTD1NAz2BImmKZmTl9yNqNsmOYjUw
 px4iF2BKPShWYfTH1cYtJFzk4Hj2AYw=
X-Google-Smtp-Source: AGHT+IFG6Jodm30Xkcn92nkspR91zPuSMzablQkmJPga0W0bnZvYKrg61betfK5/nNUoMlMzUnLwZg==
X-Received: by 2002:a81:520b:0:b0:58d:7599:676a with SMTP id
 g11-20020a81520b000000b0058d7599676amr23781975ywb.37.1692993411072; 
 Fri, 25 Aug 2023 12:56:51 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:2927:41dd:b38b:c08b])
 by smtp.gmail.com with ESMTPSA id
 w126-20020a816284000000b005924fb1be44sm673076ywb.139.2023.08.25.12.56.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Aug 2023 12:56:41 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 12:56:35 -0700
Message-Id: <20230825195635.30709-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692993411; x=1693598211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gsj6k0snAXBxbgwDeHxx1GY2unSv/drW6sMq1NWPA8s=;
 b=qSco5tiSs2zCafBa7L6G3ILc8FIt0azPHzi5JqR/aEVgVsL0mHtJVjQOW3qKc3jrNh
 Uq3E6Q7ec40ECE2t33j5bJDtAm8h7IqwBa1GlSG5UUWbKYTWGpxQqRqrzAxuILglbyWH
 TG4khj0d7x6yyrV+HOniJigL1f62ZfYkeyr1sdZy4cdNNaB9sDBel/kWdqY5spF4oS07
 3Ulgaio5JSa5KAt/SjGR3IF8DovQUNSVPD182EaS11tVbyLP0wCRV9m2ypN1pHtoPkgU
 8GyVRBaZGJEkRuFJHO4PUB8MyhnFbz+vQgqENSXCNv9LjyDBIpuI7xyuF7q4aZpUlyB2
 3SdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qSco5tiS
Subject: [Buildroot] [PATCH 1/1] package/python3: add the configuration to
 support python curses
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Working on another project with the buildroot sdk and there
was a python configuration script that could be started from
the build which required the curses module. So, instead of
switching python interpreters just add an option to be compile
with the curses module for the host-python

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/python3/Config.in.host | 5 +++++
 package/python3/python3.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 77d608bdc0..88c286c55b 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -12,6 +12,11 @@ config BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	help
 	  bz2 module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_CURSES
+	bool "curses"
+	help
+	  curses module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index bdb7cfd22f..8d88a825e6 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -25,7 +25,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-curses \
 	--disable-codecs-cjk \
 	--disable-nis \
 	--enable-unicodedata \
@@ -58,6 +57,12 @@ else
 HOST_PYTHON3_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
+HOST_PYTHON3_DEPENDENCIES += host-ncurses
+else
+HOST_PYTHON3_CONF_OPTS += --disable-curses
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
