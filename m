Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A8EE49A0
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 23:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6738660BDA;
	Fri, 18 Aug 2023 23:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6738660BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSzh8rgLKzRE; Fri, 18 Aug 2023 23:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8299A615E9;
	Fri, 18 Aug 2023 23:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8299A615E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6201BF2A1
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 23:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21320840D7
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 23:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21320840D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvlpkTDLO7Ha for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 23:46:44 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D802C840CB
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 23:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D802C840CB
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so1284987f8f.0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 16:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692402402; x=1693007202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTPrCt1Craj6+EpQ5YoDlWfbuD0YILABA4L6Hm6ylKQ=;
 b=M5ZTPjFd5zPRA3fCG6UVj8pCaKThl7953zcHByewdqHtSi1BA7Uqxha568Tzlgh42M
 JgsTjZqqRjcs1Rr8jlzHzQVxUuwtVTd+YGxaP8EfT9Hj59SXvvziJbTGDmZgJQgxkKfr
 VI8c3eCawD0axzx/tkIcGmXulVYn45lBBgQfMgWViCGrFMPL7U4f2pJ3507tInWCqw0N
 ucB4s6k+YSivLLoN9BLqikpMjB3G0qWw2mZseQWMeZeHOiNlLZTkRjx9uiBSkw5/dpv6
 1W552EE7KFD8vBYF9htVmhOQKFzPmckbXBr1gncAjAJoJGYbH5BGPZ6ZEuXu5CmU0gWX
 FqBA==
X-Gm-Message-State: AOJu0YwaGpXKs8VB22gRY0qXw7eXWrpeq2pW9exnaQ+dOm4dvRiGiCzV
 FOldbrXaAFsF8YQcHRxWroJypt+6XXA=
X-Google-Smtp-Source: AGHT+IEYnZH/ATtbi8VMdXWDyNB/KewgwvTyl77a2B/dfsLtcx+DUyO/6rEjLgfk2j1ysqjO1bAmPA==
X-Received: by 2002:a5d:5591:0:b0:317:cdc4:762e with SMTP id
 i17-20020a5d5591000000b00317cdc4762emr401845wrv.63.1692402401705; 
 Fri, 18 Aug 2023 16:46:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s12-20020adfeccc000000b00317b5c8a4f1sm4292130wro.60.2023.08.18.16.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 16:46:41 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 01:46:38 +0200
Message-ID: <20230818234638.499248-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692402402; x=1693007202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTPrCt1Craj6+EpQ5YoDlWfbuD0YILABA4L6Hm6ylKQ=;
 b=Hr2JBUjRubLGGv1Ec9/Ql9XudF9xSezhTKx8aws8ei+n5ozmwUNv+fiQryOtubvQPa
 hlsNMqynAhccTpnTrHpLvoMKyvXqhZhpzmwbPKRev+zH2+0/EdhnJnWIG8aZ96LJwz+1
 PzA4AFlOoW6/z3b6qAfjLuUgGxTh5MVMswuKFuEjMmh+nEyKjoXrRPfKe5c3RILC+QSF
 TzOnoHew9DpfkZtT03rjdZKfn880gNksBQS3LdFb115QcIChrmMN6/RIqkJtQEOD0O+5
 nflnOxVG4awrDitHxR+8+Lz6QxnfLBRCfiuzCIDOlZTUDEwFHEJWT8gcyvqBfCKD6dCJ
 356g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Hr2JBUjR
Subject: [Buildroot] [PATCH] package/qemu: force the host compiler to look
 at HOST_DIR first
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Nicolas CARRIER <carrier.nicolas0@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since meson 1.2.0, compiler's search path are retrieved and used
to link a library. If the same library is installed on the host
and build by Buildroot (HOST_DIR/lib), meson now link against
the one found in the compiler's search path instead of linking
agains the one provided by Buildroot.

See: https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566

Help the compiler by setting -Bprefix that specifies a path where to find the
executables, libraries, include files, and data files of the compiler itself.
For each subprogram to be run, the compiler driver first tries the -B prefix,
if any. If that name is not found, or if -B is not specified, the driver
tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.

Fixes:
    host/lib/libgio-2.0.so: undefined reference to `g_module_open_full'
    collect2: error: ld returned 1 exit statu

The problem only appear if we have two version of the glib2 library installed
on the system:

[Buildroot]/host/lib/libgio-2.0.so.0.7600.1
/usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8

This is probably a meson bug introduced by [1] since the error message is wrong!

$ strings output/host/lib/libgio-2.0.so | grep g_module_open_full
g_module_open_full

The libgio-2.0.so provided by Buildroot contains the g_module_open_full symbol
while the libgio-2.0.so installed on the host is too old to have it:

$ strings /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8 | grep g_module_open_full

[1] https://github.com/mesonbuild/meson/commit/59cfbf68e00aa774a9868101f423bd662938c15d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Nicolas CARRIER <carrier.nicolas0@gmail.com>
---
This meson issue may be not specific to host-qemu...
---
 package/qemu/qemu.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b341d0220d..8a8dddee58 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -401,7 +401,18 @@ HOST_QEMU_ARCH = sh4eb
 endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
-HOST_QEMU_CFLAGS = $(HOST_CFLAGS)
+# Since meson 1.2.0, compiler's search path are retrieved and used
+# to link a library. If the same library is installed on the host
+# and build by Buildroot (HOST_DIR/lib), meson now link against
+# the one found in the compiler's search path instead of linking
+# agains the one provided by Buildroot.
+# https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
+# Help the compiler by setting -Bprefix that specifies where to find the
+# executables, libraries, include files, and data files of the compiler itself.
+# For each subprogram to be run, the compiler driver first tries the -B prefix,
+# if any. If that name is not found, or if -B is not specified, the driver
+# tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.
+HOST_QEMU_CFLAGS = $(HOST_CFLAGS) -B$(HOST_DIR)/lib
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
 HOST_QEMU_TARGETS += $(HOST_QEMU_SYS_ARCH)-softmmu
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
