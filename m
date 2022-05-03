Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1404C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 00:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D1E040AAD;
	Tue,  3 May 2022 00:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz1bhDFonT4p; Tue,  3 May 2022 00:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5672440AA2;
	Tue,  3 May 2022 00:49:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 923FB1BF339
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 00:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8105A409FC
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 00:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4NLxsvaBlwz for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 00:49:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D754026F
 for <buildroot@buildroot.org>; Tue,  3 May 2022 00:49:45 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id g21so17608201iom.13
 for <buildroot@buildroot.org>; Mon, 02 May 2022 17:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuQiHf01YNVfy6t8r8l6/Q65O/9+67gxJDhKd6YiXPg=;
 b=P0g91y1AoNyVCktPDMV25WhV8oKNH6c3sdig4CfAoq//9t1ADpLCR/7BbARlfhqAhh
 Xtw4Ck5inlsI6VZBIm1Crr+Uu7KnbiHeNniqOnSMVgIdrLz5CAFf2PtcyiZbJ648E/zq
 0Xm1mYG5AWMQDuiBTQJCgcPwnm3ZU4rgroFxUDHxMzafAgKYVNjrskS/MCSu3TQPGEI2
 kSQb9ciWStKGD2ZmLehXGysn3IOPKFKGtkTThDaL8/YjntP3SZmTs2vtqMXnLd+g5jYZ
 IcpZKKGn9ev7lKGUb0b141OJulIapPZRzIwCHCtO4UVrM1kGEeXYvYdJOlqzhHSZJKfw
 4YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuQiHf01YNVfy6t8r8l6/Q65O/9+67gxJDhKd6YiXPg=;
 b=KEOn/SseBJLdaAoidpYny5QOYDbWJDnwlIdl0Ng7LbduLd3Dd/AvSEg3T5cNZXSztW
 GMN+ALaGMcU2iJfN6NVU1bqoUrGKfNqGLEohpS8s0XVXj+bWZCSLO9jZvMrNqa5uZF+Q
 r6ctcL4Ty2PKgbPD5/tBi2dgv5+Q8p1KNlCyvWzqkXUOjaPs/MdaXsIei/vTtBL+1Ev2
 q/d3tcwSbZMD3u0RbnLT1jFlHPT/fGtglv+UTgSV72cNSevTtIicHzIqzChELjCJuyii
 qjwIbgCt3B6ZDkTRgMFK+WQvrxdxAH7v+GbolE4q8R4CwiI1vJpGxENjB+gIUUv9KkHn
 QjPw==
X-Gm-Message-State: AOAM532JsXRe+gxPOIekSP5WwWl+KKj7mgmddClMx0/6aTtGlr4OLCgv
 pLtXL2xeRSM+LmE0ihUim8X3O5wPlpQ=
X-Google-Smtp-Source: ABdhPJx+gEEOUMTnx2msJqY1rpV97kskz+GIrKNUYkgwoJwafv6YqB9C/lcNeJfDY5ros3iUWeYbxA==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id
 m13-20020a0566022e8d00b0064fb683c70dmr5304748iow.62.1651538984694; 
 Mon, 02 May 2022 17:49:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 r2-20020a92c502000000b002cde6e352e2sm3088855ilg.44.2022.05.02.17.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 17:49:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 18:49:43 -0600
Message-Id: <20220503004943.3170832-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: use high quality
 random for KCONFIG_SEED
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Internally genrandconfig will use gettimeofday when generating a
KCONFIG_SEED, since autobuild-run executes genrandconfig at the same
time for multiple autobuilder runners this could potentially result
in the same KCONFIG_SEED being generated for those test runs started
at the same time.

To ensure this doesn't happen set the KCONFIG_SEED using the urandom
entropy source.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 70af84f002..8ed2783a6d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -18,6 +18,7 @@
 
 # This script generates a random configuration for testing Buildroot.
 
+from binascii import hexlify
 import contextlib
 import csv
 import os
@@ -605,9 +606,13 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
+        make_rand = [
+            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+            "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
+            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "randpackageconfig" if args.toolchains_csv else "randconfig"
+        ]
+        subprocess.check_call(make_rand)
 
         if fixup_config(sysinfo, configfile):
             break
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
