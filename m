Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C0606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EROq/Toh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKxzfv/4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9805D6073B;
	Sat, 31 Oct 2026 17:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTbpGNflX78w; Sat, 31 Oct 2026 17:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56D6D607CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467240;
	b=aR8EK8pqn18B9VpHiMYN0sd/oHdJ3w6m/OP4MU/9Q0YNTwTyESk76zkuo2RYIpfTcHED
	 DbAO7VzDgKbML/UvlVTI+y7xlgTDI+tkg8TvF+ZDgLHKGklFXerqWNMSe0c4jL1IKkYGh
	 +2saGGW4UrQKzXL6yDurmWg7Od/IXNokyen0pVFlzkijAZK9Slcsj0E05fyXn0ASKh4Hn
	 QaOYXjxwW+02cSHIkKPPBiF14ucKDPtkAmc9zjPf8yy821VWXviqU8ulapYLQptBWsN9o
	 ZtRIeoRUdkXf2jiDyyI1PJ0WliD7TKhOBFMZRzcp+kZJ1Xd/PAjO+MY8AOvML5V+0OA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=n57MdqZOSD155ueZpu3pOZxFFpNyN9oHrgwlJcFHi/Q=;
	b=ZEOVHci5e6nXaWTiI/GGF3FSBkP46jLVDGiGck+AuU/HJxueXYGrMS5WVgpWpy/W+X9e
	 k4MOseI+DvT9AwljqNRAGlRvyJw9/7/lp/cbPmeaeKLQjTPnZyU/dsol6eqWIv5guzjV7
	 EInAUdeEfeD3KTx3fyG0t0sVXzVxicdp8pbsWwphbgbNl5WPquiOAuE9N9q9ImZIjbDqN
	 AwZrqTIyhy0LhGBcmL16Lu/J1FijX3mMAHNL00E8F/SA6CClp1Hy/hLAhazVCYi4JTKZ4
	 SUXKDhM2nvPkfxqcLYhtvTidPTV3bQqHJWt6BvcgF7eOHHkmHBjN5VnLajkkJeqEhPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LKxzfv/4";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467240;
	bh=n57MdqZOSD155ueZpu3pOZxFFpNyN9oHrgwlJcFHi/Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EROq/TohKefplDsSa/lJ721WgZYCOhQylbf83WTckyDD50mwYtSmMUeV9nm1Rj7in
	 eOjEBNFpWwaKkP9GGqhJb4KhUfTaenstuJ2qDtRnCvH2uKqIqQgdJ+C4mXxSjxnZu1
	 9Ub+y0ArQAI8m/3xj818qgUfFzdPk0Bg3bA0/l4iSjzDV6Wy7S7VWz4KBjVddHJ8uh
	 7YUd0XppgJ0kYg8EG+bVJaMTi6N9x/Q/HFTJVLFlWvHv46EyzA3MOv7KiAVdTcRFvK
	 OZXFraBl/T8zlcAHZFuSlkMzUWSfgtVqsJm0RVrqj29De2DRfVOgjpM+R3e3UKXTp5
	 ewW84mVoIkIBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D6D607CF;
	Sat, 31 Oct 2026 17:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DADD4E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FD360796
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b9_w9kFNHCp for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 33FE360779
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467233;
 b=lXgjpAIZlxqaU5xn0DeCuB97vbJj5UZci8k4Gc7Fp5VgipMTgyToMhgrTEAXaFUp91Tu
 QePdPhH/RkCYyayMhUoCp7q+wW3cKI1vdjWaKEAlWjC0juGv1CS+OxAo9puxhnMJo6eRk
 Z3dBwIGhZvVGB4M67wTBRagZ0VLtCjxAo793+feLTP6WE1EDUSW5PAOAhDqGsg/brhN/Y
 6y5+dvWiyy0ffIjYWZ9VKkffsQ6cmGFoOp9jQnGDTpcGjNexnraC7DW5kVPIcp1IKNtyJ
 crFr201hBPcPUVko1oGioxX9Xk6sPJchysAcnq0HR9ewDZnktz6CvWf+5J0huXVPv9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467233;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XWBSCCz4OMNnKanFCtDX6HVbz35tEmv4L8OrOIqBO20=;
 b=DBH7SxTxniR8vlvIAUhncLI3aYrLxv4sY1fbUrJx+ajNGZ0MkRXaSWRbd4OOoq2DuafG
 oE1EVfZiiNwLRXLOryGo7AYQlxmMEP7+rTobdBD6B/V8l+qxlMp3Yl8R3pjQg7gp+ZUkG
 56iUBqOR6g4+8lJlSTiDBQ63745myE8vSPlAkMw8bHpsA+RwRvtn2jjltwp4ylDjxv2TV
 8Ib8KC2wOQ2SAR9VPHoVkkJja54+YyDG5mP5/MQIRBta7LRZP9OJkgHpURtKpYTVxVfDy
 aKnGw5wMPFXrxzSPxJ4cGfSA0r2bclrCvIo+/gGWUgi1xiB1nVbNC+ItpFNfGIO/QjQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="LKxzfv/4"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LKxzfv/4
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33FE360779
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-833e671ee9fso1933595a34.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467232; x=1794072032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XWBSCCz4OMNnKanFCtDX6HVbz35tEmv4L8OrOIqBO20=;
 b=LKxzfv/4G+BcOkNClbsXHWRWqO26L+ep98hQfBevttORNrjB3JQTQnkBlPy/T7PbGU
 EM+JWwAccEO3V+xZmzkVvPju8Nb5721nCONA0xl/cm0PpCSMrcZElxcv8SvlTRm/rjON
 KAfVex5eTUIGhgRNpydtVc4+GCpcswI+MC1+RYihcFf5YaRtPWEkxfjbiyFOocByL4Cu
 qsWCKzGUIqNpMJ0IJP2pEJF6b5ZbbNYfNexZMf/Yocs3aD8cTcNVFa+Pw4TPCAvV4G1q
 BZxTlHmQdyGpZa2aLmRmrMDAWwfbqQ3eW+vC/2y7T7GK5uOa0mUG3I9c05vVi9oT4A3g
 7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467232; x=1794072032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XWBSCCz4OMNnKanFCtDX6HVbz35tEmv4L8OrOIqBO20=;
 b=D7gM6aw+oNc0smX/yGMvdE/auUA5OTu4ZQWJxQfMXgAV1WwEoyCGpelHVb7ZEhZIZn
 FxJs3wpnx42ny+Fw8SaPHiFLMA86nRwA2oVLCyjJHFxTxdAfdUEE/hIJ9wlpP+2tDxcY
 exGz5s77fYkial0gcYUTczcacoIxCY31KnXlG48aRuP8OJouVBqx/8PWFieedtoesnwv
 4olBRPHVyG/2kMbIBjnMugBrlSCx5Acu5bDJK5l7qNwbtO8lgaADe69KEGsO5F7gNTMU
 M+lXIA+6B2AAMu8TsqjHe98H66yC3lx2DIRDS8A2EwrXhK4MlH/S+mUTV52/opdDqpYi
 O3vg==
X-Gm-Message-State: AFq9FYJMG7CzD291BgBvO7uOImonh27iR2K2/6mDhsCOGjOkt3NLXL1o
 4rC4kw/zJPZas6W+6638I13MMPBQivyQfHX2PqEdbg9tBLYFwf2g336+fFvNUw==
X-Gm-Gg: AYBFou1gsas0IJPZyibkgKgu5QLIVlfWHDKwNG1Ap+YMy8CcnB/zcptIS7yw0QGu2aY
 yQEYcNxk+Q9Xa1Bvc0HO9UyJP5kHBoPrSRUnN7C4CX9jJnkypZAdI0fFX2RrglmLhZOk1deS0qV
 6reLJhYQfP9599XWy+hZ7GblkG+FKl5yoNJ4v/MeSvanyHVbVhn7JwRdbB6keZYeT7q8+XqFrlY
 J6asa33+HuHSDmUgU6u7B2AjgvFCrMAWghaJnXePl0ESwLWp9lKczOf8GDVOUxAUj5h7Vn62BS3
 C83ATudhE1j2R6KbPGRQ/NJlDYVvgYwERy4Yo57+MrhkSSNpCcMtkm99ouszaYKsLdaGXH6bT5O
 vZtS1cZZsln8qhVZCgeA05RsEtwfRy5n/TKNyezW/JOdht66kXSdkOzVKHK/D0bdE4coLYOe3po
 vs0D9U/NkfPlaJpDMpips25yxQkVH3VJ8eNQ+IICn7D+HDcOOdAP6+BwP7I6qNUotGwwS4491dA
 OUhywJd9xpBt2R4w8e/0jGvg+R5eKgwOSH8JL7KPNxZQsLrSlZhm/CFKP/ZDhmH6Yxr8ZYzGB4t
 NPcUJZGtJ7m5abochCDPOx8y9+AiG1LHGhNulEEQwDWTPu6NqSrYUMUT+x05SDRlUSv++pW1SoJ
 e/8sOwywsY7hE1g9ilWoqUr4m2OIRLqXZFfS8nPTqK16erFF6qpGyhbcwuk7zkJpY+p7XlH2w4g
 3PHMXFkgKSc9L9J5GhdVnGjLSPhBWC8I1mo5nj4IGPXLqhbJnpVUkJ6PM+7SlurXz7b3H2upNzT
 A==
X-Received: by 2002:a05:6830:2313:b0:822:40fc:2eaa with SMTP id
 46e09a7af769-85d36601115mr3829587a34.27.1793467231788; 
 Sat, 31 Oct 2026 10:20:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:36 -0600
Message-ID: <20261031172019.2683287-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-hatchling: bump to version 1.33.0
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
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 82a28deb79..e99faa0f46 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  537991c82a1c02b1c5023fec65972966  hatchling-1.32.4.tar.gz
-sha256  c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07  hatchling-1.32.4.tar.gz
+md5  ceb27e40e3f0adc9247db08816d8c853  hatchling-1.33.0.tar.gz
+sha256  4c422bd4d554fcff5de5b73e9596f85e41e9f97f7e553d8f7595ecb31a627bef  hatchling-1.33.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 4a116d8837..ce8654cbae 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.32.4
+PYTHON_HATCHLING_VERSION = 1.33.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f6/97/b5312f01a8c6daf729a9d272dd442e0c546dbcc630495788786c4b567ed0
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/7a/f1/e47b937226ae3b093bbd0132eb0b7ee5bfad12c2b5324afd10ae49946b05
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
