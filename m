Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9FF606A31D
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hUYZ23U8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4j02oPd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399E840602;
	Sun, 22 Nov 2026 20:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfXSPZ3XDUmO; Sun, 22 Nov 2026 20:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A09E405E7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795380853;
	b=SioJcWbc1/6SOsH4f65wC/Sd6MtyUIQhnWDSwWR2xPyqUbyMwflFDNDwsgovWSd2JEoc
	 5bNmuxxLbDXV3qfdo3QNDCitn0tI/jEjn9EIIol6h16ID/7EnYoWd8xce+LrziNadpx5y
	 jnNFaxHQQgpWt31LfmmazeCpMXyVrplyPsPXxQIpdzc8CdEwn1UC4mmfq1znwFY1A0UAA
	 y0Bq5YFqLr8uYX/Sz6XOSmjJnyMvtc6LaSPkiIzU5V1zDM6vkfa1C9Fz1vTwKkEyw6Yrg
	 X/JNsC7fJt6DuwPou9EGXlnWub7MLVso5az1JONYrpsVEVlPqKhux1ebuykKcgbKs1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795380853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ea42FvCe7KvqDTnddpBUNUU4JXDITJO0XFfoNuFkNPk=;
	b=PRIfSqb6S9CPkw2d141VkhPzXRymgwok1P90rS4cR7PKlmGLqtFUKhMFZcTBWmV5m7g4
	 5s8/KNIa2BWojGOxeXhX86KnZcZ2pRZTjd7+2GGQC/s11CR0b+IS+8q7YqgSD0KeEdeDm
	 YKPk81Mg5yTRLO9T9ZNNYVf8YnRwzaW1sf9roGUsfQqlajxFBOcQFlc5ANvLeuGnl6UI/
	 m38MiPVZTfBFv5F6IwUjJW6kBEvUdMg8ffvK7taXTTAMMOc8u9YqAb/RiHbXhNQxAuJw3
	 o379C9AWWo5hG1/6rDQkogukyGezBoqE226umImPrg7mOPhNL9zq6FuEkY12emNkGlA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795380853;
	bh=ea42FvCe7KvqDTnddpBUNUU4JXDITJO0XFfoNuFkNPk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hUYZ23U8VxZNynN/4RKzyqXxb0AxEwwAiwjDIP7htXRB9TkPhkfZxFifQ0PqrBraa
	 L2Lr7oBnFS3ueJKSpuiS6IZMbugTGMXKHMXSmGmG3DN+KjNLdl5OlYRpBXHhgitGP7
	 BRFvs/Z1kMl+b/0Gy54SBJo6gU+tWqcsFcSjiPw3XDOUlJXDlUreejfBttzZw0sYHv
	 JMFkiBVCTgX9jfA3ZHWHl+z6Q3/7Q7IFa3dSea/e5moxudEwhHmPPDzYBdNGT6J1Uy
	 UNb8OVc5vg0lSbjSnUUfic5EZgMgxk/062USKNz9+wb0y8r3KylV8t2hi1uD88/GQx
	 Yi8JBI3xq1AJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A09E405E7;
	Sun, 22 Nov 2026 20:54:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC3A2260
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADFF480B7D
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4B1m3QVJNihy for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B25BE80AE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=a4j02oPd
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B25BE80AE3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso25581865e9.3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795380847; x=1795985647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lk/6K9LKvlnzpNDuHP+B0WG2usfPI0vTMmqJkZPVSFk=;
 b=a4j02oPd0KIR1Wc20VPREZvna/4nUwYOM8Hqw/hZwne0hdWucvRg2YsLVbGxP5RAhi
 2qq08jmIoBAiRLlTGcGKFnICK0nCf4JMVJYTggRkL6svym+2hL7B61fTMh5u+1HNjJd2
 2nA+fNMT3LHlWsbJ2PzO5GEYrP0lsdbenBmMSm2fOGFuLQ4hwe1k/4qlj1X1A968xr8r
 H1pJHJ4T+mHeGuUEa3a9sQ9LVoIFmcwjz2x1Eq11pmW7XK12k57ILQ7Xl5NQgGAONrC0
 5eD/BKNHBDTmEpE4QVPy0BY2h5/WNA41bS2wH3L3IupmqAjs5mXiaCh1u/hYK9qVbzBz
 8fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795380847; x=1795985647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Lk/6K9LKvlnzpNDuHP+B0WG2usfPI0vTMmqJkZPVSFk=;
 b=qNgiCSbnJ/Dl3SsMxH9jbKQK86Tx6e0vKDg/kDQktsP7kXGflKNhwrgIfIYJ7/G5o5
 LKsIoNoQaKp5lUuwjEIhvYJ874aWVzhDpqPD1eTZHNvhufhASSgZ0na7QzqrixSCK5BF
 CxogB8qzohj9wpEMI+/4G6TyLfkKITB3pTesu/a5jcCdBLBECXYBybDjTZfSbnwjpRvB
 bClaQeqduk7AUIEvHlU4GrbIoh2LqoPcsSTZxGUnbrQ3dVcmBiSrbePzYy5Bi4suCnfO
 ENvlDu+3RWY064J8RuEh4me6OXS8Uw7SYHMWxqYLVKB84kznvq406DhnozZ7O90DIEMY
 EE/Q==
X-Gm-Message-State: APuU4Z9F9G3Ap3TxVPTpK06GE9ic6Xxt9WHyZUWAwWJJkwoTPAL+56kh
 8oUJ67PXepRUBr1VUI31rqnVAdnJbXGow4vQ76QFtSp7Wf+JpJgliFSGPGPtuGN5
X-Gm-Gg: AZFdTZecJYUJlZixBq9nL4YLncj0kUAE0BW33G+hAtVmk/53RdQk6TJ1hPXL+SCVO9I
 d1GAIHoHA2B6KotlWMxcSpz8ccHC1eGHc3Sjc8Dc9fDeE9hIkp1q/8AZff2HTeCXNLwxBtstVWY
 Tx0govxtKjV4qRwjZDFTv+O8uDwOdve6J5ebj5IubXQuj79vY1rYSIcrxUWuyXowsAqCA+eqG6E
 EWRvjwfIHSOhu5onLZ2BLJikbeP9/uM2qbD1vraXDAucFoh5nmIQ7AtaVpU+y4Gd7f/KjRyEc90
 zo8XquI+wn1YOWQL2aDM3yx/j9jrs/IEGWkT/Qfqv4BQ2H+X7bc+6iTaQwoN9kvc5ExObG4Iwf/
 HE6OYC/y4KF9GGQT0mou244pumTepdQubjjZYo9mJ+JNURAnUK4ycMjP+nNvokxVoe2pk5fpQkA
 srzWrKWfU/LnW7NPu0fB6QMX0ZfYNeg/nis4UNJ4XQ68ylY0zzZc6IjxWfLXGR49btNmyNLCPk5
 ThNDY7mxg1vQJeS0OGyGALbLsB2hn1U3bMyQGGs3x8F+snOcr1aNRClAIyGEzvH/O0sZDCeuq8t
 Gf4XSJjXlgzzj8IXw8C/9FvG5SJx0v/or7iFAr8hVSXr431sl/W0U5Q5Ro3bSPZQRbO2L+X5
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id
 5b1f17b1804b1-4bb88816b2bmr214818775e9.27.1795380847189; 
 Sun, 22 Nov 2026 12:54:07 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm249135255e9.1.2026.11.22.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:54:06 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:54:03 +0100
Message-ID: <20261122205404.3669909-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/qt6: drop hashes of removed license
 files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
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

qt6languageserver, qt6mqtt, qt6opcua and qt6websockets have a hash for
LICENSES/Qt-GPL-exception-1.0.txt. Upstream removed this file from
these modules: it is in 6.8.0, but not in 6.10.0 nor in 6.11.3.

None of these packages lists the file in its _LICENSE_FILES, so the
hash is never checked. Drop it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qt6/qt6languageserver/qt6languageserver.hash | 1 -
 package/qt6/qt6mqtt/qt6mqtt.hash                     | 1 -
 package/qt6/qt6opcua/qt6opcua.hash                   | 1 -
 package/qt6/qt6websockets/qt6websockets.hash         | 1 -
 4 files changed, 4 deletions(-)

diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index cb91c6fea5..f4b0727a54 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -8,4 +8,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
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
