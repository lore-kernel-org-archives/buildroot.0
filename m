Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F126ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA599812AC;
	Sat,  3 Oct 2026 08:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sG_8Ujcjli9K; Sat,  3 Oct 2026 08:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DDC52812CD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017158;
	b=gI1DYIdST6HjsiITaKQrBA96bh7bne6oB5j+4N1h6wHT4O2H6IerDi2ZXgKxAaVxAlHE
	 W0GV18fL3GDt+SQGhEBf+tVvGDago7hc9nfNnsqTUXxBQI5V0CnhCmhyBcsOXrZGuKBUG
	 XQ/2HbKWA0YH0AUOoemkm8o86IS6LZHqWgN2/p+ZJzc543U6QWXBGASM4+isSQQJTBnlB
	 bW7E1NJzASXnZ47YPtNrQuVhUqZsqXOxRZ6GVDeshArHvuw+xoMtViEb9pZ+5cP3L5dFy
	 jVJePeqOKqtZoEJJh+7YAW76DrBBqg9iPsRsbWxN5SYauUopsS6mtgdo5F0D9yV8F7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iDqwxdYk86KyCDRu/0e0K5FhQ1T8zQ27yeDt8kiZWVI=;
	b=sO7bYOTOkMqmFWw49knIvMLlgwdCknAUdBTYPfPox0eXDyaK48/k4E66pJS2UCOE4KN2
	 MEfOpCQHUj2l4JG/hRLV7+S0Byu6mj3RMtdq1fn2IM4mRjfbzaX34LpffxLkgr+ZbVaSU
	 a1GE4XY5VMU+hPgJLHW28UFgIsrn0QBgl1fqfCukp4IacF9frqcY5hXpuDj6fwIv4mf6F
	 t7asEkEalAYPBKFeDj4hU56dCUBwoZ39euAm5kiLbJ0frgMfSHe3sI5QIkKdzzAueg954
	 cA8vS4qEedlAwyHIbzwQ5IWJZjgfB4JTFIwMJrefF1TZ98YuvPoeTutahGlwOiBFR3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017158;
	bh=iDqwxdYk86KyCDRu/0e0K5FhQ1T8zQ27yeDt8kiZWVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VN1C53KZZwQNb6VlrySik8UwWrrRbno21wfS3MsasHKq+lOHAotPnpLgBcBU/MaH9
	 3RE6t1nRa9uFwZJ5u379VSJ4BSM1CxDEBPC4XxbAcSgoZuk11JcDoFYJ/k935sdXyH
	 /SB3kRrNmnJnA2mM/ORjmo5xy8nKnRO9YqGUFQ2vY3xnf3gls/Z/4TaVFmMidferOC
	 XywD/mKrlEFFTlu5CiBT7rk6rwed6H+J0AmOMlTS6r50FiDTfm/BlQ/3uk9Rn1uCVO
	 WW7YeNPhmrMukmED1+xhZoc74QJOJO3iDwhAFMsFANSSOq9poHnqpeaIPc5haL6gBS
	 LcD39fFNjSONg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC52812CD;
	Sat,  3 Oct 2026 08:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8262E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 950B34105D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3PUZK41ZcFj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C312E40FF5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017155;
 b=GPPnlogVPWd7oVTjIsX6424xMVZR1+hu+o4WIdDn/NHhsxNrLLTXeJqO2XmgsXtUPIFl
 uVWwMiOJuD6uyWgYZJnErOOfi+q0boQIxdu8RX2JGemBMqL466Cvx7cyxIiI1/DX5FhKj
 KviFDfIyhisDQnbOQAqM7NDWuJ+ynN+sUbW6I+qwO0j5Dz34RDiGJyqsIfL+jqCowZCC5
 Bw6xmJt9zsxEBwaAX7vA21hyY98ac6fayfj5NtHd/Y0Mthu8bCA/oagOfSYZoh9VxOaaz
 pXMZKTxxLQoMd/JqYLpJEed+Fk2xom8SM49X5Tqufb5vXsCROV9bbAy1CpcqcokLt3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017155;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3aae/SRAGzIAhR970QXYXGtDXwjepyudjPvjK1HAUAE=;
 b=a3cBRc+gznf4Lk72Z59OyDokOgo5Ki/hwTcPQgIgFs0m1u5Qt9NfRmbK/2V7qnZHCtR9
 iypRDcReT2B+1em0X8VHabRddpdyNdl8ArdhVzaYp8gynmel250CnPlu/wlzY+8YK6h6y
 Gfauke4pf++Jg6ZauVj3jiaaAvorGmXQlDtcA9LEaEX8FucwHbo+uYu/6ix59dPAulpUB
 GfiwnVV0QvVUsLuOQb1qbg0PdyntxWhdmstQX790rOqNQTU4xN4JtHUrXe4bU7fgVGTwx
 5OM7TET3XR8yD9pccU8lumQ180iqI/daZsefkebRhQfxnsZs1pMuq/2X28LfDfEuC/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=tMiYdfrZ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=tMiYdfrZ
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C312E40FF5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:54 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822ab75c8f7so455436a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017153; x=1791621953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3aae/SRAGzIAhR970QXYXGtDXwjepyudjPvjK1HAUAE=;
 b=tMiYdfrZJLC0dm1+En96cI+kPMvw3gogxaz4X9zkcXye00deHZPaJbI0PR9yogPSo5
 WWokRkIaGjxZXHDzz56EH+1LNVas5Wrfm1FrwBEehuS+2gH85V7OTNywXC2h6BIofGZB
 vnhF4i+0aUf6c/gsHBP4AawQi8l62x5+QvNan3K4ORMm7IHw5twqKnLLNNuYp4zBsqo7
 K38L8IfOIaW3L4u1xENWa6xHFOK55QI4H35JcEj6ktxuvu6qb2aD9J4KOos/ioJ1XNrX
 KjF1OsF7guQ/5+tW4dmeSDdUsrRbCyDD2tDv9lKhz0yeyR1CC72xn/0Qy0+GC/K14O0i
 tdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017153; x=1791621953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3aae/SRAGzIAhR970QXYXGtDXwjepyudjPvjK1HAUAE=;
 b=Kt0sbcpiJlQUS/zXF6frBvSrs7e+69H4zQLMEA22I80Ktg0+QHycLsdWsAAgFSVpvE
 ecPrFbWLgebszPVxZx8HwR7g1pVhknthr5pBoF7kbKPKEfs9CKLdjTLgoHwneTEBdVtx
 bmhmlRe3K7MfZQcljTxDNgADTCYrdIXsJ0mSZuaBBd38e2ngpXd6q+dM4y0PtSUlxu/X
 99q86a8KU6YEDaSg6eAkbM9E5lLhhUqysTukK6JkcKfsha6Di/eH7xzkK1MwLx3duoA6
 TEtoXKcKU20CDncwGsg+re2m3pGCq7nY7o2wfXE8/aN0qjaoXijUEyZ7zoB2rZ2xsEq+
 ha6w==
X-Gm-Message-State: AFuF++mfKWrBwrWAUiUzprKYySDq4dNG2zIEHZJO7lSpdioK2ThFXG8j
 /c2MMljt3pKBQLEQiCg7ojlgwgWDaF+uwu+vajTwlX+fvWO+jLwtbqMqsyLh4w==
X-Gm-Gg: AYBFou1t9ITh1uX0ng9l8h9Rfc4SEcZIzjgLDmUDwo/pGr/YBWoSNaH2+U/TtCeK0+H
 n2v7nAgk9DJdwYbFG6OcBp03uNTSADew6njabMSaLchwCMaJo8vZlWyjTm3TnJKJx7uj9JlLJWY
 cttxqk8imaIko92EJFtQX8zawuT2BWbFYnCjcHLVdXchY0UIZvzgsYO/InyfHCnANc9Qu1vDMqL
 IoJsP1l46+Rc3HFMmNRqhN5jeKDOWHTZBXLJFngsYEDRwMplDhZZFukUmHHc6cNRKyZlW7uVVQy
 UzqwPruQ7dF9VW+AxJzCdj2J3D7icp5wqmcZfH4IStELGR35KT62ufK3zD987r0MiipZqDxJEWy
 XeeX12s5SM2UTDwRXRV0q4hLJiXAy/MPYocVFhDNRf1Gqt+wryylT2fGHuURsCyooS360tL0Ijg
 JTOYYPi/kIADLYCVdwZACybXHW/5dq41tNqbKyTcyQCWpJ0FTMb2HTR8sTi2eXkCl+nF6QSVMk9
 AWEDQr8TV8aFXJBGt70TkbZo2yUg0acrhzoqDVfnB+E1Fif6672QhNo0dcZFnwujrKhBxqmK3Hy
 sssfjjm7Tbj5uGo5tSd0KwCMTV6OOqkBGRTlgvcPjYyTtEjJtQ0n9dSTCncXphVYp4TIO6bUTaV
 QhMyVbZGom/sNoX59lExRq0at3YRRqzJOk4bMVkEOOlc=
X-Received: by 2002:a05:6830:82bf:b0:7f4:bae7:b00d with SMTP id
 46e09a7af769-8227cd1ddfemr5584400a34.0.1791017153429; 
 Sat, 03 Oct 2026 01:45:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:15 -0600
Message-ID: <20261003084453.545653-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 6.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 58fa1b611f..0d5fff4145 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  a1104b826ed8414130553e4482bd714d  ujson-5.12.0.tar.gz
-sha256  14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4  ujson-5.12.0.tar.gz
+md5  0821265a819a657e8b9fc5147e4cb3b7  ujson-6.0.0.tar.gz
+sha256  80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae  ujson-6.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 3893a205c8..11059ef2eb 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.12.0
+PYTHON_UJSON_VERSION = 6.0.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/cb/3e/c35530c5ffc25b71c59ae0cd7b8f99df37313daa162ce1e2f7925f7c2877
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/64/7c/e1fa3fb70b53192436d751b5cb671f0ee960baa188b8351a7fec735223d3
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
