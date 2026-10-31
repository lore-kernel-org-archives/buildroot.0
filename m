Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7768A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XP6TdrUq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUNfBbXW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C08F6067E;
	Sat, 31 Oct 2026 18:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdW0XqIsONfg; Sat, 31 Oct 2026 18:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6AAF060640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793470042;
	b=EEkqqPFhYlWkB1SDGFGqsVa4OV8XIQdoGJQajYWo8QafY1zSaqR/gM4czENM8RbJuNLN
	 HAKZOfOihGv9FNbZfiH5BDbRlDiXsqqzcBs6OQzKAan6f5rVMvkJgaNMeBaMvEXP52lJh
	 HrikKyPpns3FP8P2XcH1hEW92ICIMg2J05FR9bSJZHopxGLlZu57E5b9VzzQOXtgV//m7
	 Lk73qP4enM+Oh2MVaVpw1hkvv+ewcFGMc77VBdcOKtotieSaBI02Vp6QkKgScHwFdoJOI
	 FOO/ZM3a14bq4YLYN/4xiX8b/XtjQl8B0g9sII391+YLaux8RtZdl0UpNnt5siFxOHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793470042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Zm9Ymv/t59qmb1f6trMsHxwurfBd+t/P1eZw0CH3Ft0=;
	b=UAB2g4cNENGYjjUulIeYJmJm3gHx4uEUHIBFZdBzPwwoaLXLrnX6EQRNojn+c/py1B+6
	 SrDMNx7LmPz0mvPEKiBpwp4d0FRbsdLbMNH+rKKWx84Vo1IWsKHTIEoO02GrL7m5MeB1k
	 xelj21YtAwpYwJsidZipHvw1fWO3bMPsqsePnJDaq2yzyPTi/4bvTLqH6qIV2ykPcKmw/
	 5aid1HFozFfWiKeGK+BsHS3/UWxlAYxtsbntU002Y3ac59WuPBTYnp/ow4L8atGQ+5I7H
	 IS6qyOUSE5RBUfEskHTmYYS702I1AVTYNXsa/ZJ6S6xJh8c5oHyt6CuMJDCNUga0Wog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUNfBbXW;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793470042;
	bh=Zm9Ymv/t59qmb1f6trMsHxwurfBd+t/P1eZw0CH3Ft0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XP6TdrUqYy4MBPP59gNKoUU0j0i4adaSWufYoHi67pFmMcYYqW1LTx/7Lwr9tJUHO
	 uOFCjAuOOVHlVMNA+Zwr1sNV6+GiCBex9XffjQ73A807LP2eGCcABzRz1IR9Z/L7m9
	 wYU/GYPfgjqiJy+4yDjhM5INcoxBVzM5DAlf9YH9A9kh9CRV7UJiTntR6LeLpqbPaI
	 AqHvS43v+jjOh5qPUfcLnUqM7c1o5PJuozN4pw+f24cutWfJY2S22VE1RT71fsfKzt
	 6OqgwCsnEXuR1VtafEE3NIAL4U3G08+jnxnF7BqLt0sQDyhWBuFQfGQbuOLlyrf8Em
	 rA7g/niSJOMAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAF060640;
	Sat, 31 Oct 2026 18:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C3214E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61BA560640
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkDxCsOVv-vd for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B32D6061B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793470038;
 b=ex+MnRqb7cxuR/Mt14gX6/qfr0W2wpgqxZ6wCqiXZhRSWhNCh8e4rGRXYRbx9p5WRrVf
 WGE7VGcH9NEbnT3kQL2GNDtvyssX8NA3K75QLx7aXlCfLuznZQkZL7xlNQPXtws1AqZbi
 sSL0QjnekFR83qmJdIQlpiNlhdCCpncmHwbZUrIlfIEN2Xs7owQAxWrWYRitoSZDeRo4D
 Gq5eicemCV54yyJxKH722e/mPijMW4T02t+7gbTm70Va8Z2qOkmGcqpcwh1gf4Dz2ueE8
 t2ZWT+EGW9f+R/6M4V5h6RIqsjaHRvtYkxkq12HVvrP5ZEQgtNIAz5rM9dk7BucgEWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793470038;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AySC5t2KWcuJqdg1dFV6GNTpTOr+ZdRTcOzUhN1tzgU=;
 b=NrTPqJ50ozI8ZoIX/GB3nPbcRLEF/AGuzQKNtFl51LnxCgFf7dWpBhpiyJguiSfZJXf8
 4PW6RDI0SJLqTAju+FkDcvjTJqHdig8HsWgmQwRD/EbyjUPt80GvwNv3YNRiuMk+feHC+
 IyKH7vp6A0gUVyKR0Zl9P9JIBZLP2vAB9nS5bVsbm5hbtd6j/nnBumggcAAqCxcqJQOC7
 yYrlzkrvTmqHDNzLRqy78ISw8XfsLXJyh5wKtkoN8yg5NqPR3PgaY1gZls8W2ENaLPf1V
 4Efx+w9/x6PSNPMcm81SS6Y5HMxYebCuc3qbYi0rvTIuRug9nsAsjo5gmb6BQdZEk+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=rUNfBbXW; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=rUNfBbXW
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B32D6061B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:18 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6f5a0893610so1471195eaf.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793470037; x=1794074837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AySC5t2KWcuJqdg1dFV6GNTpTOr+ZdRTcOzUhN1tzgU=;
 b=rUNfBbXW5ZTHx29XA7CooE0lpBHN3T6/jmkKCq+15ErGXuJDCCVh+dHEAW+3lUNpVB
 8Xah4iv12jxVXH/7pG+9BKfyKFInCuz0v4+U0duZInVWFdutTgauScNr7nE/MY9nMxDq
 urxHAqe5HUtkuB9AJoq4ZV0Xf7pIa1Tg6WVfcP6GDydvMdzrhmA8HtP47kqtPpY18TFd
 uLwX7s50MKVdh4DaqkRLFMvnJc3sti+juItwuvBecfCU7dsehYgNoZNUSIdKnfFThkVT
 qOCmRo6Sp2mx6iWuNye3UHOF0OGlHqizZsD+f8sDKm1PW18PCR9wzn1VEBsxhoaG6O4j
 klxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793470037; x=1794074837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AySC5t2KWcuJqdg1dFV6GNTpTOr+ZdRTcOzUhN1tzgU=;
 b=u3CD8v3aENIgbfPLngh7kYnPvFhgqVc7fn3IRPrDofv6zPFlqwmqQP4FA687zaN2GV
 MKz9Cca1/px+n3bmRg74fT6yTXR47IrMxx1iTNquouG7vnvmqfFqdpqgRdU0OGcxXI5M
 ecSnp/3P0mPYOlOnM8bI/ReknjM5JkvvlN5FdirgdVWbTYnp2opEsAXAA8lIqlDdQd+s
 xy2plQVYEUxcokSS34G9YTylMxw5GiOmlKTnD7gWwsWmfYX7KKDEsXZrq6kzTUs5Xk5J
 69hxOqEdRdoGNW8A3/z++OgxpzcmWzLFgVJIJFZ85znHlMUmPKFJFj2To89eUIQvtOre
 gXyw==
X-Gm-Message-State: AFq9FYLuJMviokRNPMVcR/s/+y8IJPBaJHKXDy78pG74OJW6WWFTqd4a
 1ElRNWZZ32Su0ivhbTx8uYMX/Cj0Cb8+zPa3rtkBo4znV2OycfqN1FEmwQiV8g==
X-Gm-Gg: AYBFou2xn8FGFpOf+ISaDkIVqUpNV54iiTDFqkq0s616JoVdn7z5+gsXu59bx4+ifyI
 3D85sqotvDtoOEmqabcjGTOk9K4FniJuZvZCtB76NFKtKqcYRqrFhma2yHJjOaE40mrL/SOiPtk
 2hXeHCN7jL/mHbG3VqBe7JXFzlYB7bYAnw+so8qVnr/R8qushk9vRph9Ewk6HTahSLuLsxXK/7F
 fuKsxLWJCqyKsQuhNNLbyCAYIPjodnsg+vlS01uZugcAm5xaJbJbZ0FxUgR/YyWZBvQtfEIYB9t
 9vffb7KnuHu5JZfUo1jIUfpYYOi37AZgMXt7aUMlYutoJo6YcK+4AsyibOndSSOqU/E1e3sZX+z
 GweuxDMPm/ChAS4K8Vsw7PWX44Tmb4vwlMwQwNYJFYLgpzNlVIkHSnm2qAEMkmawD1BT2qMjE7M
 Yzj1OKvQ8j7wrnTjAvjBd74hK0Lp6O1hPH0nuoIAw1URTsIsWxUh7Lf9TmunLCRA1nDfVz/xDGz
 CkCEeEIi9Ke7+CpdrdtQgMtIdvd0TQfjMpSuPLs9VLpQDV5nscCJxkxeA0LRBo2MeLl5yQ2S4io
 4TODnC7hG6Jf4PWx2GK88y+DFow8Ex4f5v0vbud48dTU8v1n0Etp8CitMTEdKT6LPBaG2Pnpqhj
 NG/nxD03Wxjc+vYDrzJY7iHLcL1oln7Ei0xljhDUqXLWCYPblmQH2OFTwuzfJwLoN4pkT5art/6
 wkUT3ablIw6QcwCgoZFUeHuagVfaR4SoZlhsG/xKyhzogCRJ5bFii+9SawqGgUpGLA/QENHVtS
X-Received: by 2002:a05:6820:a290:10b0:702:9fce:ae76 with SMTP id
 006d021491bc7-714f2a44a77mr2283756eaf.61.1793470037115; 
 Sat, 31 Oct 2026 11:07:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-714f2a84854sm4935744eaf.2.2026.10.31.11.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:07:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:07:11 -0600
Message-ID: <20261031180711.2738509-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031180711.2738509-1-james.hilliard1@gmail.com>
References: <20261031180711.2738509-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-grpcio-reflection: bump to
 version 1.85.1
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
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 42540564d2..1f5b56f58b 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  fcc7b785c8283697cba440e9c32e6260  grpcio_reflection-1.84.1.tar.gz
-sha256  09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8  grpcio_reflection-1.84.1.tar.gz
+md5  732c4dde3cbd777dc44d0fcdfa20acc7  grpcio_reflection-1.85.1.tar.gz
+sha256  a3257f35cc817e372cfe330ba3411fc0c61f23b09a94dd2d8f91185955c5533c  grpcio_reflection-1.85.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 1b5f909727..f21b8d5e91 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.1
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.85.1
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/d8/16/dc6673110945d3d2a17d862516b67e0237dabdbaaa6ea1c8ccd76fb704b1
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/3d/57/6dd3f295af8c5b0516ae58b252fad8f07eb18c13b6e81db04b3537740574
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
