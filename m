Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6552C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 11:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67DA6408F7;
	Sun, 13 Mar 2022 11:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNzwmbAaMXiF; Sun, 13 Mar 2022 11:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7187D408EE;
	Sun, 13 Mar 2022 11:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 936A81BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73E4281BBD
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esWXnLsXtsrO for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 11:27:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AB9181BB2
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:27:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e24so19623452wrc.10
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 04:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkzH7GyfsDOicyiFrKxTxuR29RENP4kB6J0sZDsHtRI=;
 b=CN6apjroB5pzjof92OSc+7sAZ4WV6ei84jDfHpjO4ephrI7XpVko+xscHAr22kF4HI
 MDY0BbiICCztOjmzqJHdLcWFWTA+keuiiELE6iXh7r2cJvAGRt/BgjY8u3+O1tyUF/2u
 SrZLZQA79rgG7A5xaQe0eYLLvnGHAKNR6GMVMHJqR5d8y33/cTou3zvwp+I2XeDKyIfe
 7usrc3CjjQRBs9GdXkYjG6RCaHIJVOqKkSgyjopq4oVhje/dUthXysVLsz+XG9XYHWuF
 Lw2kJIjNiejU8U4d4FG7TWvr9C/dxi+ndJEYXb2s+jZlfftlCH6KZFC0n+ihyDWJDwyY
 oc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkzH7GyfsDOicyiFrKxTxuR29RENP4kB6J0sZDsHtRI=;
 b=gP7oqXsqi36opmSJ6LYyot0TM1ohthrOWNYVDNfW/o/W948hcXIqC6afMZUJCfsqSE
 AcAm0nqKmdNvadJqDWg0K/35FzuTNan23dY9FwFrOf9VOZZH2pYte53Mfvyid3rHcLJh
 zCNuJ5709wbiFkIiH5ZDX46IBxis2w/RIDhK169tngdGn52KVV3U1lNeJW1J+U5QMgLo
 BFnafNM2VyaCY+vCxgPnVS9A1+OUz1ixCwbEnray4e05MpNUkuj5nF675KMA7+eBgJ+/
 errNwiZ5J0VWo2lamaD5wFMdi+92cPyi8gnvHrErZF1IsJ0wKm5elVn6twA49P+IMWie
 0Oiw==
X-Gm-Message-State: AOAM530sAOfBgsy2zeYAHaquzUgnMgvKqfIaVtFgZt6W3NZ23Y99AdKW
 JMXdMFl8tDVk3Pg3dceNXJYc1/tJBfY=
X-Google-Smtp-Source: ABdhPJyRFtN9q2tNx8GY3uE96sFSxyUSyNuguW7gn6d2YXRPCFGAQLg6g+XvnteI7DDCsMWk54fSuA==
X-Received: by 2002:a5d:5746:0:b0:1ea:9643:92ac with SMTP id
 q6-20020a5d5746000000b001ea964392acmr13156889wrw.597.1647170844457; 
 Sun, 13 Mar 2022 04:27:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 4-20020a056000154400b00203812ca383sm10606106wry.78.2022.03.13.04.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 04:27:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 12:26:33 +0100
Message-Id: <20220313112633.1125643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build on sparc v8
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on sparc v8 raised since commit
5770a645a3a49a3f0f02972131a4ff5283b4c11e:

ERROR: detected a std::atomic implementation that fails for function pointers.
Please apply the patch corresponding to your Standard Library vendor, found in
  qtbase/config.tests/atomicfptr

Fixes:
 - http://autobuild.buildroot.org/results/5a2/5a20e984a5536165056b3fbd93b8712e8ddbeed4/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...figure.json-fix-atomicfptr-detection.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch

diff --git a/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
new file mode 100644
index 0000000000..5f0f81a4bd
--- /dev/null
+++ b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
@@ -0,0 +1,48 @@
+From e9d1f80dffb4e29e44fc0b0627704af15cdd281a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Mar 2022 12:05:04 +0100
+Subject: [PATCH] src/corelib/configure.json: fix atomicfptr detection
+
+Fix atomicfptr detection on sparc v8 by linking with libatomic if needed
+to avoid the following build failure:
+
+/sysroot -std=gnu++11 -w -fPIC  -I. -I/home/peko/autobuild/instance-0/output-1/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
+> /home/peko/autobuild/instance-0/output-1/host/bin/sparc-linux-g++ --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot -Wl,-O1 -o atomicfptr main.o   -lexecinfo  -lrt -lpthread -ldl
+> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: main.o: in function `test(std::atomic<void (*)(int)> volatile&)':
+> main.cpp:(.text+0x40): undefined reference to `__atomic_compare_exchange_4'
+> collect2: error: ld returned 1 exit status
+> make[1]: *** [Makefile:69: atomicfptr] Error 1
+
+[...]
+
+ERROR: detected a std::atomic implementation that fails for function pointers.
+Please apply the patch corresponding to your Standard Library vendor, found in
+  qtbase/config.tests/atomicfptr
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5a20e984a5536165056b3fbd93b8712e8ddbeed4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://invent.kde.org/qt/qt/qtbase/-/merge_requests/138]
+---
+ src/corelib/configure.json | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/configure.json b/src/corelib/configure.json
+index 9b5d19d41b..ac88f5856c 100644
+--- a/src/corelib/configure.json
++++ b/src/corelib/configure.json
+@@ -309,7 +309,8 @@
+                     "test(fptr);"
+                 ],
+                 "qmake": "CONFIG += c++11"
+-            }
++            },
++            "use": "libatomic"
+         },
+         "clock-monotonic": {
+             "label": "POSIX monotonic clock",
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
