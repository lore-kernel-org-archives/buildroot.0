Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84243606A339
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hRRWSGeF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aKz9z+ah
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1CA80CB2;
	Sat, 21 Nov 2026 20:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybYxBL0qaPzt; Sat, 21 Nov 2026 20:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95F9680DE2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291793;
	b=PG56m9t7jAl2cfe5/ilUlnZxr/jOvbuwAG/XAiz5+GIS6htl2zdL9p826nwsFyDJrrIt
	 bBE5qufE+3QHdfPBVAoVT9m6YMKzin1B2B4QGIFbopsnyWlqeZtC7TnwhqIQgpek/zdvK
	 QRl+4ytNtBV24ygwx/6LHFINJhIqc8DJSuyOY+CMWHW8ZlkYWuzYhhSdMhjxy9AcXIHSB
	 4yxxocdNRcfwrZMtX/0wvD851aOK8YyorF3LYFzD5vb7PH6FWlgW2NFpwBoqOm3yxpMhw
	 YmAOb0+X5miMzfdU7KzBHgxDKJmSB8vCcbmzSCfGPJCtHG37x5JxVYZ3WkdlFKp2+pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AItT1XcY2H8/9wiOXylwWd4rKCRZfSL1Yt1dR04nyck=;
	b=bJYn/TQElhFAA6XSRmtcI/ScSwsQDyETUNWNx7WssMPV2Tol8AMvFdGI38ha130RdZzL
	 0f23WTLnMgus/olJMiw2a7vCIpiYVR1TXPDEmHkSg2ESpAhGrZF2TRfdbE9Va/oJHIgoZ
	 73fE37OpyvAqq45AVT6HYhOk5gFW46oVi/SC/DXl0VngXsSnQ3qESO/KjcT84/1HQX1FV
	 zJJioa+TRGBqHruL2Dpfmu9wJafnIUDG4eW6nr1G37Iu/xyPm1CpckHkjuumx+adHKPk6
	 Xwfbavjv4Aokd1AaJGvGzBf7xcGJfYIkPs2yYDnaYS2fODFzUgQ6nBq7ga8ceXY4f/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aKz9z+ah;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291793;
	bh=AItT1XcY2H8/9wiOXylwWd4rKCRZfSL1Yt1dR04nyck=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hRRWSGeFohFh8fzrkmUVls2hnAX99+/HABMU0cquD4e6DQUHv48K7nWSHJ3p0aXSV
	 ASX/wcMcBDZ6ZkyhP9VB6PW2U9XjEis1o0RCt5UV3cPj+ajhPMyIG8X9Kpevf2/R/B
	 z7F2x+j7YKYkxcCZ+3s91uVF+RES26CQMOzF/Gu5Y1JbOVdr+8IZ4eFo+/4malY66p
	 HaA6l/3Ct5dVZmUfWOXSPn319T1rAeiE5FkfL2fn42UoJktcj5UC83jh2zEzBszYDw
	 y06MTfikOVVnI32rhyUzRdYugBZTwITgmzusjCyRs02ejIR3iPgP3qQm+4Dw+qe2ZX
	 OJUOXonI2qmYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F9680DE2;
	Sat, 21 Nov 2026 20:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 235AD465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B8D80DE2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfDy3YTFz0iH for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F15380CB2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aKz9z+ah
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F15380CB2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795291762;
 bh=IyqSgGwAYwFrJHRHMI6WsRUSYiNlJj836cdY7YXSGMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aKz9z+ah1tIab5cnpyfVUIW7M0Fbb1Mk+e+Ak/SniLEuwtRgqAS5rNDxQOzle9C9y
 m/JNjCSPDtABXEAhwaFt6YmKkkmQf2+DnVWug9FB84wrrr90QwL/S2nsi7GbnRQBwZ
 vHVBYvTyNvk3eruxYtvQ+GiJ3wpJc7LYgDzS19J6sz9Wx6eXRE518SAqSzh8X6c9tF
 8a1KTHshRfp3Byup5m1Qt+dlP9FA5/f+mVK3R0uuF1VKhwvhzQQrwPDBoKeJO1DKf7
 Zye+toe7n/81Cmw8hW00fVrp2+qbqAAa8g2qE/cKxLqRkESxIx7KWOlIJJfHTPXMPo
 TpLd+hJCN65cA==
X-KAS-Sym: v3:f51bdf72230551df:kiR/jCxABIilLY762ar9EXtvcaN4WdtnENdIvaq1hxPum
 hwbTp3VkMgvw37dw2qWzic8kqtyzmg9P6FVJP0rUyuN+ay9WFRsCtKMTbx7fk8E4quInsmjWZEh
 yPdgZw5IR2ZuPPkC7W8VqEIdLfoLH462//SFnQEi0ve7sseiMMia8OPqwUyoJJHIOlb4Ki6TYKE
 pXsuhB8LR4IUydJrBOc4/iKJoymbC+E0okd5KLrPajxJ4R9jFu4s8NlTA5SRdioAL7iLfgFSofg
 RSdHzbrh/jgON+GaaCClAUd7iyGIgrb5NBai9adGGEWFSX09KlmZhqeoz98aMInC8Exk8f9A==:
 ST2EVBnDlxGzbcoPEXlo79vGf1ZAIZmm0uo9QuRKc60VywiNmKgE2FIgzLrIk4HNZUAaKUDDCFl
 lpAOdAlxdJvH20+WUgUHZKpP5Xr2PIHm+44rEaqtr8GYbwoCEPYLXsSz3qwpBc58Fhi9e1Zn7z/
 zFnWPZmKVHnQGckiNlsHciLMt2uJ8Ue1/zyLoA4ffeBpeg9JO0n01pkYCsfK9uMN0o1wzZ07TFc
 I+nm2uqVIYmm7qdUXAcBH0LNbdz5CDqPRUqURG9pTUAuo0XKhpF7GrdDw6M67Tfw+WcAThNptR6
 QIV480ZUbK0tdL2C8AzNn7JvDBkszcyQAYUEPCEHbTayOrzCSWOiknB0viNjeLry2zDGtjXsNdo
 JNJYbIuo9cxxU5yeZfqL3tefX9ptgWDx9TIcOZuwrqdQ167t0cH2Zno4HLWB23FBDtH0Hm5fnrL
 4fDSzDZyR7P/rwdj++95FAyIAJFCbRCM5bMssfW+HMdZ+O5RkiexVeYr9YO8TB5Gyv1DglrgtO5
 foryvLwHnfo57l/llemFi2DKAgr0LSzo7ssR3tqnfSpDhw2RYoDWE5ngEUzq+gcjs+3Hu9raSUC
 6W7AtWE=
Received: from fli4l.lan.fli4l (p5b3a06d0.dip0.t-ipconnect.de [91.58.6.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 631E1A4C4A04;
 Sat, 21 Nov 2026 21:09:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46466)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xUrOg-000000002I8-44dg;
 Sat, 21 Nov 2026 20:09:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 21:09:17 +0100
Message-ID: <20261121200918.130286-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121200918.130286-1-bernd@kuhls.net>
References: <20261121200918.130286-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH/next 2/3] package/docker-compose: bump version
 to 5.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/docker/compose/releases/tag/v5.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 600f815d05..538ce8b7bf 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  faf3ce5928d0a44d4bf35e64cea45372f30b030002dfe16c7c3c6b8e5105a8aa  docker-compose-5.7.0-go2.tar.gz
+sha256  d2e733809a5449b0f629a8569102a2364f2627e41c6e0aa0becf862a092c5d0a  docker-compose-5.8.0-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 68d7aeed48..b2d6b71919 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 5.7.0
+DOCKER_COMPOSE_VERSION = 5.8.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
