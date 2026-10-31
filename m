Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022D606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dkRtFxFi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuuchExW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 575C560766;
	Sat, 31 Oct 2026 17:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8UeFFW5tzxC; Sat, 31 Oct 2026 17:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 342DE607AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467252;
	b=KfcJQJ7/qdodnmKBLqJpQrm2GZh1/QX14WE3TAp8Sy6NzcK/OcABwd3SgNYLWABHpcWH
	 39+8mb/TkM299bw8PZV7fZvrbANwI2nvyan9+8+rqu6lWlaH/CRAFBV0IRXrwe7cHLuwl
	 ummDXreH9uszyjz/HQo8C6JSJf8phJXhhIth3tFo4hFNDtysChQL0vxiqgAqS4orJBkwH
	 Q7DK8vMWc78MIYflVbIC1WKEQtOrwGnX9lIU454WNCt9dnFdfUkzhdalDDUan4tvH34qo
	 ppVHRhe5WGN9rtoXZkRWwfseIf8iVk0kzVzf5vYMv8fUWpfS1p2vGyJt9+iZmainA4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zg2h1JsduUqG/oyv9dtSRz/dKaUEuwxdizQzmuSmmb4=;
	b=kCYKjCVG5/0YmyqsUxJeBiqit9lH+z+L9wwqd7UpgEAEpgDDggNdDun6NnHL2ns3IZsx
	 ueNaBt6/tU6YWRIDw1f9gdypG0dqcwS939SA7O0t6P+QXreBDsYyosPurbar9zh/xuWfO
	 +GrkcZajKeF33YqcLYFQCeJFZKRZs5SxBpdl3rNMmQlXt/MG6o8LuGj/jSGyDb3NBm4Xl
	 Q70mYpO2R762Mp+LG8YQ3lH5fp4xQ+n9GLQyhhzY31qRBpLYzFz2/2dG7fbgg/cM1DXhw
	 9HYQl1bs+yqcsSflvMOHEFyYhzGDGBGwMtwV5ojxJk+uaSabP/2Ef0p24p4L25wQIag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467252;
	bh=Zg2h1JsduUqG/oyv9dtSRz/dKaUEuwxdizQzmuSmmb4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dkRtFxFiXIAU+A01mma//EwhfI3gxkCSFwmJuqbXzAWEvX5myJkmJ5tKWxNHdXtWn
	 W4n3OBPPYpi6DQdVrz1g7hG0Us93ziHNaJFIXSnsUFjlWWansA77ad4Qgv9QCzEToN
	 tUhobiag8fq1nFeFpdTIfcNlZAeM7UEvOJyiWBnjFATdsykAEhpUmDVR7UhiSy0iCT
	 ZcAlj4F/ihdHpOjQLRmseUKa756kIQ7WKnW92sF/ioRDyFYHjzViolI4EDy/w3BIhK
	 GcKKHb4VgQAkl2R/VVgBKp8lS3bt6O4o3j3X7rIXN7PwzWCFc//PiYsmDPlIhkvT09
	 eY6jR+yPO+m5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342DE607AA;
	Sat, 31 Oct 2026 17:20:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A824E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1DF14035C
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzCJ5CRuSVH6 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED5CF40355
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467241;
 b=PFDZxrLjTrmrwuqjrSaTLcvblceZXrIG2wev8Dnou5/Ue8/Nc3Xr4i2YKSg+KUeQ8U8U
 FeIpPL3bXikS+s5AcvVCLB38tmWrO80yKXV8m5nluTrZmQMqttLTC6paGL5tBOH4Zc5qx
 hiyDUS4W6W1IBPp++srpAg9QRRotddBaWeAK9pKvI/CZYkfoTNWZMI5wLxjvDs7zVxD0q
 s384VTrN7vPMlOMySAhVmYWGoY6OLTcaRPo0t2tdEdLT+BVL5uQ+0KCIWnGA6qKlI6nQe
 yeNdCEQ5feAzPVXwsgsbOEypntYP9C8dUDevtoyWYAMNywAK3ravjR7tB0/84MBQzRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467241;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yyY15/Ir228H/pLUWNvDA9pSXWJCjeLy1iqRW1lelTA=;
 b=sz+ANFSKMyVemL6BFuD4wmD037rGNRP7L8fCjpglJoh0+hoaT3PK9Fe1Bu/3oO4gKNG3
 TWG9IgOPdIErBFPpHrf8yOBhKz8NnPUDo1A8sSk1dX6QyyuiORpxLgd8Vx5dbCyd1w7Wp
 KjJJgZWV9FGf0Pr0Vg8nn++hlp7nlt0xAr/o+M04Pdkyqsrz9g/dKpMjF/3rpvzbu1Dbv
 E8cE5DyQ2YgesthOkMgEuHGrFHvxM8mKNCIDzccrKi3WrBX6tRlxRQOJf3MSqsFdpeL46
 c9YTxvLui5Cx/h4DuzkUXAO4mkHBWwCgWDv+W3mB3f6jtO7XUyTg1gZByWwI+Rk+j7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=VuuchExW; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VuuchExW
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED5CF40355
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:40 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-85c1135c286so1071017a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467240; x=1794072040; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yyY15/Ir228H/pLUWNvDA9pSXWJCjeLy1iqRW1lelTA=;
 b=VuuchExWhsl6duibo5jXDiXlyoEhez5HFmvAnnoHXxITcS44tRCQ3HfQijGv7UiAGZ
 Lt+ht2jwS0hkk5HXGI+I6Abi/D/8AREyOGb9Fg/GsOkUuJGBou5vTuGcgoccQryydZHZ
 PDM929nCeBztFtaLFToA0Qf9YIQiwNBEKyOfsCJewHIVYYOQGOH2AcuhRBExGkV3eaHi
 xkgjN4HGBoh0AK08z6DCZjSq+mjWbFSdmXJa8lkdsNpI2cUS/j+yrMU96BGBFxm8NxOI
 7ZIMbB2HYf5h7WaZk2RaotbyCDXgGp4xF0yGiT+fnIYM7TO9RaQz3TmsrJzwlslxb/+y
 sszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467240; x=1794072040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yyY15/Ir228H/pLUWNvDA9pSXWJCjeLy1iqRW1lelTA=;
 b=f7ID6hyWvmL7JCReS9x2y8e1VYQFNJx5x6YaG8vh877e2kPjj2o7NY7c4FWNnnM3qt
 T9GYJRxBP1z++B/xYkdsav9fxcZDSj8ll10Us+fW2Wdo0akT7tZz8lati5ZiV2lyYPLQ
 bsljbPS15jzTYo2nyjLrxszaMeCYb5Shxv4mXejiqugsgzyTt5sOrIJjiFPHeJ8wo0Fh
 cBi97Pnk8ygjcv/zedhELUEkmq7QX9zpzBC/FOFm+wnlPfFjRzk1/5xCj+4xbi/n4QCS
 RueRG7FNQfDkonjDEUu/OH4SAg37k0S/xg86wxpKloLAcLL/rQcFL8OshpNuUVgxk87r
 kF+A==
X-Gm-Message-State: AFq9FYLJCX7tKVqy1Rks2sBXgKpkGJ1rT1zWYEyvgbLaZv3TfRHA1+bf
 U3aBguK8iibdBrZO9Wnvht/P4H6s2x5WhCvhdVTBolz+060Bj75T2dds4OCLxg==
X-Gm-Gg: AYBFou04p7vKY3Aa2um7uePfx+R8Ez3RXXJTE5QKLjGyv1UAnv7Xe7MmTxwWnYFx7X+
 OP66Wwt3pZ+Ospqhf4Cr+xluVe80SXD/dmZnSGCsbb31WX6Tsl9Zlqa8wc7bLELPxxn3JoVyIVL
 q2PP7IXxs09C0ioFYzk0y4xecv0jxsv+y2DDH6DCi7YApJhcGC0Id2FXVTIMiuwx81sYanAV4/F
 ZQT3j5Af36hdNWsdzDCCo2lUSZLPWpaF4Od8mUa6DFgMzAuhHtETtdHhF+DNTRCp8wYEcAYAI34
 reQA93o9MgkCMTTeI7TrcckHn/ftfk3gkx5F6WVVOkfpBz8aVt0qg2IBnlau2YSv+TPW2EeJaIz
 um6YfaMqTVGSKj7Q54vqPhnD0i3FsMPlucFJ5o8nqZyZI+tp3CFGqjrERhNjtF5C7DbBJUiOqUF
 MX91Doyi13qYmhUX9Zl42PUVESqeg965ed71IUug4pLT3p9WcvtQEDvnedSZgOW1R6cozkumgOO
 x6fBEWuqekSg2B+5MEpg64SAE/F8izsv4M5QHIK9TbE5gWv74uKmorlXjo3SZnCXjHyV5hRUSPP
 AFDRz77o+YU5Z+eT26DTUCcRP/Xx4tA4FWHjSdQ36jzKYUN0DyKLblc6YuObDMAxEz+rYsy/JWk
 g7oZwmans/lc6IN567ae9g3dvrX1rq0rmDHr1mmCq/B8ecOF9pDVYybkOyVskTMXvYYfSq/ZP2h
 6v07dDeUPf9CHGxjqm9ueZ5G7edz+8f3mG70XPNvQTjL67mBubrkRpeqOZpak4ikMSFoqWZCkTs
 A==
X-Received: by 2002:a05:6830:680c:b0:7e6:d0ad:5254 with SMTP id
 46e09a7af769-85d364bb5f2mr4423641a34.8.1793467239889; 
 Sat, 31 Oct 2026 10:20:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:40 -0600
Message-ID: <20261031172019.2683287-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-jsonmodels: bump to version 2.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jsonmodels/python-jsonmodels.hash | 4 ++--
 package/python-jsonmodels/python-jsonmodels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index f7cde97b4d..e417f0c236 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonmodels/json
-md5  8fe7bda2a40b92e5d3fcdb7e676fd8ad  jsonmodels-2.8.0.tar.gz
-sha256  9c37ae58f0417252b743ee1fa85fc937d9696e16520824f6b221f19f62f08f9c  jsonmodels-2.8.0.tar.gz
+md5  510866299b5082340e4bb0473dba8b7e  jsonmodels-2.9.0.tar.gz
+sha256  45d17aee2fbf28e0689451641cf97d41f8321266254f024e20c9f52088fb3bac  jsonmodels-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index faf40cfcde..5275f215f5 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONMODELS_VERSION = 2.8.0
+PYTHON_JSONMODELS_VERSION = 2.9.0
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/04/85/0e02cbc656ef7f0f5d3db13be5b622c231bf55bbad6a8c4612ce95fcb8cf
+PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/8a/8e/134dfa6f8cafabfcf406835fced78ceb95d1433bff9b375e34ed08b2775b
 PYTHON_JSONMODELS_SETUP_TYPE = hatch
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
