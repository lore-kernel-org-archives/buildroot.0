Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28C4EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 963C34176D;
	Tue, 20 Jun 2023 17:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 963C34176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X2r2etkj0uV; Tue, 20 Jun 2023 17:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D324A41777;
	Tue, 20 Jun 2023 17:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D324A41777
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8B41BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 607094176D
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 607094176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYudnga7pooF for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F93541766
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F93541766
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:23:10 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-570284c7e61so55448807b3.1
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687281789; x=1689873789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9F1UlslrpkYl57kD6wTjgkoPwbrZy+ztDRiAWmst/4=;
 b=XF3tTsiTGpes2HJB70gVzVu34IwWXFdOF82TNe2UHRNoyv/TQZKni+vUqrqv5c+pIu
 Lxlf6EPq2QrUmtjsVt9I/2qyFjXCylybAT2/Ujqs1C8BpSWYyNgAtj2ykyWQU6N5Y2+3
 RmOLDb8ItK+i/zn+IhaQvzN5GJVV8H82T9oYNu77e4kDMx9dKZSINUdGlz3e81YSqYuR
 YmHs9uLDG2brvaHKKfX1bpMydhozt6YMnozWwaAsefeX7RfAlympFyeQQYM6lzOrwLWi
 MHIzHYEwwO+0XkS7AGaTpYJ+6xwf3h3QHtDtfH2IfSFalhPQkLtvq4bNXQUHiz6RfCEL
 wd8g==
X-Gm-Message-State: AC+VfDypyWutVl8JCV1LB19H9YvHROzTwdMR2MGp/QGoP/a1Yn+esTb4
 J7oNcnuk9UrTbIPgzyUL8v4iO36xun4=
X-Google-Smtp-Source: ACHHUZ4ScCSeaVze8a0bY7A8ij0WyhV1EdaXxaVTqpRY0kPVSAJdmxdbGaf1abrvYSaEmdXL4xE1Vw==
X-Received: by 2002:a81:6942:0:b0:55d:8cee:96e9 with SMTP id
 e63-20020a816942000000b0055d8cee96e9mr15653301ywc.5.1687281789198; 
 Tue, 20 Jun 2023 10:23:09 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a0dde06000000b00560c2e3ec63sm592350ywe.77.2023.06.20.10.23.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:23:08 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:23:05 -0700
Message-Id: <20230620172305.4176-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687281789; x=1689873789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b9F1UlslrpkYl57kD6wTjgkoPwbrZy+ztDRiAWmst/4=;
 b=H1g6j+eS+SEgcQjGXZ4nRDYtuXQ8+3ZbzJh3NFsbSj7Cc6IcetipthcujKOb5XPeBf
 1GTHe4NlLATBrlidgBhM0Sgo1oKHw+t0yFXL1rbsblpd8VAlQSoJvS3Qsem7Kor0kOt4
 wxNDB1ggMKroaB/6V0ooNuDApqlu3upD4kEMf50QcER0rzKR3y0d1B/job5CqKGxJ2rN
 Mptg+zRyd5Yb2jq4zMCwDwlE1lzp8cjfxpZV8y4Ne3lnArB/A9QCGtZMcR8r6h6/J3fl
 ZL6VvRyNpchX6qjhTJnPvbwdPtsC8SgF593WjvkO6bDnpjChcjOrPvi+0sO/NZWzBawI
 nbdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=H1g6j+eS
Subject: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot always enable largefile support in the toolchains, and
thus the associated definitions are always on. This leads to a
problem in the unzip that on a 32-bit arch with these flags being
passed in

   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64

But, the LARGE_FILE_SUPPORT not being defined will cause a size
mismatch on the comparison of the zipfiles.

    $ unzip test.zip
    Archive: test.zip
    error: invalid zip file with overlapped components (possible zip bomb)

Simple solution is just enable LARGE_FILE_SUPPORT in cmake to get
an expected extraction.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/unzip/unzip.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 44cc2013fb..14ccedd48f 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -28,4 +28,18 @@ UNZIP_IGNORE_CVES = \
 	CVE-2022-0529 \
 	CVE-2022-0530
 
+# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+UNZIP_TARGET_CFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
+# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+UNZIP_TARGET_CXXFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CXXFLAGS))
+
+UNZIP_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(UNZIP_TARGET_CFLAGS) -DLARGE_FILE_SUPPORT" \
+	-DCMAKE_CXX_FLAGS="$(UNZIP_TARGET_CXXFLAGS) -DLARGE_FILE_SUPPORT"
+
 $(eval $(cmake-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
