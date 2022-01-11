Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D60BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93BA883EDE;
	Tue, 11 Jan 2022 22:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DtpomwWiDgB; Tue, 11 Jan 2022 22:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C494983EDC;
	Tue, 11 Jan 2022 22:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37BB21BF3DE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 262C383EDC
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ux0tDYw51tH for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B84283EDB
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:43:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e9so938834wra.2
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sz6Scl2o1Yz0670AtR+wAnPER0fEIOJWkSOgt1xv2sI=;
 b=GlZd1NrzYB7VJi3BBOjZoR4b+Sbi/G4PeNLckAFoA0UQQhcKennDEQ0CwxQ/r/8vm6
 Tw1vfueZnTHv01SldXB+X/wrWxzLeNqKDrYVG968mRVYCcqiR4d6vblpkpB8V60SJRRH
 tHwpkyo6jj5oyXZ/fMJOw/Axf+MTu1f0mcjCpNRAujPAWKfH96abljpjI3wymiVsx27X
 xgwDqVd2R9HuySFUdOIbwQasVX2+fpiUJLnPMDE4GImIVhQG6twZonyBnpMY4kOIAYeG
 5IGNWmaZ0NU2LSzxrxD218acSaCffoTZXBj8lsldEo2BWCqzXutXuIeYESjy6mbCkt++
 xFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sz6Scl2o1Yz0670AtR+wAnPER0fEIOJWkSOgt1xv2sI=;
 b=thskadtIOjSLDYXLIjy5tRnCRwVPXnMUqYryzLjokvpSNa+7+794JZG8hKc9oBnEPp
 3fq3rkS/BTknoAHhw39JNPYWbTabwhFoeLGTpoHoW0jfO0DL9kgJDhMyPyhX0tY16flo
 6D+U2eFyvWPtGYyCIT3+uHMN8RA+hx7x1OIhuPp4ipAcKQLEzWvnlOvnFU3IKEHlYHyT
 Ev9K1UuHSm8Q4ew/jKhJQegqthJdUxD27hHpdTMonRSYvMwNzro3aqG1b72UeeyX0JVY
 l9Q3Y8rxDD5N/JlY9spm+UlY8BJrZ/qSKg0EMbRqtKNMAqMPKojUw4B3g9xeME2h677H
 AC8Q==
X-Gm-Message-State: AOAM533G9l7hzSNywilL5iPJBk+LBCp0TKnp+RbesRcWeYm8moB2rtMP
 AFrPdMMmCZacP/qnyklW1QxsolnHFpE=
X-Google-Smtp-Source: ABdhPJy7LqKPJ9rUOxvVzf3bMSN//aUXGn6k/pYqRXuFpaMJ6JroggBxOm7mPobs4qYA24RU9jfD7w==
X-Received: by 2002:a05:6000:114d:: with SMTP id
 d13mr622415wrx.32.1641941030243; 
 Tue, 11 Jan 2022 14:43:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id j16sm9728081wrp.76.2022.01.11.14.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 14:43:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 23:41:56 +0100
Message-Id: <20220111224156.2800195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snappy: bump to version 1.1.9
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Disable benchmarks through option added by
  https://github.com/google/snappy/commit/4ebd8b2f23dd4ab67ca695256a128cd796d39ce6
- Update indentation in hash file (two spaces)

https://github.com/google/snappy/releases/tag/1.1.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 +++++++++++++++++++
 package/snappy/snappy.hash                    |  4 +-
 package/snappy/snappy.mk                      |  4 +-
 3 files changed, 75 insertions(+), 4 deletions(-)
 create mode 100644 package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch

diff --git a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
new file mode 100644
index 0000000000..bd2ef07794
--- /dev/null
+++ b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
@@ -0,0 +1,71 @@
+From 0c716d435abe65250100c2caea0e5126ac4e14bd Mon Sep 17 00:00:00 2001
+From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
+Date: Wed, 5 May 2021 14:16:46 +0300
+Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+
+Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
+fix the following compilation errors and a warning with GCC:
+
+[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
+/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
+-I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
+-march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
+-DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
+/tmp/snappy-1.1.9/snappy.cc
+/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
+function might not be inlinable [-Wattributes]
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
+unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
+uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
+char; ptrdiff_t = int]':
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+CMakeFiles/snappy.dir/build.make:137: recipe for target
+'CMakeFiles/snappy.dir/snappy.cc.o' failed
+
+Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
+inline specifier.
+
+[Retrieved from:
+https://github.com/google/snappy/pull/128/commits/0c716d435abe65250100c2caea0e5126ac4e14bd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ snappy.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/snappy.cc b/snappy.cc
+index 79dc0e8d..51157be2 100644
+--- a/snappy.cc
++++ b/snappy.cc
+@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
+ }
+ 
+ SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+-size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
++inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+   const uint8_t*& ip = *ip_p;
+   // This section is crucial for the throughput of the decompression loop.
+   // The latency of an iteration is fundamentally constrained by the
diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index c08c5b7fe4..b49b0e7e3b 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f  snappy-1.1.8.tar.gz
-sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
+sha256  75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7  snappy-1.1.9.tar.gz
+sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index e1fa28fbce..d31dcdd5fe 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.8
+SNAPPY_VERSION = 1.1.9
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_CPE_ID_VENDOR = google
 SNAPPY_INSTALL_STAGING = YES
-SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
+SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_BENCHMARKS=OFF -DSNAPPY_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
