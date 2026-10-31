Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D6606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eUK6gJwr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z36n05vI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2E916067E;
	Sat, 31 Oct 2026 18:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpCV1kBXaDWh; Sat, 31 Oct 2026 18:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B754C6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793469993;
	b=PC39FbOp3SC2JyYT2HIC9nDu5A9MN0IwI1fP/4+S8uaBm+zAVW6M6EyR8VSPURSbDjT8
	 SxxeJTeaUAFIkll1s1pQk0T3NP97vxX3gf0P0vtvsA7odZnDpcRV7q0SRJUjZWWXUGtq5
	 bx8/BWvF0h7OPDCgpsiZJslC/gmdNlZwagIJE5NorRYk06v6ClaR+8sYn50B90MBPd50F
	 ELvCc0OKKKIGRX0RAAhLouuImRgYWwFB4JZ3tx2YirvJ2qQa7aJuUApt6Q60lUigpZFwn
	 On5MM3N9/koyGYXCn5+eKXHtZxOSEeJUL6rU8HndadZCk6AFohTwgF/rhFYdKP2SLqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793469993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y1kpBrTyZyzXEfXMNC+HtGwWE60oXr5Y1eunnRdj09w=;
	b=stmGqKDfSl6ZBQ2GatiL48Usbw3EvYdsWuSqeWAgeywzJ8b/BjBdPeBMdt+7W0EbGO9E
	 HGIdkcX3C3RKWsU5kS9+ZkBm5wiozZMW0AOOAQHQy4xQtrEua2iYihrGdMd7mLJsZIBWB
	 e3fhqyjRvc9zcfT7RMIYQktdSWj3OnX3SEiL0efMhaetdhhb3/rziVpj+opThcjLSscoC
	 GvPZv3We4lInSbqveNTHnqHuSo9vWc0vbGJiR1dEHivmzUjgls9+tjibaM+UYfIBOICPs
	 ELt/VYrKHlOIeFPBRXLU91Cob2Bhz9K8BDSURkUcLxnuKiKaCAaVy5RGMjj2G3LR+Pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793469993;
	bh=Y1kpBrTyZyzXEfXMNC+HtGwWE60oXr5Y1eunnRdj09w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eUK6gJwrQt74I0NZu1xNuYIDUCJdEqStE5fbsZ9Xg6rzDHzpfrxo8XGksXPMpuvvc
	 EPL45yXS3LkJhpdvxA0LtTEMnsa/AuKqk3K+JSRxXxSvwuUxHjCFlvVu1qsEr1sJHo
	 PUcLFTNttbA7pT/nFb29BM5fnnVqopTCo2dj5LHs1A6lCyUXsAOyLENVfzWCgsXib1
	 OwaRqKQEsHfafOlf0cCd3LDOIqWHx1YEfJkNy3QANUTharVh70LBGcroi66RHkEpTH
	 xlPPxBQREucMWxsYOoGlRZUPf35q4eSs8Q6GCSjDngp/v3nSltXfZgA+5+m74T2gA7
	 JKuSucdYvtPNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B754C6061B;
	Sat, 31 Oct 2026 18:06:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 464234E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 374C280E01
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLLs_oYTojzp for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31E2880DE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793469991;
 b=tJ5Gpf9CaJoeu0ArMyRdVggcFjGl7K4IEmzd1Ocs7NINiqxP4VkHnKpnZidgyhrv/Lr7
 RqooERtcxWk1AW/wfKgh5lQ5Hm8fc3QHkskTK0bYZ8EovB4gCF7OKWPaTWh3inmVSc253
 YKXH+lGXXsUZwaHmyG2zDm4zoVYHIOGD1h9HyQARmWmIOfbCFI3nOWRKozY5A8u/JVWhc
 nsUM4H7fQQXal9VUu6jOMaZNa6w+B1L/2dd3K/dPXOT/kn8SkLZl8vrfQSSitdXk4veYi
 1HphQV0JJin1wNjO5FMWVg6s6x4zio3yrFkCteCTVF8nH1qrjkvK3gqqDNM7o2sJKyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793469991;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=AAy3l89Toy4v6fsfsVd91eG3UkNRmGSzPBR8b6QNn2w=;
 b=n4isUtxgynrQAoC/2aCVsfpc6y9HpKazYurKQNSsFC00RFUA2zQAmeacasnHnmpMMTad
 ELi0S/k8nAdZOK3b8VPg4pxrgeT2JYLSp6cRLaaWqgRmGwPWRKfEZWCV/jw7QzUvAxGII
 gMX0z1nAoE1Cl2u0t6aEtZErHZl6q4VXosz9KDxQ3JpgjVHpn8LnnDS4fDLekPE8eMjBA
 87/31vtp6qdkimcFVfR+6MFxRBWc8KvYlI3l04S2putwazZFkndL4HfmAulPEugaZG4QD
 /9c3RSL9I2/XjChdZBC4uItc8505IKf14IU/Jk758dDDLfsUJuYFTSNNjgBgn4azNhg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=z36n05vI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=z36n05vI
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31E2880DE3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:30 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4f488ba6e90so665382b6e.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793469990; x=1794074790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AAy3l89Toy4v6fsfsVd91eG3UkNRmGSzPBR8b6QNn2w=;
 b=z36n05vIuch3tNMgr0aqtjznPMmBg+1m6WFEPsUWUqXwtRejw/P3uesbp7iwA7pDUk
 sU97G2GnIYJ1+4z7duahIeSSKG5YJbuSc1g1NmUQe3/yD+hUMvy8klMpUHg2GYK0HgDx
 JkMUDMsXNbvNGXsBGax7zoB7HbhV6jZfpNv2kDTZCGqBhZ0048lTzjGCUcqCb9TtZOGb
 26a5ZTxGUfaXay/aXgKajGZmjo3BUWI1RIA2klCsVtVnyQLrjyN6eeRT36xSBfTxKCjR
 DGcpjLcRGrbcTXv3zFFWDcevK9BwHbDZ1tWaEMUJNHjnzPP6Bkr08P6jTONS/AGlDrKf
 diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793469990; x=1794074790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AAy3l89Toy4v6fsfsVd91eG3UkNRmGSzPBR8b6QNn2w=;
 b=K2zPnLzCaQZaum0Y1m1IuhlSSymBKwbMRjEK9FdLxeeA3BKBH5VJMw60z+ncjY2csq
 SpagqMWqg2TvgQMW4gPTfyfzh0Htsm5Z66YFYeGLrAJkbW8XC0wv8ZzE6lXqUyH8d16V
 U1e7bFO1L8McBjOstXt+KtqeKChWHXPuPfd+rOpcTll/7YhSHtURPWpjeAdxpy3EIzV3
 wuJXrbVjSR58v4KneK+L+/Qz1HQ6CJkxxRHnp9vmyTNAkv87sn6ty2lP1lLDVC91OZCF
 2x8ABG9Jt/6K2lIxhTMQvV91wTXJPuudjOHKcZxcho9Ebze71YRSEF4E+wTZAN5oMsBT
 CqHg==
X-Gm-Message-State: AFq9FYKovQ1QZjPWMickwg2OgA7HZbM7HINix/z3Q+9slNRojeBiBLjJ
 YBz4Spe7xAY1Pxsz8n1kd4hns8q19kJ5d9tLx0bImoY1wrRcI+0u+U5QIevEAA==
X-Gm-Gg: AYBFou3ruq9c/MvsrkhPm8p3j41IBG6it1B1JUHGFVwVS5FHoTTZpDc64SXsN42KvEt
 UzJX/jwXQN0Dq7pBzy493r/JYv/jnBEwWHrYLI0ZTYEiaSdHCHyM8UQpoXxmXDnZwGG4+ZwiGk7
 fx+JDPSjlBIHaR+ySMaJ75dhIuA3dnSf2DdoV/f4FgSK3Iat+C2taZzLWG82Zn6eytJRjUj/DGY
 d0y2WdWfhKLGvC9TaJdLd1Iphs+75fRaYzcuUBO9De+am4/qaFmyq3hqKKWmsqHiQKlDXA9pYHv
 NiQ8kFXGjYe5LcLjsdiGmeoj3goKCB+dZPz7WCqp1eNcU3r3Ciyw6ZBBzPbUBEFKdx4T+/2pz+A
 OYVkqeqgbjht+pkTVZ/3BQCJi+n9Rg8tvT9BNQMkSB2y2S8gZZAn+K1wowuBO5y7Nxv0AEhicJp
 RSBKEwm8rcFiEe+KDYwgJDr/dIW5kmPGqt88LIMuZPY+LpKYBLgt14dvTKdqy18Yi6njLZep8xE
 l2Mi9CIS0CTs8ASPuKJfCnsrnZshYuLBA4Go+nyfOn0Kyxf5y3lrfjMXh/CHWkusOuNPKVQnmsU
 1UlfWdDcD0YRaYrCIINxjyIvRIxHd3xZgNpUvB1pun2LhFP0FJKYg34DCB/VKLoaPFXB8UWPFtm
 AQHenTPYgHzQ6m7l3vktyZYJ7nl97XNONZi3fUcKNaMo+yPcTVtNnaloO2hVnyWCpW4Qrje99Iq
 Lrr1Mgqg7G8ZIBkS3YvlDmEFnUZfiZaqzFm7oPfMbTVLStWsnMAj64elwDUbsacNktLrAe2itpp
 6aJMEnybY1fzDsCWEjGbw==
X-Received: by 2002:a05:6808:c1b2:b0:55c:844:98b3 with SMTP id
 5614622812f47-5640ddc230emr4192057b6e.50.1793469990053; 
 Sat, 31 Oct 2026 11:06:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fdd2fb7sm4407759b6e.10.2026.10.31.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:06:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:06:24 -0600
Message-ID: <20261031180625.2738332-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-botocore: bump to version
 1.43.123
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 4165d4cfde..bb6a31f622 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  3d48f43d16ae64ec8af669c35f938b20  botocore-1.43.118.tar.gz
-sha256  7f3f9d88cc9e847587690f82a42e3c3c292c3026c92c1e60d68a9310018e003f  botocore-1.43.118.tar.gz
+md5  2a0f0c5b960417f5942dee41def3e83d  botocore-1.43.123.tar.gz
+sha256  80948cb9b1cdf1a1a25809089a42e3a1bc4af0258d198222db6e97dcc660dd0c  botocore-1.43.123.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3aee2d8f30..de4d459434 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.118
+PYTHON_BOTOCORE_VERSION = 1.43.123
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/d4/b8/3e55154ddaf1a6d1d4ddda85c0e5983205a3b7657edacd8ebba8c6fd774c
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/e0/de/011fc2a47fb066c47064b122498d2fd21f55bc90ea514acbddc37ca0f8c1
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
