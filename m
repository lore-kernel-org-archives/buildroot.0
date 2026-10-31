Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781CB606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a1gDhATW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckEVNAxv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F3680E7F;
	Sat, 31 Oct 2026 20:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDvtIvhP68Ix; Sat, 31 Oct 2026 20:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5BC7C80E47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477973;
	b=N8cqSv0EDOIn9HqOXnJWc5wZBOyPPHQOLTCv56N+RGgoiAJ7z5KJFCpu0l8PSSi2hGvK
	 Qikcx5AX1UYzJKrkXaPOA7dkhXA8hCUDXgMHyte7IJmcTtgmvI8UWyfbO0KVzHbo0bpzK
	 v0GMNGDhHz/tVjl7FdlbBxHbzWZFwHnau/L5+oPzBrHnJWviuWyyiSxQtmrI/BjbmjK57
	 NYRC6+2ZbaZeJuBq63so/Bu9Xk+SVHOY7tR6QRCZf3rMDM0hGY+1O/FC60PkEzHDLSzWH
	 b7SChP11pzjGMcWuR9FNJeny8BCLLVHC2QUhElrLo8PFSo81WhSeMSdqI0C/OYotNYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a/edIVvWSD5MnTM/wtEtFufhVdSCbJhCp7MKNfrxVnI=;
	b=W3E80jAarZBnOWY5aSSZaSAV0l5W7A6pHbTA1Ezxs3Qe6e9r3TNlW5C1Lb4UTMNTTnEb
	 MAOZZQlrNj/ER6yS342Twm9f2gz8tATKgOIJG0UzlA3xJ9c0ZW5pwjWNBh1cj3ZzEtBFt
	 ulSn7PhOgGSDIyWaZDuThCHvkiS/Fya4MX+3gNsalVlK5RFvSkjpgtluUasrMs80quDrI
	 0uuZKt74RRJ3ipgSXnDqs/oYwR2Jjv9D1X0nuThQ1qZ1kKdg/NF3lnx1VB5PtcBGWoFGy
	 W+ZSPSGyVeoTtWN/QeAhIVoH7hVuzJ2iUiIgGo9kfe7yiCq0rNu5s+MEPMuwpAzYMRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477973;
	bh=a/edIVvWSD5MnTM/wtEtFufhVdSCbJhCp7MKNfrxVnI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=a1gDhATWuMSIdMGTAgCZ303Vnj/gSSvKU1eELL7F0LxhcenjTZaQ3qkPlm1InLMJR
	 UzBi/sur1SGirPQwmNmQNpTVQvZQ7Bf6AMEN3RDiyBBzn+dcOxu5OKry5ZUxzCP5WL
	 Hy74MZJV+JdxorHALiRemG6c2914HLE9ofWTf6vaa3ELas6vqO/MhjsZZl03k8WOxv
	 K7oEQsUvxjeNKR9ZBXIg9jTm6o65hifzPBtFCtUNzkawzoNE+YtNTQZKcrSfwVT9cY
	 oOdDP2oUxEV4cAMbiMbLxg8/7MZ2jtLi4a/jBy3wlBGavX2u+/XPsHmfajE1F/yewi
	 3mAeA1TL6O4wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC7C80E47;
	Sat, 31 Oct 2026 20:19:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A42380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D39340699
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbUFj6Ug1nZR for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 853B34064B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477968;
 b=i4U4Kk505b4DcEaWszQyb0W3ySN47dRGpxGS1ac3Tq1seI0wCC906b6SOEs6/aI9zDg6
 bGVpnamvHEFFHobBvZ9IH6aRUMIwQR4zRNfKLE0433Yq/UaUwXKM+U4rTIBO/N4tZJZSB
 hZyeOOSzuwZVHqHO/jGFfOT8r/hUK5j+SXalnT8DT/zUhhKnFTzHgOsdS/hR7fNqOCALA
 j104ZvM5f1VIwHLKMLKkTNyb29AC1HIrAr78bsq3b58YyGY5OgfKfeiLiaKoYBc0N7rRS
 nhVgo/eJ7qkcW5RVp/SlQXapgpMxoItM3j6sIlYVqUEGNgf0py/1YcIBYOrPC0VlYBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477968;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=AwXhR4wkJFdlTGF0pLKqzPFpVrcOL/uHYFV8M/ezAC0=;
 b=alwUqOo7OIKeWvqTxMu0ix/XvJZJmcFXwJmq5ZX1MRFi5TLZ9Hjn+ZC10GuK5ir8UwA6
 ubrIz/IHKhFe0J45lwoG3gNEyKfNp427F90lEHZfFZz1c2DYCBUgQaaQ3w3Pao7gvmKEn
 GNlxVSGPCVh2mC228M/JLPJMuYJYzgojSp+vSiK7/kLSXbSghAMPs4u7Hdp6UJmbz9nS3
 KvFjqbOj54vvRl/g8cGZ0xTbnnjyY9vxeEkpkoSb/nheqBSwh55+kZ6LV5n9/DPyIc5Vm
 xGhxzB/yAY2t/iaw+j+zivVwim8KgZgC6tDzeM36gbMpXR4FA59/dkBCbq9J69ZuqNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ckEVNAxv; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ckEVNAxv
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 853B34064B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:28 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-82380b0f55dso802326a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477967; x=1794082767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AwXhR4wkJFdlTGF0pLKqzPFpVrcOL/uHYFV8M/ezAC0=;
 b=ckEVNAxvPPT3P66U2F4kiYeiQMlcfJkQwgsobDrz/G7fa48ysmYO9dLviem8ED1Ktw
 jPnEJmm81JVVaCtQu06Jw9mdYruczC7QJr3tX0SGO7gVI2p2j4uGpsokeKMNmw/Z7H3P
 incHFSbINMesrhKWnihwf+wZcjro9VoECZqvnY4DWsMFD4IlPHYXsydsujdBjbWTkve6
 CraUoCB5GflbwSnwCe8bf7O0cxzirsHopS7ACdaJdy5K7BKac78MR2N/55RHKeV0tF8W
 McY8y917K94jSYaa2nkHkJVVHy8zVSjU8UaLZvtji3tlJ7Bu2W2OIIi4eGrux+OaUtcV
 vFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477967; x=1794082767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AwXhR4wkJFdlTGF0pLKqzPFpVrcOL/uHYFV8M/ezAC0=;
 b=c6s8wn2q/2Bqs7d52lFYex/ss/FiEOkKNGhRWkzaqf1OgvMw9j27q96XPtqjoTEWJs
 UWEaTTTyxSs/37OCbkCyt861LqkEPdeJSyb09hb3A5w/scEFDBLEZ10jfFgRRuw5q7HG
 x2fQtOFQq9ExymyJKJ80K4Ug6lxCqKAoBNPpY4BBXHeMc65OtyJQcoaEjQ/DWFEDuXry
 LfR4qMv1LPmNKdVqtAYwFmW/WdtreA5c2VZtPLX+Gz9qdH4lda+cksBS3lgBimc+fsxJ
 EbuoNXBky7I0hUL/knd0UbtN+Es7EY6tz2CAB/wrhY7rEnw78Eyk0MvAIMCoLLcP2R5A
 OTmg==
X-Gm-Message-State: AFq9FYJ6cZyWNthwXWEYqZoZgT9J8UyzFA0E8zR6gh0Xn2tIRFReVgWv
 8Ufc7eBPLqBxtPsKL6xtUV7ezHp2sLs5QubjXq8DZXTRVYKraTgoeWEeI8niVg==
X-Gm-Gg: AYBFou30/C1OVo5NfxTqsp0J6QSCIUVo3+ZS2ZB5rITNNqVDMjVeihAdxb9urvh/KRi
 y1B+uFfqhtrm3VxZ3YOXBC4CWwiOXZGUxlS1VLIVBY7iDG2UG3GPH5jXd1KNtCP7G2dJn7OyFpZ
 cm+rUkgbEadPNSBdzgBOXRIRt7fTBl1mM9Jx9yFQtwpqwNYyT67MaLRP0KRacZpcQU8Gu7EHVH7
 ruoGS6KL0jQy059g33oV2A5SUcRgTquJ1ehQ/GkC8RI1RmEGvNYIdBUfvYHyoDaJzhu1QXx2bw/
 6+zq0H9URphPg4TRKYHy6QeChZk0Ekb01F+QNSSM7j5aYREFSb10rFLSoaAAYOeS+O53BZBKv2D
 OvJ3wYv4hOfWOJYUXPuZhSDQuNkPX5igv521CXDJSQmC/tc/z+Hwazyq7xlk++UIaP6knvCWWls
 C1yAq5Lt6oaJxfsoCsLGIeEzmzMupK3wlRQvyk90EaNl+oFKg5UGYx74HNzukeMZ1YHmNmmLvgK
 LDlXNqtMcM/ZgVl/w5BaOfFraYA3m33VPGHgOjmvFi4ePqDqNDj8hapCgDDhSRDqIQtaURPOPzn
 Mat1KMvRE6WadGvA+ySdQ3+9kOMcf1e+c9K8JnrEQTxKTAZB7VPgTUpe3MxuwH1bJcFUEcCDDFx
 Rzi+Vv5zq3ir/wW5LfQff4QHAN9GwXiimN5xszjeqKDuUj9wntYL8NYGdNs76iioZ/FJjB/p6y7
 Uuxo6MrBFZ8qrPAM56/tu+vhk5ZfxIzFAOT6fkcst7T+7GiqDgxk/Qu590u5lvRnYUuww9jTaAS
 Q==
X-Received: by 2002:a05:6870:3c05:b0:48f:e137:dc80 with SMTP id
 586e51a60fabf-4a9077d5a2amr3679135fac.57.1793477966984; 
 Sat, 31 Oct 2026 13:19:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:06 -0600
Message-ID: <20261031201918.2850153-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-httplib2: bump to version 0.32.1
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the missing host-python-pyparsing runtime dependency for the
host variant.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index fcb8b19374..58929f2577 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  0c45edbd75957af282de53fb428f6b1f  httplib2-0.32.0.tar.gz
-sha256  48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025  httplib2-0.32.0.tar.gz
+md5  61c2a054468f59da08155d4addaedc87  httplib2-0.32.1.tar.gz
+sha256  37900eb8a74576bd99fc39ae1dc8409f95f965d45b56cbcb2194bb55f58a90e1  httplib2-0.32.1.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ae683c759f..f4ac638f33 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.32.0
+PYTHON_HTTPLIB2_VERSION = 0.32.1
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/93/da/affa4b2adc11468c7d88d9b4258cac432479046edcf212284b55d4528593
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
 PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
+HOST_PYTHON_HTTPLIB2_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
