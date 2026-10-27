Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D25606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UVHQGL50;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ET/eFaqt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21384057E;
	Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9N2YHTBQpOw; Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 12230406FD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119226;
	b=a7617P55cHlXsoPWRc3VvAIWA9ZiKcrAVuiDIOBVaxwMGsB5UA/8HhaDc4suntcaKnAB
	 tuIvef1Pbm+0QFayi8lmERkuZ57YzRT0bnYNapP4HQ3+SQyacrc4ZQKcxPznBxrlCmePK
	 A1rAKCCfr8eqIde3ZBa6ok6QUFiRkjn3MJbaZmVpgtVzJEdPFbB6cE2HVS0rQMjuNmHgU
	 BDo/yZUjJVlrUjP7mmQRKBNPxBCbNcCFm9F1AqK2x4ssd68o62FHYnYhHVaR/eh3dzU61
	 nt02G5SKtXOyYvp14tBzhZeUfoNdCK/jMBCAH7d+b6Zr7x4ueIALc0UaGOBGLgCRz0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qdcpGv19QX6vOiTfvMfCmOGdaMgtY7z3EHg41hBsnp4=;
	b=Do50W3yRSa31UAn1bJs0KPnD3PjiyorSH+/8iXqNkWzwlfxZM8xOLLDb//KuvAlIx6ry
	 +bg7tBiKox5UwV5loU2b+FptBlZDGumOJI5JFkCz6qPEQeP5eHjgCCIYhLURr/XGiEhf5
	 UelLldwFRhPsfY7wXFNWBa30Qx5IX+PbvjRDp6HTTVgg31civ+aoXoTYAnNXda8Bugb0G
	 tt3QbjFFD0SOH0LS1TBIDoFBmgCQp8obn5BPHyYGDGP0h6YbVRpc5bKxa1lMPaRcoT2i1
	 VbNfHetmppljNONcMfw9Cyy0XoDlw0RUoUy1n2wKmhPwAYA6ZUvptOk7h3qVUooaIAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119226;
	bh=qdcpGv19QX6vOiTfvMfCmOGdaMgtY7z3EHg41hBsnp4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UVHQGL50p2K+2FaPMlFkFiyTApp8GzjFSlLg2Ybc+QHeaCefPo8IN4hyHsgfdOPnk
	 zJHEtixuvXCsCXyeiyxp1CTcQUDxdXRlNkw8cBzjy9ouarBGgcHQuEAGNTDzo4dLFZ
	 wEDRd2O9HIoomSE7LEGV0r+iPpAjDiNsVc/3ZTFusqJh2IQHLSJuC8egL9g4O1xRD0
	 mLQAbsawAfD07DU3qiSFZNfiSK95PyO1LnwIO0qZlwDVtx8CwmhRa/WH1A2RFSqCZH
	 u3wiRgdyfU7nIt8xk/lX6zd44N8bgIlB0jFSUFApEmDRP7KX/BM2UK+UCrKq3vyJJM
	 3jgY1jkVQYcwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12230406FD;
	Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E824172
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA215400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_vKuyY_HQzl for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C9C4840024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119220;
 b=hm1oWUHFldxpdBh01iqc3bwZPANIfEsueisDgMp3pGjLlaikiG9uSzuUCITWljWZk4WA
 k7y8fn/2xuo8J21FIjgY+ctmhRg+lEXG0gQ0Zm0wPrjx92RIp75SmbLnkd72xezkd26jf
 ZzsJ17JpW0TWdLW7fDN8FQ7GFGbQUIwMKOZRLhqXxeWTLB2vx20YNB1tlBjQHcqGq9Vl3
 hQ5ENGFJ0F/NqZKnHa8bTHdlFCbPdwWnSXOJeSp/MPzuRcAXzOvO05KlUKmIktbsGKrsE
 Lj2E66Yokp6ScnugDwMIMfJyEFBL69B3nw4NgoXxKpLdG5DxFcaFghoLjQXu7Q0RE4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119220;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=bqmreE73Q3hriQQRYq+Rqwd8A2/w1oFrspd75iESC9M=;
 b=fvb62/kFxR8YSJTqPUfkH+bSAjOFejs9ayoyXTzq6EX3E4rM0pnFXee1kAD9/emH0T6L
 38L7OotzF1WOWLvrmw/W87YO6KDGdBFlBT8rmO8l9tjsSCcdeFzo6kyBLWwXe0BZ1mQ6F
 rZNb6zu9q4S5jiH5ypSWGiTanT7yJkhaTARRH+fZ0MLvvnpWwg/zzn2rV2VX5/YqONzC3
 NHsURJ4tnf0PsLT8+Nn1RiO5vZZR2ufo1fePHYyYsIYPyhqc3gJegNtZPLnvMDivRoQ1I
 Tpvu/EDunGes9xA0bIjTfP4/xFGLfrXNjEyey8Zxhz+quVBCsP/uNwF6c7V5KTikQww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b="ET/eFaqt"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ET/eFaqt
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9C4840024
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6aff2e5b322so16447a12.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119217; x=1793724017;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bqmreE73Q3hriQQRYq+Rqwd8A2/w1oFrspd75iESC9M=;
 b=ET/eFaqtYOwcKDgrItigqyrylbgFlsZqv0wC9dOtsu3KlK7yL0QvYjhDxKS9YjZip6
 uQXf+3alYxTtwrGqi+853yxT5rihkgvy8dwfGAD9QzmLzQK8cY0yHcZN/54m3jN65I0l
 ExQ0BO1Yt8FjqWC1vvJXCvmk6L2G8Wk7kjb2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119217; x=1793724017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bqmreE73Q3hriQQRYq+Rqwd8A2/w1oFrspd75iESC9M=;
 b=ZdNUwGj3Y06H5DLHPQ+pWHRXXymNGZWlBtR/lXKGAXYYDTTmpcHJpukgnK0YrrLrc6
 DtDrYY/IQ7w9XX7KD8GmjRAoT9lTg7R+QpaBGQMACgF6akhUwfMQ9COxMQwgMTRCPSPt
 qnF3kv6nZuArGCpwVFTI5VTqyc+XXlaZQa9ztqxs2oWZS0OomLhteySe7YfmnDgkyH7t
 0YHm61Jaggnit9QRYfeCI4zetnl9Yxk1lf/RvU3X1+RcuAJqc7kg1ND4YfaDK20FVQk/
 7L3qy6g4rxyOcUsWe73v4KkFpytD16zjmr3aBfZr9PsVqu6tL4uFCOO2+y4cKdlXBOFM
 94KQ==
X-Gm-Message-State: AFq9FYIwGQ3cblHJUEswHRnKM4spV2MAV50XpluTfRwte+kTXAJX6u2x
 UogDYgMc3CDpeda6ZV8UCJLPfr/EhazXw+JfKGggI2+1lwJzM322mlb5igxGtTk6UBo0Z55D/eW
 ZQsqiYVg=
X-Gm-Gg: AYBFou3sJDOJtbbZWuNHwUpnzduIV3hFRuvDqNiry2+KY06TzAL52giQWg87A7v1T+x
 0eQWguPLg0WPvCF5yZFpkeUJj+zSBty7GkENj0v1fYDY1T3wwLB8OULD8qkBJEG9J1qsj73Z4WG
 zqcb9Djkf6U7jtwnqZGjfLnMzzo9kfjoD02RFsLAMOpM4Yew5etXp9SG/l/RYENVtWpZlVv3HZ2
 1W8qjux5LLUqit9AgLZ2zeGEJj8J8Fa5gXtr6liReZ3rxwVDd2xMTWlY2PgKJTzOIBtCiWxaBwd
 WatzagS/X656yoIUueVAVoRXDyxM+BtziI4LXmSaT7tMlZ9wb5paQ4Am1uvEf5oESDy7Xi0RBYS
 +6lWTNQw29PTKzIlgdjkxFrixiMETw6TZNk3JvLu8eXGRPzY5Mv4cfCnSZ3Vj6icpR5GuKJ8ipC
 maSGEgFFQuIsNuBocrV1doQ1X7xA43mh5+F0zZu5G5mrfFVHqxkBe/E3NB+dZhI7NKWNeJtgs+G
 MoAFFq5WXslE+fq5cWZSAp+1H8zS1VG1UONQavXSmRvTdX91nREJNREqfKj90d8vjgV6Sqkfbv3
 VJJ4A56zF/uLyNSESufHRacDAKdTK4aEQr2a8YTYgycqH14w0uR6Rg+09JwHk+dqgmOsq/xWJe8
 dW8TNzyNSunejq5NJ/xrDCOe+aliR5zxqlcbOsV+I7hrBjBXz+IlBdUVd2lTNXZzQwOUUZfapqK
 1p9Fgachw=
X-Received: by 2002:a17:907:170f:b0:c46:ae89:cd3c with SMTP id
 a640c23a62f3a-c46bda51372mr1119725566b.1.1793119217302; 
 Tue, 27 Oct 2026 09:40:17 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:00 +0100
Message-ID: <20261027164013.1602502-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 03/14] package/mender-artifact: bump version
 to 4.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 5dffdbb7df..bf00b26464 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed984  mender-artifact-4.4.1-go2.tar.gz
+sha256  d8e9e18e48a2124e5e367ffafb3313a3dcba7a8a8a8b162b1dcb8791964c6385  mender-artifact-4.4.2-go2.tar.gz
 sha256  0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b068  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 9f235b55bd..e881529c82 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.4.1
+HOST_MENDER_ARTIFACT_VERSION = 4.4.2
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
