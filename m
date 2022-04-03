Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 11:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3A9833CA;
	Sun,  3 Apr 2022 11:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioMbT9D8WpaI; Sun,  3 Apr 2022 11:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A431832EB;
	Sun,  3 Apr 2022 11:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 866191BF4E3
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 755B24030B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSa4qbb5tjo6 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 11:06:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D164E402AD
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 11:06:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w4so10350395wrg.12
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9yMbNO6gC5xDUh0sDvBXVnCNv08+nygv9NOT0fyEr4=;
 b=n57bFzoeQXskQWejUvFc23QE3IgvXdVEqFTf3Xn6Kyy+fHggWjiNwS73kVJoI0VUgG
 6aYnYSU+67NLZ0TEudD8Y7C6Orb8HOTc8/sdbASemXtJjr8d7Ui74eawU9Ahw1rzmOim
 j5JfibykKT4Vg1MNAMdhJXCvvaLd7hi3uLOTT0CdooA9vggsA6QOZpR/6VGbG6khssYh
 /cfIHD+586+xHem9eZpesSzam6dCWLFoA6OgxTtWzLZSS6MO+msP3STzGvg5fy12MS5Y
 C7Cq0r7DOtDJKJX2OM4o+tyeulU77OUPGy2Vk5PAqsh/RMzkdBLWz+wF38gJCfyI3OjX
 /WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9yMbNO6gC5xDUh0sDvBXVnCNv08+nygv9NOT0fyEr4=;
 b=RSulZHmAxK+edFWmQ5lTvbVjqJFOx729ETbnmemfjUpMkbIjJizukenvWcxU5ckfl5
 W+7pXH7OSSomfbmBFQVvHcdCWCixGmaWHDwmT6RGKdYjyJTyqKz5xpWOiI8Sacu5/arE
 nq7HHsnYsDrs2LgFCSZj52G0aioHbjWcZqB0EaaVtA5sZgdN0iKJ9d9wUi2YhfXLOUzD
 8BXg4Bh0CtKsTNjHE97fPBHCLt7/5vPiLvYeeu8ldwT+ayjtQdF92r3uDLgZ8K0/6vxV
 QK+ocg1FhrRqfTUsTWTu4XPdfgCwpVWJRHZwfJTw1agH9eMyp4p5+PM06AOvJO9mZeBQ
 Up8w==
X-Gm-Message-State: AOAM530Lth8Ylr8U/6LhqlWKmEOby/0HfaigwF5EaKckgSRL98alI23P
 nxgqTksyfx8rwJ1c19/uY7JEr7otx08=
X-Google-Smtp-Source: ABdhPJwTZlonXLG3Bjb5RJ/N+2lLH67m7QepxjGKP6j7aUKBqSMKp1KS1KVeUQSD19Ht4OxpMFktTQ==
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr14115580wri.71.1648984005824; 
 Sun, 03 Apr 2022 04:06:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm6548259wru.42.2022.04.03.04.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 04:06:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 13:04:55 +0200
Message-Id: <20220403110455.2875846-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
References: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/htop: fix hwloc static build
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

Fix the following static build failure with hwloc raised since commit
c83bf9720632bcd4d438094a9fc30feff69fc555:

checking for hwloc_get_proc_cpubind in -lhwloc... no
configure: error: can not find required library libhwloc

Fixes:
 - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-fix-static-build-with-hwloc.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch

diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
new file mode 100644
index 0000000000..0ac79766c5
--- /dev/null
+++ b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
@@ -0,0 +1,54 @@
+From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 Apr 2022 17:27:01 +0200
+Subject: [PATCH] configure.ac: fix static build with hwloc
+
+Retrieve hwloc dependencies through pkg-config to avoid the following
+static build failure:
+
+checking for hwloc_get_proc_cpubind in -lhwloc... no
+configure: error: can not find required library libhwloc
+
+This build failure is raised because without pkg-config, hwloc
+dependencies such as libxml2 are not retrieved:
+
+configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
+configure:9022: /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc -o conftest -D_GNU_SOURCE -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lhwloc  -llzma -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib -lncurses -lm   >&5
+/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
+topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
+---
+ configure.ac | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ecac1ecf..6bb7eb69f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -456,8 +456,18 @@ case "$enable_hwloc" in
+    no)
+       ;;
+    yes)
+-      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
+-      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++      m4_ifdef([PKG_PROG_PKG_CONFIG], [
++         PKG_PROG_PKG_CONFIG()
++         PKG_CHECK_MODULES(HWLOC, hwloc, [
++               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
++            ], [
++               AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
++               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++            ])
++         ], [
++            AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
++            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
++         ])
+       ;;
+    *)
+       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
