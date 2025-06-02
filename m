Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6657BC54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 14:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1769181FBD;
	Mon,  2 Jun 2025 14:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH0i1xoW12Tp; Mon,  2 Jun 2025 14:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6694781763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6694781763;
	Mon,  2 Jun 2025 14:57:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D910127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4367740AEB
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-BkB5-1_kDs for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 14:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A36440AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A36440AE7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A36440AE7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:57:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 872B743B53;
 Mon,  2 Jun 2025 14:57:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon,  2 Jun 2025 16:57:33 +0200
Message-ID: <20250602145733.99743-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeelieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfhgeduvdejgeehgfffkeefudfgieevvdetjeekheehfeejleeljeehfeeileffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppeefjedrudeivddrledtrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefjedrudeivddrledtrddvvddphhgvlhhopegsohhothihrddrpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748876258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LMHLmIVibNHVyqo2eO4d2GjlpEoMplYc/nf3to7YRGM=;
 b=owWKfSQT9faMtdd1+FnhyJpZpeLkzg8gbrf8L/8VdRuPgZFIoV1sw5Y4Nn+fTgApcBm4Xc
 LJixcpAcqefmnZj16Sd4f7ZERSm53Gc36xl58Crc3DmqloV0AjeW1fsXkG1JfLUEPEBR98
 H+DCi0hk9hTE2MhGBEpGfRRWwE7gzs4vhKfEbcQ/yXIbRcto35wdYmtEBjQRsJVN2L2VuH
 mn0/BVQT0kffuLLeo+9bBMTNPMrqO2mEfbFoBjDol6AJEseWnk5Ek/TrXNVcm3vhmmB+mR
 xwCHN6YOR69whsI4wvXUF6rqLvf2J51QZpioBV8TdKUmVbsPy6JaulxCUkIvjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=owWKfSQT
Subject: [Buildroot] [PATCH] package/unzip: fix cmake 4 compatibility
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

unzip fails on hosts with CMake 4, such as Arch Linux:

  CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
    Compatibility with CMake < 3.5 has been removed from CMake.

    Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
    to tell CMake that the project requires at least <min> but has been updated
    to work with policies introduced by <max> or earlier.

    Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fix by updating the cmake_minimum_required to 3.5.

Fixes:
  https://autobuild.buildroot.org/results/211379177fbc293bcae3a16d951d263035a1d8a3/
  https://autobuild.buildroot.org/results/5701aae037df6997724765cac53c3247c367508a/
  https://autobuild.buildroot.org/results/d1d48040e7db67a54dc5ce24d19d97084407a401/
  and other similar failures

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .../0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
index cbc58e484b92..bdb3eae6af65 100644
--- a/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
+++ b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
@@ -31,7 +31,7 @@ index 0000000..27951b4
 --- /dev/null
 +++ b/CMakeLists.txt
 @@ -0,0 +1,17 @@
-+cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
 +INCLUDE(CheckFunctionExists)
 +
 +project(unzip C)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
