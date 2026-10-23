Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A75606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cA2GzclS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s541i/6Q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB1B81217;
	Fri, 23 Oct 2026 18:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giA37MHvQaHy; Fri, 23 Oct 2026 18:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEDB981668
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779541;
	b=HwxFGhN/lsV4zRnDrDFQE5OII4UAVlNsLwmzBdeKks9C+AQgJwrixs7vLe2TibzFpwFf
	 2Hd9pQD5eeJxI+LrH9OwEfXyNNo3iS8B8I9E1JAi7q+4qwh0CANKvzN66vQ3GzXdEZZ3K
	 cXwAFDKqjSKMZF6C7I15tKu0Sgf4j+tZMLQN+Oe6hm18QZFen2ndXOw/+4CpK+ip/6ndN
	 KQf+y5cv35ezo+KKP1XeWc9sFa5HtZgoQ0+mehQ0fVLKF8x2PQc7W+cX6CtxybQStmDjY
	 tEhovgwcmPhFAwOQqHmUKbTxjKYLs0qAqJBIxqa6E+erQBfBSt7udn29UZfy+cqkNmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EIt2bRhSZPFSHfhZtcUszz9cOaA+b8iay+aW0NepLFU=;
	b=jc4glPwHDNlbcEHvT2S32OEIOBaYwwC5sieXVHH/7My0bG3OA099eI/WQCMqVQJEE7Xu
	 n8KW9WUtDke656fyJeHQ2qXV5hkNhKDMbQM31K50iJoT+RPaLzSX8F30QkUjqPaQeTgir
	 dewdyFhBWDGqPhzG1oB52cbZufSWPUXbHT63Im4CCoRREhmDawuHtMfv2APWJyEAkkQJ4
	 bV+4Vdxyeb1J/x/wsB6wGamlBXPUZJhYdW7ym7zRmJ+Cm5DLofUIqi/pvaTqfcxrpoz1/
	 WlGHW9jMrM+hFeFyfxyzJSdSHnuFEwWteDBVcqa/FU9y+R/Xk4fm9aZ+OfLP1mPx6aQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779541;
	bh=EIt2bRhSZPFSHfhZtcUszz9cOaA+b8iay+aW0NepLFU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cA2GzclShY7wi6LgB7zYBqDTRq9NI4BlFDcTBxI5YypONyuox8Ao7DjkEbcefCgDd
	 1BfPvvRA/3rYZuY4cH2W1Kfzyfd5N+X7P1B3s0Bl8lIBFNBnB9SXKM7TJgiMH6PF05
	 wQq9RIvSSdKYSD4nbtmtu1/rR5wfdS2jBP97qXBpYMzvJTU4y2JX8/xIdVcJCTZoLM
	 G+oPQ20qKr1Q/RdnS957mA1rFR1oUUGM79Syuimvu2EYwA8RNSZiG4tJbu3T2159eH
	 uijl54F4yTO5/1bB7/58wcEX6SJoDqJoDbI613xvIyHPpSvvuB0x5eCi9RbNX5rzcF
	 e2gzH/lo919jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEDB981668;
	Fri, 23 Oct 2026 18:19:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBBA770E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C176F40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SySk5z7ogZ3 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D0B5340061
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779531;
 b=UcmJR2XjbiVMi+LUmpKdY+0tT1aJGQYwnBQsOVcIPp9Dj3ul69jeAng90sHg1NyAoR3+
 eDpciofvLQo1mbuKJ6+kJ9sMEs3IQstmzNygwqi3FDyJ5NIY/gHJEsyOqXRB96y8XeaSd
 9Dlq5YtQ8wABvhfvM6S1M0yHY+KLwnKbkMr943EGYpXg4shoeY+cLfDY5W4ZOMD3wTF5K
 df27rXDgtgD1huOM5MlkvBMQ1yA20QiTgala/rdAO8UmkqBr74dEcPFXEPtTB7RyKzZfj
 IeoufFoAkS//nL8fgyOa0259uWI3dXDUau4A0Gu8XSudNyQstDR6jKFXcsQEEmBLn8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779531;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+XC+GzVkK2L8qi3T3PKmhzaPVI0OaCGFSNRg075VBCE=;
 b=iBJAsfxEiCcC8LzB4lU8c9SAfM4eFwOd3LnckJX5AyIKrxrbXpipvDZXc5k9l2sKLm4+
 lx4jvLht7ASGOLtNt4qSfmalge0tVSPyZDgtxPcQojdh12nxvYoUVIRPS55en+WyaKQP+
 GkpVwqaBt2lftHq/UaejQLQ4knuz381U8xj6blbm4tYN8bY80GTTpLBfXh3fl6yW0dnQu
 HTE8iK18ZUTKmuAB3K3HpuTZmZO16LS935LrDfYnc7zNWvasksoAPyFEkb4RQXzmR8qac
 sAhtmRFgzbxskFPVA+sR3Cx6tYu8n0voUhmzC5rcXAU3Bh8TgOcqvTLEFKO4ltOjqLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="s541i/6Q"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s541i/6Q
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0B5340061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:50 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6d290b10a35so517985eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779529; x=1793384329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+XC+GzVkK2L8qi3T3PKmhzaPVI0OaCGFSNRg075VBCE=;
 b=s541i/6Qz3HhhyEscA6hp+M6geoaT+QNvJQoDnT4NXqStm6ThmNL6ZombXP2wAkz/4
 OnmceqsTfjNiRScKbEiQvqFULYYbiCdBzvjnlV4Xs8FYqiJ5bybk1wSSnJE9bcnagW6E
 XvW2SELX4SSd1ovsrCeuLD8HgSbDanaS9fjKG85fLNrGS+JxPovtCPMoYiHwbuXHGbo4
 csVDm3LwTeOjkk9ePY2CwG70d//QN2KfnWTeoCzb4FxFS90CmOWRcUiWsY2jzGepYyc3
 EsVMw4ngx095ovLXcstI09YKMTsZJ2vqPUbW9DW2fTqv06beBsrDB1Cy4qkytgaaHxiV
 GMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779529; x=1793384329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+XC+GzVkK2L8qi3T3PKmhzaPVI0OaCGFSNRg075VBCE=;
 b=k8pJ7QFQZbYdc14uUg6pWAR+rrPxcofRg04g8+cn72MHT7wKWcEK9FmoWTR+s5N8cl
 GRutI/KNOvRW5ySY28NQy0BRIzSd1+HKQllpgT1qD9rTTGNoMeQ/H6VIR+cZRmF3svHP
 0XlyUcidxh2OM0DHDkH5k1BlhqNuDZahX2yWd9jjrYwP2O05Tt5bsaY7i51Nk/XgPY8H
 s6c0iVEhAMHPLK00W4wV6yX9bPt7w4xGL+nz4E5u7l1Ii7LcQ3amBehk/CYl+Oiy8i/H
 NQ1hG/gdj/PtkiQP36fje3ZcXzLWyixyOYRYeOX8lSRXWqiGgHE1Z8oZJAKuc3a4+hTk
 prXQ==
X-Gm-Message-State: AFq9FYLZWVoW+Rku+iliKuyAg6nCbO2DlO6hycxI5/F6HoFpYdOwxwlV
 1woPsuvyX8b90SY2qsAWTHJD7UPSa/dDQNXKQdCr8AtwbYnGN9b/TvcOjdLaFLXR
X-Gm-Gg: AYBFou0X60HMq2439c19sloWiFJBmPhhccWZlV/eEklPct2oIrlwRsDwQ+mPBUNF8ro
 m1o4YRVQrbBzRVgWMczuJ5+NazAJ+rbOZwbPndPLt2IMllGnstyyhBalKv2nCGbTmguMvN3zQoa
 57SNfdMPYC9ZuweQaIpGbAsxG0h++jOxSvkIvD2B6GOwVxiVnBcP5PbBNe/Hw/bY/thob8txwDR
 dcYmp1beKNwguuSOIgkttdnZ9LwVFpUxckiw1uSc/JbbO5eY+5pojQbZvgjHcD52ZApCk/au+VF
 B1rfSzHcwZBlpfCibskwsuMKKeaombyhbCjSwwH5+ZAIRONKUpzwElIwiHHCqhxfWFFBHmzR9yw
 +VfoQUBmNx6mZAE1EDRR3gqSl73nXfmBf/o2K83HMzgB8DRXwsCkNo/RLas4k2Ew5HVNCIwYBOs
 JlpbK9o8/lfonNVixRRh9M6pZ4nwADXS6YSk5zEBb9bFvfNm6UtJ7vZgCBw82oyKd6FunwGln82
 q9zGPhaYnktpLODOD9oDIbNGHVc1GPBvyNc7vrIxl+op7A4iRzPz2BDj/RHmfOGeBeo8NEFW9yB
 RvIrpysr0FJ6HXBgGQ9k8lD9XiEjFN3u3+VhuMDNxRTvyfuFx86/WOixMgkNumJoRm41t3ycfxI
 2Xwfk2Q80ja2nXRVOggbdTshzvRpiWhPTIaJfF5PpOxw6JQOUSfsCy+yqOs7Ncc9hfpEeIbPxK5
 E7t5NK+nvdTRE8RNHZyKEk3Ck=
X-Received: by 2002:a05:6820:258d:b0:70a:6888:2281 with SMTP id
 006d021491bc7-70b88abb136mr1575254eaf.69.1792779529495; 
 Fri, 23 Oct 2026 11:18:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:36 -0600
Message-ID: <20261023181818.920329-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pyroute2: bump to version 0.9.7
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
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index a488951cde..8dc11452da 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  a8c34ff9de89e55d5d50e9959937e56f  pyroute2-0.9.6.tar.gz
-sha256  6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219ef1db2  pyroute2-0.9.6.tar.gz
+md5  6d2b1eedc7f400d4bb411cce82cc15d0  pyroute2-0.9.7.tar.gz
+sha256  a678b098478c46ec51d6bf9a03c3cd2ac0172dffa590e9e8c1eeab633d0c17c6  pyroute2-0.9.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index dabf7e923d..6a2748fbd4 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.9.6
+PYTHON_PYROUTE2_VERSION = 0.9.7
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9b/3c/cae3aa8a07522d4fd625958f690ab6eb4ffbd9c94e30e2995f585fded630
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/1b/2a/d295013eb67b5bb3a0ebff7c6ae3f635a8f55929b3f5367889ddadd7f4dd
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
