Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E8606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ShJNpn23;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qj9uq3Gw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C0080FFF;
	Sat, 31 Oct 2026 14:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKjKTA2aCytP; Sat, 31 Oct 2026 14:36:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B8F0681011
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793457389;
	b=QbKqvYaDZ0rLYusjg+JbEDHgC3PI75iJJCa9h6MEDV9HAqz6H1hsobXuKdhYkWyzt7YI
	 OcHwVIYBTteFcYiJiFgozeW2F1UWRdt2mRi+p8WYy0bFkb6LuM0O4AucqowdFOzyQ8yXO
	 Itl8ioLr4wVTckD3ov2ugBSi4i66vDZ/XaJ1g/K2soqzj9PsN5U0YLmjltz2uoGtGzPs9
	 Jk5YDesBh7Oo42Zl2h2rfs23hVa7pmPxDVAdIx5/LTG8+GUsqMecFbKO8e+PgP1KXCW5Y
	 rCVLSdHs1wIc9KQJ8Y2BdfiRcmVACdGQ3B38ItuS6DLamrk/pF9vWWGb88rtzW/bHRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793457389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aeWmvfc0Bi+un1qMmJJx38iWhUj4N2OcbJDCTHSERjg=;
	b=I5Ag10XJAY7Ay9EqTWamPKiPa8+XRstItyPB+zsyboa6s96uF2BTd/iHJZoDbJ8sLBXc
	 MzwLen3HAO6XmWKy6E2YQjoIzy06dYfc27aR6A2F9xMA87du8pP4kOjKgyvuzELP79vSn
	 NilbdSjphmfC/wmS/2/Lb+yismDLzuLd47PzIDhpaqBbyQdjkECtxvW6PJa8iDK4GguCz
	 whxdtLzKDiEavkn4Cvguo2xIpVlgY1I/FcSRWIqZw0T6APYX+8prSRm2+gNINgCED+4M1
	 ELNHF10G4yruwXoWgiwpz6QByon30m+M9y5lrV6mC6QVA/BzdvEncFY8CVn6iCrjeEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qj9uq3Gw;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793457389;
	bh=aeWmvfc0Bi+un1qMmJJx38iWhUj4N2OcbJDCTHSERjg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShJNpn23OiIZE6B/BAek/grUhcMcRf17YERpB4YbXiUzFs32R+MCaFB91OLdFrhb+
	 7uj2LPBpodsAcQ5KiPY1DIyMnPbxDaivodCr54YY1Z/dAA5wn5GbMTTcPjVtz72IRY
	 0yCeEjnC21wAT1wd0tASKndqxoAHuY3aGanpXQN/C/iEOEhcJePq/wn4lE/Pysxxm9
	 rHOdD9OhjAik8K4iO5x0CAlUMFOIYvcVExbQxgtyQwu1Q6RurHUjPJYcG5rQCCGDDg
	 nIpAVwF6WOwu8EGjxAkA3bdsm3lDgme1CG/Do7ZkwmCwikuS7G/JpOK6TRSVsPYu7G
	 UtxDXoxidX9Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F0681011;
	Sat, 31 Oct 2026 14:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F70380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0BC581005
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Blpl1Ow6LcRI for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 14:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43FCB81010
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793457385;
 b=Sw0Pfl+nECdt29sy3ba/BIVAG4+ZhBlfXu7PCFc9jADU6y4vtvUPKhnMs1O7HiGDjJZY
 NTNEFSMb6CNW4G/B21YMZSetBQv7PIjSqZZiDdOIbBUZjHhFx6cUuau1t7lckoYcFQQg0
 ZZrVOKbL57W4W+4sbAQh4SAte35pVr7p3xWbxGs6+Z0STgrzB7q1auxEaAJWhkPnyy3Vi
 1T84ztVYz7QCwpPtzqHwcXsuLKe6scoFwYzb8jgc+jFKp1LJCJgsz65Mupl32VaZSeMJo
 1ikO4thGgMAmTESf0He2bZ2JaP5yB2W86/5ODbvH5v0tISkWY6HvbADPBFHq1dYjAgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793457385;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=j8nJpZVn6hktTu9RL6PJbjbCkeEdpOnyNhXqUlb7Kh8=;
 b=bONwChEuGkX7SOcKobBHvxGUTwoHylaepUSnjrWeAtEqosr1RkQGiqHWG3zDYjpZLbvK
 b2Cu0rZy0+7JVq8uDArgXttj3i5nME9GYcUJqWhZqOht5Z7la4b6woF5LrZ9C/Ohz8Pjd
 b5eVXkmX9oat7NodcMHkJ/gt2ckpjMw4enazQNVomQU+FnkSdmLcyLn5da8/QUAGpusd9
 pe/GOf+e+7tD92tyckZDOJ+Zd0cULAXK0bxhmPzmSAFbt4VqhfQiro5lYh8nJ6FONGRyw
 HCB4Jw4hD5f0FHmxGusrexvxRQNMnR2wEP53uYL1HTUPRBB/99C69Szx1XeuxudUhHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Qj9uq3Gw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Qj9uq3Gw
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43FCB81010
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so970180f8f.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793457382; x=1794062182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j8nJpZVn6hktTu9RL6PJbjbCkeEdpOnyNhXqUlb7Kh8=;
 b=Qj9uq3GwJj0h4afnoESY4pFKRg/Y258dULLEXK1eKnCxceP3wiAay1gOAv+TaPJ94q
 581PPE1MrhCo03N/haBl4wH/iel3zHYPhS4nukcqZxcFDnJZ1SPCmhibcRSOMv5/m/ty
 sF4Op/XUCbsZ3pI4HwS4bRxcbaZGMWSNUKaftBVnSMthBwwm9Dud2IkD6J9rK6D4Rjpz
 hUplNnhFqloYt3m1keoBCA8sDyPXW2RF2brxcq79PH2q3lFwe2emk/uB822spLOIMgAr
 0jup7JRzLaH8aO5IUd81W0sUnRZ3sASYjVKcPbsGx0YQxg002OXhHb9hj/zn39aEMg3A
 0XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793457382; x=1794062182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j8nJpZVn6hktTu9RL6PJbjbCkeEdpOnyNhXqUlb7Kh8=;
 b=HlmsAge2ZsF3OG+fn5mhY3izdqOoCUfmZc9UGCBkk8z5BexbN/4fOlaQGuHB/Oc/83
 MaMGYznYqi0jIZBzpcGfqFQ28u31SXP+Qiv1DBwSbTWl7S3UWyAr3+nXHBrhhm9/TwVc
 Do+DvR1eVgamto7Bd5V4a0d1VAftIHGthcB3U7OrbzrgzZKXU23cH3ncmLlwozHjAGtd
 zbeZVV4pzuNdPfkJ3gQS4H3oRIyZaSaiIVBBUrIdgQtYbNtvst98JicG37traAM+CnA2
 LZUss6mh0KnlnkGDf6t1WGM9mrY/lhhkVsau+oEO0e/3YfnPF25D1dRkV+6YZE6geFS7
 EItw==
X-Gm-Message-State: AFq9FYIuYAWF3RxHZ/9kZfTDhXPt1jourHFw6RNLOwoUzXsh3QA7TJnq
 qkWm3BLhDpc2zRvknrYWBZDw8XDMdm10xYyJL0MEk7i0OCFYA+4roHFfZchG/Q==
X-Gm-Gg: AYBFou0V/ogTIB8t8eCYP8MPSoi8aMtDrOJdvuMnkki0DeCBjdxXEYHAj7Ugu9FzHPF
 0fTpQncqrc+BNSXvTyOnuHrAg8Oa++vJpEgKqQM6SfoDL6/ZxiLmZ9fWEzPEmRDIbz0QalPsRtk
 CdCzHsOw4NhgxqKTy7UkSRaBfTe4JXwmNmdccUH9G09czMr2MjwdTnniQaQhJQ0vFyqcb5qMEOO
 MsZnt0tFbieNXEE1iTWm7/R3b8r/Nb4pkk1Y8x9dOrovR/ul8SvuRtU95u7sH3BiOBF9fRk/W0u
 wXsczRz/8RZ9oZjanweRc6D4f028WntAwD4S/QRuREb/Ea49wmcSAqVAh9gmxo2Sv8gDwDQGJie
 +SATbf3Kc02V7ziZKPB/AIZW3/0L10igzTiPFMcH7K2i8/F2EnxiMLhd0S8QNeL9vLtOf/wcKJa
 UumdUgilhU3aIkzpdpXr96eiFWyzs2yxrNe5ZQ23iTUbl2QD6SLkuUvPEsCwl0ta/kmDmNcRZr5
 aLgt9M+qAVhbxx4EDNzburxPJT4GeeQ97+AvcNP9zcKFhgnuAK0PXcB2zjEPZbxPr2/wBdI0yOO
 iR2p6Ye6uid5gGJuZe3B3LD/MkR3CgUxsLsracYDPX0d3d2rxUqFSw==
X-Received: by 2002:adf:e007:0:20b0:48d:fdd0:6ce8 with SMTP id
 ffacd0b85a97d-48e6e2bc847mr9607776f8f.3.1793457381796; 
 Sat, 31 Oct 2026 07:36:21 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789c6sm9794118f8f.26.2026.10.31.07.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:36:21 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 31 Oct 2026 15:36:17 +0100
Message-Id: <20261031143617.445438-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
References: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
 <20261031143617.445438-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/python-web2py: bump to version
 3.3.3
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

web2py 3.3.3 stores binaries/*.zip with Git LFS, so the archive
generated from the git repository depends on git-lfs being installed on
the build host: it contains either the zip files or their LFS pointers,
with different hashes.

So download the release tag archive with the github helper instead,
which doesn't include the git submodules (pydal, yatl and rocket3): in
that case, gluon imports the installed modules, provided by
python-pydal, python-yatl and the new python-rocket3 package.
host-python-rocket3 is needed to generate the admin panel password.

Update the list of files not installed on the target, as some of them
were renamed, removed or added in the new version, and also exclude the
Buildroot stamp and file list files.

Changes:
https://github.com/web2py/web2py/compare/v3.1.1...v3.3.3

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - use the comparison between the tags as changelog [Julien]
  - download the release tag archive with the github helper and use the
    python-pydal, python-yatl and new python-rocket3 packages instead of
    the git submodules, as the git archive hash depended on git-lfs
    being installed [Julien]
  - update the list of files not installed on the target
---
 package/python-web2py/Config.in          |  1 +
 package/python-web2py/python-web2py.hash |  2 +-
 package/python-web2py/python-web2py.mk   | 40 +++++++++++++++++-------
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index 0c141d9fc5..83ce4b3e74 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_WEB2PY
 	bool "python-web2py"
 	select BR2_PACKAGE_PYTHON_PYDAL # runtime
+	select BR2_PACKAGE_PYTHON_ROCKET3 # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index b100a1fec8..5e7fd0d9b4 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
+sha256  38655b8f1c9737348b61669ccb2beaecdba1f6bf1e9a5cfa697a14b660b31a78  python-web2py-v3.3.3.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 68847a2385..168c1d3445 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.3.3
 PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
-PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
-PYTHON_WEB2PY_SITE_METHOD = git
-PYTHON_WEB2PY_GIT_SUBMODULES = YES
+PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
@@ -21,20 +19,33 @@ PYTHON_WEB2PY_EXCLUSIONS = \
 	welcome.w2p \
 	applications/examples \
 	applications/welcome \
+	binaries \
 	deposit \
+	docker \
 	docs \
 	examples \
 	extras \
 	handlers \
 	scripts \
-	ABOUT \
+	.codecov.yml \
+	.gitattributes \
+	.github \
+	.gitignore \
+	.gitmodules \
+	.travis.yml \
+	ABOUT.web2py.txt \
 	anyserver.py \
-	CHANGELOG \
+	app.yaml \
+	appveyor.yml \
+	CHANGELOG.md \
+	gae.nix \
 	Makefile \
-	MANIFEST.in \
-	README.markdown \
-	setup.py \
-	tox.ini
+	README.md \
+	requirements.gae.txt \
+	requirements.txt \
+	SECURITY.md \
+	tox.ini \
+	versioning-and-support-policy.md
 
 define PYTHON_WEB2PY_GENERATE_PASSWORD
 	$(HOST_DIR)/bin/python -c 'import os; \
@@ -44,15 +55,22 @@ define PYTHON_WEB2PY_GENERATE_PASSWORD
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
+# gluon imports rocket3 to generate the password
+PYTHON_WEB2PY_DEPENDENCIES += host-python-rocket3
 PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
 else
 PYTHON_WEB2PY_EXCLUSIONS += applications/admin
 endif
 
+# The build directory also contains the Buildroot stamp and file list
+# files, which must not be installed.
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www/web2py
 	rsync -a $(@D)/ $(TARGET_DIR)/var/www/web2py/ \
-		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS))
+		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS)) \
+		--exclude='.stamp_*' \
+		--exclude='.files-list*' \
+		--exclude=.applied_patches_list
 endef
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
