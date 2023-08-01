Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07BC001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 13:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D1760A71;
	Tue,  1 Aug 2023 13:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D1760A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxGQUBz2bwxP; Tue,  1 Aug 2023 13:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE866606CB;
	Tue,  1 Aug 2023 13:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE866606CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9E01BF31D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A84B811AA
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A84B811AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFU83nqk3Srp for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 13:21:19 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75BB080E7F
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 13:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BB080E7F
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31771bb4869so5812017f8f.0
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 06:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690896077; x=1691500877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=exzDP85kSMarMBpmtJofPzlUx55LyRrJDf0yDYFSbaA=;
 b=eTlrTBb0TiBNMdB1v9M7KZ6jgM8HB0MJQKyMoEC6aleKdwetsgxLh9EkWeT6qD6FVZ
 4aMej+vjdBrR6F1yxrnjAUQbTYq39fjm1GdyB5yzGVf0MOgB8JeLZEbrtX5Tni9X/4IB
 b93kVkPVKgDXGqTjMGr8iPMNkpgNjY60fEUghc0UAdxmsqe/C1bAAOePUcNQvADczF/F
 vb37DmPqVF4oPx7A9Ny582o0b1h4+XOoO5wA5K25nbJyG2nGjvk/xT2CJttAOaa9cCli
 poTOAe1090KCDZNn74PvItLNlgt/Fk3j5qzq1yNiYTRf7/UC6qniKyqk0GeObXv1gZht
 +g2Q==
X-Gm-Message-State: ABy/qLZMUVR45e9ZAfUfLEmg2TObpATgVfVsbFGcRyjFoRLXHyvQJs8w
 xwNSkIcY//0FZylOKcZwvbJYxzaDTNo=
X-Google-Smtp-Source: APBJJlHg14GcjDvH+6KOUW3zCwdMnrDfNbzjmy8NehXOeLAJw0tdtwD+eOSSUWTz1LoxaMuxyoYwpg==
X-Received: by 2002:a5d:6391:0:b0:315:7d2f:fc36 with SMTP id
 p17-20020a5d6391000000b003157d2ffc36mr2359349wru.20.1690896077200; 
 Tue, 01 Aug 2023 06:21:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d6992000000b0031134bcdacdsm16096677wru.42.2023.08.01.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 06:21:16 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 15:21:13 +0200
Message-ID: <20230801132113.357748-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690896077; x=1691500877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=exzDP85kSMarMBpmtJofPzlUx55LyRrJDf0yDYFSbaA=;
 b=XS+txt+rdQR3MCME7WxDpQrIDenmizZLFPKDyF5AQpUyVPikR0tE2IZEescH70WcCt
 qdOx/I2D1C4C56/qQT523jT9JAJsBZMIjCDgL7LXpzM2nnDjLXx3yNINhverLEYs7W1r
 WGyTwwKxdDhmeDVF4ED4WMbcctay3+yhYSmArM3ONjk2FGIZhLoqj8U4CFaZPFJF/OOx
 RW1AcuxYVOItvcDe9LAcLZzbNePB1m0qP/kTx58G0JkTJAsKTJmoB1eLV0O8E33mmQvx
 Wf20f8AMi1Cfl+qvt/6mKv7WFNR+h6/H4mTwwqUxyjl9mI5r85+/FiveKE4Xb8cYKQpl
 vHEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XS+txt+r
Subject: [Buildroot] [PATCH] support/testing: TestNoTimezone: fix the test
 case for Glibc
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We have changed to a Glibc based toolchain recently [1] but the
behavior of TZ handling is not the same between libc implementation
when no Zone Database is installed.

musl and uClibc-ng return "UTC" when the data file of the requested
time zone is missing or when TZ is not set.

 # TZ=America/Los_Angeles date +%Z
 UTC

 # TZ= date +%Z
 UTC

Glibc return all or part of TZ content or "Universal" if TZ is empty.

 # TZ=America/Los_Angeles date +%Z
 America

 # TZ= date +%Z
 Universal

As demonstrated by TestAllTimezone, Glibc return "PDT" when the
America/Los_Angeles time zone data file is installed:

 # TZ=America/Los_Angeles date +%Z
 PDT

Since the Glibc behavior seems weird (not a bug [2]) when TZ is
set but the time zone data file is missing, update our test
to check against a string defined in the Glibc code [3].

[1] f89f52168fcb667a3e8e43f6f44d5b1ca3961a8c
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=30710
[3] https://sourceware.org/git/?p=glibc.git;a=blob;f=time/tzset.c;h=78c18f8147415c92dc6eb735be672fa7e0b8f76e;hb=47b76f6d1d3a5ad13e585dbcc616aaea62b8bb20#l380

Ref:
https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html

Fixe:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561117

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/core/test_timezone.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index 0e5009494d..bf4a47fcde 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -22,8 +22,11 @@ class TestNoTimezone(infra.basetest.BRTest):
         boot_armv5_cpio(self.emulator, self.builddir)
         tz, _ = self.emulator.run("TZ=UTC date +%Z")
         self.assertEqual(tz[0].strip(), "UTC")
-        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
-        self.assertEqual(tz[0].strip(), "UTC")
+        # This test is Glibc specific since there is no Time Zone Database installed
+        # and other C libraries use their own rule for returning time zone name or
+        # abbreviation when TZ is empty or set with a not installed time zone data file.
+        tz, _ = self.emulator.run("TZ= date +%Z")
+        self.assertEqual(tz[0].strip(), "Universal")
 
 
 class TestAllTimezone(infra.basetest.BRTest):
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
