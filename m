Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424BC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 13:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA82812C8;
	Wed, 12 Jun 2024 13:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcy72oK8r-W0; Wed, 12 Jun 2024 13:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F6C812EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F6C812EC;
	Wed, 12 Jun 2024 13:57:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561BF1BF371
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38003812EC
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5Ln1tasARha for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 13:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BB3681153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BB3681153
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BB3681153
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 13:57:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.77]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bfq-1sTxIM2dd0-015RDR; Wed, 12
 Jun 2024 15:57:28 +0200
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 15:57:25 +0200
Message-ID: <20240612135727.11811-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612135727.11811-1-ps.report@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5Jfp7JWVIw+yMM4+GcS4ufQfvxXLAlSsLE20xvblZn4yungvzfd
 DUWZsoIBpjbODWunPAc2SgVMzmTP9aPeuBSQkfWcZK1KQm4c6J+XoKHaNdDIYog2mJ1qsT8
 hoBRs/xBIvh/5VcqH8cSpvRD/nFltOBRvBKbPiGMeDch0S0tUmAuc5O4Do32GvlwMfSDzeU
 GwKDb1BRKkd15OUDtIrmQ==
UI-OutboundReport: notjunk:1;M01:P0:wHD0GygEtPM=;aO5dfxbLlzncCMXQS+ay7j4hq37
 e+7DQnNYB89/ToKKq6vU9AKhep044ODLI3ZYux2N7US1MENlG+iy5gHGR0jg0or2LoZ6kdPkb
 EBgSAK+bLESO7OM+D48/YfWCULBdDBIR5uhRUtlCRiYh5oGLAGwLaEck5l9zXCJlAUtKHEXuy
 lnRJMieP44ixqyCQ4S3pcpOaoD0VZHTBHhNpIdAUktI7yk16uYX8Q3qJ4bl8BE6XhmC5dVxXi
 Zb5Sx98HmadjHnm0gC/cEWsqBA9UZzuDAjqYfjoyWu5L7qXSLhaZEyi7UXAg3qfn1KQCCVAGv
 UUytfJ1rVUcPE2tD+T81Wj0s/TanRzBVL/dDS2YIZu52MVcsBFv8RRy5CMR72gobgYXsSwawv
 utB71bw9DK6VKS3QPzWH/u9iybcPSreEUpqkgLFAdoxuofKVksya9C0Szxva17oc3ahR7TDr9
 k0iO/iEJ2F+ywG8mPLF5RqshMXrJLsNDYaPXSRyU2qANc/KUGc/ocuFvsTSeHYFGGf2W5Jvme
 T0NMJ4Qcv3r1YJCGmq7U1JiepUfVMiUWaaF4kJkxO5mCZ73F7EhZiTgjKE0UlXVq8pU7rLWgm
 2VF6282Uuu2uOId0r45ZKMvlTqu7M3MBxo8Zp4E39UQnPGX1ZwWs7VTocXogYzD0NHiy1xUMQ
 n7umd6wQOYBf/ORiZ2qvATjLEQDqsp/kG8dpjlzVOJGNu/p1MZcxbnANUXKPwJ9Hfj/N4fOGL
 LWDNtxYd4DdvBdXayxb1AXitNvVgaTvnXZZ7dYfxDjKf1qeeAxsZ70Z8irPJ+2NQA1BG2/hIQ
 pA+h68B9DZtT2k2VTVHDSOjVv5MzyJ5iio78o9WsxHHxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718200648; x=1718805448; i=ps.report@gmx.net;
 bh=2VDnQF54PKrQRtFymzYTbT05OW4xXQnzQnySf5hHUe0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZJA/keNl58WsW45hLvZwL/brwr4w+0B+UJ3BA99jLPMT8NqRu141BTQWNEU+vBPK
 mANRJQiVSGpEv+EKIstrgdFFQRNPQIHKU95CH1OlpDxoQH/uhLww5f6zs0rdQzQx9
 1MOi/x1CR5SPty+222mQFJLwyDAeeTcP4F6DowN/neF8PaFj/AS/jAiKM1AllqFSC
 ANJvRvkPvJGmK34nWiPEwg41X9NLJgwLE0PZneKNLbIH/ZFIWMgEEC+Gc5AeTrN95
 tZgPVbZD6/BI9LzvhZKeKydSmfxiultHLn6drqZHDBX9b5nTwRAfDt8HCIOhOpsfa
 ra0Yj7nNHxwi8OVJyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=ZJA/keNl
Subject: [Buildroot] [PATCH v2 3/5] package/xz: determine all autoconf
 options
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Determine all autoconf options (with default values) with the following
special cases:

- sandbox: use 'auto' (which will compile detect landlock in case
  kernel headers >= 5.13)

- unaligned-access: use 'auto' (which will default to yes for x86, x86-64,
  powerpc, powerpc64 and powcerpc64le and use compile detection for arm,
  aarch64 and riscv, see xz-5.6.0/configure line 21323 ff)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - remove '--enable-ifunc' (upstream removed)
---
 package/xz/xz.mk | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 10590f6be8..e051ad0047 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,6 +13,45 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+XZ_CONF_OPTS = \
+	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
+	--enable-checks=crc32,crc64,sha256 \
+	--disable-external-sha256 \
+	--enable-microlzma \
+	--enable-lzip-decoder \
+	--enable-assembler \
+	--enable-clmul-crc \
+	--enable-arm64-crc32 \
+	--disable-small \
+	--enable-assume-ram=128 \
+	--enable-xz \
+	--enable-xzdec \
+	--enable-lzmadec \
+	--enable-lzmainfo \
+	--enable-lzma-links \
+	--enable-scripts \
+	--enable-sandbox=auto \
+	--enable-symbol-versions \
+	--enable-rpath \
+	--enable-largfile \
+	--enable-unaligned-access=auto \
+	--disable-unsafe-type-punning \
+	--disable-werror \
+	--disable-year2038
+
+HOST_XZ_CONF_OPTS = \
+	$(XZ_CONF_OPTS) \
+	--enable-nls \
+	--enable-threads
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+XZ_CONF_OPTS += --enable-nls
+else
+Z_CONF_OPTS += --disable-nls
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
