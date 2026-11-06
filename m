Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1E606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RRWiTO4I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxLD/Dmi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B92F608E4;
	Fri,  6 Nov 2026 19:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZytGzlydyDo9; Fri,  6 Nov 2026 19:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 78B5F608D0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992572;
	b=r32klAQw+BfNcm2ffBaf8UDTmPkifi/tIKvjvsuZfy2oIolFgKl7nitv//DMCtO+ufnR
	 aXwY3Cs+xhwrEfWMgMZPJ/UbbIOnahUEYmnFsrnyP89jGKMDD2g1ePHoh5CIZzU2CdHCw
	 MYUDZKDyUuDfXSXWZ7HSwgWv4Vt7Z+KCBmGHU/RWE8eDsWoN+ccjWO2ns/XTlG0QdI0zJ
	 WLpxZQ7wTWzSiOAVn7gbw48rYa6Q0Tc9ceR6Ota+4cGkkjmHBINZ1Mm8W9kKpmmWzH1g+
	 IT2Qp3UQTiT7M2eqP3eGObjGYVoXUsN+JSl7TGbiibkRkwU4VicnXcllS/QfU1qA5Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VXljZbytmIPm0O6M+VipPKcRe1/Se49URr8LfLm6A/k=;
	b=VDh23ODrn7xh3D9sB4SEjnG3DJ2sMO88wykN+tOCtsDhMjKGEO2s2O+2H3MkqI23w+da
	 Hbi0vPiNVzyVvtE7LRXEyJoaqlsd5We9qG3oozikYG8Jz4xcvEo7D/Z3dVOQ71CdR1Sxg
	 nb5mCCE4zjD/gahPJ2k3KLfQDt7zf4cvxs0CJ0BWnlTOKanGwSA9UQX3VNORGgV3K0olz
	 xWgXushIE0jnGG8x06uO1ktFqG08WSC2Rqbhiw0p9a3s1SXwTxhIsmQ5cAGEIhV/bDF9k
	 b7QCoBT8dJ0nlhouOFdwBBFydqOSTI5PZjLJfT/dSGlPJf50bdoaTE+i4lLtL0KlZ8g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992572;
	bh=VXljZbytmIPm0O6M+VipPKcRe1/Se49URr8LfLm6A/k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RRWiTO4IBnhIavDBZw9l7rr1EaL9RjYSmJIMTPRrgkjIp/jebMSWeVoGSB7WfX9yQ
	 GJkllBxPEQIQzxJokFWA0wCVd8ZA2I6mb3NABtYt0X4gbAJmXBlrZfFpxQtAPKenU5
	 acEiCQPDJo+RAgMQksG/+U19ybie6y31DDfCY/nm/eEqkuTYtl8UO4jILvmuVFVi5b
	 J3/xDiUEw8FzbH5cC3pafC1CzZc6whULQeigdprIcHj9TRalVWsHlhME00w1X94Sf+
	 2Ufh04M8P+VlX9RgHw537y97/vV+fuEQkNHIRz0bAjN6hXzhuVJ5gMI7tJ0+f1wKmf
	 j5puoqW2oHmJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78B5F608D0;
	Fri,  6 Nov 2026 19:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87F814B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DD3B403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idLTjFZiujh9 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8A5E1400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=WxLD/Dmi
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A5E1400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:06 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-843cf077f10so1406727a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992565; x=1794597365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L8JplLo7mD3nuC7tyaEg17Z34Xab2hjw8dfOX8+Lyzk=;
 b=WxLD/DmivML++8N8F+a3QpeoU2lxeudRYWw8jvYwI37rZ38CNza4uQGxYkpDShZCpi
 rP34ekHV7ynGs6zctjZi/H0U+C0jkR9N6OJ8LdGMjTKcfLlpvMJ0DDoO66FRvTwNi/mo
 M6XeqwcdrsL7+DgXXmDiXdbZjLnB7cEJ4o57H68fDoyTBtmKoGdvmoMMO1F26LY07xg1
 gs+uaGjfQuvqjhotvK++NrdFAnrpFlvs+eh2gFSOyZpmeGmhHtVo8f9Np2GSbEjKCNYt
 Z1I9rzjPeaaRL7x9mC2ju8V/gQ7c4YQnJIAvQGHXwSUkDU2lLm1Be4C51sRxI5wJqUfu
 bDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992565; x=1794597365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L8JplLo7mD3nuC7tyaEg17Z34Xab2hjw8dfOX8+Lyzk=;
 b=2HVcZp4SslVwD+mTrbBT6LAFnUKxLkONOtTjpGxARbZsRFCGbbwSCfWWikfdxFIhlC
 LbXSyB0EoztIaGz1R2gCzTA2mD4NayNNg2lHSZobNdzcmPNaq2Px9ZzUZV0HHfurBkvT
 pJL6vLR7De2TewaN3JPtVtLfKjNTkAaQz/BMs1US+AL8siOVXbhNDz/9t84rhFXsaVvy
 iJ57degBfQq0oE6/kKdQqgURmr6NsUL+u+L0qkii5d1vY3F5tdfwVO3kbvPrCJ0EvSdF
 q0lnetbL5okMQF+f1Fm046q6JNkfg+kFVVcJdzhfZWBclX6lEBl8l1LhB0JvmdcIzJaM
 RGaQ==
X-Gm-Message-State: APuU4Z9kFgeJOdVTNqWzHXX+Rcdpk4H9P3KCzpQUZ/rMuaf5vBxU7XFt
 6yIma/rY507ExJPUh/DDhx5psVGaibh/f4LayqtE1xCWWsaO5LiijcEC3O6Fbg==
X-Gm-Gg: AYBFou1lP9S58Wbv96imICjWvF7BRXvo4KlG70W8wnMnUyHLnDS+2BcMc8qvitVBX3z
 MWifws0zuwfeXfXZfPHRHeIU285yegV2crAJl5mTwvk+Q885KlnKGufAs3IsMnSUMdBtpl8joLF
 PTBV/WtJltU70R6Q1Nw5/OOS7bkRkp51t4gSeg6TF5sp+ojIjyP2RTIj56EeD15AZFffqgD3bFa
 KTFeS6R2kWxM6Aet9NYbzMxXhLWFcvdSmUJV2+ki/+66RtVBud8pceld8osOECwSy4CvNn7v1HG
 5UPiPLuiebHhvSW8v2plSTS8duVy9YqjaRKo1jPcA/nJYanNt7lG0ftjZUC0fpxxp8cXPYjwZio
 YJGUEMlq/LUhGOTW6AQpL8SZ+ByLCZE7lc4rggQDmJTgXVPl40dpLpwDOjsn3kX7/m9jCIirz9W
 kNv0v8HOktFiMrVXRDOmyw/nleWHPagH+YJ65Et+MxT7WIflPonao856zGWMuMLaqTvJGPqc3rE
 bI805Ew1P9el8K3tg23TEHQ7IxYCzmBLPzeumoz7lOyy2YlrtONTOugkC1LgkbOjgy8D2IcWnRU
 7izmxsIq/hQsRfoZgzJqZFTqB7RLgAV3QPbu8rC1YTRMf/s4i6kB3rECyTbW3Y0JXq8o1RGR9Ax
 +DREY2B1Djum03hHk6k8Ah9+UUUUrgnWDCMCaiI/ksEddkn65TWxFrmOQ4DEqItzLgvlG4zs1T9
 AduCNJYUZdKVemNpkmvW5javZXDrSjrl3CypdoIObzUNxMUE0gMka/Svnc1hsM/FIVenRJ00MG9
 8ZSAuRPevZEOkvQHavu/eU=
X-Received: by 2002:a05:6820:428a:b0:6da:4b62:b6b2 with SMTP id
 006d021491bc7-716e790c5f2mr1571088eaf.40.1793992565160; 
 Fri, 06 Nov 2026 11:16:05 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:38 -0700
Message-ID: <20261106191536.2120153-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-auth: bump to version
 2.62.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 8ed03dd9e5..77e651c676 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  efa6eb1ad00dd54f257b745beb28c363  google_auth-2.62.0.tar.gz
-sha256  0bef0ce54bdf9ce226c5d66e4264413bd918141c31bbe49fb52eac882f513d69  google_auth-2.62.0.tar.gz
+md5  a0c81651e7aacabb9df4637c2b4a1cc4  google_auth-2.62.1.tar.gz
+sha256  3c8e1ce2553784ae17fd220e6f88df3281d86ab98019278f436d06dffab17a9e  google_auth-2.62.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 2ec4100fa9..c038af6f35 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.62.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.62.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/f5/b9/4b2528f30114b106e3c3a7298ba38d85e682fd1f83fe7c4a5b77c7677082
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/c4/38/d79ab09dcfc1e1638d887c8f65657619d3ebc454165c558ef79355971ce3
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
