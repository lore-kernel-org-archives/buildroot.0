Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E8CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E01474055A;
	Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmaJgND2iQ12; Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11E0640663
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145144;
	b=dqcvQrB5vTi43JGKtQv9Eao7RF5GIY+ILF7rvoPwn7ckWXNKnW9TKUG18jeRu2mr8Jgv
	 BYMYovq0wxf0sdWcQK5xH5jsfirK4cJQSlV8THjlANTCFlDJExsT1b9DdjBBU0DNE6VAm
	 IH4aOhiGqOEDJcakiY9X3iizaB4vID+6/65Ver0Rubez3lgyKsvaCYHrHBLkxendn8nT0
	 e0SECmFoOHhBNP73XIw7Mu4UgkkQELEu/P3JOQx2XYR1L+NSCjd8QtLLquPcKPxiVXQJy
	 C1u5f1t6c0Hzd34r/w0Q8wKOPcydP3Rd0c6gIzUud91iv6D1dhnhC6e69loMJFIeTCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FngyESga9c0sYtTXH5Sn2MMOGJNZ5L8G1PY0F35kuN4=;
	b=aM2vm84ewIsO9wOzib/iDFf/w2Su06PUqos5BCj+VQ9OZ3eyXo9bxsnBu9tz/eJmr/dA
	 w0ntb5Ihuhm/1KFA7+7hUjIqiTF0cjxG0PWc9TM6fHmtrQLJo7N2yf2MhD8qpRfOfOLVJ
	 sAbG+FdVHtEuqJ3g4Plxx0CzzdYqR/bnASZYYGWmWxIAXq2nmuU/+AtOBqYpJjmS+rBaO
	 oU8gdOAQqE1cYx1rXMJRSW7hSxO7+uk/zx4/IqGJVo3HmRpSH9JQAHQ6z1JD4JZ4yIE95
	 bDZWv+7LXI7LvPuvsqdSLG/tTPd5iO3/fQORFFlSaNczX326BU8wKK6aQCxME2ZYNvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145144;
	bh=FngyESga9c0sYtTXH5Sn2MMOGJNZ5L8G1PY0F35kuN4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jlcMCyp34FOL9J1Q0Jzca1X0762MeoG8GKUnyhLS7nHP4Qfio/sUkSemjGzRKkS+I
	 zNTekl6E5HtSPv3cmj+YgnzagRayZ4zQNk5wpDSspVAV6rmGrRKk1fBUwjY/Jx5za/
	 MZLXZ3NvSL0ji03EYF7tGR9nwZAfOVlkpGnh7h2a3OM+CNPiJ7w1QszTemyDIFRuD4
	 /cpqsx2l/nLQnO5eFy9BB1JzofeoZBNOTKebqPNMecWY2o4Yh/B93kZscNsqCak/8H
	 zxIvTCurOtfrRZxEbiQCWOJQVBQtE31+dqyTeGYeO+egE1yqyqDd775JVRgESjVtWh
	 gbsQyUCe06LQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E0640663;
	Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A32EF32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 831276072B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXDjLs7bxYJw for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3709C60702
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145141;
 b=tEqQtxY+tJ1wnkgBsqJuAoRFhQpsKAfdrVpt34YObECkQIwL318B2c6YQD79fVfZ9d4w
 2i5Xh218rETvixzG62JyyiMbntdlFKVaD/TTSoYkc/YsIohmovxaBNVm3eq/DJlp/Ocpx
 uAReo2MYHAlq0SdGpGU2MceO22VKrR5t0cuPcZPncuO6ZhZu/1CurmgRgPGUguOTY12mD
 eVt4F4BpBCwVoDYU0X5F7PQ6GnCXVGi5UBKlfz24hesy/sycaKRwC9Jq8A9GX15u3wWrW
 azIAYX9YMGi7zi4GwYWXaR2K//6eA2KU72AIWYobHSK49skC75J2gQvgt0d5ktdu6Zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145141;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EVMZw/PykWKCINGxXHeQQQjV3EFbFy9RlKm3XCspz8w=;
 b=GI8zxDyoJ3juNYLSaPyU0f2uVSEyUZ12hIhC630NHDwPKBiNoYRdcJJdXuZnNXyGJldp
 gNRjQLnd840A5ITVAvVe+M4h4XTBN3pPEnupBmVn858NX332Gubzspou+4smOdsal29na
 +B8CFcbkd5ixelELPDgd7s4vHqFLoNO5aM+il6vLoZ1sL3ThGnCbCA1ve3AYPDBmGxr2t
 fe3CRUyoaKn1bsaodoxRsKpoUBl7ZLh8w5KtohD4oNIQ45L3ma92qVo1T/pBltz00W3v/
 toV5JTNAEp2vWq5nZ3SWaCaE9dN/R37dvOGLMIm9Z3fvhb0Xi9UbvQz01WOt087TBOw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ILMJ4nA6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ILMJ4nA6
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3709C60702
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:59 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82480e2d376so364027a34.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145139; x=1791749939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EVMZw/PykWKCINGxXHeQQQjV3EFbFy9RlKm3XCspz8w=;
 b=ILMJ4nA6HL/OluxpNamDWA3N5rtfWrUvzk/2TefyGCYRsZnFaRbH1YjXY70Jax8Fk+
 UpbpKFyNXCOyM82kMUqCCvXp6S53hWu5+vpHVVsPkWeIfXXrxnbtA9ORa3wvoUDtB6Tc
 rFQuMwXNipOI7vGNRkPCXs9xxc6S7gBYUnIBISwvW348MdcuRIuUPOnWT9MbTQJC/Zp/
 FXtTS52WwxtCVfvXfeds2gv0sSDzHT41MZWRY4RmcEhCVaOVUQVuLQOa9yXayOs4NXBG
 0+Vk8fGJn63La4Ls06kPnNyWjmTFUvMpOeIPkHagslV0VGQu1n51Qh4WVB8Oj21+HD4S
 cAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145139; x=1791749939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EVMZw/PykWKCINGxXHeQQQjV3EFbFy9RlKm3XCspz8w=;
 b=Ntku1mcZZsibVz2pqCeInvd9H4+CrnWAfp6PMbWO8zZTniO2HYjHzRi5nb8wj0ILLT
 T1f1xbJTzWN4y/Klza2qyLeQKUBCjNK4Q042ouRCrz91i1IB5sCYjkaU9JJUa5ApOB2K
 VzmIFG3bjVJi6A/WE/jKN/xj/PQZ5Mfs0JgFKXmZpKmg8J2L6XI/Hm3QcxaOn8DEpyau
 ulH9EDU5beFpVN+ry5eUeVuQA/5L/599hIARf8JDdp5CgpTuzPi2tFmCfVEwLICHd132
 phjoJMpgf42nrfozSU2MP9fd3gL6ifSmnw/I3HY+tF4wzZovphqJ/BSaIAv4GKvx0qUj
 q3YQ==
X-Gm-Message-State: AFuF++mPdk9H9tsgcj/mhtJxC4KoqnNrjdXbq7CkjqlhpJqC2QVXQ7D+
 CeInsPLLOU61XxAeRXZX9wiorm5yjsbkiWMjGSkNc77p/GxrUoJOMpGwAXRxxQ==
X-Gm-Gg: AYBFou0j4Z/VFp92eJUO3j0lRVyjc51ykzTyZdmRSsh6hiNiSe7Owp+trN7FDa/vLr6
 bb5aHStTegaXE8Bc0LGG8ksz2BM+zSuINfKRXjVUokTkJsG/Sves17WLMLHrTV52Hd0JfwdObzD
 Tg/6w/VTSLZtlpNc9V9KMTw6zSFJgZAvbiI+lDqmiYtJw42CPHHYDUkdPo8OgRn2BD+g8rU3Auq
 4ohlvybzTAYq75ibcyEUkoZeZbFyvGoC/eWvH4MKQEW533VAeDJThQK4gvgf134+Q2ek2icNxEE
 G9QzmylsgA3HrDiAlLYY2qK31gCkOgpUT3KaKXigvPSqX/TfT3TOiW+cV+C2ygyTaOHnSYZaqNo
 4hToByk2YvHm1QKKp5CO4zWEY1kxyjTuj44kat/TeA69Y00a6g8l0ZtzdQJTcFeeOyuXwMftewj
 BxPO3Oo3RqjJo4vdlUyMTg1ed8Hwdh8FHcykDdpEByDTTZ2CJYUcjcQgZYpPK3Rxyve7/cJxQ7Y
 TbBKfTd9NzKK8d1d6avQqCNA03B5iqV0IN3YFJ5VaDjtSucb+PnEdaHRoYdYw2NP7WA+cGFMD3g
 5Yv79bEF4Ant2jR3mG8c50qQ55qMmerIsUSdUdu7KDJYXuIndkfE+glhIVYPgMgADvPXrIqJq14
 06CZ0R6v12Z5+V2kd2WM8ilJG7QjLoA+vh6eCIoFE8WRK3hcuk9qFqg==
X-Received: by 2002:a05:6830:6d49:b0:81b:9d18:75c with SMTP id
 46e09a7af769-82282c77f43mr8407840a34.20.1791145138902; 
 Sun, 04 Oct 2026 13:18:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:18:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:44 -0600
Message-ID: <20261004201853.915471-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.12.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index a237667ad8..7f7590a6c8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
-sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
+md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
+sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index d3463254f4..9610dccc64 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.2
+PYTHON_PLATFORMDIRS_VERSION = 4.12.3
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
