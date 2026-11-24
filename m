Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C120606A322
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GVZTtyhj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knnB+Ikg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46244607EF;
	Tue, 24 Nov 2026 09:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuEKrW6o2cgR; Tue, 24 Nov 2026 09:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B315607C7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795511576;
	b=CmfXOg9DgEpakb/VIO6psCEOzdS0XsXIlKaZptLuOiuvSBTxD3A42TNKRZz7yHUvgwNk
	 jiV8kmyaKiTdW48Ru0t2GdPbUF40IIRDhq4ebts/TYCZRQgalYf6b+t5Jpjj9fkamqLza
	 eHmNNPQRN5J+S87uta6oGTViRtULAsqSWm6tFvKQQURCFDhx7ScSml8bnR/GfD2Za0sMC
	 hPeU4rnWlbgs9XpdmD9dJNo65H9hAh4m3RlLzqk4A14EaRJQMwepq0kqwYV42kj9ikRXo
	 D1ph+B6mR7eUBRyBzRNoZgx9vfuyr/0seqYDvWUlBsgq5KlJLZZIa4ZxWYyEK4E26Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795511576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mn5jBYX1hcJhs1KoW0s2RSYwzdXGLFfuGmeiLY66nrM=;
	b=FVS/2dV6qfptKrVJKd4Q8wBZ8yHNo15iL6WmL3sQipKUU4k3SsePyKA6h797AmN0bx8o
	 /7x494cC0Cpvo9VmBlIpJzQbet2RuaeOv38MjkZaRbMOH6yijft0jK85XpYpnsAFE4XYN
	 Z/nrqUnVVZYRMsN6HeLCyLKyhJeKcW1h6FJ901LJYDzOYAI/HRjrhfvQfXlJvrN9QEs95
	 kqYP10qKsmxZivNNXcFw92mD6N3er0gH9zugUQzl5RlhpSTL4GODcpA20gwjBbaOCHMH+
	 fli9ts9c4XMrBlZswzQZpmFpL7P5L3Cm3Nqv8xOKMmnAjMZaPz0z/x0/KLAu7auaW+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795511576;
	bh=mn5jBYX1hcJhs1KoW0s2RSYwzdXGLFfuGmeiLY66nrM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GVZTtyhjTVHaonOOAA75lI+m82GVq4HFVqOziS9WzI7pyBi/jtnvmLBZCX3ZVZ77y
	 oLbPpzNMTTXuMgQZvycsNXUEgAJsYOJQsNExEK7hAGPatANvawXKLKvOHrVK6PA5Rr
	 a/ZkPVY3NA36hEzuA8G0vh2TrJ3idJWUt74WUdR796/aj8OLz3pUcIzZy3FtLbHL1c
	 PFE7zzJPxHoMKiHqj5SkFiRbilzwfzM3AG/RfrDGJEY47X7P/rMemepDZtINl2WaHE
	 LJEQASpu5+aVoaG4W6BN9zCUQnmiu/BNKSRGG/3hZqtxYEXWqL/3Bx/5+f3oHS4zFf
	 GQqUcUZdobmiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B315607C7;
	Tue, 24 Nov 2026 09:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8377D715
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 805B44058B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-bhOxb04kzT for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 09:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A52CF40581
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=knnB+Ikg
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A52CF40581
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:12:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so33542035e9.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795511572; x=1796116372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PYVdqKPgbI3XZ0xfioNg+93a2AfBRsApxTQKyMeTX74=;
 b=knnB+Ikguef9wUblhECfFzgd49tAnlYuOHMcm55Fl4MJcGqdoR4UK9QhUBbRks4n7l
 3j8Ik/AC33/NC/O4Ykq17u64FnyaxHFERA16xFNEJvW4MK25Eb3AqKuEJfZ1AnmCPTSP
 9F0HOKqYoH0TCHcNxTr8GdWH6qlSFjW400c1J4jUEJM37wlP/Kz/4Y0yvRG6IvmvydIV
 1C7Zl3N8gs0T8dnG6eFomDcmJhQuoH5/0aAzVDoftdxRWDlzcDqdOR6s6uVcEuXeSJtv
 C66DxSG59wbmQR08Dq+WCPrYimPxECM0qP0aAOE08acx/itmKfi77x0L7hZrXVjqWm1N
 RWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795511572; x=1796116372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=PYVdqKPgbI3XZ0xfioNg+93a2AfBRsApxTQKyMeTX74=;
 b=xWsGTNFK71m3whlVWmFz/eWJmFaFF3VLRogrUs0LN6ETP9VvfTkADW+UapDQwheal8
 5cGhoR8EMMiS4BHS/E1xOgqIFsbjVM7RyHx914zEg08SZm0KVXDY0dmt3gSphj1sjVD2
 ngKngZybg0DU3YiTOILOIxvSK2DEanTmPWP7VhI++KyRqGmyGxvyTsVPY187mPPGrnve
 mEDuzV0NsFYpO9QLSZoqfQKp6EKoPkJwwO9uL2rVuy4hZguYdSADby+w6FyHzTet/QYa
 kLJVJ8UKVPM50xx9G6u/wGL0VCsIziPwjNt+Hey1MTSbpzB4okCfR2Nm5nN3H2QgsNwy
 4dYw==
X-Gm-Message-State: APuU4Z+Jy5Nr2m99CVT/moxBk8VFIbpjbpZcP/PUrRZjYCnN1FgZVOod
 XzqOnSFMfkoSk0aH3PhjUYnd181jMAkDKsUwfBJP/YQcMFQRxF4hukwZB1ZMtTnN
X-Gm-Gg: AZFdTZfWC6I1AvHNwE30V1Z5GX5aRk0Zy3RDEhwZR0EKXeMbFOo+9mZA9Zf1ohpFhZT
 JeuCDpodIIgHeLeUGroRkN06EGoF3HBlzsf7M1EHOs/uIkEqurFu1EvfBRU8CoALNF3n6NVyqxZ
 GO1pAFdaxilLVnu4nX5LjPow9Iy2dvfznXBiYq7/yd7s6qggw8p25kmad1Mjn78K9prcjodYY8l
 0TlCmeQwuKRgmP8N8VQZJMsqi7heYeGpU6im7gbc7EIzdCH3U9BVTey/iSDEf8obPoOdWu1b2AM
 TE4083GYV1KOLHCjA1kFGA1fYbyuCabkJ0sgZ3LxrfrAOpZSzNy1jZTnpI3uzxPrutOUBpv8V4Y
 WdAo1gjtoQ52wV4ltaQsQT1um2ivyThbDXB5BXrcT7hGGU6NMcAwi7L2EYbVADqhqGBuLN618UO
 JojRw/XJOLuJWaGpZn+Jg6x/DiPXcYvrTLoO6M+mHKPiSnJ0PPnN/vCVdIOJSjD2bxMUPWTbx3P
 pQAjKnjP58+aol1WTaN0vSpZVTo/Sr1NnW1Mq0FSgmY4DzylHSkU0e8D+LXBzetrLqy+ZM9McTN
 2EHq2gTeEpjtC7j+X9EaoneeGc+WXg2KnQtNKVEuhoMcbzOTvCMtrN+DAYvj65LvwhTD5/+u
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id
 5b1f17b1804b1-4bb88820e06mr279497235e9.26.1795511572230; 
 Tue, 24 Nov 2026 01:12:52 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442995sm432716265e9.2.2026.11.24.01.12.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 01:12:51 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Nov 2026 10:12:50 +0100
Message-ID: <20261124091250.2377810-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: move libkcapi to Angelo Compagnucci
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The e-mail address of Tan En De is rejected by the mail server:

  550 5.4.1 Recipient address rejected: Access denied.

Remove the entry and take over the package, which would be orphan
otherwise.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1cfa212f15..59fad7f26b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -241,6 +241,7 @@ F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libdill/
+F:	package/libkcapi/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
@@ -3240,9 +3241,6 @@ N:	Takumi Takahashi <takumiiinn@gmail.com>
 F:	package/gsettings-desktop-schemas/
 F:	package/libcanberra/
 
-N:	Tan En De <ende.tan@starfivetech.com>
-F:	package/libkcapi/
-
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	package/pugixml/
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
