Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE00C678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6130E4169B;
	Sat,  4 Mar 2023 19:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6130E4169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MINYHKan-t7H; Sat,  4 Mar 2023 19:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512214168C;
	Sat,  4 Mar 2023 19:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512214168C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD0B21BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B6B60C1D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B6B60C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZqBodIKWohN for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:49:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E9860030
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4E9860030
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:49:31 +0000 (UTC)
Received: from localhost.localdomain ([146.241.82.238])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YXsmpoxnU8S3GYXsmp5kaI; Sat, 04 Mar 2023 20:49:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 20:49:27 +0100
Message-Id: <20230304194927.2385765-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHTTmX1F6MLxBu1cen38rb3svtb3ToXgxSA8uNRx14lf69k8lNqtH8CrAFcYSE/3fIZLWQLBsDhtEMr30ovNqMu38Jp5/8X+CeD6L9yxscZHqjE9RUuZ
 wqDSLFH5sMCkbln3X0bIt193zs/kfOupP+63dM8vIHhHjwDryzWXh/eOn95Ay755wt7du3CTnpi6SrswaiUW4xOHgz7R0ZT7JLTBpIdZKM0STc+/PSfvNJ4O
 IBCqFd/h8xknC4W3nSJCAXMiJ1YPX94kiNDT9l0s8TxRUJNpViWPLtAqg27KAQqz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677959368; bh=pwGrrqhrtltQbWayrcud3SiSlcno0SXGLYl3qjBrr0Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=PYlaEntkrm1fAn6je3yd3mLN6eUjqC+Jn6mtonb22gYt5sFWnoKeb97IeMuaTixbu
 pkoXWCBvW1nSf7hk95XgbY1T93YIQDtLiJjE04hJN0Iqxkv/4sSJW9odWpExPvsrhw
 QEe1bIs/2zGIN6HHJobNbQQ3obz6exqSUwbty51O49XU/w3vSKL65CzovGBdOhW/br
 10k9ajSfGkXnoPwjSWeccjqwCABkVQSvZSrBO4iDtO6eVNgIh2eU5br2FBmoH1kx5b
 bjdkxFZ+jZcl9ud3tpj56JEx5fS8bUU13OAq3+xDOZDKoEvWA/R/Qw/7lrFszcQpb3
 ogEc/Mp7lp5cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PYlaEntk
Subject: [Buildroot] [PATCH,
 for-next] package/harfbuzz: bump to version 7.1.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the major release changed all the packages that have direct
dependency to harfbuzz has been succesfully built:
- efl
- libass
- mupdf
- pango
- qt5base
- qt5webengine
- qt6base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 9489f25c6a..e881f58510 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
+sha256  f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b  harfbuzz-7.1.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index b0112168e1..24c6f3ef27 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.3.1
+HARFBUZZ_VERSION = 7.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
