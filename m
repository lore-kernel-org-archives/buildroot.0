Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62DFCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE8F60E04;
	Sat,  3 Oct 2026 07:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYMOtz9D6LJH; Sat,  3 Oct 2026 07:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9355460DFA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012283;
	b=PU9e6fZq285SIqzaXPzvKnjP3Pj5MvWE3u/ZeKVT9y44jiFQgA41TT8+ALZ01zGGAqn+
	 TkfIdZGykzcu5xWsFoQG6/lW65HkZoxFy27LOm1AcF4K5i08+N3GnLcUteDDofU8aD0vf
	 HtThvGsL0xTsiUYGx2cMc5DvozgdWhLYszqq/Bf0O4nKHUYwrENqiNHadtu85tzAoA7kW
	 K7tvuLgA3yq7HNAbwujCBYmOo+7FXxynEaMka8ZsRUE1oDSTBBO/teTsqUZUNfYxF5r17
	 vB5pLnYGvun/P/Sok0evL15s4cOQhO2elaa+hHT8HN//8VekaA2Sax6rC/Cj96SyWMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0Ka32jlqY5l7MgogbZF6NNPWcT9nSkdwcr/oknFdr1c=;
	b=cBwW6pre7na+gG+CmK6bX9bT/4Q2yRisncuE/XeCrFmi8s1Hw/TaNOsbGqga7I1BrERN
	 4etJ6Qdoq1SXhGiLiRu5bLO1/qCWWvzv585yuMacGzd+FY4qnNRT7p+GTJN7xq1hRV/2i
	 /uA84gwbRCa2/kSRvT73U5ZDQVi5Nz1ZSuYLltveE2H7TYKiJfC4eAn9T+hOQAyke6ajf
	 yUipPVahBgcQEtjxfXm0egQlcNunANwQZAHeUPxcWM3XMxNQrbwMyt98609gPWk9A/MXa
	 L1AKahLj+eV5cPzC6R4LZJ8CCkVrDbSyxObm5iNhPvUW9Le23/ZKmeC0Y7mztCiYUvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012283;
	bh=0Ka32jlqY5l7MgogbZF6NNPWcT9nSkdwcr/oknFdr1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=igRq7N5hypzSNPOM1M9ifrNLQqCww28Ua+ICJtuwnCaWCIQFlVxUeYvN47Da5t4uw
	 anA8uWO9yyZr6cX9mbexnFjDQG0gCJkB+IshEhe0tX3HDITXqjSv8exfAGE5emDRhA
	 p30cAo42RbK7l9LHbTWP+S/c3dc3KoTHb5aQ85xz7ZiOMaW3cRiXvvLorz199sqiWB
	 4DX7f+3Xbn1ydDxXIQhlIlzcgcURuoBw9spzuG+PV3bKcMKaloP8QWuNEC2v4R9vES
	 DGgJVKqb2Zg7O4LZbEO4BfGwxSsv2l9WxuO6+aBc+wwDea+4asZtsy6RgFoZulXago
	 zzsKWIQvGiwng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9355460DFA;
	Sat,  3 Oct 2026 07:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B9934E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903A540064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR2aXotb26iM for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AE86540059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012281;
 b=aKDNTgj+xttVhr/+G9j0VKWmiX7CUF/1SqtMMYad/JmL1SNRoer9l/R3Jw3NSfJ02Z2G
 DKk9AbLgru9SmdWcLjti2r+Uw+mY1Vk7CI3f4yrTynb0h9s5tE79fnV0D7gj1Crh7rpIe
 XFF8M+VBVmqgK1vn9lT8wynU6fhsbA2tRyqASBrjzVxyP1Y2ykhrWn7goJwQ57tLK4L6h
 OwScVqmoKRT4fBYw4OWnyp2GRztI8M9UfMds1s0dL2lne3i0Cln8wsZiq1rD5YQpwy1mE
 hzwVJCRj8LSDwyonRD20BLMzOY8ZDb10SCv2iIG0O8Ydk24d2ZJQCN2C/JbKJbQYdLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012281;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uq4WDIefBq06/qh1Wc25EDCJiZ24rKn2U0p00mvntC8=;
 b=FQHyn+S/YPl2qTPM9sDyc38KHQaKZZohgIMlZsOlRvUuY6mTH9Z7XRftyqGXcWoMos2o
 oTk5yBni29vbIWXaO1YEMOHJLdOCAN8NV7nNzBxtCi6/6aL22xhPcUWlcYxvNvD/uyJMF
 4ydKtVEIXDQyZUvfBmjyaJ8JcoteDR6WrXbAZjwtWt+g9gEnrh/Um88HtAWDt7pVEuLc3
 K6CpETYgjfHGFXmb+IQnqyVx43CoJhz0ur7Gzs9dF7lSsSqNCorlxviQSJsxh6dXTGnUX
 WjxuyR5ZS/OgY8jyFzw/4tXgR2ZkXlumeAJRmP2ZEZ2WYM4aluItU2J5+9O+TrSUK+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=H0Jpt4c2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=H0Jpt4c2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE86540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010943;
 bh=uq4WDIefBq06/qh1Wc25EDCJiZ24rKn2U0p00mvntC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=H0Jpt4c2Y2RTfjv6pIYcKBDukjAhLuz2VfQMuQR8xdRG/E+cksdNSmKNI78go9B4X
 //DjpGNKB7oJW19tE/+I/BLqe3WivUOawUunM/OM2WndMbXDwEsFfMZR0glCDBUphE
 g+Wwz2TR0B+RFr96jHyeAOVq4dFgbwhCisthUU4UfLiIUPy9+TNp/ZywjMrbV0NZ1Q
 A8vMqA/c3hO6lFR56GIazaw1ssKljunXiSNS6AsJUfeeyIgVhXfJU1kObdZ1p/C+Iy
 d2SxRc01U4IgLZi8m7xCknk77r5gi1iUl3M6fOdCOGWDZANn+mxfAYmzp7a5apOHYo
 4ifqhZtfG/WHA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 GBZB8PrFRbs4vedEiXO0MK3881GwASKXa8tiUXUrXg7YtNjlsnHL6OuzFjk8nqSvDTAwQcf+WbC
 FQDf/MXon6NdH0N74Vl4HLerq9rx/Utj1OBeRp3IhkqdQ0uv/3JvYhokB/56Gq94I/Euh06NO0H
 wvAJVsYKcTsnMm09u5HXeRXDCtjohyCOmwzxCYp7Dy5QplhjyAMVWmN1zQ0M9k+tQnAv8mrSFFK
 gJ8azcEGdMOBkd0+YI6QiCyFSoYpGKNrutP3fNphD/gKWjZZZNcfwTWOGbxbWGr3Tg/zOazoSzU
 zTsFTVzcNKG5GIr8/7JDtNwSj+sPKKxA3HusZ6FXQCgf1Snl7pdMNMeAxXWUQ3CeSRCi/4OTKdw
 wGxjkSzlGb9cWoMwuSPMBblxiThjQIFzgg+2iA+PjdmUF2Pcr+pqNzfH5T4WP9GcqKAqR4WzEVN
 NfKGQSnROkhX4gR/xsjxjq98xVwjPxZ2Fz4h02IXWRB+y+zlFxEe7VtwBKIlDoN74wh2eH6+XvG
 5vRhszZ+BbJu0NsTh0+wH1XF++qG9wpzFPapooS8lzZYa7Wb0JwSbflUIyYuf5oCtURP9x1i7Xp
 tiQ7RnDmprRp04QWSIXYRkIvhh8M8quSG9nWpsu8WtPQTcnFnIJ0JdIvnwRhBal4
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C4FEA4C5524;
 Sat,  3 Oct 2026 09:02:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-492K;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:22 +0200
Message-ID: <20261003070128.1295458-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 050/114] package/python-paramiko: bump version
 to 5.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 64e49fd90f..3815f5888e 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  86c64e731c55db62c0be2ddcb97e6be5  paramiko-4.0.0.tar.gz
-sha256  6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f  paramiko-4.0.0.tar.gz
+md5  5767a11ec78dc1da7cb9e99559aa0ab6  paramiko-5.0.0.tar.gz
+sha256  36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79  paramiko-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6ad0fa0d1b..6f313ecf3a 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 4.0.0
+PYTHON_PARAMIKO_VERSION = 5.0.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/62/93/dcc25d52f49022ae6175d15e6bd751f1acc99b98bc61fc55e5155a7be2e7
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
