Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A968606A326
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EychqxMx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvoaucHX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457E66070A;
	Mon, 23 Nov 2026 22:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXHKbKyYlKvB; Mon, 23 Nov 2026 22:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F11A606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795471226;
	b=OPRtfIUkNR8FtWS9wvwxFm2gJixivv5vWL1uvKKsy4n8JFTG5We5Ue4Fcsf0VlU6aGOc
	 uQYKyCoHM/Q7STFfxumdhCIOQoFTQZuyhor5wdZx9atQcYoWGJBwPpD9kk1oJJoWi6wjM
	 mm5Pgmpdal+XqM+ZjshPB/09CmvNqg56I3OZR5rUY5M4s+HzCdymbxqWPd4UhHxmoe0ID
	 2i8N1Zyv1G2E+uT6KeYmT5ZUn6J3T54YE+lqjiy66vAgGq3kgPfLf2/ya6lVaGFfrQc8y
	 RlaOGlJ8JxnrOyUqsRt5NWn1cklB3eekQl3177XqBcUnVA7Dei7urAxUJfQLC55oz0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=k644+e4adE77mukNkxaU7ZsWTlPWckqyXkq/e4bcAPA=;
	b=pwBfTglchEGbqKPBz/FajWyAiDpTWJWpFFljLN7HEJKS8MUhi+Eh0/M6qWKr9PRgzhkI
	 xKgyV+DlM632gsmRkUHpzXUl5JWZlEf/KFlarDAXGGgLEXFyfm1k5rHco3ulNfOfI+u9R
	 0ZdcIzfHJG7G5SKDL3Lv5uCpt6HE2yg/M3ndUxCcKhaa8qxUHRvix02iYXm05JBq3jAIQ
	 4F2ON1/KRpcm0JTHPSTAwm6D1ClLEKN0QRgIhTbP+hzb/eRQ2TKKkh10tW2rk0YnffJy1
	 8WGLmFVsKBWxffEjZst+uElGLPo1YooJv1JVGBT7kWdFuR3wG9OftKf6bnVyqDeQnKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795471226;
	bh=k644+e4adE77mukNkxaU7ZsWTlPWckqyXkq/e4bcAPA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EychqxMxY1ydtZiFR3LSgFOKiQmgeZBgqyMsZZ7lnMLONXgMwsjEb4ngf/xptzDJv
	 OgMbL12jYS0w6eaXycnRlAX5IvSmBdzszvL3tiSYvSaKXsZXVfrOqK//PxuOylir/g
	 xcN7pnmrMI3JcLanVW30/QCnSrQ4WQfZuhI+D5UpUCqGAGUbcEpHSjGvSDO+Q396Uj
	 /TVowGT3tOwZ6c1z3vY4o4JhnuvpLkEvU+ZswqJOD36W0P4wq+qnVZHtwTJaf4qM+o
	 1Ot7z3tV3mO0UP4zzUOciIT2f4i5Bws5io190io06BtJogrlyfKTTuTRr6tgaD4LeC
	 1f367nrHtYzbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F11A606A5;
	Mon, 23 Nov 2026 22:00:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C82D2260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B190280F3F
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eh_nUTg9sCsu for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:00:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6926A80F3D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=WvoaucHX
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6926A80F3D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so21816095e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795471221; x=1796076021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=326OF7qDmvDXbbV5xaqtpDCVvdGG3/vI3w3FyD3GIwQ=;
 b=WvoaucHXqbhJ4cioCpcm6cALgGjW26VJJMFmLE3TKMeMrqieA0V28E+nlClXevO40E
 cNm8a/6PXYAdxfcskVfkWjmB/wheX4i9NG2zG7tajUBEEnv2Ffle9TStGqFGlxe+89oL
 p+Rd35a+UU2+TjWhmyv4hPm+vLNoZVIxwrmItQzkLR0SiCftAVt97vKGwsnYUaSQwAjj
 KH/QrTvViPu4DxYFCswKQfSPVDXLqmeASVn5A86mHR+YPKL51IIBALEJRBMxcTzOFAUC
 eYaUmaM/HAw18AxATv6P2pejker8PQs/LNHPcbnWKPDyCooPt654uiMnM8aQ+EyEJRjr
 XFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795471221; x=1796076021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=326OF7qDmvDXbbV5xaqtpDCVvdGG3/vI3w3FyD3GIwQ=;
 b=ep0As14dkaFj2WOs0NNmf+SWL3/SQY2zrNe1x5X7AW1aQi18RtfN0YQGusd6pq7QNz
 UE1BO+iCPUU2tXFXEIT0hTnqsmI4c+ScoTpc0eTrxJu9nIZbZB5inr08qFHfqCxyOUcK
 buXrYBExCcc2CUKVHNXpO5HPZNU0cgrMTIWWkoIfzdr+uA3FYJkd0L330aPXup4T09/3
 YQ32hjuizCw2qdwlVL+bpBj6XbAmfQzW2wNWtQ5Rki9ClRWnWJVx4hmXJgKfPq4g9mww
 tp5ewGr1avKm6pirxKUbn3JPtdmCYQgjSeJTUmBrT4y5A3dqqnonqXko8AYmK620RGK/
 aYdQ==
X-Gm-Message-State: APuU4Z/UDMQR+sLjQYDwKtZo3BdRx+EBMJ49PhsKONv78DA9FH351nZt
 GPZBCNZuOVylCEdsKU+ogm65KyvX6YAiuydr1b9gzFBjr1VZlaJYvg2NrEBq2CI6
X-Gm-Gg: AZFdTZfn9jeFZCq1aTaXt1qv/Orb+EVIkRfcfb8ezFnajUTwq/aXagwSfcDjArvHX9p
 qTLz6ZbQYJwsAb75Yt9l9J9GeqMVZ1KnZ2d61UXd4ADCT400WCITwFtUUvsd6A78kA2DyRmuOwG
 NzCd6wk24YxA6eyPvrQSrVoL2RD5JbIXHTq0I9XVS6GdtKFSMfSuScb0hSC/1WqylcUoVuBZu0Y
 /yzcEUknmuyvU3hpRcWnrRGMhygsqdThiQHDjYleZlkVrMg3Re/BpK8oT5v7+NR5sfojgDiHJMQ
 mulY0jiJc8LVo37ienLTAGx7fG6W9hlq09R10TuPCWOCdc5ZUBc932/AFu2/rV/6utHWufQcRKp
 3cBEvtoC39V1kgD6YZX91BoAmXJ7msP/V5DrG3nQ2dkEXkRuvJwH8obskw0+/MHcciU6e/Se3sg
 ambZCjTvz6+yj+wLC6IFqw8NufQ7HKOsBqP6UKBRfj5GvCVr9Uw0vq3CHRStPIplBXKqt9IWuql
 wHlLZREynomROlkLGT2S/HMLMqSGRHCH2jd2Nrc/vG8aJCS8eb4lyuxk29ppCzCuC4Sl6JRwFlg
 9gLWJ2u2NYUNVnWb0iirmwzBYV6pLFKX5QEA+VPgRuOc/1dXiL0=
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id
 5b1f17b1804b1-4bb8893e021mr288565825e9.32.1795471220687; 
 Mon, 23 Nov 2026 14:00:20 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906635c7sm205310275e9.2.2026.11.23.14.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 14:00:20 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 23:00:14 +0100
Message-ID: <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
References: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/4] package/qt6: drop hashes of removed
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qt6mqtt, qt6opcua and qt6websockets have a hash for
LICENSES/Qt-GPL-exception-1.0.txt. Upstream removed this file from
these modules:

- qtwebsockets: in 6.8.1;
- qtmqtt and qtopcua: in 6.8.2.

None of these packages lists the file in its _LICENSE_FILES, so the
hash is never checked. Drop it.

On 2025.02.x, the qtmqtt and qtopcua hashes went stale with the bump
to 6.8.4, which is only on that branch.

Backport to: 2025.02.x, 2026.08.x

Fixes: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96 ("package/qt6: bump version to 6.8.1")
Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1")
Fixes: 1ef39b9196e0a5979581187f15fd665ca390c2a0 ("package/qt6: bump version to 6.8.4")
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - split by backport branch: qt6languageserver moved to its own
    patch, only 2026.08.x needs it [Thomas Petazzoni]
  - add the "Backport to:" line

Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say in which version each module dropped the file

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20261123212022.3748880-1-angelo.compagnucci@gmail.com/

 package/qt6/qt6mqtt/qt6mqtt.hash             | 1 -
 package/qt6/qt6opcua/qt6opcua.hash           | 1 -
 package/qt6/qt6websockets/qt6websockets.hash | 1 -
 3 files changed, 3 deletions(-)

diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 50e63c7d51..cb345f43ee 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -6,4 +6,3 @@ sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENS
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 1c141c162f..ed0602e407 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -7,4 +7,3 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 57c0301c7f..3387892890 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -8,4 +8,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
