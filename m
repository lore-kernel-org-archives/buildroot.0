Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513C1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC904611C3
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC904611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A505B6069C;
	Sat, 16 Oct 2021 07:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOm0cdtmntnh; Sat, 16 Oct 2021 07:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE85D6067F;
	Sat, 16 Oct 2021 07:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C494C1BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DDA401DF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id el3IKkZop3pZ for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5967400BE
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2C5C288ED2; Sat, 16 Oct 2021 07:36:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:39:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e78d88bd2adb3f2167a5abf56cb1d3a07003dab9
X-Git-Newrev: abd3ef7c9204bbec2db543d4838b89773026bcde
X-Patchwork-Hint: ignore
Message-Id: <20211016073638.2C5C288ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: fix arc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd3ef7c9204bbec2db543d4838b89773026bcde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the follownig build failure on arc since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/93f231c4a860f4467029a2c2e4fc0b67096b14f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-Add-support-of-ARC-architecture.patch     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/python-ujson/0002-Add-support-of-ARC-architecture.patch b/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
new file mode 100644
index 0000000000..d38b24f5fc
--- /dev/null
+++ b/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
@@ -0,0 +1,36 @@
+From eafa625a34fd5d8bec18eddfccbca55ce77b4849 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 1 Nov 2018 17:36:17 +0200
+Subject: [PATCH] Add support of ARC architecture (#82)
+
+More info about ARC architecture is here: [1] & [2].
+We need ARC supported here for many things like:
+ - ICU (see [3])
+ - Qt5 etc
+
+[1] https://www.synopsys.com/designware-ip/processor-solutions/arc-processors.html
+[2] https://en.wikipedia.org/wiki/ARC_(processor)
+[3] https://unicode-org.atlassian.net/browse/ICU-20155
+
+Fixes #81
+
+[Retrieved from:
+https://github.com/google/double-conversion/commit/eafa625a34fd5d8bec18eddfccbca55ce77b4849]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 41c5b02..2e1be0d 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -94,7 +94,7 @@ int main(int argc, char** argv) {
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+-    defined(__or1k__)
++    defined(__or1k__) || defined(__arc__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
