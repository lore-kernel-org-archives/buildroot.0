Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FD606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ie2KBuwv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KnQw92pW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01788608E2;
	Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TIXFQuYtK_l; Fri,  6 Nov 2026 19:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EAA8608E0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992559;
	b=DXozYpQwkMchLPb+8JxSMm+NGstVKUhjpSeIg0CIgE8mgIWTf/FK6QygyAND5CzqHwRN
	 3eJFm99DX1XW5aGke5BH6eF62Nn6XOobx09awOITq1Cu8C8LoIF1+QTJgeGYt+r/eIcMi
	 OpnCGUXfaAzYvVzaTKfAU4aE7JpVXCmIvkrEBCcJ/kFPGhDIzWz03teQpLc5ObFL5Tqg/
	 3EGE1cbH5iLZNYmmFwHUmfSUKADdn1Qk68xN89lovTw9yhlYDmlK+Sv5Kr1sQHqBOzEtK
	 YGvM0WtSk9kOxhLRGotGN0TB0awHFiOrdGlguP/fMaw0M+Zf7q2nrjkaf+FXpjYoBbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IdTgK3yhVO6XygAouhtt3RRCYZ1kGYeldlVZu+kdF0E=;
	b=FQnuo8MWm47Bnn3SDQB/tDIkakAgm4+kQmKDKoHkgNgTQYuVISU5lcmjaZdiwbXalLgV
	 OoDZALKFK1C2Hec5bgpmw7BxxNs0Qo01uquGY3xbuWHA+tFUnwUIVksXoBEkIwFCdGim9
	 eQl5aKTLLqg920jhMH3ieAcZGLmL2QL15oQyah/PNt8VFv1AsPPQFwcP5PqqBn/5UrzwJ
	 nseGrb97YWqPAqzlwQqBmaMWBM4a/3CHRGYeQd5oYMoe8K4C2QJuv/vAWTnJKDQu99GZI
	 zWymGyA2ns3f/NPycbqSafwMf2y/NIX39VXuIXNmuDRWvv8/mOvJrUs3lQ32Sw0QDrA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992559;
	bh=IdTgK3yhVO6XygAouhtt3RRCYZ1kGYeldlVZu+kdF0E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ie2KBuwvyJvXMe0y0emuodyoqwauxf+bNRcYae1NCgx4icrtVzPszBR5X+PI6A3kf
	 pApNbgOlQZ5oSjPLrAW/OoXhP+maxuYVMkpgViCrwnexEg/RFr5tRjheWiC3QMBYZT
	 QouaDlo938LpACWyrRhFm4V59vNnIqZxhJ9EuXeaC+VrJgrYMT/VrS/XrP7QYmLwZX
	 DFOfCQqtBNJEQ8p53JMX/i+U0n/0aCfwbjNdbaSJkjsoFU9fPki/TDSExujgQ9OKOs
	 JdRz5fhd2hjsIgE8hvKVa7vhW3xJjHmdW7uBTmLJzHhDb7Mu2rrhmoBfbDmAfiVKtN
	 /7jZ1v59/ZMvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EAA8608E0;
	Fri,  6 Nov 2026 19:15:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9C24B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6AC340990
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n_R5p4qtxWE for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E077D40980
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=KnQw92pW
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E077D40980
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:55 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6b19e291cc6so904452eaf.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992554; x=1794597354; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=axtllrUftMvZMnRgYQh9adu9zqD96rKWnO9Pv+ObV60=;
 b=KnQw92pWWpFD+l5HLBnHVyYAoxYVlsoaP/DCuBNj03KBY3wQ+o6fOVKcoALd4R5e3G
 J4pRwVTzkfDpw21hoC77WqNUb94hrk79idMddUi5JJMNB1mAyXePcX8iqbTOibtV9KqS
 achUUow+U4aKIGUDWTwGu5xz2W+/5NGsKXgLfTa245d37slm4WLOoJVAoZsLqX7pWzPg
 KfnlkR7szx11mAv3iuGnXowgCoRqiQYbpyI/hgMMC7ZgZRyNCpq1FZjkzT1uT5tMKjLd
 nmCj4CJt8SowKQJrV2r/uOiizTly7c1rBMDU1PhtmCPidifAd+yjgDe/DUvQvMKPxOjt
 +oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992554; x=1794597354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=axtllrUftMvZMnRgYQh9adu9zqD96rKWnO9Pv+ObV60=;
 b=hXM0gMAQCAjuLhXjgWrda2yC3G+NcjIcZlxIXGwWm/o3xuwaUD8MbEtfZaoc08f01N
 5ndMFu8jq/Mp05pGrUk+3ltvrbJvg0f8uWOlVPNLK2rAc29TQizoKE5RpFziqnAjCz+8
 07mBa1x1fvP1dvTe/8VBWFhkbyT1LXX0/5yFJ4JR175qLqHT4F+6ZLTUraYZeKs3lgBV
 du5DBI6BCVqvcgcr2cXscOrj07w5WMGW7ZWZORD4IkypayC+wBIBjgtWb/ko05T5B3DH
 l/+8NfLSdwQaZBimYclYpQu9eGyNPAtOnU4C6THcfnOkooHZ8JNVxVWSjWShkpA8Gz24
 SY1w==
X-Gm-Message-State: APuU4Z+jli9eOol9WA/FNCLhZHxzHyNTyRz9ykmEjaPUmrU7c8bDx323
 qkeifiNExNlSZqUgDMjyugWP3kFBqxjePrL+ZVq2anBrY9IQEWhDLKkSs2nosA==
X-Gm-Gg: AYBFou1+ByMzT597qL7pRpUEZWK3sYwJhVvzvOd1p6e2n63nUgiKBJXPRdM6rVVEqUl
 N6XlA1iYijqS7vZGyPEaSYLWPlWvCQxiHdFYzWQef8VXUNLiTfrfdfNaazJEMP/1XAlejMQHCyf
 Gn/8UM8AUcq0TyC3DtS0PBCgJRZvREAttGpnIDRzxAlrG/28QT6zQf8mRv4oB7d+5WCV1fAVz6F
 lmL2DmQWTSdutZycnVMWoQy4DRl9RQvj7Ofyj4DcCCCMrbvYw633OjnXR9MKCSdVr+tDTiYSUFf
 og2S0YC3osg+X9FIC2EQQpPFX4tDJHMuj/F1HRKS3mp36JrEypdiR3u6bGYT25KUrM7ng6C0c+e
 jA1oA1URPn47KF+GjXb+aNkB4IKB4JsvrEniPfcLxwXL0TqpGPj66OPtuc9DAACfdxMcjoeFnx+
 evmNc4YrK1sDvUFrI9urqPzy5UXXXLDjyaRpVAXT9cy6QrOch9niJUrSRoastx45eVRXfIcU1Ls
 zsTDjFqo8uryAXMROVvT/MFotbTiUVP+FzcCIqjMPSAdPr+u+LXrCPGMahPe5NHnziWViT/aUx8
 AAAOSiRcQIqdx/HufMZoZGWGsrIZgs6ecCZ9PwU6PwgT4luTpUomQNxdN5a9eUaA9ppcyVbJMM0
 ylG8xREaKEowNXjXKlKWx6FicwOwnwMF4EYqvgelzE/5dlPlpRXkM4nVSCPuDEVUi8Z6IyuP/wg
 Ey79xx6wZvjjToUGYHB7j1dT8LSzWkEt4qfFzxdnoj2Sd2hxgk5F7abAUcI+EmdI9m/MrDHuYCR
 g==
X-Received: by 2002:a05:6820:625:b0:6df:428f:f181 with SMTP id
 006d021491bc7-716e7921dc9mr1972295eaf.69.1793992554241; 
 Fri, 06 Nov 2026 11:15:54 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:31 -0700
Message-ID: <20261106191536.2120153-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bsdiff4: bump to version 1.4.2
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index c3551e455f..b6a706911c 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  2b1bc9f016efdbb413db2954ddab7cde  bsdiff4-1.4.1.tar.gz
-sha256  d66fe7d6c50ea533aa860ac76689e05cfb0a3f8c7bd6730ddf5089a948f66ac5  bsdiff4-1.4.1.tar.gz
+md5  a96b7596b75e444f2e39dc791fdd836b  bsdiff4-1.4.2.tar.gz
+sha256  3ffd4d8b2d5b9f0f1c427e4fb58512dc88a4cc807623b72bc0e95e0baa21c70b  bsdiff4-1.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  409b960b948de9fe1ed54308394b225572661fd9cb6378002488bb318a7f1c66  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index d56d524f2e..3b6414f392 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.4.1
+PYTHON_BSDIFF4_VERSION = 1.4.2
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9f/56/f7e929c66b74e0efb7239ab02254cbc693f079b7836f3cbc2760fbbb2781
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/ae/89/6933ddf0a7d1d117a1c4c8e33b893c686935a8b392e36a8ae098189faed8
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
