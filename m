Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABFFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7673D60FED
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7673D60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D59A400F5;
	Fri, 22 Oct 2021 19:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMKOA7dI7ZAK; Fri, 22 Oct 2021 19:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC90401C1;
	Fri, 22 Oct 2021 19:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2131B1C1127
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1173483916
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMsfFdD5noNZ for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 19:07:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0F5838ED
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 19:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634929623;
 bh=OBILJUSIPMzljpemwSGLgQyLSSUS/oei6hKPJS1rlyU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gcqW6aBbpuKPQt4xQtzTPuLbLGdc24qeDvOMdMavw8zD6xuS8MeVhHEHjx3zWgbfS
 SYJMXmTPxQQq/XTTOehc3nnDwTxzAnPRdyukHc6IFrsWvRglS0UxTgFQlUwTvPwLHp
 mNZoaQBkzwLESQwCdRSeZ53RHXb3617Ybec7Fahg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.153]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MSKu0-1mFtQk42Mi-00SiYR; Fri, 22 Oct 2021 21:07:03 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 21:07:01 +0200
Message-Id: <20211022190702.7782-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Xgydc7bNavzOXILjh4W5kEUF+jV8Hnihc4WXxot7Lup///t+mFe
 MyouT935et4D1W1tJiZAm0+gr4sf7aRQa9h/fY44QDS0jnq3vdRNCQa2rrXcFFVrn3EhdJV
 FNOqfkIwc9zfPbGIJscgkRevZvzhINMOY3r5bJPk/vOMYpEeZTrSmcuF8JVnsK9lsu6Aryr
 E1qoSQXt2BegpxsgjM2sw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:laYJNaqZ1sU=:UJXjCvhOwGxuwWJImK/79H
 p23ANRNBqDGtedrT7Eoqcjc1HaclnWPwvAvd5aF9Sme2n+e8DvtScONiWNjbodLV4S+jOunZK
 q6xPq8qAoktc+GDY+TLkkBmsME499tuy4V4lytKYfDWJImDQUYVUC9jHqUZCfBvSPhSHSg70b
 drcU1ZWXH/Nj1mYQuepfvJZdrVjZMpMt1gV6+qEb2M9vvTPYqgNcW3UBtok79Lm2gHraQETE6
 TAsAv59S87LTYVECpCA9NqXtpW3TKltHdX3O3Y8D8XssKo2+UlKszOoKpLmD8rYAIzbZE2Z09
 r5K2V7HbPWCZModT6F+vBVorc5aTmWs4O3e08cUoDItcjPzn6zV97ij8lmjcct/DuCGrQqn4a
 eCnH0FPbuVYpEpvWj8rCRuaxJSC2nR6qcIE13Avf1Ddi37I01NYRq77/6WBpLsRhzVfLn9e/Q
 DebEw9BOMmKBjaFi6+vv6CYNlLSx47PiBulzPxuYkMV1MDM+8dia6EvwBuNBZD8kLKX/sL+dI
 affRoY9F2bXEsha/T2qzHujDCUqSQJ5L9IUA7ilEbkybuaCXv7gZ8yDUOCe/iXqFdk/PR01TO
 9I+308NT1W9ZAh9g+MVcVQlqDz3lC0zmaHwNNsEdWxRrGth4F/AdBrtu15Rz+2QXXIaN47Wac
 WGxrLV2gdYxu1qKfw2V7QpegsMoxRuaa5D9p+ikRKMji4Ae7RLOlKDsUAy+S/yIHaU8F0MKQK
 lkjKdQ3U/4XhZ8zZio/zzv1pW85sa985Y9So+ao/qJj2nLi9OU/l3Hk3lgqVxqeYDu4c47USh
 XfPLAowlhWU58wJnzGxXnC3f2dmDl6bEbRm9DUJxt4Wgi+fUKQ5p0oQpJzqQldIAXyfhfh416
 i5VkoHRQRhghH5QfBG8MC4rcE6U4hBdSHxl2u719LKL6u5g0f8YnIgtl6rQFsbNFGHkFEyYEi
 onSiN4Pf6XIhA/olUWVRyOkrG9FNI/Pf1JZfp8cjSCZBN85zABsDrSJnud7Dh1s5B+pLJhlkA
 RFb+dkH9CCBE65pjwzEbG/0+UURBy0dtQ49QrT5E5GyGYF+hNLzev1J4da2+UsYxkvTgXbWrn
 qIVRWYQYbHRty4=
Subject: [Buildroot] [PATCH v1 1/2] package/gtest: fix gtest.pc/gmock.pc
 library names for the debug build
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

   - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2

  >>> libcamera 40f5fddca7f774944a53f58eeaebc4db79c373d8 Building
  [...]
  [114/123] Linking target src/lc-compliance/lc-compliance
  FAILED: src/lc-compliance/lc-compliance
  [...]
  .../host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...test.pc-gmock.pc-library-names-for-t.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch

diff --git a/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
new file mode 100644
index 0000000000..c47e8fc8f8
--- /dev/null
+++ b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
@@ -0,0 +1,62 @@
+From cf5a3177159ca832470e7f876cab0a1923fa666f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 22 Oct 2021 20:17:36 +0200
+Subject: [PATCH] pkg-config: fix gtest.pc/gmock.pc library names for the debug
+ build
+
+In case CMAKE_BUILD_TYPE is set to Debug the gtest library is
+name libgtestd.a but the link command returned from gtest.pc is
+'-lgtest' (without the debug d) and so the linking of dependent
+packages fails (see [1] for a buildroot failure example).
+
+Enhance the gtest.pc ang gmock.pc generation to honour the debug 'd'.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2021-October/626382.html
+
+[Upstream: https://github.com/google/googletest/pull/3625]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ googlemock/cmake/gmock.pc.in          | 2 +-
+ googletest/cmake/gtest.pc.in          | 2 +-
+ googletest/cmake/internal_utils.cmake | 3 +++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/googlemock/cmake/gmock.pc.in b/googlemock/cmake/gmock.pc.in
+index 23c67b5c..0f469857 100644
+--- a/googlemock/cmake/gmock.pc.in
++++ b/googlemock/cmake/gmock.pc.in
+@@ -6,5 +6,5 @@ Description: GoogleMock (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+ Requires: gtest = @PROJECT_VERSION@
+-Libs: -L${libdir} -lgmock @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgmock@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/gtest.pc.in b/googletest/cmake/gtest.pc.in
+index b4148fae..225bba81 100644
+--- a/googletest/cmake/gtest.pc.in
++++ b/googletest/cmake/gtest.pc.in
+@@ -5,5 +5,5 @@ Name: gtest
+ Description: GoogleTest (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+-Libs: -L${libdir} -lgtest @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgtest@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/internal_utils.cmake b/googletest/cmake/internal_utils.cmake
+index 58fc9bfb..fd81b825 100644
+--- a/googletest/cmake/internal_utils.cmake
++++ b/googletest/cmake/internal_utils.cmake
+@@ -335,6 +335,9 @@ function(install_project)
+     # Configure and install pkgconfig files.
+     foreach(t ${ARGN})
+       set(configured_pc "${generated_dir}/${t}.pc")
++      if(CMAKE_BUILD_TYPE MATCHES Debug)
++        set(DEBUG_POSTFIX "d")
++      endif()
+       configure_file("${PROJECT_SOURCE_DIR}/cmake/${t}.pc.in"
+         "${configured_pc}" @ONLY)
+       install(FILES "${configured_pc}"
+-- 
+2.33.1
+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
