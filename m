Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C7C55182
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F0E6065E;
	Sun,  2 Aug 2026 19:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KONL4PaHoeNW; Sun,  2 Aug 2026 19:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705AB6061B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785699882;
	bh=1o0i3Fidqc0TeBYnJmxkPRJHnpPJPgXaDlnR83csiTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=BTySTMwMu+6e1CyFENpWjs0EmcGT+Ff9bVXEZW1RyVN2aacCmn/OQ3hUYdCSQv/T4
	 OtqPPF172YiBJwMQhiiJduiftAJT6Gmtaa96t2tzJ5Ea9u7qj/wv2HvKn50uKblU3A
	 C2M5BWTx5Pg6T/0j73+T5zyutY2kIcXm1GZGMb38XX9rWJqYZ3dSkYUdRcmzljeCs5
	 n+tr7jGObHlkzbLR9YIWPwoEYMM7PKQwV0wH5Sr2qW2gwBLaPhyBuIBzcNxSMDgJBe
	 pIXR4FVyJPuGwHuPvdAWhqK68jETuwLBLrKbjCfY4kiWPYDUlryTNCZnwdKLllkD8c
	 QnSPpCBDAjdDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705AB6061B;
	Sun,  2 Aug 2026 19:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C5C13B9
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D7EE6061B
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UToVxWC64YMf for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B4386061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B4386061A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B4386061A
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1wgTDw1jEL-00Cwlm; Sun, 02
 Aug 2026 21:44:33 +0200
To: buildroot@buildroot.org
Date: Sun,  2 Aug 2026 21:44:20 +0200
Message-ID: <20260802194421.1914703-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cOlVyRojvWJJtpmQ/Axx+twHZpKTSRBggER+Y1Ysx0b9cuotCDi
 x1Yh7LPgOzY0F1XlAP1zVLSkLpUh9yJxkPZ+v5Ewz9bnSr7g9WaLMBjaIwNzxyS8miUjTJY
 CMl8cmtrBha5OCjsMniLrJTFIU0E21VvHqUF1L3TnLgccCFxPk/WM4qhIeWOOpe1wf164J7
 SpjbDY0CMoxHIJoBqdBSA==
UI-OutboundReport: notjunk:1;M01:P0:IHJXNL8BI5g=;bQfQdJ2R5VC8g+Ks6pW5mtB0cFU
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785699873; x=1786304673; i=fiona.klute@gmx.de;
 bh=waHIRW3XJAgHg+usbJykerve0SEIHBbxRBWK2+ui1+8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TfpRjQI6mr4oz/2247CwKeByCrwEQDmjG7hl0dBqAP6XE4LUYdmClo5P51OVRj8k
 EQKVAEAI4zOWTWBmkGJ5Zq9TwP5nP7O9IuPRekdcz56GQBkoEzqbfQerkVlTmKxqW
 M5Orsc8782JtE0OFG+0yzDu+j2MiPzQ2kw21tMyYl/lJcX2A4u4BjinSKQhCNdrUk
 NTR2rnRVVepnaH7t6pFe4KAeF6Vt+fSrPPBsgo1seoOWjevL52OxCH/ahPw8qTo64
 4cdQRScauUMFERZVv2z8AledhsTCCaiePBP6pbEAGgQXLWz0AH/+NXiMUAIQe1BZN
 EdzfTJCwaY60nCFHYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TfpRjQI6
Subject: [Buildroot] [PATCH v3 1/2] package/fakeroot: bump to version 2.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The source archive does not contain a pre-build configure script any
more, so enable autoreconf. Fakeroot also contains an experimental
Meson build definition since 2.1, but Buildroot should keep using
autotools until the Meson build is stable.

Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
not support before v2.0 [2]. This update allows updating btrfs-progs
past v6.10 without breaking build of btrfs rootfs images.

Upstream changes:
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
[2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* commit message: explicitly state why Buildroot should keep using
  autotools for now
* add comment explaining why autoreconf is needed

 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 9 ++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 82a6214380..0c330b7792 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
-sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
+# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
+sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
+sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 12d7f1c4a1..8354f994ee 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 2.1.4
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,4 +18,7 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
+# source archive does not contain pre-generated configure script
+FAKEROOT_AUTORECONF = YES
+
 $(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
