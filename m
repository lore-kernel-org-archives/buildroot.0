Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660E606A329
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dslbok00;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PtOxlDrA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C1860728;
	Mon, 19 Oct 2026 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GI85ZfYx3Yn; Mon, 19 Oct 2026 17:19:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 515CA60693
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430354;
	b=Wvgv8rQF71zZZ/NhjtlRrjkwRwGfU61+3pBILYidQcWktmyTkl4chfuIkzM2kAKUO1vl
	 OLATf8+3qnKfM2yVmFvEcs40rRjnYLwzPMB4RbuhACQWXrW8Gh1DlmqUSWiRaPRKrlbSN
	 38ViyJ3lJvOP8HIKgTXDic2CwvgbZCNrRtVhWkxxNuej6Lm06z6RG52+/+JN9Ac9S80qF
	 kOVhuf1gjSitOoV95uBHmMniURB/8EI0JRbY+83oaSdeR2K9LgJT/K3Dndv2wRM3IZ0As
	 XdOBpkh13Cgm+ESPgWkvUcdb70M4SDAaInFgjK3A8MpP1w0sPrlyV93xfzIzE7+tIBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zlWz9bQ2INsyKF0tjKmSbaDDndRlZtE/890AS7f9HNc=;
	b=q6DPj85LE7xN6reh7hJEUOdV07gmWoyybPFieZj2JiM7fAixjRQiGUinDBk9dNYwPzV9
	 URpCDiX3Oj+Kf/EJSJ6WMw/NEp8ZbpvMGouO+I/b9U+jH6/pweGQKXlTfiUK6+0HIjSJR
	 eu0ANHFDD3JTwaf9rqCZKhmlNE1r9aEDsyvlo5rbUFeotaCBCPinTA3N3SxQXiOsAZPbe
	 VGOntYHrCF+6cFBTugjLldkA37NSRnCb8OzVOJURbcCYtLIcHm7GShbaKphBkW/HszwU3
	 uzomG8C9tIdmv99IjaFf0HPFkAzOKsDIZBKLpol1f71KNZho0gQX7Q+W7LGXPwgzxoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430354;
	bh=zlWz9bQ2INsyKF0tjKmSbaDDndRlZtE/890AS7f9HNc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dslbok00fKEz8vIdUCseyAj8T+QRexEqZNUrD6sH10jBBYFPlippHQjGMX6dlt/zY
	 s4aitzNU6rAa3SuKKz0WLsv5QdCLVt/qFw+9DJ9CNkqoJI58tlIkV7kBiklJVDJOGx
	 LGoWNZ7F6uI1FvwsLdaM38kpPblMbqi8Qxz1up6z7uSoS9FqdIVAh9dZ/MCJRs4a4s
	 KKnYKNY1sOpFdHMlnrjmd5LYcJ1+bXWwLegfMB3CSsRo0qScWmcJh3KAPUyqRUSfrz
	 ewG9l9WR0t+ztL2e3Q0zBusUADptRtzUrTR4TRW9vv313po5l27HCUaGaYt+eSbuLf
	 rf2Z6cS3PRsvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 515CA60693;
	Mon, 19 Oct 2026 17:19:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 322A41AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E79840189
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0jo7dqLB_O4 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8A2594008C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430339;
 b=E1b2QyOjSa2CJxs8qOV0FzXPcT9tKJQJTjcCWGTPIp8noj3yNnmD4KNibJxYbiJmWMmD
 Jt0TdwSzr25ObRS9Ey9VsqJN0GqEcD0iuVYN5NKernm6xPWfEwGdiyZ1OxVZI3IegzZCh
 gX9tU02fWSlQDwSI8IPJBqUKGBJQHAdNHs0z5hef3cZtE5WlgLr0TdesDbnEQuuQALFoC
 JMg0mzh95SbXlUWr7upIiEQhzGA5yqI+yDehuGfsszYhAn+NPgBCxsEc7KOp8Wl5cN5Hn
 tI+L9g6T5AM0gHIMS2KJtXXNAgW/xqOiICDFuA5617QEor+tqaG+L06ViKhmTLXn6kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430339;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=dQHlGzeNWknyp0hS5EADioeoNoLdmV9EVh+Gu1vz8kg=;
 b=KjBZgY1Zr0G8GkEZ69Jjy6FA/h39Nmu/bvjLtU595ZIjDyLGcIM0EIgIlleocVkpoggv
 e+MKR9TqSwIGeopliYAGZWil60CwfSg6q0xdKrgvlsmZjX2NbtnwkaxCzGdLJNesUQBXb
 J1V3DXM68MjTOyIMYMv8i1yresXTvyFWOQeBsU3Su8l14NK9yl6mTwQdcvzRfMs9yZYut
 ROxF5jdiiXaqihe2pVh9gdZ2oiJ00u/XvElgc7Dz+HtAfPGVyGD/cZst/qa2TouFKAgpW
 HOIFHCXNjCzgVEVAKkD+HRwyM6kVlBxJ5ZWfwLkhxFLXPvnaF1GI0h46/TczQ/I3OCg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PtOxlDrA; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PtOxlDrA
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A2594008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:18:59 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-4f14642adb4so1025756b6e.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430338; x=1793035138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dQHlGzeNWknyp0hS5EADioeoNoLdmV9EVh+Gu1vz8kg=;
 b=PtOxlDrAeyQbbmNFDcJcfaE6Lmw2hEp584VdpRf4k7ZCEpTjS3L9MgVVb3UB6wWj88
 hs/hg5E0A/dAp7oXjES3iBRP/y6k7nYMK5WnYSw9OG2oVBiajzuazZKOM3FIJDFFYjfG
 tDrXSJB8cGLl0ngngo+qB2pLQ39vgs6d3g2hgfLiEEisj5QN895SRUtXcdFVJB9+MYwq
 VHEV6eteN3UGqmvAKoqSdfSR4KE1KWlBx/d+E50q4fdQqwSIp0KuSNJXyIDSn+aEE4PS
 linzNrDFatXSd/vkS3wwwAk9VeVsADgsHMjyQb5oFq5pfl64G95NYlQ5MoCKOMtMlWKV
 e6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430338; x=1793035138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dQHlGzeNWknyp0hS5EADioeoNoLdmV9EVh+Gu1vz8kg=;
 b=yqY/o5dHRp/GoZ0huxTr6HS7+UqFSyIC7SDbfcBjzviKylEUEfLXKXW8/9vUbEmeqQ
 QNyhSbNP7L1Lc91TOBs4o3AmrSojikyRV6OBEfhd/7pNvn4xdRyjLBLzSjPm1czUCJT6
 RyHYWtNSj8zGvAcHEJk/ikm+3+q/tBEaV5ewxlCRHZTmld1Gs5aHHFmBaAKv24mLYfGl
 R6HTqDkq1usJzK3OT/cn6E9CvFiACuVb6NBGtg3vVhpAeHB4nqkN5rjPHIVE9LvBeTPk
 AqX88rhuRGtAx4iPfc+sNsxzBqPUbBcjlx+DxpSIC9TTFO20RfgcsIE1TuCVDeMBE4yd
 aqhA==
X-Gm-Message-State: AFq9FYJNi9dys4L0GgAhvwaH2qqEPTohYqBs/I4ioRzX8Q8+mk2+Wmgy
 w2CrH9+GNvIqPQTC/MI225DRkI097qUdosyMznfRY7GkG6AnpQdiz29w+t3dEw==
X-Gm-Gg: AYBFou1c81c5YOXLCrOeQAWvv+hojFFeRJEfEqgeioKw4cY45Yr925SrkZwRgQlK8LZ
 G6KAdaohL0QX3ztAiMfHooUUMPefypsGq617OIqtaZUG8waxJsc57BT384ux0HCSxT8GtrcpuH3
 w3/MxJGxEf4JO7IVBrGStg/5sq/Op+pfUxAnjGsNhvwpfsUOjMY+VWodxxq4Xngcg1t/a9pzh3j
 q8OxiVSt8Q6bZKJpyvZ/8bRNWKKR09W36XGAsHd46xC8DeAqZeu0CZq2ANiVPJVl9JelwsXym1t
 8U4yHWz5CcoGjyxf9xaqaY9+hHT3CKsI1e7srGXVveJXiBza7OxKdzjeF8ugAcIEuiwXmKdmZch
 MG6CTS+8qT3oKzVqLxXijmrFUylN8GIkdtXlv0Ut9gzqaVDXfxvxwdE39CAm+xDreXy8mRFS6LP
 vuKgrdQFFBZKRjsqSJK+UoTDyZAiR8shYz8rqOBDW9O7HQIE7Hl2SNL8lswigD1YPD2AwPYVbsX
 jHpTmVPFdf9U9N2rHfA6Nui4faa4dJTX+V/u5CvofvFrMtggqc5VmbTPgitwH/CtcqHrjEIn67V
 TpT33cbYfwFUNB5UUs79MhXm/YtWYWUBbouYePUpZ+fh6M9ziwrXVygDC2aUW7OsHBEAFN1Dz88
 tqjmN08vJCnuf0eoM0PkAjFaB3C2/jIVApJ5VVk+A8g==
X-Received: by 2002:a05:6808:15a2:b0:4e9:eb70:b8a with SMTP id
 5614622812f47-53cd2a629dcmr6366145b6e.45.1792430338124; 
 Mon, 19 Oct 2026 10:18:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:18:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:42 -0600
Message-ID: <20261019171854.734871-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bitarray: bump to version 3.12.3
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
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 41d9c1389e..4a933c0225 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  29c4785c85eac1d397d49fb27c4b1cd2  bitarray-3.12.2.tar.gz
-sha256  940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b  bitarray-3.12.2.tar.gz
+md5  2664d3d633071ae31cacef0d09e9fcc7  bitarray-3.12.3.tar.gz
+sha256  919e35a951c0a551631b94bf568f3f5e38d004e0c60866cb2ca51bd8c4778fec  bitarray-3.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 40dd9cb2ca..ce811a10cb 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.12.2
+PYTHON_BITARRAY_VERSION = 3.12.3
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/21/46/2e429b78a594006417d8a5f8971e027f3e6a2657c288d7875cf9bde64295
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/a9/cc/aa09a20048dd650d9a36bd70c26b2688413066d65acc9f484f94b9929108
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
