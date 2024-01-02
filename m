Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E5C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88893404C1;
	Tue,  2 Jan 2024 21:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88893404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjskaf6um_c1; Tue,  2 Jan 2024 21:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D9B940A5E;
	Tue,  2 Jan 2024 21:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D9B940A5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35A0F1BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E79581CDB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E79581CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cV0-Jq3I9Zq4 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:57:51 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7864381BCF
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7864381BCF
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso9570845f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 13:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704232668; x=1704837468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XB7R2W16usDCdbkJN3VYk88zbBFrdoFvkzNgNsCOs9E=;
 b=LbmQcGxhM1sHFbO1ZkGHa7V65Pl4ogwiYXwzfx8b6k4na0eeDGBsKAvcCaEcoI/lfZ
 MAhzofAOHJAKFVbKV/hXzdKm5kjGYzXd+K308mpl4AMLB9yDPjOOs8CIuDNqvrxmg4RQ
 a+Z23K5pLdBTRyspaVyg8e3akKdXFGyjiWO/SdnFsqGGapYFOaN3VGDJcpHU+ULIx1kx
 TyJYnyIB0V34jRHLqNOxUMzbszPDq8hWWIVZzUohL1prZny3l49b0NQw2AEQW+pPngcf
 3mURJuwbs9ZBOwJsUXQk9NckbnKBDAfhpNlz7mwEK+xYPLS976IM0y0H4EcxPyuHr6hp
 /EYw==
X-Gm-Message-State: AOJu0YyN61cIRoq5dNU2XPJ5gwHD/HzT0Gr1p66QbvnW4Acn0OiVRzIx
 HYJdkmcl9Z0r1VChZFmphzTFj22lrPk=
X-Google-Smtp-Source: AGHT+IFuFiEpY6HTOmt27glWRzMpsv3LS+uZkxdpEKuWzGjupAXr1jIftSZCc9Wa1CeWgG47BjNONQ==
X-Received: by 2002:adf:f044:0:b0:337:4927:c6e7 with SMTP id
 t4-20020adff044000000b003374927c6e7mr410113wro.91.1704232668335; 
 Tue, 02 Jan 2024 13:57:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b00336e69fbc32sm17889276wrs.102.2024.01.02.13.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 13:57:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 22:57:46 +0100
Message-ID: <20240102215746.2334141-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704232668; x=1704837468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XB7R2W16usDCdbkJN3VYk88zbBFrdoFvkzNgNsCOs9E=;
 b=bQcq1pHlerW7RO/lRE7PnszyWGhjpuXhP65Q2+dF17Dl8NDDme9O3MpnPcjUg0uVRO
 xx4UnMjZa/6FI+RW6TPCi5hGggKw4nhek/6AQ7819y0b7mJY0miWeHVL74Hs/NWOhWzy
 he7YPaqgGeU5Nw/SqPN8jdF88GZnmSgUE8FBnzxGmVMnDlcCNZZZKL7BFIkrnvpmk4Bp
 GzYS0ioxwxp7XuWWvxrjk7gQEz/I0LSYuSVO8w3EI5Ias6nVJ8bMndL5y1RNEAy9XyEU
 qSsjgDfEpHHFb9dZS+D+laJPN1q9BOP73wlG8C5xFaIZUDePe6nommA4ZHv3FxLGWS6Q
 2m+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bQcq1pHl
Subject: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.1.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to use https instead of http because of HSTS
- Drop patch (already in version)

https://sourceforge.net/projects/iperf2/files/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...fix-single-threaded-compile-breakage.patch | 32 -------------------
 package/iperf/iperf.hash                      |  4 +--
 package/iperf/iperf.mk                        |  4 +--
 4 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/iperf/0001-fix-single-threaded-compile-breakage.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b93ff3c0db..b5e8c11243 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -561,7 +561,6 @@ package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch Upstream
 package/intltool/0001-perl-5.26-compatibility.patch Upstream
 package/iotop/0001-Fix-build-error-with-Python-3.patch Upstream
 package/iozone/0001-Add-new-targets-for-iozone.patch Upstream
-package/iperf/0001-fix-single-threaded-compile-breakage.patch Upstream
 package/ipmitool/0001-configure.ac-fix-readline-static-build.patch Upstream
 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch Upstream
 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch Upstream
diff --git a/package/iperf/0001-fix-single-threaded-compile-breakage.patch b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
deleted file mode 100644
index 85baf76ea4..0000000000
--- a/package/iperf/0001-fix-single-threaded-compile-breakage.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6405b7a005bb2364466b56f480d50af0be423d76 Mon Sep 17 00:00:00 2001
-From: Robert McMahon <rjmcmahon@rjmcmahon.com>
-Date: Tue, 27 Sep 2022 20:31:04 -0700
-Subject: [PATCH] fix single threaded compile breakage
-
-[Retrieved (and backported) from:
-https://sourceforge.net/p/iperf2/code/ci/6405b7a005bb2364466b56f480d50af0be423d76]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/version.h | 2 +-
- src/Settings.cpp  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Settings.cpp b/src/Settings.cpp
-index aac1b5f..fc5a181 100644
---- a/src/Settings.cpp
-+++ b/src/Settings.cpp
-@@ -1160,10 +1160,10 @@ void Settings_Interpret (char option, const char *optarg, struct thread_Settings
- 			delete [] tmp;
- 		    }
- 		}
-+	    }
- #else
- 		fprintf(stderr, "bounceback-congest option requires a platform that supports threads\n");
- #endif
--	    }
- 	}
- 	if (bouncebackdelaystart) {
- 	    bouncebackdelaystart = 0;
--- 
-2.35.1
-
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 34218bcf3b..eb6088649d 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  7725efffc6ef46fe5247ee326c39e5fa2eadf1eb  iperf-2.1.8.tar.gz
+sha1  e7b669c2e8747df95b59956e83ff53d3971d7a5f  iperf-2.1.9.tar.gz
 
 # Locally computed:
-sha256  8e2cf2fbc9d0d4d1cf9d109b1e328459f9622993dc9a4c5a7dc8a2088fb7beaf  iperf-2.1.8.tar.gz
+sha256  5c0771aab00ef14520013aef01675977816e23bb8f5d9fde016f90eb2f1be788  iperf-2.1.9.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 47944880a3..1347f766d1 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.8
-IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
+IPERF_VERSION = 2.1.9
+IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
 IPERF_CPE_ID_VENDOR = iperf2_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
