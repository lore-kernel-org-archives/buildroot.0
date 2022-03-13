Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 11:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C8CC408ED;
	Sun, 13 Mar 2022 11:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pT6w2HJG2nk6; Sun, 13 Mar 2022 11:34:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E724040B;
	Sun, 13 Mar 2022 11:34:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED4E1BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 446C540278
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgIMzp1a7mc5 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 11:34:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6BAA40273
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:34:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r6so19272838wrr.2
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oer5qU+IjrDCwSKJ5buNF1oIJ6Unm9Y5dwG0vaDgkUc=;
 b=nQG/iVBWWmLe37FlxCllzZr93w6ZES3ugxFBbJNPoHu5FDe+/aoM4Dc5FHaImSyUo8
 umR/an8pqeLNG1GLekvHHcChuW14/2WyEmjNz/P68CrRk44woJzODUR7x+P0fHyFOOps
 fw8wbxuy22kPAxG3xn18Ic2veVYeG0bC1rhsr6x3tiO2jCmeRGyr2xgHnY2XeyA7Ig9p
 eBawrQmTsrUA6Wb+9Gi8TLNSFep68onsvpMXW1buwiV61pIWNJfFuNSsESbAR3c0gUky
 6valyTgoASmHFumpLCi5I58j4W3ITYZoXGkCMgyvclOFqqCDKNN7sGa0FW63rJS365TJ
 ynQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oer5qU+IjrDCwSKJ5buNF1oIJ6Unm9Y5dwG0vaDgkUc=;
 b=7SCYGHgUDWxK+mCR1rSU6xFb2KGAg15Po7TQDKRhzQ6BMtqIQ/2qMXaL2KqHxaWKM8
 Mg3hzt7dq/Bko9au3bxfCkx0BCDQce/QLM7Q29Tok53LQRq/YVE9bjoTSICSkFu9H5eW
 Xyb3R2WP+BPmq5z3SXKvYIAH8G2Y9dm2Pn/13Z+JPD7b7tsdJZgSqfrVWD/qcQibUC+B
 m/weT8Fvw+rqZCz+nynOunvyZELe2M+vr+XQ9OZn31zIjF5j8rBV2qK9+PlQsKohSPh8
 evTyhzIISPvMzdspPKZwjTZWRtuwP3GinRg0kLis9N4vHI3c9V+3J3LOEWS+Y8Idae9N
 hwqQ==
X-Gm-Message-State: AOAM533PrxydwrFIYVRCxmOZo74hAsGpi+83wyO9GSHRf18SaxjcRTnB
 vQ0gWGkIJvMIfPBh5AunTrDxUWyE85c=
X-Google-Smtp-Source: ABdhPJw5gjk+6HWTKHY+lFewUxQASIi/ZzrqzQlvw86MUkqgrS08rOIK7P4ZszQ7NMjCG584dPVn1A==
X-Received: by 2002:adf:f945:0:b0:203:9078:4803 with SMTP id
 q5-20020adff945000000b0020390784803mr10476245wrr.217.1647171264571; 
 Sun, 13 Mar 2022 04:34:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b00389e8aaad51sm9349685wmq.12.2022.03.13.04.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 04:34:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 12:33:33 +0100
Message-Id: <20220313113333.1125977-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/nbd: security bump to version 3.24
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

Fix CVE-2022-26495: In nbd-server in nbd before 3.24, there is an
integer overflow with a resultant heap-based buffer overflow. A value of
0xffffffff in the name length field will cause a zero-sized buffer to be
allocated for the name, resulting in a write to a dangling pointer. This
issue exists for the NBD_OPT_INFO, NBD_OPT_GO, and NBD_OPT_EXPORT_NAME
messages.

Fix CVE-2022-26496: In nbd-server in nbd before 3.24, there is a
stack-based buffer overflow. An attacker can cause a buffer overflow in
the parsing of the name field by sending a crafted NBD_OPT_INFO or
NBD_OPT_GO message with an large value as the length of the name.

https://github.com/NetworkBlockDevice/nbd/compare/nbd-3.21...nbd-3.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Tag as a security bump and add CVEs

 package/nbd/nbd.hash | 8 ++++----
 package/nbd/nbd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index f0df35bc27..f58a89bf9a 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
-md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
-sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
+md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
+sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
 
 # Locally calculated
-sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
+sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 0a7f08b2cf..f0fb23910e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.21
+NBD_VERSION = 3.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
