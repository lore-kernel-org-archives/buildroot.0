Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NxGvPRd3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LGLtKetQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5597981358;
	Fri, 23 Oct 2026 18:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PlRTFarD0RW; Fri, 23 Oct 2026 18:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C3B6B8113D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779522;
	b=Xr91n277kwhS1dEEIjJIgdzLS0Y9jLZKHXJ8Uu/CBhETQkJgkrIOUTrVhVcw/dRNOovW
	 bqNZvqkx5tC5sQjjn2Yrf9gTUUGFvYXrNtsHhML5G74wz8Q/+4m+SbB8PtKEgHS6Vg1mi
	 h9t9cVbwYnCF57gFQRYSexCxM17j992MfE2E6tLT4NXQ2+q8kk/VgRteN7K/7ZATUfa2m
	 Mj68AtuDbafipzd3D/wWaDkvQ40l0A1QXqBxnhKoDfzyPgra84q6qT3NXN4WbW75WyjHL
	 5mNgBrsXTsEKLiU46p+rGnK+B0OiI7QuDuj8ceXamneQiLdWquPDfgVonNQuekLlyIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5qePyz7Yy9ADoGh/dHrcqgEq8rdlDpVOswZG/SKzV78=;
	b=S45+DpxtyVAmRUnPzlpeZSrZH59wxtYCrLDaLPnnld+FC042x97gHCZFMyXTkVaeqZWR
	 biCiOpyeKtSZdvrezjr2ezPZzZDQy5oYK4aDvw0OgPLATqwsottF5fVCjq1VqYpdrlDTF
	 jGQXYnpGfTZGrQxqtgVFBO54Z9pveg1F/3c8T2V6NWgpJAIVH8SE/fjehOsYm1XuoDkcE
	 NEFYsUACOMerykALbGV+10FksOwPzVBId/5wcPYOsKfYnbvwCrcrCvTx7irlBvmR57juV
	 YAqx6mFvSrTIb6yAm6QtTogy+49arD8IP7EKKHpCQZCJkwK6DXt4aUuGkkoOm28dihw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779522;
	bh=5qePyz7Yy9ADoGh/dHrcqgEq8rdlDpVOswZG/SKzV78=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NxGvPRd3x04ptOZIZ3XXuO7aOPFJi0wh7uZ2/RjwCVOdN0TzDQHDGeFR1u5sMarZ3
	 KfSzPgMVfaZLQ9bH5QSt21M/2Py6vuR/pmMSplB6HVpP/JwWPBwm5QK1n7bmazpPcD
	 dJLGQhEK8sOVEpK5ECRKYVMrFmPsmtubkO6BdyV78+aRLtlrvnYND3zTemByS58Aea
	 LtkPf1bYzYRpI1zdUmjQMUrjUiqKq3FLhtoi4Xa3xNi23d/Qe956RIpJ9c3L6T51FC
	 mQSV3Ei7XhyT73gv8uPzADArLyy/SK5GeSqEE9nUc9Ze61Y3/Zq0dETmclgVuo16I+
	 6RfxmTVaHtl6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B6B8113D;
	Fri, 23 Oct 2026 18:18:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75FCE235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67AF16067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzQ7qAPxGpFm for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 799B7608E7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779517;
 b=QD4YGxDLj7/Zz3t8AM2tTNn6JmGXjY6Bt1t7H/Ej0aSUWWw92IsbI2LmrmJ8jXLdLyKG
 fk0u3q5y+rhVCxFB3lFxkelTX4pj6JC0IJf/SReF3m3RtLq+/COSQlQ7a+griP3xwCVJu
 +l/Bx7FdXNgPXvgo8e/KVO0Hac5QvnCfwaNcIlPNIHwX8kVMk7PQrtV9JdmsIuc0Jmnht
 ozO5gY3AUJ1EUP67lCRsSLu/GWyURYbcvBYu164ax0zY07DV4rvDOL/vToDH9nLt70+7t
 izdrnAf9aU4GhUVnteb9tvA44DgvVwFOFAYCGCx13Y8lnt5Ec+7ZOM4PCYqqXdMORrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779517;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XbaV7eMWQVPekbRwg2/BWpTPoHoXvZKpqqcliDIbDdM=;
 b=EQl8YMKvN21+jxbKXoNKfG4VJzqdq7uQWaZZ1PkxXM/jmtgVctizOt8uhos/WvagVGX0
 lo/XEb9NcoMaQFP+1tj8e4gtG3gVRFz+ZI3bypUJOafBvrBFZKsHdSaaR/NmgbiyP0fv/
 wR9PHc55xmgVHJ8zEoCKFNlxcUEixI+nu5MHJnQi6Fx7mIn58fQJ0l53y4fH0iQFayT0M
 J44Y0ZDZmMXI2IO3BmWOB0HxNt7m5QLreMg7kX/6ntlesoJ2/kG0Kw0Han6g1Y+gWigIk
 ManBqROvRKVXA7EtZQjHPc3bLKJkvE33HT3gx0ardyegwAHkmKpn4sf+2jh5RadDBoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LGLtKetQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LGLtKetQ
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 799B7608E7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-6dd4f3f696aso711289eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779515; x=1793384315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XbaV7eMWQVPekbRwg2/BWpTPoHoXvZKpqqcliDIbDdM=;
 b=LGLtKetQxJaLhk3b0w8RsJxAe6WeKYL8VWqIh9ce4hL0MqjnKl8zqZz11+6TsckFjA
 u5TY3oblVZnomQd1gWc0+NcX+RPyQjv3eIgv/ZImQuKqB0orko4R+fzvAr19QJed5wX1
 +otdM8YFz1Toh+MrqfbD5BVGd7BbF8kYZlys9wGB7hU6+N4mdmXRl+VkzhDuYTYgotjI
 uG5FTVY13A4GtGVmfz61wgJ1XbXOPBfHNj+CQ5/y23SF3mT3qlKDl9pkazTUZVi17LOj
 Atvc6EbOJojDkBBYBZrklLOPNxAXnlBG+JBnYD4ScctyubMQ9+Enadq3w9vHev3Ghr6q
 gnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779515; x=1793384315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XbaV7eMWQVPekbRwg2/BWpTPoHoXvZKpqqcliDIbDdM=;
 b=goJZW9D38DPtF1sa321k2j3q3N2DLPHL/+Q9UmI8NDIobmHeBKBZd8cS9VII9KqkUl
 9ZDS69hrI+Av7FSkt7u/cufbjTv5s3IFo3YCExtImX+ixC90Q3oMc7Ynd/DguBsXAg1i
 8hUO1Eu1o68JLQKmDUOmWQvKFuHK+NZqEFtIxeDlFLva05eExGTZP1IGjqif5aerQdOU
 g2qj7DabMr+5cImvVrOG3mrxYiLiuT8rdbI4XeKz4jL/FoZjiDhwf57WZvb06JNLfY9q
 uPrzpEEgfeZqLgDtN36ZyvEqnWYqW0gGbPZaFJbD4mzd3HHBzTaHGJF1G7E2tuoZ4xIR
 pBGg==
X-Gm-Message-State: AFq9FYLtmXfVtlk2Np2G+UHJe9CsG7nH7aFz6E5qpTuJ/FPNKZYbeIQF
 STLivi5tL1CP1ndyJN7n7bbBe2jj450Y0vvcxc1N/ZACBWLlM6PSvlM7lvuUpg==
X-Gm-Gg: AYBFou0rlJb7mZMk2H3jVJzyexxej3nw+gy96CTvYp+TcuknKIic/BFMFSZ5BlO2bxe
 A0hhE4BgfD2bDO1YLUh6J94Sb7d6ZOTCDnohRzWQkhEe1Wws1Pq1sdA5c/wCG8NHFOwgBD0swuO
 kqzJ/vkbMwnkBcV+aB3BWBjvnmelIRh+1k1+/nbuY9PQL7SbXiSePnFfqVACVBRn82JtWyCh6dN
 dfte25OB49mnPH3U+U4+h9NUWdGt/ZeIuYPOqe8Zf5He8Koz4XYf8sQBLSEsXOdFeJCOn1sCVX+
 x/Yq1T7+z9XYfgOukg+igW+IbxqMHll5DoglRKfhNxbykOwZ2aVmrVKq/zAVXESsR6PVHgfQsWL
 0BqL1YxgohoTli1DWLZdzAptFsoFZZ2PeE5Jf8viZbt76NklwzVya2SApISbkuOTe631jTCcyq+
 LPAuRj0+ilvl6Qk5yMbukJrxzPZBI5GY60xt5xdyHfiLXHb3frRsCXcO7PGLRmrxBAGK2Dipe1l
 Xp99pDFAQqreIEpV+TtB95qeLSj1Z8WkreivHnv8drl5XE0DpTo+aeBk5HC4Lv+0M8Xx4IUf6Xu
 HO+a3NZXrPa5FdmErgmAvQjwP47PIz/iZf+NIuP5Jl9clGUOKSOguBz8nbGcjmlarGOzrzZKkOx
 vLNTUEUg7k3T9ey+ySi4dOokjDS0R+7tmOeXBtDQDd0flSmycNBM8rYoOGIxXw+Fj5/dRUsjcWZ
 U1XrZEGXJaUrgNEfdUFm7+T8o=
X-Received: by 2002:a05:6820:1346:b0:6df:ac2e:85b7 with SMTP id
 006d021491bc7-70b889b7122mr2012940eaf.15.1792779515169; 
 Fri, 23 Oct 2026 11:18:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:27 -0600
Message-ID: <20261023181818.920329-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-api-core: bump to version
 2.43.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index d546dbae68..2a619a6c1e 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  d24f5de1ee29fe538f3b042188f7a51c  google_api_core-2.42.0.tar.gz
-sha256  82cf5daa2ef1b456d4e29ff1de1a5c2995c7be3ccf4fc608184326e03390c1ee  google_api_core-2.42.0.tar.gz
+md5  2ac450a1a704ecc4b73951dcdb69f7d4  google_api_core-2.43.0.tar.gz
+sha256  d67355a22d995a009b6c5ca98744ea35fbf4f9c2c006aa0588c0941d1ceb5216  google_api_core-2.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 55371ab811..0ee2d158c9 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.42.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.43.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/ac/aa/2aa84799e6920216f8aa2866d3b43daa20f7060dcb6efc8f0449e8be0ab0
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/bf/1c/83011225511b8a0aeee9633d58d8e6b5d858ea5502e76117bcefb620245d
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
