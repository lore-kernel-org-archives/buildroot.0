Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2641C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BADD610D1
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BADD610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E802E401EF;
	Sat, 16 Oct 2021 07:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfOKqHRZ_NQx; Sat, 16 Oct 2021 07:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD8C1401DF;
	Sat, 16 Oct 2021 07:39:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 652271BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52B1C81CBA
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_785eAshbAb for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B39081C20
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2143E88EC0; Sat, 16 Oct 2021 07:36:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:39:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1f3de47d1c8822ddbeaf9ea8512a5f00148ad7
X-Git-Newrev: e78d88bd2adb3f2167a5abf56cb1d3a07003dab9
X-Patchwork-Hint: ignore
Message-Id: <20211016073638.2143E88EC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: fix or1k build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e78d88bd2adb3f2167a5abf56cb1d3a07003dab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the follownig build failure on or1k since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a82f794f130b0c8d5d626c507bae2e22d15f801b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...port-for-aarch64_be-or1k-and-microblazebe.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
new file mode 100644
index 0000000000..b43eb54dcd
--- /dev/null
+++ b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
@@ -0,0 +1,30 @@
+From 768a445f0c28311bf88685bf0bb990505c12fd4c Mon Sep 17 00:00:00 2001
+From: Florian Loitsch <florian@loitsch.com>
+Date: Sat, 8 Sep 2018 18:18:15 +0200
+Subject: [PATCH] Add support for aarch64_be, or1k and microblazebe.
+
+Fixes #73.
+
+[Retrieved from:
+https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ double-conversion/utils.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/double-conversion/ouble-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 98a2a11..492bc97 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -76,8 +76,9 @@ inline void abort_noreturn() { abort(); }
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || defined(__aarch64__) || \
+-    defined(__riscv)
++    defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
++    defined(__riscv) || \
++    defined(__or1k__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
