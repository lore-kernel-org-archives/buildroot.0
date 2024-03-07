Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B57C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 16:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBAE41BBD;
	Thu,  7 Mar 2024 16:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4QdgVpsNDgA; Thu,  7 Mar 2024 16:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3137F41BB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3137F41BB6;
	Thu,  7 Mar 2024 16:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 775251BF5AA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CB482998
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yi6w93DzOdLK for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 16:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B739882983
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B739882983
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B739882983
 for <buildroot@busybox.net>; Thu,  7 Mar 2024 16:52:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQMuR-1rUiJ82BPd-00MLgn; Thu, 07 Mar 2024 17:52:19 +0100
To: buildroot@busybox.net
Date: Thu,  7 Mar 2024 17:52:15 +0100
Message-ID: <20240307165218.10027-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Njp9oWnRaWzAgbZWtw0M7vlRqj3sU3XfQMDWBNEQFYWD/jsnS1B
 SeV//rBwJBa1SOnDt/lY4LFz6aMCJLbC5Lza+RgFU0221a2wWrB06BgK/I44r2CpV0yR2MU
 eEmxu1TQ/AlVbx+vUpXzW0NWGSfa8Gb5tKD4D3VgXiESCVauKVsKUHYoKH4fd4S6ToSbTrH
 kndI8/idbbSstA9f/Z7hA==
UI-OutboundReport: notjunk:1;M01:P0:CrdsbzDE+U8=;jxUjcwtfUABEUfGpJd/zlfDWmLn
 OdVAvRFQenfnfaWQx6ik0D3Cxs/OgUqlCKLNxgZQNlh5C1zFyPv/5+wvrtlbQxS5dE0GDcWn6
 cKe/jLrXpKh/kwSCxR8Sa0Ner4rS66rxQ/QC0qCa5ac+EbhNjt0SDiYcQVss9iK6XCDvEDkLn
 c/O1xvRbQ/hMqOz4yu55ndpUrRcbcK6LLCUPWGMy1VeFccc4jclR/uPz1lIqvOjXkAboAPI07
 Lr/c+Vl6C9ksQ2DQTaCJMiqwSx1V6NEX/muZOu022AgknK1S0idk0GW1PczgUqORDJvpc6NCC
 NYflmw+aFvsjP2ASq6CMAyuPvbixYQ8dtfMXK4NSJCo+/H9GDejISMLI9acqGWpMbF8aY4xf4
 JEzHcYpVzvQfNZR0abyYYLOtCfssMh1sfuJy5Ig+5AYpaqgPlxgT66fljOKL+4ujev0BRegFC
 Uo78wJZPu6DoMwvQHQNFt/HLNGowjYoArcrthiyhAMi1NoWOsIjRof4ATtZFAmEsIrdEyiVEj
 LaTE/zzYkhxOck6nACl/6I4jxY2Adfx/f3TSpg2qOJbKU9iYD79ORdA3VwB/AxYRx3EKpB9Ho
 BUqIP+/c/lYxFHxkDXfkHHgvFK3lpFKzYlH0ZkIgCHnENHOptw3yg0AuOG2T6jqNdq4v/CnPj
 +juNqOADfDveZrzhEsCv+AfcW5jXUHUozFANG6iCUARENsWGmAR0M+gIGhHp6Nx16Y+MXom67
 HnbnNLUsmMCQJOvjUGbeDOsAQNzmqEZAO4LjQAdgX7ZYvtxXqfcQgF20a6i30r1XdyRi18oof
 yjkPBKvqp1aG1xnycP+fWLB5KIr7pNMOlt/05xKsGM9Vc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1709830339; x=1710435139; i=ps.report@gmx.net;
 bh=aWThDUvoveAEQKg85YK6Qp0GHChqymWz4Q2eu9hx7Rs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=U5EcKPo3GYeym9SKkaZp0OcK8k+V68y/06Kk14MivuHC6EG0Tev+L3NyzjswHYQp
 AGSJJgg14zfRmCF3s/3o0qWqzyPG6/ds+Uee/oqMLw1liwyhAqBddqHtGCW6KSHjK
 J+ERRp9OOPj2mSECe+AJOMKJbQaC6LxAVXR70C39WKJzfCG1MuqX+i6cFz4R4/VZV
 kpKw1oQHcyCcqxWbqQwxt52+0NHx6Z1coqUrfs1p9fqNnk2cYg7E3RU/UUYJZzBJ4
 lKqodoKl3zlFA6JqKU64EGe8a1KtmwJvs/ti1qEuBWn1Sbsvw14R3tE2oUFPEz9EF
 Wvc+DJYZJPTROH3cWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=U5EcKPo3
Subject: [Buildroot] [PATCH v1 1/4] package/xz: bump version to 5.6.0
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

- bump version to 5.6.0
- change homepage URL to https://xz.tukaani.org/xz-utils/
- add BSD-0-Clause and update license file hash accordingly (see [1], [2],
  and [3])

For details see [4].

[1] https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c
[2] https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71
[3] https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699
[4] https://github.com/tukaani-project/xz/blob/master/NEWS

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/xz/Config.in | 2 +-
 package/xz/xz.hash   | 7 ++++---
 package/xz/xz.mk     | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 687bd55482..7130fa5e8e 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XZ
 	  invoked via appropriate symlinks will emulate the behavior
 	  of the commands in the lzma package.
 
-	  https://tukaani.org/xz/
+	  https://xz.tukaani.org/xz-utils/
diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index e8025a8065..71c2c65a3e 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,10 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
-sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.tar.bz2.sig
+sha256  88c8631cefba91664fdc47b14bb753e1876f4964a07db650821d203992b1e1ea  xz-5.6.0.tar.bz2
 
 # Hash for license files
-sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
+sha256  0864e508475f20b43a2393957fdb5a966558099ffa8fed1e3e73fe2b3eebb145  COPYING
+sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 40fa59ca7c..e35fbc0268 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.6
+XZ_VERSION = 5.6.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
