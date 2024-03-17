Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87892C54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B02818D4;
	Sun, 17 Mar 2024 14:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFx7m3uwRr6W; Sun, 17 Mar 2024 14:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B9B8190B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B9B8190B;
	Sun, 17 Mar 2024 14:47:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9EA1BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A7D38194C
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-oyNTtJYbbn for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E2B48190B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2B48190B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E2B48190B
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:47:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3416df43cabso201454f8f.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710686824; x=1711291624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PB73wOfK4DC1ov3PVVEatp4J539QJHbBJfk33uyXDcM=;
 b=APgHYks5Csegw/CcMtIQphfB00AVGI3dNQUf3KPJ7prvwCRubOEtleWSiJsr9c+t0d
 eXFFzX4xc+xgFI5xPgvWjJ0nPU2c6YOpk/rzdaB3VA6JuOC4Fu0nT398rcd97Ji6ezh9
 qBo7ydhgS+dnWuZugV8idei/Oxowkeg4y6jBMqK0f2bvoWTT8C5a+brcBAygVpeWZUVz
 VBF78bGoNuqb67MKEaYQEeNV5vNdZdP3XzbN73d1L59xVpqtsmm2kJP6UXBdK0Qllr+c
 LGGFcQb4+cqXCj0x7FshfdV6blVJ7cCBrj1g3mzislrT/EbJJjIsJcUoRAbw7LHhkuOE
 5STg==
X-Gm-Message-State: AOJu0Yx7x8xY+L4q4mZseFHzxjsI6qYWR9uxnLY21cWP1MhVw1QVGtW9
 AnB+b+UcNGIWidkiWqtl8QgIjqxs0WeAFGWTDXzCiaauNtwel9iKE98p0uDs
X-Google-Smtp-Source: AGHT+IFaVNJVmxNktgVjIRxNpY2WnmnVauFOD4oc0gFWt7K2kDzWjxIFBm4erzLthLzoBT8sHXytjQ==
X-Received: by 2002:a05:6000:188b:b0:341:715e:36d4 with SMTP id
 a11-20020a056000188b00b00341715e36d4mr872753wri.29.1710686823847; 
 Sun, 17 Mar 2024 07:47:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d5684000000b0033ec6c8e780sm7565125wrv.102.2024.03.17.07.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 07:47:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 15:47:01 +0100
Message-ID: <20240317144701.1042537-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710686824; x=1711291624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PB73wOfK4DC1ov3PVVEatp4J539QJHbBJfk33uyXDcM=;
 b=KYIe+2kuWAVnJ1SlsC6JADlKmB5nqrb4+5ik02TpzXRyeYckvVksA6NfQjfRdJyOgj
 vygx+mR6zbnihBzzQPG/d7EMR56fJT7x5M5Ba1qu02ouHmVJWLhLL9r4Pd2YzptbO/4p
 JePX1xIq6WHzNJezP0DAaV73+vrNZ4Gz3IzrOw4N/BWkxBzUpoO5p60WPXupZbM765GZ
 Tfkto72BvshnGKlBUF7znb+Z6+zQA+TRmgeTB418aU0HO51POiUJIM9eHy7ZiN1FDpzg
 M3pKB0WhtlbC7S4kNb6tEAeHyzEHZi805jx27ixZCCc1Gul3EZMfjK9O9YSbX50sAzKS
 QHHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KYIe+2ku
Subject: [Buildroot] [PATCH 1/1] package/mraa: fix build with musl >= 1.2.5
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
Cc: Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with musl >= 1.2.5 (raised since commit
f7f03445cf320adbbc41270a806b38c911d3454a):

/home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c: In function 'mraa_count_iio_devices':
/home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c:341:38: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
  341 |     if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
      |                                      ^~~~~~~~
      |                                      rename

Fixes: f7f03445cf320adbbc41270a806b38c911d3454a
 - http://autobuild.buildroot.org/results/1f16df70e49a9f8823a791c0fcc677de07136835

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../mraa/0002-mraa-Use-posix-basename.patch   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/mraa/0002-mraa-Use-posix-basename.patch

diff --git a/package/mraa/0002-mraa-Use-posix-basename.patch b/package/mraa/0002-mraa-Use-posix-basename.patch
new file mode 100644
index 0000000000..3c5c99f031
--- /dev/null
+++ b/package/mraa/0002-mraa-Use-posix-basename.patch
@@ -0,0 +1,45 @@
+From 47c3850cddd63cebd9dc48e411963314449118f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Dec 2023 19:16:35 -0800
+Subject: [PATCH] mraa: Use posix basename
+
+Musl has removed the declaration from string.h [1] which exposes the
+problem especially with clang-17+ compiler where implicit function
+declaration is flagged as error. Use posix basename and make a copy of
+string to operate on to emulate GNU basename behaviour.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/eclipse/mraa/commit/47c3850cddd63cebd9dc48e411963314449118f1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mraa.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/mraa.c b/src/mraa.c
+index 653ea1fa7..b556d0455 100644
+--- a/src/mraa.c
++++ b/src/mraa.c
+@@ -12,6 +12,7 @@
+ #endif
+ 
+ #include <dlfcn.h>
++#include <libgen.h>
+ #include <pwd.h>
+ #include <sched.h>
+ #include <stddef.h>
+@@ -341,9 +342,11 @@ static int
+ mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
+ {
+     // we are only interested in files with specific names
+-    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
++    char* tmp = strdup(path);
++    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
+         num_iio_devices++;
+     }
++    free(tmp);
+     return 0;
+ }
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
