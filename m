Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4DC83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C670461341;
	Thu, 31 Aug 2023 19:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C670461341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkNjlPWZ8p_x; Thu, 31 Aug 2023 19:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1066C61331;
	Thu, 31 Aug 2023 19:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1066C61331
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD6401BF3D4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C37C961331
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37C961331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUHZhSId1w03 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:46:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FAC761321
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FAC761321
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.251]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N7QxL-1pb8jO0F7F-017m9g; Thu, 31 Aug 2023 21:46:03 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 21:45:13 +0200
Message-ID: <20230831194514.37493-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5Lw4ZYtD7iO7MMF7SQn2hoK6Sp5wEuZlUuNhJg+AKZujCHGsCgd
 QRw2ufnCXBad2gDFTb13+jCSRzCCmlBPYgWajBm3rXCQddyig0amv5LnSy+jGLFAmQUlpgZ
 uQxJLvwB5mBNQSOphiBA5veKhPaEmfnoph2e01dO4qJAbkQk1ZYFZiy0gmuioos9VkCrYyq
 XBePkdYFA8w0G5phdnxeQ==
UI-OutboundReport: notjunk:1;M01:P0:U/N9yXLexS0=;dt02mW77U8qLz0DM08DUMBVOIDW
 j5KdbDgBkvDALwz49oS2zhtJ6E8v9MlsSg1XZCNYWe2fI8IaaVhkPVLPDDhX+W3FKAxykfq1w
 67HCU4Y/h+G/H1B6FcBrDJpJeVj9MLhx5IuA0F3VVbNF9GO3PUB2Y6vc2xGmyU0sSs6XB5fT5
 R8ZLABvn13CWJ6ylzMgl79zpYU0aGveuYAsnUiKzA2KnBeTKAtjtaihw0ynrvkMXveqJDZx7w
 1r2srApBsYVaRfCJyrspGGjKFMvNYMT11M32bG2Sg/RreLyO+PHI0jGvDLhgW0grHpQ0AJDi3
 c8nEzTev3rpJDs4dswycduExo1lnEeLEa5CuKJobRW6GIFpV1zHGXGVYBFWx4AsVUW8+pfXVS
 0ta5dthTRh9WqJvj7YKh3I07gJWrcLXWojr8+y7NwDQwWa7zCb0NOcMGGyBMurZ13tekEEEZ6
 hyYHFhg2s/5G5NcqfBCbewehBBOxoabiSjaoyWfHCyCu92ukvUDrNLP6khzh0IMefInaAK00h
 OB0paeiHK0L3sZ31itftMzYnuNQ4P0bFif3YxU+FjIKra42gI30IiqlD+1BU9djhKohdwUwbD
 aVMkffqWMy8t6X2PIEZhM5OMTms1P717eZpaS00IJSYR9eUFJe5/9XzyQ2g6JWPtMGnFJMutn
 zQbWswwuF3k6WYQ42rdRz3+k874YlpF/V0Sv00uFM1KbpHmWJcsrZuirCz1rkLtFlxOhNzWla
 RYgjuEvrOlmRBRw9bnVM2F3z8XCSNU5LfJ+HDvbM8UReE9cHVLMH6OpLOBtxveXKE4Jt1sVsf
 GpcvrCcC9JXCPOhXqnjJep/CQmSZKhLSSfGcc+4I/J3xgNenmF1q+xgetN2cJkYDHyFIIfo5D
 epTqbJCGH1Idjub74etE/L3NvD3HEXkRijgwFf/f1mCiiu0qPd7ZTLHuukCrMb9UVvDdokEVj
 VEVUTors994h/m9tzPOgD0yPMcY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693511163; x=1694115963; i=dalang@gmx.at;
 bh=wKxABYLKxoxeaLBazu+IV0nxjA0pFPiQptD5Oiwvg2E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=dsGtc7S30zZcOcdTXPckia1FHPMl09hZkgdI6n6ZDRd1nNftYvGLti7qawxph/QbKQt4/Rq
 OQp6x+lJ3NVINd8DccvZXbraGtv0/6RP/5d7F7HxCZ1YsdEvHwaRutmPuE2eqAh1wQ+XKJspt
 hpu45YfEeH0SqqUTN/cS0SA11rVvq1wj1DtgX/k8YJ/vHgMThK/MWYglMkvynC7RrwM8LqBKw
 hlA+hYalPprWRLxSKA2nHySFB9jMDtNfbcWhwm6IDpBNQ0yVE1qpgcIxDBYEFI2gqsxpLLwqD
 l0Rncy+acJwe1dQ95fmE/bcyfd3Z0V0iiVH++GHO97jLgsucvW2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=dsGtc7S3
Subject: [Buildroot] [PATCH] package/libxcrypt: fix another build issue with
 perl >= 5.38
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

perl 5.38 deprecated smartmatch (~~ and the given/when syntax).
Backport another upstream patch to drop uses of given.

Fixes:
- http://autobuild.buildroot.net/results/727/727aa831881af36394bafef9e13a0dcbd9d0db3a

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...ve-smartmatch-usage-from-gen-crypt-h.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch

diff --git a/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch b/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
new file mode 100644
index 0000000000..444896b53f
--- /dev/null
+++ b/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
@@ -0,0 +1,61 @@
+From 95d6e03ae37f4ec948474d111105bbdd2938aba2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
+Date: Sun, 25 Jun 2023 01:35:08 +0200
+Subject: [PATCH] Remove smartmatch usage from gen-crypt-h
+
+Needed for Perl 5.38
+
+Upstream: https://github.com/besser82/libxcrypt/commit/95d6e03ae37f4ec948474d111105bbdd2938aba2
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ build-aux/scripts/gen-crypt-h | 31 ++++++++++++++-----------------
+ 1 file changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/build-aux/scripts/gen-crypt-h b/build-aux/scripts/gen-crypt-h
+index 12aecf6d..b113b791 100644
+--- a/build-aux/scripts/gen-crypt-h
++++ b/build-aux/scripts/gen-crypt-h
+@@ -12,7 +12,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:std :utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+
+@@ -37,22 +36,20 @@ sub process_config_h {
+     local $_;
+     while (<$fh>) {
+         chomp;
+-        # Yes, 'given $_' is really required here.
+-        given ($_) {
+-            when ('#define HAVE_SYS_CDEFS_H 1') {
+-                $have_sys_cdefs_h = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
+-                $have_sys_cdefs_begin_end_decls = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_THROW 1') {
+-                $have_sys_cdefs_throw = 1;
+-            }
+-            when (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
+-                $substs{XCRYPT_VERSION_STR}   = $1;
+-                $substs{XCRYPT_VERSION_MAJOR} = $2;
+-                $substs{XCRYPT_VERSION_MINOR} = $3;
+-            }
++
++        if ($_ eq '#define HAVE_SYS_CDEFS_H 1') {
++            $have_sys_cdefs_h = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
++            $have_sys_cdefs_begin_end_decls = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_THROW 1') {
++            $have_sys_cdefs_throw = 1;
++        }
++        elsif (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
++            $substs{XCRYPT_VERSION_STR}   = $1;
++            $substs{XCRYPT_VERSION_MAJOR} = $2;
++            $substs{XCRYPT_VERSION_MINOR} = $3;
+         }
+     }
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
