Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F0C4725D
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 00:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202DA42CAE;
	Sat, 20 Jan 2024 00:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202DA42CAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id END6XHWjGyEV; Sat, 20 Jan 2024 00:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5334206A;
	Sat, 20 Jan 2024 00:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5334206A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4781BF28E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 00:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D5D846B5
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 00:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D5D846B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S--71ckETyif for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 00:53:13 +0000 (UTC)
Received: from mx0a-003ede02.pphosted.com (mx0a-003ede02.pphosted.com
 [205.220.169.153])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 537CD84661
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 00:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537CD84661
Received: from pps.filterd (m0286615.ppops.net [127.0.0.1])
 by mx0b-003ede02.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JG9gnx018240
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 16:53:12 -0800
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0b-003ede02.pphosted.com (PPS) with ESMTPS id 3vkqkmnf7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 16:53:12 -0800 (PST)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6d9bd4fa279so1367797b3a.0
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 16:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705711991; x=1706316791;
 h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=On9KiXOtaoLANPJFhyJTpi82nggDiYbkNn+wLVjtS3w=;
 b=DOyNjLnx0siUqT1tlN52SIp7genMvo4hODlShLHj6w8auzULPxzEj8ksHPwIoBlcWS
 vJLShQbi0OrL1SVzeSwE+FrI48E82ZaFVhdtrrHh427gw1XBNf4e09kqvteewcWkZlD4
 93zKz/5RSMx86Z1NN4qG7JllgufA7qz4ydAuYH4sjiyBNZQ+1zjY2GqFul4udyznbXEq
 uJipNgzDUIxCQ6VppnE5nwgPLlfXJcm6tlHkxelTeBM2Yi7IJ3CWRhBjxFMjOZTiXgA3
 E3a+37fXHLuglfthTHNVO2QCHSXxv10lR3PD86ROWRK5nhcnABHOMmccE2LbqXoFaYm7
 6ZQw==
X-Gm-Message-State: AOJu0YxSgCO8Jt9WT69crWNK7PgAW1TDQUN5f08HTz1CKxsoMckJpcRF
 CRmW4GiL6VL5SNxvGUmfod2AzHVVJmKWNAlbSIXUxSklriYyzzC2cfax5T4gRdaMhNAvb1ppyuf
 yt47KAJd/E0/Lwq+jZViBpHPOp+4nhXTaSwTKvn1SvTn+Z/HO3rbZgowT0p/MXcbHqyjq0XZ03N
 hPDZgvN5jUql3a0HIzPldNdlFBkP0i9yHVNZbL8OHvnPClT8Ho
X-Received: by 2002:a05:6a20:12c5:b0:19a:7c41:f567 with SMTP id
 v5-20020a056a2012c500b0019a7c41f567mr689685pzg.12.1705711991666; 
 Fri, 19 Jan 2024 16:53:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIUBTveTVY5ntW2eX3nMZm9RTdb1CvcwSMi07pVKhn2Y9kIjNEjAQIGgtW6ltIrAVOhfNfCg==
X-Received: by 2002:a05:6a20:12c5:b0:19a:7c41:f567 with SMTP id
 v5-20020a056a2012c500b0019a7c41f567mr689681pzg.12.1705711991227; 
 Fri, 19 Jan 2024 16:53:11 -0800 (PST)
Received: from CN3W9T2-DT.corp.robot.car ([199.73.127.2])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170902b28500b001d7077f0421sm3282356plr.119.2024.01.19.16.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 16:53:10 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 16:52:48 -0800
Message-ID: <20240120005248.3986139-1-hudson.ayers@getcruise.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: g-tn9_-uGogVHoMijSY9kJedr2n7isNM
X-Proofpoint-ORIG-GUID: g-tn9_-uGogVHoMijSY9kJedr2n7isNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_12,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=727 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401200005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getcruise.com; 
 h=from:to:cc:subject:date:message-id:mime-version:content-type;
 s=ppemail; bh=On9KiXOtaoLANPJFhyJTpi82nggDiYbkNn+wLVjtS3w=; b=n
 X9zaJ2CEKckYZI15bdgD9ZrxKi3d7QgnnEWuKBz5tRXnY8L+5cHeqNcP7v2jCUQ1
 VDca68AYLh4LDTKNQfCQ66aNQ+0wMzr9iypnOmUCFVg4/QzHY5nIyvWVfXVynRJF
 2WnW+sWgiajSGuUAYj15PHTFCQ0cv5qFYDo6CbyXiXtAFQ5ukRYCxY5xRYjcyCR3
 DgfnwQ/S0EIHaSMCLMAhmL1+i8sXa6F6A1QrFfir/HtPtCJCuqOmgnG7ZR4HpcCo
 bIYpKyfsrWU30LHd7VBsTZQSHhAxNTDZuFHRWHy67tUSuA+h81J8hqAEZGgpZTQD
 L5WK8uNmifnJysoLwBupQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getcruise.com; s=google; t=1705711991; x=1706316791; darn=buildroot.org;
 h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=On9KiXOtaoLANPJFhyJTpi82nggDiYbkNn+wLVjtS3w=;
 b=XU5NSwvFQe6Wv4vI1RaGfU43ElMjVGXHL+YCU6dvOi476JAEjBPQn6LAABvEMeuWs5
 l3K4s21v0/OL/aov8itjVdl1vtJRI3pHtxtSR4+Tn73xtxLF+njRjn7PLwtNXaZyQkW0
 3u+m8NelqBQnec2S1tQ6C/tQjtaCOlKluPMiWuXhukSMW4WkCNPJJUWnD4DjjIptDVUK
 lYXKnBGHimoeassbTKowjON+L0kGrDqDQDgHV8MxvZ69Hn3RztwbxG+MZ+WUxbr1OnCG
 yTkzXoURuOijaF8pebpwtHpFLv7XhOfM22Kuq7I1HGCODm4C8vvCT9FiQhoXbc6TNj0q
 bqSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=getcruise.com header.i=@getcruise.com
 header.a=rsa-sha256 header.s=ppemail header.b=nX9zaJ2C; 
 dkim=pass (2048-bit key) header.d=getcruise.com header.i=@getcruise.com
 header.a=rsa-sha256 header.s=google header.b=XU5NSwvF
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump version to 17.0
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
From: Hudson Ayers via buildroot <buildroot@buildroot.org>
Reply-To: Hudson Ayers <hudson.ayers@getcruise.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Hudson Ayers <hudson.ayers@getcruise.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This changes bumps the version of the genimage package,
which brings in fixes when generating flash images that
reference sparse files, along with other fixes and features.

Signed-off-by: Hudson Ayers <hudson.ayers@getcruise.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 7ea8f99fda..e09ffd82be 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  869f9662d3b778c69b1d1fe70df658e1c9e90aeda26abb753f6fe55e8b0c6e73  genimage-16.tar.xz
+sha256  a8756e3567a0d4d82c36b08ccc1e088250b9006d5670c6b2b014185e6ec60671  genimage-17.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index d1671f335d..2be8e1137e 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 16
+GENIMAGE_VERSION = 17
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.43.0


-- 


*Confidentiality Note:* We care about protecting our proprietary 
information, confidential material, and trade secrets. This message may 
contain some or all of those things. Cruise will suffer material harm if 
anyone other than the intended recipient disseminates or takes any action 
based on this message. If you have received this message (including any 
attachments) in error, please delete it immediately and notify the sender 
promptly.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
