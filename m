Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3679C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:39:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CADD611C3
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CADD611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC6A40227;
	Sat, 16 Oct 2021 07:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdD2YXSTVzuS; Sat, 16 Oct 2021 07:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 574E8400BE;
	Sat, 16 Oct 2021 07:39:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74A911BF95E
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649E440253
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGGdMJLAjrg1 for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADED24024E
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3686388EC0; Sat, 16 Oct 2021 07:36:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:39:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abd3ef7c9204bbec2db543d4838b89773026bcde
X-Git-Newrev: 9b2d4a4211b8c8d9ece45b472c4f7cdbbb1ee526
X-Patchwork-Hint: ignore
Message-Id: <20211016073638.3686388EC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: fix microblaze build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b2d4a4211b8c8d9ece45b472c4f7cdbbb1ee526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the follownig build failure on microblaze since bump to version
4.1.0 in commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3cf5f266e0101a6c43f97801157fb6b2edce1ed0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-Add-support-for-microblaze.patch          | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/python-ujson/0003-Add-support-for-microblaze.patch b/package/python-ujson/0003-Add-support-for-microblaze.patch
new file mode 100644
index 0000000000..14fd52eb98
--- /dev/null
+++ b/package/python-ujson/0003-Add-support-for-microblaze.patch
@@ -0,0 +1,27 @@
+From 5cc233e98b74c5c370de888198a2b35200d55468 Mon Sep 17 00:00:00 2001
+From: Florian Loitsch <florian@toitware.com>
+Date: Sat, 12 Oct 2019 14:35:52 +0200
+Subject: [PATCH] Add support for microblaze.
+
+Really fixes #73.
+[Retrieved (and backported) from:
+https://github.com/google/double-conversion/commit/5cc233e98b74c5c370de888198a2b35200d55468]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Changelog                 | 4 ++++
+ double-conversion/utils.h | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/deps/idouble-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 1a71df0..221467f 100644
+--- a/deps/doyble-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -102,6 +102,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+-    defined(__or1k__) || defined(__arc__)
++    defined(__or1k__) || defined(__arc__) || \
++    defined(__microblaze__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
