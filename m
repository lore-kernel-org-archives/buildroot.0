Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06442C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888F360BE3;
	Tue, 29 Aug 2023 20:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888F360BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq0JHxPBi5Yi; Tue, 29 Aug 2023 20:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA49C60C15;
	Tue, 29 Aug 2023 20:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA49C60C15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C25721BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C18482118
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C18482118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y024kMgtC6u3 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:16:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E3F18210E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E3F18210E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.251]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N0oG5-1pnuxI2PhN-00woOn; Tue, 29 Aug 2023 22:16:17 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 22:15:11 +0200
Message-ID: <20230829201514.208583-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OsISZnGLc0DH9UYkzK4h2+GWnkqdY6FwCmR6ZuKW3bEwkZDf6Kc
 Z2ruZL/zH/LN8ovWyTwuZlQACYMTQ514JeY6WKJnYz+MuRDz71ZffKrMmZEf+5L3+ECUi+n
 PCDi9fxIsiMFTFsD2m/630cJR4VkzpTSYj7wwEXPqxuUmjE9WEHAiHLEG3XfmHXbVTaMQCj
 la1qrpFn4ElCzgjL/5aEA==
UI-OutboundReport: notjunk:1;M01:P0:mE6RCThMkc4=;HYGf9KN5RkFrpajfr6vGJSE9csC
 lRHhQeRHC3+1tvr3YQOvyu3VFcahWhhE54NiEsZW7w7cWZSjQNcmWKQ/Pkif9unYfX9sA/tIG
 cqCgh2kjsKegJOLYKQCosuJDPu2j7XEFcMR1VO/ycEJd728X+XA1f/VjPQykl1Y6hFioQQ5Iy
 +VP1ypUo1BR7OheNIh6paSZDcBPJtaUdkkxE7gCmqUwv+Y36QELLUzwrzd66A2PsjLdCw2VJY
 W+j78CFEHgg5iNC6pfUppjYr3W0WuLI/GM22q5UsK2laIUligzb+aax3B55VI6vgGllAmeSML
 ugb01a58S1TUyPlIGbKmXf9QLUQD72JDlqw6jSAO0dT90AN839OfwVFQuWy7pRoal6ZqGUwVD
 moUjPZd9Jex9h8HuQwh/Oz2oXwNNXrfDmGwNm2xTY+h98Zw2cSAOAhScBG2nfJFEVU6YoDCi/
 MdpecvqGlrpTjijMDfo3sRdOZ9VmqPJY8jiF9CgQ7OmN4pvXwR0NqABjR/49XMvbHqzxLhYd/
 jtjOqrneRSmhJLseoSG8p74s1klpM0DzuhCJeKpUK4ir6FHsscGYnUS80mu7spODv9N7/RzR5
 l7/V14grU0fEucdVpZE4LhzgcUg9NcyQnpeBcjkq2WP9sPL15SgbPvhi7De+EpcwhPO223hA3
 WtjYA82i//UnxAa+mm6caWXfjZoLGcot1WsfteU2dirDLOMHP61PhyEvT0+Uj5f/awJd2Z2+i
 ZuYcQJysc9kNoCp+ini4zPdMFAcebKTHVQuTzDud+Ijrsiv+pEL8xpuHlLE9pWmjpz8JCBxut
 A/n6/LiSKs74EIT97PF8ehzwICUQAtyCok9luu5d4N8n6q1jJDsbQus4D77gD85r4TKVBTmhu
 WRXEuCkRS21JmQLg40PtQ8V2cmN2BKHxbUFIhGO66cynpDgUsgrN8SCTKnU79m5iehwAe1izK
 1HO2WtjdmTqmgxYtxb5NclkbOTs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693340177; x=1693944977; i=dalang@gmx.at;
 bh=6kxo6uCj98M/0rXHBVZ/bDcmwKwcW9vY8mqAjx0Li80=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=t6KzAVGxeV2TG5UZyMV6a0hVHRwBZ5vUmTvp+xyQeD/YkD5a44f3T/fSmod5IxjjvUJPD8T
 Qom0mAzLz1PEkikoDURr0u32KDx1HIccHB+P8wNDzBWWOMFCaPOlMI2t7cyBc6PsHuADOhK+r
 v/Ketiei42+I8/0Ikb3Yy2bfcchf/PAwMTw9Tt5RawtcINUpX1TxbCCwA8cZhpXcTGS4OX0P0
 UzuY0n0Y1o7glvL9I+Kye72TQnw9iT6ZF0Ap8dG0nvpEFJj6q1usQ0dlN7qgh/7kzFCWk8ToM
 GZdSaOib6JOTH7CzQpEAZhDjUVklYlZMOprFOr4dqineSORxnW0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=t6KzAVGx
Subject: [Buildroot] [PATCH] package/libxcrypt: fix build with perl >= 5.38
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
Backport an upstream patch to drop uses of when.

Fixes:
- http://autobuild.buildroot.net/results/04c/04cf8d79fe8a58c3438e7be95ae781c9b2bef8a0/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...ommon.pm-compatible-with-latest-perl.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch

diff --git a/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch b/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
new file mode 100644
index 0000000000..7a17fa5c12
--- /dev/null
+++ b/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
@@ -0,0 +1,50 @@
+From ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <fawaka@gmail.com>
+Date: Tue, 6 Jun 2023 17:03:57 +0200
+Subject: [PATCH] Make BuildCommon.pm compatible with latest perl
+
+It was previously using an experimental feature that has since been dropped.
+This removes the use of that feature.
+
+Upstream: https://github.com/besser82/libxcrypt/commit/ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ build-aux/scripts/BuildCommon.pm | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/build-aux/scripts/BuildCommon.pm b/build-aux/scripts/BuildCommon.pm
+index 0e6f2a31..c38ba21b 100644
+--- a/build-aux/scripts/BuildCommon.pm
++++ b/build-aux/scripts/BuildCommon.pm
+@@ -11,7 +11,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+
+@@ -519,19 +518,19 @@ sub parse_symver_args {
+     my $COMPAT_ABI;
+     local $_;
+     for (@args) {
+-        when (/^SYMVER_MIN=(.+)$/) {
++        if (/^SYMVER_MIN=(.+)$/) {
+             $usage_error->() if defined $SYMVER_MIN;
+             $SYMVER_MIN = $1;
+         }
+-        when (/^SYMVER_FLOOR=(.+)$/) {
++        elsif (/^SYMVER_FLOOR=(.+)$/) {
+             $usage_error->() if defined $SYMVER_FLOOR;
+             $SYMVER_FLOOR = $1;
+         }
+-        when (/^COMPAT_ABI=(.+)$/) {
++        elsif (/^COMPAT_ABI=(.+)$/) {
+             $usage_error->() if defined $COMPAT_ABI;
+             $COMPAT_ABI = $1;
+         }
+-        default {
++        else {
+             $usage_error->() if defined $map_in;
+             $map_in = $_;
+         }
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
