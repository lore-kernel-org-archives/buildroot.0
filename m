Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D4606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R2BFehEB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E81D81248;
	Sat,  7 Nov 2026 12:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yk9zZAmEygXE; Sat,  7 Nov 2026 12:13:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 63E9F81232
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794053616;
	b=WKlrTJmYCN+/ka7odrUTp6LNAKTWdMHXF0qQ5Zt0Et8Vl04zYM7WcfEGAncAcOFLa5EN
	 X4+4vL+POZuIqeRm9P6NaLxtftxxTprmFpmGEYxgYZZk9H3yxB89AGqATIILQGAq/tHA3
	 YT+ipwuuxSqC283b7Cz9RaTTGVRN12E9elli7llHVs7NZaBk68gl1pOKpt+pNfKqNpvRf
	 p/GJodo5LDdvDnyvpGHg23Tb4SXbKW233LNHSMLeR7dqp5Yzgzm2pEGmeTLjaeT90bGTC
	 0w2wDS2UnoUT7KgTuFmzuC7hXzW8jvHl01EDLitBbvUMkUUmTAuhuH2HwTdju6CN/XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794053616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=54SCNNvDzqxHQ3FY7i79IoApZCVyIUydimNzxvgoKmY=;
	b=WR5jKOQ+yMll5GcMuYvYW3YxI08hwjQApODc55S78TkCtihvTkxKF4ZKJDboluVgnoTZ
	 9xIS7ewDg4rDyPk1WP5adxekDKxQ3qrB3KGKaMTSGqBKDCP4s4mmPxIai3Dy0KyWjRj9V
	 YXtNc6Evuo2aejPv+Ij2oNA99rmR5qmdwp3GMoqI9uEhPwQg5z8N5tDkYvC8W+SAS87No
	 JDSr5Tr7qk9Qk5T7vyEg4ScqXlELHbaR31Qb92Wr41iS74cb7mQuF48rCFSGkEAURgZB9
	 x1qe3bfrQyJp4mKQiBoNDiK6ZOZK4nPaktHv2VSG4q4wWmxhe0PRi/1261KQvH5JWow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794053616;
	bh=54SCNNvDzqxHQ3FY7i79IoApZCVyIUydimNzxvgoKmY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R2BFehEBMGqr/WwQF4hLenqYhSo2CQpfaYNg6i50GjG/HZCoYOhnW7mWTqOBvU1vJ
	 yoH6bulA53vLaVZdQzFcworSBSYqeT0mTIwseuzPh46P++Z1IAAZg0Q5Ak3xvp/HCG
	 ywSotLaiQWz/stcHWYYJwSSgkW3n2G5cVELkcjjH+NLUJ59sxjl6Zl8gHOX08wqnV8
	 DgncB7QJLeBVr0CfWucHU9Hjrkw+1Qw1DScoAGCCDlC9ZHrXaVFc1mcHDrO9hjAIxb
	 5gHc+lAvTh81EQicSqxQWZ83kTRoC/NLWVzLN3dl+SLTGjylCdE86Sl3Er/jXyq/Ze
	 u6zS9xUIlZr8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E9F81232;
	Sat,  7 Nov 2026 12:13:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94689211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 12:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1BE407CD
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 12:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCBA__ag0BN8 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 12:13:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53BCF407C6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.221.49
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.49;
 helo=mail-wr1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53BCF407C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 12:13:32 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so888213f8f.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 04:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794053611; x=1794658411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pKxA14KYLSt04yTp2Qcpn7q+2+yemTd+O3Ihxne7dTM=;
 b=DhGN12zEsn3ow17/GQClQwuZ3KsqrYmrKJpmPin9NcKTYglBPaP0EoEjJm95ETv7UG
 kUKsn2E7H4afuUX0dW/qidskEmeO1PNUTh2jmuIFioVF1Pq7/jwJI/JTu8ryQyvnLVP5
 U9Lx+tFcOJ/aB8SEOO3RswwcHfmjRyQs5bGFHx98VdsNCHT5nWtkqtMxh3rFH+YZQyOF
 vKIMBnp0rGmiEkOTipUfJPB6hXQ5LXA71eztANVh+Nvtbog2brXjAm+NAaJ98adFwKvD
 rIllJf0tho1Fc/y1jqNRiRnz4fm3crB2UkL4yyBcQqayQ19Dk45JL/nfDlmBh4x/D4G9
 hbSQ==
X-Gm-Message-State: APuU4Z8NI7lG+g89J9iiab+fwnabOCS8O7a9jMFdYib1L08hIrZcR3xF
 Hi91emP0+Nzr2ABmczyMDr9Z+vIoqYgaSA/CS6USaknJP+yq4i0VbSAA/8fApw==
X-Gm-Gg: AYBFou10ZVZiwXc5ekdHxw1+Mzr89Xivhs1SCPEv6rCy5tbItgTcAnzMp/prAIUMJdX
 TD1IWFg8HJ77C308H7nUOjgsIKhX4M41ilreT6EyDSrp2Mjlnq/gV/0ykOof4wOcWYC05+KvS/3
 1k/1MLskJJrwJd+flIWnYOY2IggygzH+QgY6Oi8LIXMb9CB+9VRXptB+VrCquW7qosQIZ4ElRYc
 akHsvBxqoXAsIBSTiU+7nzf7jIzxxp6wd2Tpt7QWsBtANWHOvWiOS7s4CuW0NfdYz7UFWyVjeeA
 bddGEWqEBdJXr4BSiq47tmO1yFuvTJdqJU0gsVt1rCkpQYqGzo41Cs7VbTx3lw9dOFLDpMlq3xQ
 lRYQctbZ3TRsfeSCQlB7TPLJxsylCE5lXbxt5Siku5MDCDt7qvQkj5SfXhws87MpNnchf7HNGWC
 UOA8z26LzYRZEITnnqM3PrcTbhfSFmZr0y8eW02pdakl2JzmCWNzg5i7B++cSuId9BdbSAMpaDC
 I5Je0oSu8KdFs25YIOGcQnNAzd76kp/o20wE+d8ESelh0LLFA1IPWRHdz3Uqs/OKj3dms5wVW0m
 kHC42nSgzkTv8rv45PgF1BJaJRajZX0+mUHHUMvYLpZPHRujH1bs+lNMZSSRw+6ffUUBZDG5AXM
 nczO9EUQ0EdK8t0xcDaR27OJZ7Ap2Ro2upVVjzk2lCEdtVXlLPChl/qkgTjDo8aVE
X-Received: by 2002:a05:600c:4fc9:b0:4a2:d99:3171 with SMTP id
 5b1f17b1804b1-4b6e017053fmr94039155e9.23.1794053610783; 
 Sat, 07 Nov 2026 04:13:30 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7d98:2a79:132c:8f8c])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb0d7a7sm63801545e9.9.2026.11.07.04.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 04:13:30 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat,  7 Nov 2026 13:13:27 +0100
Message-ID: <20261107121327.1314641-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/util-linux: update license info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Audit all source files and README.licensing in util-linux 2.41.5 and
align UTIL_LINUX_LICENSE, UTIL_LINUX_LIBS_LICENSE, and their
corresponding *_LICENSE_FILES:

- Add GPL-2.0 (sys-utils/lscpu-dmi.c, sys-utils/nsenter.c); drop the
  outdated comment claiming no files are GPL-2.0-only.
- Add GPL-1.0+ (disk-utils/fdisk.c).
- Use BSD-4-Clause-UC to match README.licensing and
  COPYING.BSD-4-Clause-UC.
- Add libsmartcols to LGPL-2.1+ in both util-linux and util-linux-libs.
- Add lastlog2, liblastlog2, and pam_lastlog2 to BSD-2-Clause, and
  include BSD-2-Clause (xxhash) in util-linux-libs.
- Add EUPL-1.2 (schedutils/coresched.c).
- Add crc64 (lib/crc64.c) to MIT, and include MIT (crc64) in
  util-linux-libs.
- Add Public Domain (lib/*, mcookie, setpgid, setsid, line).
- Drop Documentation/licenses/COPYING.GPL-3.0-or-later since GPL-3.0+
  is only used in tests, build scripts, and the disabled hwclock GPLv3
  date parser.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 .../util-linux-libs/util-linux-libs.mk         | 14 +++++++++-----
 package/util-linux/util-linux.hash             |  1 -
 package/util-linux/util-linux.mk               | 18 ++++++++++--------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index d434a8f461c..53b9fb05ffb 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -13,13 +13,17 @@ UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
 UTIL_LINUX_LIBS_CPE_ID_VENDOR = $(UTIL_LINUX_CPE_ID_VENDOR)
 UTIL_LINUX_LIBS_CPE_ID_PRODUCT = $(UTIL_LINUX_CPE_ID_PRODUCT)
 
-# README.licensing claims that some files are GPL-2.0 only, but this is not
-# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
-# (but we disable that option). rfkill uses an ISC-style license.
-UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
+UTIL_LINUX_LIBS_LICENSE = \
+	LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), \
+	BSD-3-Clause (libuuid), \
+	BSD-2-Clause (xxhash), \
+	MIT (crc64), \
+	Public Domain
 UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-2-Clause \
 	Documentation/licenses/COPYING.BSD-3-Clause \
-	Documentation/licenses/COPYING.LGPL-2.1-or-later
+	Documentation/licenses/COPYING.LGPL-2.1-or-later \
+	Documentation/licenses/COPYING.MIT
 
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_LIBS_AUTORECONF = YES
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index b6393d6ec01..4f1378fdbd6 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -8,7 +8,6 @@ sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Docume
 sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  Documentation/licenses/COPYING.EUPL-1.2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-only
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
-sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  Documentation/licenses/COPYING.GPL-3.0-or-later
 sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
 sha256  8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348  Documentation/licenses/COPYING.MIT
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 9ddf48a343b..d973b33d401 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -12,17 +12,20 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# README.licensing claims that some files are GPL-2.0 only, but this is not
-# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
-# (but we disable that option). rfkill uses an ISC-style license.
+# Some files are GPL-3.0+ or LGPL-3.0+ but only in tests, python bindings,
+# and optionally in hwclock (but we disable those options).
 UTIL_LINUX_LICENSE = \
 	GPL-2.0+, \
-	BSD-4-Clause, \
-	LGPL-2.1+ (libblkid, libfdisk, libmount), \
+	GPL-2.0 (lscpu-dmi, nsenter), \
+	GPL-1.0+ (fdisk), \
+	BSD-4-Clause-UC, \
+	LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), \
 	BSD-3-Clause (libuuid), \
-	BSD-2-Clause (xxhash), \
+	BSD-2-Clause (lastlog2, liblastlog2, pam_lastlog2, xxhash), \
+	EUPL-1.2 (coresched), \
 	ISC (rfkill), \
-	MIT (hardlink, flock)
+	MIT (crc64, flock, hardlink), \
+	Public Domain
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-2-Clause \
 	Documentation/licenses/COPYING.BSD-3-Clause \
@@ -30,7 +33,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.EUPL-1.2 \
 	Documentation/licenses/COPYING.GPL-2.0-only \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
-	Documentation/licenses/COPYING.GPL-3.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later \
 	Documentation/licenses/COPYING.MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
