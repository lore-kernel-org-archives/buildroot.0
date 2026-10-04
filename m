Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D81CA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D416073B;
	Sun,  4 Oct 2026 20:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqX0u1Dxb-Kc; Sun,  4 Oct 2026 20:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DAF0C6073E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145147;
	b=PejQ8MtUxQSkqRgs57rqmOqXQQXK5bqzs4bmD3jwm0wholGWmiVsfqv+rL3sduGJ37Ir
	 G2mIzeanq1pnTPtk5wBCK5iBrXjFwvDH1pnk4saPXTAIt2G3k9h8dfmxW9zNd1hrrU6qS
	 crVON0PG1dgI1bNvzeUlej4/1t1tv3zVuH6SEi+sGDT8qSnrMVv66mu1cIQZXS+nC4/5s
	 wPvA/w33wruM0jPQ96XCuaJmQ/fBHpAwvRsBQj9yZYyvKqB4M8FGD3dt7pQAvmk7vpH8L
	 05JFqM20TunfP12L3gMEnp9Q3jOLH1pmCkjB2+WA/0ctNjtsCtK3c9PXOlY323CpklQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oO860ReC5v8UmCFc5jITg9wcOkKxrlbvMzJbfqqQmZA=;
	b=Lm0cEQLJD1i4dxz7z+lf4BqCOdaDdB+9bhv2nePcuIJUzue3OytlUe/2NvQBVexCWOnY
	 R70p25RGwD9rakUh8g9ruDAdZFYoCvxwFxZxIgy6FfdoCMP/nGWVjOo4hVB3ySrwNnMYk
	 m3qpKvjExFIgBjSFYFIDRRODmMSHyr9UDg+J6zCy1jaD7hTdyCgbvs1HsfhbEKkH4oSxu
	 JZKt0MG4mrfYeGZPq27m8g9wWmde6SHdTw//t+nxlM/K1sQX2FSH+NYWjOtz2aAmkj7II
	 QXbrpi0aKuVScKG9E2BqNQ0CxoKvTBig5Esf2Q2668UhZneU6Fm/JaQ3OOXQmKfLMBw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145146;
	bh=oO860ReC5v8UmCFc5jITg9wcOkKxrlbvMzJbfqqQmZA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FnpVnYjd/ujcAgUbSRrtlS5DWCCgg+PaiKH/7dZh3uSW1CPlevYEzc1zxVfIXLs5x
	 On3uTEMgAbiCKeoLe/QvTSBVfXeAZ6RLCcr7H2JRL1Lu5KRe2nLlIInp8/KnuofhnE
	 nWvLsWUIVjapGC3ULvakkiVLtMtN3SWjKg31+kMD4o2EBNS7XChBGnQQAJusn0sFVQ
	 HobbyFW9ioExmgoTpe18eCDF40RaGsUDi3M3weT1KddsqL6ft4ZljaztetQi/gm/kd
	 AmW8iaV6ovuQCUcZwhHkTIo+2nMdRBgZXNgToAqoQGu4d7XhjquEvUpsCpPnkmRaDU
	 lH3JdmYPtuyRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF0C6073E;
	Sun,  4 Oct 2026 20:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD55732F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3F6406C9
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rk8t7SUDoL1 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C024F4055A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145144;
 b=PF2Dz5pczM2pcFv+Gayy+ZDbNevUsA+gMc0k3rcanbtcnTtqyUo0ncVBmtRoa1BtPv96
 lYEN6DAlJog3j+dB66xo2x87mluWNx87s1S7/DkBffWvp9tNNJsNds3uyVEDmxuJRR+OL
 7CEN5/yfWMEsovdKOFVcW2Qa8NxIaihEeR+52t91aQU0NKLJ3lsZeGIaR0KdvL9Qi9pmE
 tkQHtBY6Kog7g0/E/238DdrF9oFi2G8qeL1oJuwL08ppGJd36SFhU6Y2mD3Dd3weF5rCS
 Yeqb6+uC7K0GQRtlA6Mupo7zS6Odd9VYhaUb4El0Lif0P34CNcPkV5znEkCN/SFMh+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145144;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zF7CPBVBFJ2UW/EBIZE5z6jPDAaVq1UyBUrCyboSRy8=;
 b=HdA9m4Tts4/bMZobSH+0neBQEMcL+S8cUW11rQ+kfxooRbL6P9mjlyxeDQTETR+MHp/y
 fwmTlcvilfZwe0OFcD2ytEWDpeSECteXKtjrx6DgCsSSGKOLWjOyximh7DsLmH0s6dTpm
 SSVVN/fXggsIPp4rqKWKGuVIR9S3U7EU9yRzP0E7VTKqbdgQUUeirKHEH1X+dEb5QbfTb
 AIhO6CDp+iN/UbBpHFE8HYJyb+8k5XhzhwfWYliGd1pGf7OjhXKgbk7/hKouP7wg9T+23
 aZG3Uvn7ldHkVJDMwZNQPuMrFk4UyxK+6d9JBaN8MxObXPxORBpqVtV7vq9ltJO8i4w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YjWVN5CS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YjWVN5CS
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C024F4055A
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:03 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so1457424a34.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145142; x=1791749942; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zF7CPBVBFJ2UW/EBIZE5z6jPDAaVq1UyBUrCyboSRy8=;
 b=YjWVN5CSr5ySO/dOQFhMQAAsuLZkx5Cpvt3iFmkaSdKCQXgcs/Ev69nMv2Z5bLNLHL
 XvI+AxVnfGVAoPqm2z8qhw+H1aJrpAR4FXC0fd9dbtFdXOd15eH6xzs3IInipv4CAr5K
 27bqO2NyO4MrviZZYLRR1MZ6sG+5jhE/n08eOgsDrElwDXPUjlmjpk8761K+rid0Ujbk
 2QZiIlIdM4U8etQZMkVjPAzG5egRSrOab85HqOov04ZiGBaWHJfTJ69CQy5G5QswsuDF
 pIHi51gGLYWsTsPs4Web1nVygE7XUPvJ4ZLymL2+qGKqQCsW32btQd9/1QcyS+aVAtPf
 38rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145142; x=1791749942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zF7CPBVBFJ2UW/EBIZE5z6jPDAaVq1UyBUrCyboSRy8=;
 b=DuNVtS0FlurGvMuh5GIT4/UK5B7sxALsKCgm3Q4V15Nj99KetLEHZI3nI6vmHuim4e
 jeLNaAtEC/m/610kThqelqHeXt4S67uOimeyHGE9U/PCP49f9qHPBT92wj0QQTDEtsE+
 b+MIquPxjwx4S6+q9nizQCjXSSPiTr9CIawnJGnqqevhIhetmZs4Q4uks8lTfJ+fQE8w
 bPYxRaMBEz+HI+NGQ4NlHB6xqqQkxcnEtEpUV0fqbrztYrNqhGXELbYfNmu/n0vHsGpQ
 p30lA35pNM8cc4PxqOGNSLlAV3pZQf9EY6SO8qzkCOIUq0T3ol60DlvP2oWYS76zt/vN
 dfxQ==
X-Gm-Message-State: AFuF++kVEeHgRMMG0tJGQP1NZbfTWxmGkwrlWJ6wxfge8zwEQzdQGuSg
 EvYB4osevTXhIpAXGO4L179S6g1MVYNEiaT5VOjZtdpOKIkwr0pPifYINoFNHQ==
X-Gm-Gg: AYBFou0n2XmrhJAlV8hAeHLr9ExJOTf2rVkosafCHbyDO6ZrzUHs4G4OQ+gdSUN9bVU
 CJRtObwJFFeBvTGxWYlNuLKBa0sB1JU3A0Wq89sqZgyI+FXUX3bMv9k/A67PxhvtFcv8Pgssd+i
 8D7AiDBAEj6+FqhWQ+m0VLPCRgEyr1qaxQFupdoRB4TFlTRyEfYRNNFZXHtAaTojY6EpD4Ax5sk
 QMREVdtpvd+MQP2tC+BHtWAO91Yri5o7E/l+kOSVNTOTUsWomkzyVy/KZQffJm9F/ogkeT5pVos
 Up4yTP3iQrMegoWg79kxDIldxGnivCPz1H+5DkYOPzIerM+EYHGxnhIscMNtwy0GAMnrpJ652oB
 sWs5ada6uQ3+6eKU9rDS4er9+t08YLQGG+emLrOY5zX0p+QNu0Qr5gpNC31ntU4CM2nJYEALPej
 bTjaZQjc4zVSuBuqTcDQw9ULQWCHLfV0geOqEl152mKvd+hW0NG5O60eKTMXKp3EzoNne0D+Tkp
 6aBr12WU1A0be9cpKSCCC3RXmPKdyFtTNfHVMy9dEdlES1AzTxJl4Y2sIcV7EwPyAl8tBvvwaOg
 4SEwaXqM56EtuzRBVPmOSHjIiFqV3XMDgBxPNtaFHCz6C6tRCjkeiM2H90UyGLQJR5BryvXvVRW
 WTqYFkuHuw4+CrnQormxbVnh+LJ6n9u8mWeAyfWrHgUIU3G5APwoL4g==
X-Received: by 2002:a05:6830:6a97:b0:81b:65b1:504c with SMTP id
 46e09a7af769-82281c7fec1mr9153721a34.9.1791145142543; 
 Sun, 04 Oct 2026 13:19:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:19:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:46 -0600
Message-ID: <20261004201853.915471-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2026.5
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e39ce4cdc5..f26bbd767e 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  cdf22c8015c77214dc4bdfddff39a1b5  pytz-2026.4.tar.gz
-sha256  464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63  pytz-2026.4.tar.gz
+md5  f6fcc93492495d83d7bea567fdb1eab9  pytz-2026.5.tar.gz
+sha256  fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86  pytz-2026.5.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 85fe1d30ec..4513fb6b73 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.4
+PYTHON_PYTZ_VERSION = 2026.5
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/b0/ed/fa23d28713004418bbf2407127f80f385bfb0bf4e677bef02c25c27b00ee
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/14/21/d83d6ef28c4c912c4bb4d1dcf591f7b8c6bde87b9c66f9f454677314e16d
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
