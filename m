Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C0606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 22:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U52eg/iO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9jCE85I
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC9F860622;
	Sat, 21 Nov 2026 22:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQ5TlsBGBDNM; Sat, 21 Nov 2026 22:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8D6360628
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795301453;
	b=X2ttxK87sC2NMXqd5rgsIgfU9/bJx3Yyaky3dw4/ZEcpYZb1KiWebhgM5iuaCBzPPFhq
	 2I/fDFJnTQ8Yq0jw+3EQAHZkFEW7xkTbtINq5zK389bqsJHqOQbxZQHPBzfgXQguKAEth
	 7DFibpWb78xTchTQ2nYDPLGEBaYpoDQbXF+pT7Rsj1uk+32L621CV6fxQ+c33PUTdHU6W
	 zUfgB+ylnE76csGkSgJbTtxDCv1gwZS3zqHWSthLT0IkIJ9nEJxYcQLcdIKMlc4rJ41go
	 VpfGt5ksCwZd9Rm/5N8+gwRKGwNBOAOxHLZL60JNeIFM06mYQSdKsHpfc28ZnPfqr/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795301453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xKPzWewsxvQObfcWoliPHlx2GksXZ/fO4kSSE9F55U4=;
	b=cbci5NcGehdqoFuthwGKFYuzdYNa3uX1n9q7SypMrpUPVqJwTpOWPrVc7HfZ3Pi+UPPJ
	 AivWaTMIBq/18v8dq5KnO9m1uEQY/79PhLhO9N/G4DlxpMprxLALNQYrSSMx3ItSh8yy9
	 QGviUNDX76IKpy1SITuN2mPYvxtKDtVO1+jIhLCoSEf4EtY8nZhIApygWDF36UR0KSjRv
	 VRi5RoNyVobKy5IfGVpHBDGi/5y3LvS3BgiR+YHYAo2WFaN9CRfs8rCEuhYe1lty9pukn
	 R4JLBMDYNFH5qgLY+jp6fJTNM/GGIWWvKQ8U9tubCzSc0+iJC/vveItQBWTlBtKJFkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795301453;
	bh=xKPzWewsxvQObfcWoliPHlx2GksXZ/fO4kSSE9F55U4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U52eg/iOUtrO+HaM/5YcQuf8a2xE5FWIiIFLAoxzHytEDtQQVH2TaGeBlKcfAE8oZ
	 WdrphPNeZNL647kc41m1A2e+n44Sq/0IOOENGUbfbwEm5wZjr//MmKZ+nzJpMRBJIg
	 5E4nqJHxTJWLP3O+/q03UTN2PtFG9LljkZbiAk2fz1OOHKl2RcWa2MuzXOG7ZYNOWP
	 r+c7uG9odKXmKFfKvtIHptholx362iqUSAKWjmn5SeTHwTfR18v+0FwN0MQsICkedD
	 qKzwMyIVR2YuIrCBpVTxFOwLH1fruZYWdTBoaBsk/zkkWEJHeXxNGmCPcRyjjODA2O
	 hgFPC1efWZXbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D6360628;
	Sat, 21 Nov 2026 22:50:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE7E310
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DFC080E16
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEf4Y8bmBoH7 for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 22:50:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CBE380DF5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=E9jCE85I
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CBE380DF5
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:50:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4ac109a8a12so1112716f8f.3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 14:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795301448; x=1795906248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jdk5z2+Tv5RkVSNBS43gM2iOVrvozfs88kvOZe99vFI=;
 b=E9jCE85IOquZTMvVuRbVtaML7O/E3dnwlhptPbK3QNMIDpnzQlwdhfI5FI965g+x3R
 XdhZRFa75LOibsZV3rGdxRc+JZX34ObKRm33PdCgaMWWUalzT+uf8Li5TSFNnY+J58gF
 4TJ3DFMVjnE1Jjrnze6E8kNA6pVkEypFPG4hL5OPngbEmplFQ5dj7ZgfnAdDpcB3zwRN
 j+jLm56aF7mplGP9OqK3aL22V1Zy3r5vmwMMzR5iBcRnm3/lm3uFMWpSRuMYF7AzPhg2
 VR5/wZOm/psItznb22p4y5klJc4b7SS5mSqLpcbqBZQVzfSqng0d/ybaH6yDigd/MCXj
 RWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795301448; x=1795906248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=jdk5z2+Tv5RkVSNBS43gM2iOVrvozfs88kvOZe99vFI=;
 b=Qu9/G2v7kwwIUGSf/CU81KZQKYyb+JN+o+/X72Nk8ukOap1icRzxxG2YZ9nLvk+AgT
 a+6K1D64XVjPfWRW+WxiPMl1NHDxgkkZdf7h8XWglMIzC8r5prqc5CGkdAfKRvlMs/Bx
 3Qzb+xwve2BK/mE+6N/tO+b4G8l2ekkEg0iKev4CNgSlKVWwRpwY8lM3VZDZkOETbXMD
 4XX6hKbkaVIdtAmlR/VyJnYdjf9I+2RBg5kRhTKMX2SoU/CrDlKMEYgrJ8kqxPyep4ho
 MSZ6PEM9eyG0tzeYJIKuNm8jHYb1pQ2RT0wbuxtiSbHlfumsCIdQTFv2swpAyHw8DUQ8
 QdUA==
X-Gm-Message-State: APuU4Z/Ni0r+qcc/rRKaru3RfWqov9m6qROKixrWT0anRG5w8GQQWHoG
 8OfLyRTfTB6L3NZQ0i+5GCXzMrRQHxPavK5tGDQ3yMQUDuSuMWKZLv01Ls544ZKJ
X-Gm-Gg: AZFdTZeoap0vZEDklopNBkuYV2SPXdiT6ZtBzsjMfiwRuuRltzClZ0n9Fg3+TNHCnGb
 GVvlVjScozA2h03P7SFNT4b0JytiXmhw8cDWD7+5tOmvqg/TMy4Om78LZopaCzPRncAXzPqrAwD
 LTdevJqlqGEwC73zTG2uDWkHmrApg7RNtDVd+tHE4Mpfrci1ZPksc8GbUFI4dMjZyPaIoLIRkcr
 Lzy/ufLLKrDD0fnfxHGL53jbAp/vMZrYwAemcpxEaV8ob1UsefEjIx0Z/pcLASUpNkTTYDhnlqo
 Jr9jdJt9EeVvb1bMnoaaUE45jCMIKMi1c5vrOd54XFCSHKSYrve29pNd4wsQklnPMOnvM6bxi21
 23w2SpEdH90RFe1qLXiWCt7AmZ7OpRJY92hRNg3ACBL2k/vX2G+yHQCOUbdvLU12Rmuq9QLJzDR
 2iNgzyIJC/G3BirkEB8MvIauJKB3DyV2MMee+8l4+zKbB7rWXW2Q4w26r9jUbdnlt0+Xivyl6I9
 WQ9T1V7Qv6U0VIcNQB2Mmu5h6t/3tVtfPT8TOy0YkfNzCsGApYvr+dixt1jw29vDjTtGr4asi5n
 cux8HYGsupljRTY5tzS84/2KQkQ1UqRfaGZWVM939Y5iHnKujy4=
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id
 5b1f17b1804b1-4bb88824fc8mr169418195e9.34.1795301447932; 
 Sat, 21 Nov 2026 14:50:47 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab5ffcad11sm13225220f8f.0.2026.11.21.14.50.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 14:50:47 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 23:50:46 +0100
Message-ID: <20261121225046.447546-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to version
 7.1.2-36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- GHSA-qw9c-mq27-w844: Heap Buffer Over-Write when exporting pixel data
- GHSA-5545-xpgp-wj32: Use After Free in ASHLAR encoder due to multi
  threading.
- GHSA-wp55-fj9p-xx9q: Heap Buffer Over-Read in WandView with specific
  thread settings
- GHSA-cvrx-j29f-c5q9: Use After Free in splay tree when using it
  concurrently
- GHSA-f3r8-89f9-mx43: Use After Free in DOT decoder in multithreaded
  environment
- GHSA-4cmr-g39q-mh38: Heap Buffer Over-Read in specific stream
  operation
- GHSA-4jg2-g974-7w79: Heap Buffer Over-Read when decoding a PICT image
  and encoding it with the DPX encoder
- GHSA-6rm4-qg7h-vvc4: Heap Buffer Over-Read and Null Pointer
  Dereference in draw operation
- GHSA-8xm2-q8hq-m68q: Heap Buffer Over-Write when providing a specific
  argument to the ShearRotateImage method
- GHSA-5c63-85hh-8vpj: Policy Bypass when doing a sub image search
- GHSA-7pvc-jpr7-9wxq: Heap Buffer Over-Write in EXR decoder
- GHSA-58v3-cmwm-hj3w: Policy Bypass with -splice operation
- GHSA-h5qr-j3rh-p38h: Infinite Loop when providing invalid argument to
  the -rotational-blur option
- GHSA-rqg8-7wq4-54hj: Heap Buffer Over-Write in ICON decoder
- GHSA-6r6f-x5h8-fw8h: New security policy to prevent formatting
  placeholders has been added
- GHSA-j4x4-q2rm-qxjf: Heap Buffer Over-Write in the C++ readImages and
  montage api
- GHSA-rm4h-gcc3-55wx: Information Disclosure in PGX and FITS decoder
- GHSA-cf7p-m88c-h9jh: Heap Buffer Over-Write when encoding 12 bit
  images
- GHSA-p5vf-jpj8-mmhm: Information Disclosure in MIFF decoder
- GHSA-8c8r-vjh3-j578: Heap Buffer Over-Write in MAC decoder
- GHSA-949m-6h6h-4gj2: Information Disclosure in DJVU decoder
- GHSA-g3c3-wcx5-7qrw: Heap Buffer Over-Read in HEIC decoder
- GHSA-mqmh-65w8-fgjp: Heap Buffer Over-Write in Postscript decoders
- GHSA-c8x7-2x5c-m4gv: Denial of service in MSVG decoder
- GHSA-vf87-6hhw-9hcj: Denial of service in FITS decoder
- GHSA-v56x-r6p7-8v88: Use After Free in MPC decoder
- GHSA-w85x-jcrh-64rr: Use After Free in image registry when using it
  concurrently
- GHSA-8gpx-685q-62m9: Uninitialized Pointer Dereference in MSL decoder

Release notes:
https://imagemagick.org/changelog/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8064895322..36fd00dd7d 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40b6fefa88fe16ca5a4b3d3db5133eaebfb0157f21f98530bde8aec5dd5b0776  imagemagick-7.1.2-35.tar.gz
+sha256  5ba807e38a6bcb7c3c96a166485e270c5017aaa6b166f0440dc4b2badf6e6167  imagemagick-7.1.2-36.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a9d908d507..96ce3a9ad0 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-35
+IMAGEMAGICK_VERSION = 7.1.2-36
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
