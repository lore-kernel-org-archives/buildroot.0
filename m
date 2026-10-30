Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B854606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=afLiV2dk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZ4ElU4u
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7236079D;
	Fri, 30 Oct 2026 11:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyF16FbyJp6b; Fri, 30 Oct 2026 11:42:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70F1760679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793360535;
	b=fmn7hxr78as0An9Xck43Pi56xc9pDLpYhkwhnlHlVhs7WDH1Jh8QyfWrwgMZQ80Kqaiy
	 PqD9O+NUt+AmA7btnDl6r3Vlql4idCLWCiM/j/H4h/LMVKKTyCLCJ59rC3PwdibG79vSm
	 ZTAHT4Tf0RlyY9VVSL2cow2SUkcYoWro5mbaKpBWyZ1hXOQiyjwQ3W0H2Beu/Dpw7eaF1
	 TPSsQQhuwMh3grdXBmAoFZdtHGcWG4ng87mNZopd3D0o5eeL+5PoQ6+ZJV6qQmGfxx6OY
	 nax6ffwwrMjtLphDoO5Vdi0EGo0FYWobtf1Kluw1q45Ridsvrc85jw1Mtg0o1YtbBUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793360535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+DI9OYHw+havNBxQ236zgyr7qubRXmfaGpjeldlcgIY=;
	b=l+KPlD/dGGplK4UYgRh5XuDxL6XGCkkBM5rK6ze7xYekn2BvGMfn3ULkpBH7VjCvhYno
	 VDwkhM+tGlM05hK+Knrle32UH5PPeVl7bquCnh0qZeY7tr9v/2VAOm5DgauKE/XsYS2t3
	 O3zW+oZQW/4GcKP89srBSW7cD5W9nSZkxvDwBd+vH7bRSCV39ZgK6mYHk70zLTEZQFWI4
	 VSqQnqn5SWZjcWJVW99vcFlTJtEwPWAGtaJj1gyAvpyW3I5S2QWyEmcKA+XaMEYMW2rR6
	 q07K/Go1Jak8r91ih1cQ8IwL04lEODTxKAP9v97BG/Rdb65YrAxGpOT41qiBkrrnSPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793360535;
	bh=+DI9OYHw+havNBxQ236zgyr7qubRXmfaGpjeldlcgIY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=afLiV2dklnf+ESTIvqsk7xafjylAbF73qhjaox5hNV61yoh9AThp4DPKcwj4wGtQW
	 DrzrwedhW/VPLPW2IrWbEUUroNrYt0lkU/yTAgAOlhJ98q+7l4l+zR0jEZURRHtd8I
	 fhWi0BQf/e+blfHMNQqHjezNjE9rWzkK6n5pZ4kXYQQZaOMDY6CtIHbLzRiBh4T8is
	 xXNm0m5kZWVVOyWW4dKsZCLX2cgwcZWqi/RXszvPBr08M6Zgm0iyR13cN4F0cFJT4H
	 TMEz6N2L8ATrn4tOY/0GGbR0g42x4f6o0iBURUv6ejDdhFNDtrUsurPidrmHgPj+a7
	 AfX9kncSt4eNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F1760679;
	Fri, 30 Oct 2026 11:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D8041DE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F2B810F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAtbEXjP8pQP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:42:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2425B80D6A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793360533;
 b=GF5yFHpKxlXM37jKBUKdg/PzJyEMP5P1OFpT3Dg4S7f8n3/uaSZ3ZKuNVYLSCdMaxwBa
 sSF7RnP9Mksee2N+y361WPtDcSf800KcJt8ao2rSg9Bl4p4sS3twCk2esXSe297LPOiAN
 sPHymM+um5YphUhgeK3MCkmusradPVd7QbEdMifC2vkp7jGhJfMEBjUmgFiK5otxeijP/
 5Qb7xVRmqbwVDKrn7khiR5j972x2R28gjWVSum4vniKVDtguaz+z737ILsbElB+R+fqpA
 nO00E7Gd3e3M43ulADukZQJ08V/uTRgpQuUTWBRJDT5It/es8Q9GtVhD1s20zaYmqKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793360533;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EF1FQZ+mBeEuUnMVaoPZtZJl3SDYlnA09hloDQnnBr0=;
 b=NqsP/jua7J+NpPkZP/3YVUxjcKzZy1HtolGyy67GP08lhOKGeCYVgCmA9oH59EiECskM
 lMjcnn39MzCaCon4pf7C4ju6+wvUyJlCYTCGV8CN1altMEljbLybjHkP0H6r9sNZGs/dM
 X/ICXL7kVPVOJx9z/xaEC0B9/PEIPGwkEcpFgwcS/yRkf7V8UshR0wA1OcAol1nhLgX+V
 q7W7SHvQraEnRGUS0Q9uQOpcQUW0fEImberpqU5sPRvdXpgrobD5DWOrLN/BhWdHRb3HE
 wY1nYuI99+7mgqawsBm2IKTXF2brQZySKPlCpeoruk6bR7nbYybHLrGYJqZ+AKTv3wQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=EZ4ElU4u; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=EZ4ElU4u
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2425B80D6A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:42:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so516176f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793360531; x=1793965331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EF1FQZ+mBeEuUnMVaoPZtZJl3SDYlnA09hloDQnnBr0=;
 b=EZ4ElU4uAIK6xn75aOSk9wmmPLkRGE0ZpV8e/2b1pO9ybaQxij/LcWAzxBTNXFz8i0
 0i3on75nldSZ1+uSy19ammW8671/9FxtfAFyqSIDyTcIGscZHFSMXndGa+JtIqCPRn1I
 0QS/IEyOZBHEiNHY8GUN9ZTxlh2jgmXMjw1zyFMU6zNPFHg6JsVA8t80a3cWVWuBBj2A
 rslyUqGFr/4NMMp552VSEqFWdCS4FVMAiyMTwFlGG7a9lrB7eQ391NHmvTqQZLzjzMfl
 gaRu0j9dH6W7vLX1s+i/4rlGI2zstAR5jxFFn1Ry0WXjkx0U77ujVpD2Q2io3DyqFyPD
 Mw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793360531; x=1793965331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EF1FQZ+mBeEuUnMVaoPZtZJl3SDYlnA09hloDQnnBr0=;
 b=CoHHznXwa5fQKf2GlOtSwZn7skJJ4+m+mWPUCAIHwVMwgvHbKpXLFDfvjv8GoAABiB
 Lz0kwM+MO3bVb0ZScxSzYxOWa4UR1PHJetY443pC+YGeEPOrFiIUGwbwJNg4YtX5WMWD
 PB/4IW1LS5sE59NTvK0A3C9FV8xWpl3/zqplYjFVM4acMwqaVbhrzHFKSlVep7oHOHkF
 u9q/sm5ShPePiwpW0OE1AadjRt8GT1c2GWXLPDfd/S6U4TrjL2Mz/y+pgYUnDRhVqIGC
 /NJo64zJHGmTu7Pl4soBRYOy4OdcKIHv59z7ilbEBkXXNPcBP576SBYH7r3Btv/6wEM3
 jpvg==
X-Gm-Message-State: AFq9FYJcQ8h4knM/UIbrHxzrTrvfmaViR9yYpVi/xf5eZ43Du0gitVr0
 wc3AzCf78sb6PGLLKUnwUiZYDT9r0JvpHZj1bHOd3L9d3nd/7zHGDI5owprK4g==
X-Gm-Gg: AYBFou0X1scXJ8zwiDlR3DUXTv/i3ull+7hMe7mvq1gEjelpFpP3pxSE/DPWVVYzKGG
 yWKuBgKqLNMXkUrCrGvD0RRfypzTl6S72R7BIJsJXARK/lSMQtpFErUbdv2VLe4cE+jWR/RFEyR
 P8ciNP6VxLgyz7D3kf8gqKrQUo8Ci4T2S3MeG+eF/AvV3QpAJxwj/hm1LNdoghgW1Nca5B204p7
 dC8c+dO3Wlo6Ahtp+Zu+zySzrZaHQ/1qff67DVytE6fsvtX6w7WLAP3+khufWn6SknNGvmZbNfB
 NtLNL5QTj7XAebIYdRPfp0Upfp46hqG77kr0jzMS6brMKVnxcLhtF4MTY9j58XXiz8qa7lxz3XW
 TI2U/ULA5a7LT2gAuPPDqUiaoWEz+IDPbLpBQPa9vyPVbCXry4q10lBERKCqeOVQAwKbgCgo2GT
 Sp97O+U+gbgeGLh82lUWYfLgJjWHGXgFmv/xZ76RoXCiFpYUvB318h2CYqVu0pmVZees7FYFuTV
 hX7US5evs/Aqbl6Xw/sv2BC6wawvMH8lrgETzXHNwiz/sc6vbYq/DYIjNOZrvhX5oYZzgLK2GQr
 a/rLp4Wt6zR3FIQwzWTqtbQRF0yRCnt6Nq/zpm12nICG146ZFWvRkw==
X-Received: by 2002:a05:6000:4287:b0:488:7df9:3898 with SMTP id
 ffacd0b85a97d-48e6e30ba37mr5231907f8f.56.1793360530581; 
 Fri, 30 Oct 2026 04:42:10 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9a3b1sm2927426f8f.44.2026.10.30.04.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:42:09 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 12:42:05 +0100
Message-Id: <20261030114205.2915371-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sshguard: bump to version 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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

Changelog:
https://bitbucket.org/sshguard/sshguard/src/v2.6.0/CHANGELOG.rst

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index 81d79e3034..f6dbc31cfc 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.5.1/sshguard-2.5.1.sha256
-sha256  997a1e0ec2b2165b4757c42f8948162eb534183946af52efc406885d97cb89fc  sshguard-2.5.1.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.6.0/sshguard-2.6.0.sha256
+sha256  17cf44e29ce7853bd2df1425785947a097eda1d4f87ffb03a92d4c98bae4654d  sshguard-2.6.0.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 4aa152bbfc..a0dce8d880 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.5.1
+SSHGUARD_VERSION = 2.6.0
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
