Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB1DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F9E813AB;
	Sun,  2 Jan 2022 17:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ic4A_B-tZpoE; Sun,  2 Jan 2022 17:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE8E81361;
	Sun,  2 Jan 2022 17:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77E811BF3FF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B3381358
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIcMk5OJawAR for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 17:46:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46C8781356
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 17:46:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o30so17741551wms.4
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 09:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXxllXQvAljTbclJ19efihAqasIMKShddDeDORPbGtY=;
 b=EZsyGZHDxX5wO61blmmp6YfrovZvIlSOlwz1cQB7HBOIgd6W3pvSedPsU6XbU9LnCg
 vSkPjuANv99jYL89/sYk+2L2hwfyMJ1P1X8P7lIHJSO205RiZU2xwQ9S4DeKuGVBC0uC
 579h0G4Zsl8Zx9VAfcHbqisXeKxcB77abnFpo0R3A3wvxjmBBXHAK1QEYKKDyQnVafPD
 c9Ex+ufX0qlQ1UxDq3MKq7OahIgZ7C00+O1ynF6iQecf98+f2oTWcFVrNzmvaAcMTFAl
 qXAukcRWZovYmJysAVyKvmD5QiRQxRKuIzGjdT3YMce5T4tocL3I7lwwuu8frnHiQmgW
 WjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXxllXQvAljTbclJ19efihAqasIMKShddDeDORPbGtY=;
 b=PxgYLkKdIA7TVBf5yp4kYpqFBI//Nm6L+KqrZst7Qj1FF8syKOorpRC3156vq62oOH
 JP7vge3NaAMjDUbn7YsM4GLJjFdhp5D+BqMITNl3NcCyUYKDbjgqXPbfBci1Jc7fLJvp
 ueEJXRvh0QUJmtnsSLSn+VSqQp1dI9LvJ59Bz05z5PiCpS5V403GJ7erT+ENLRfqvtV9
 Gt5w8wQ0e08iusfo2QIra5nWvn5nHeel/P5h7XK7a0t0WTsKJWA9utjL+I3hV06sa3sM
 2mp3kzmEK/Oxe57vB2FbGRfG52F5uZJlTQenBgoUL/XLIY0FSAYI/se3lie94qnIi5ZO
 SPvw==
X-Gm-Message-State: AOAM530ML6zkglHbss0BdJlSx0TggPIMln8S9qLg1/Co9cMLmpTny8d8
 Gb1JiU0XG+Jkr1BDVfK/JP4MqUVTnLU=
X-Google-Smtp-Source: ABdhPJypTox0NPtKOHYfjqFwnsb2yfcbc8HPdN3cYX20D7tjGvU1rEZSZ0yIM6P4H9H5zodAG/PtZw==
X-Received: by 2002:a1c:9897:: with SMTP id
 a145mr36027015wme.194.1641145614394; 
 Sun, 02 Jan 2022 09:46:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id k19sm33455164wmo.29.2022.01.02.09.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:46:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 18:45:01 +0100
Message-Id: <20220102174501.2824124-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: fix uclibc-ng build
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

Fix the following build failure raised since the addition of the package
in commit 663f39c88c01593855c18355a4decdceeffd884b:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'

Fixes:
 - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-check-for-inb-and-outb.patch         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/freeipmi/0002-check-for-inb-and-outb.patch

diff --git a/package/freeipmi/0002-check-for-inb-and-outb.patch b/package/freeipmi/0002-check-for-inb-and-outb.patch
new file mode 100644
index 0000000000..3bc006acc7
--- /dev/null
+++ b/package/freeipmi/0002-check-for-inb-and-outb.patch
@@ -0,0 +1,50 @@
+From 47249279f3ef2c1fcfc312294f1c98c35232aed0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jan 2022 10:37:00 +0100
+Subject: [PATCH] check for inb and outb
+
+Check for inb and outb before using them to avoid the following build
+failure on uclibc-ng:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
+/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/50]
+---
+ configure.ac                         | 2 +-
+ libfreeipmi/driver/ipmi-kcs-driver.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 711b27674..bcc4156ff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -476,7 +476,7 @@ AC_CHECK_FUNCS([memcpy mempcpy memset mlock])
+ AC_CHECK_FUNCS([getline getprogname])
+ AC_CHECK_FUNCS([strerror strerror_r])
+ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
+-AC_CHECK_FUNCS([iopl])
++AC_CHECK_FUNCS([inb iopl outb])
+ AC_CHECK_FUNCS([asprintf])
+ AC_CHECK_FUNCS([cbrt])
+ AC_CHECK_FUNCS([getmsg putmsg])
+diff --git a/libfreeipmi/driver/ipmi-kcs-driver.c b/libfreeipmi/driver/ipmi-kcs-driver.c
+index c212887c0..a9d4b2e96 100644
+--- a/libfreeipmi/driver/ipmi-kcs-driver.c
++++ b/libfreeipmi/driver/ipmi-kcs-driver.c
+@@ -162,7 +162,7 @@
+ #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
+ # define _INB(port)  inb (port)
+ # define _OUTB(data, port)  outb (port, data)
+-#elif defined(HAVE_IOPL)
++#elif defined(HAVE_INB) && defined(HAVE_OUTB)
+ # define _INB(port)  inb (port)
+ # define _OUTB(data, port)  outb (data, port)
+ #else
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
