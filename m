Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED0BCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D6E640E81;
	Sat,  3 Oct 2026 07:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmzD_XN-0_Pa; Sat,  3 Oct 2026 07:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5678D40F46
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011716;
	b=OMwuurNo13RiovHK0TxDarPs5mKXrYDJ4Pq3s99hir1gNJvCHl2hZySNCDasfQ0AT+QZ
	 USz2oNTEmarpYhfYdw85NoueeRRRV7hrgEjJQVPjTTsR+3qRM/KiuZS+6RfTAWi15iJTs
	 WB9ZIciLnFEID68vk9if+ucdsOxwcFpwzcZsI134id1D3gbtFCXyirSHnQchnKVI1nR39
	 IkGhl0auL4D1Ga9U1VhkuHpgA2amJ1LCpwgnxNlfd06V/Af7WHTWfVjPJ2Bqnv4Nf1a4Y
	 sGkAPECtzH1PGl/oipx4ydV/gHFuNox67P9AvMpNC89BMNmDOS5KnVXgDridaJNQrJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w4US8VZgudKVxMwg5aMcNXam5E6eqtndn7FK8Lx6RaE=;
	b=CrCDJJ0pC6aMZP1A7N271ipqHFPrp6PBxJe9ZFX11DLr58HyCb8+TO7S6RMwCQ2zdS/O
	 MsfkgHLDSSFHuQiMQP/uUmvk5UMlSMm7mCYozOK5kqZIZFDEP3nkR9cJCaQEjwhxl089P
	 QmrVuuxD7pH46AgqC4cw2Kzl3ZAxnfrdsyMkSGJYSImBS9UF/7VKPv68sPF7EkCnqG/Yl
	 KzUWCk4k+zvkzoN1BZjbUUPP5FL74s8Lh4vMV8fuW6t98qHvHs8/jJmounrOedGk/OsH4
	 qxpK3pOy0DxjtGZDMETNNM80ha08iFVPaaOWEMui0Fx/Ue9yylChpCfaztU7qdeCQEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011716;
	bh=w4US8VZgudKVxMwg5aMcNXam5E6eqtndn7FK8Lx6RaE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pzFAk9IT2CqCezDe6OrxuBRXmoxacBLQVUMbBErJLOxesOaDUvR5d5EsCJlMHMXpW
	 BLABZvSid87tQrnqSBUFiL1Oy+IL1Xy+pakz001JkNNhSpMI97YYPpsVYfwid33Ej2
	 dYq+rQzXDzmEZB0TFp+hHn1+eUERMK7Pd4VOvOxTns4yBwULu0j4swqOvSBKgBZNc6
	 99q0XsUSX3fHaEkdJ5raNCLNNGwDq0phqHy4wUuALgTBF8T7gHNKxrNd0ZcN9rj9oR
	 xP7AlWTrTBwM2lVk/ex3cRWPp+Dk7S9/htn+ZgRRGu22UFO01WES/58DtZK0KukMSI
	 LJcXCyK6Fqk/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5678D40F46;
	Sat,  3 Oct 2026 07:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D3434E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ACC460621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05F_Yhyi53qD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:15:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E9256064C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011713;
 b=hWu1lI12j4CaF80w7m5bi0Ee0GcgvpTLYuDRIwAs68xCFhcg/38nmMIU+ZR8PrPhRNJ0
 gnr8cMa0wry6885jFL9RmwGhZKkJRnNIu/Vjvwq6R4xiEAobgjI4dBHTEvXKuLf3Z8O1X
 s/+dM42dZdQucm6oH1JajsT4bv5iUBaqZ40X5U1EpYSXuVY0jIj3F3LpOEav4+buQy05n
 1t5vIyjcscEG3QbpbGnTQudPNm6i5eRsvDB+KR5zqp/vWNFmQS20vLiGZhlsjaBPvy3p+
 L0HxiDlFlObt2hmzVjYxBuVOI2RvZXk3WyPuezCdnhmq9L1hKqE+68dVNPFkOwocrSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011713;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=APDVi/XM18KkErTgIiOIxG2/gOMWcYuSf5Z2HR4F6cU=;
 b=hSSMBDM6P5ZMCNNBd1qQE0sTeCFWyUUnxD8xm6fdVUCe1fm7gMTt7Er/jy/d5CHaJpmN
 ulVuRkz21wHQo/gUKxvTCKoxoju2OPLF0R/ey2pwiZqRFO9Rcl7mouDlwix45Og+u8lsG
 TS+VlFQMIV6MHmsm+U7yTcn7WRhwfPjOhkOH/bSy0ffq3JQLzNxnmSNkTkkLm3UqRWSGt
 +B+L+u81J8kfBtJEL5qP55kKuPZ2uuOrsZICoJKs3oViRzEEYZCaXgQjBI0MON2FvAcLz
 +ybcDia29NhEQxrOJuEl2MzarJ2JM9xCJJTdWqeOSIghXqfoekBjOcRSEqgVOqxJDYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jqlcxhOq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jqlcxhOq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9256064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010934;
 bh=APDVi/XM18KkErTgIiOIxG2/gOMWcYuSf5Z2HR4F6cU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jqlcxhOqoFTaQiYaP+nqBfPbsqiu2bmZnuSVR2sLh+yFb6o7Fnu7r5dE1HbSwoHdv
 syMn01mzimoADmV9jjeryCGyZCrVApNvV3IRL5M4xBf+bMkR1jBZFnOQjjP0gHeaXF
 KVrDXWvffE6djMv/FM9EDFtTRoO3MkAfWfhXWpcuzkiXc0EOGYxuuU8HkEEVT2RU+7
 3AoWFnOWePDcOawcqfK7t6LkVaxsJTC0cPcHY5+J28XO2d8fnSFCsjD84iqpOmyV7C
 x3EcB5pjvnfnkT8je8ay7WvjrSXa/YkDTtWrt50BqMxZL/TIxxZ9gw5PT2m2vbg3aC
 XZ7sIowlUQzRw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 jpajjGVA8+kqEewqth0YpMLX/LEOIQTpfweZ9NnPC+X33vcRUSB6Pawskn8YY9gE3Xp4lsu3mjH
 vizbTskrT+6Sc/csvmgmkNT9tzk+fdYsUVpR7T+QVdpVR4rSpjU5DmsaF0W1YVNtF+4YVxm7spN
 IHbaJLD1ba+qqYSdYSCmWrgquWAUkzVXXovO2wlQsajSGwOoKo5Cdy9x5VPaMRqCXt65hwFFcoH
 9BfChQYG3TdRSrths70PD5Tv/h4iYc2m6lYVT0AOteVHQ7aX1XVD4psAp21b1DvZSttFD3MV6nL
 0PsgV93ShsULtlcWypZCPDbUXOiNdoGaoBGJZfJxr31iqXezpYmMTNh4ZvdRKrjJ72a2ZOt1qiX
 xBKEYsBviJv0o0eD5YJQmuOK+6KymxNje1O/K2UeQvfqDHgcfqWnNF+QPG7X54kdzZVrwn69zJR
 pYQS6cVXVmjFEw54Yk51LZuGP0J4sm62YYX0OteY/x7x2ChOVutR8uyGYngNKHA0+8se5IkjWVj
 wFwYGifR1xzE+iuNMJWiPra1zNAolqhsNRKTavDBh+PGFHgHUOfqgqpxa/ytCXvEtvGl+IrM/cn
 buJiI9zA2soSstEQpvm2vR03RtweFu2nrY6WGFRKN53B1RkTW9TfPoZMnyiC+/M=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B50FA4C53C4;
 Sat,  3 Oct 2026 09:02:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-1qgw;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:37 +0200
Message-ID: <20261003070128.1295458-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 005/114] package/python-autobahn: bump version
 to 26.7.1
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
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 34d585278f..64715ff622 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  3dbc5c77f853b68a4a8c8ffcbd4eb024  autobahn-25.12.2.tar.gz
-sha256  754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c  autobahn-25.12.2.tar.gz
+md5  d6e43b49c77a11d5b36ac8a2da415d0f  autobahn-26.7.1.tar.gz
+sha256  c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245  autobahn-26.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index f110276018..bb411033fe 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 25.12.2
+PYTHON_AUTOBAHN_VERSION = 26.7.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/d5/9adf0f5b9eb244e58e898e9f3db4b00c09835ef4b6c37d491886e0376b4f
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/de/73/f109f563c27e048e45d135d81af19e6ca391e24905550b06bd1c9d674c57
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
