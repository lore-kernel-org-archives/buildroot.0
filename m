Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7158FCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC9240C03;
	Sat,  3 Oct 2026 07:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6km0gQ3MFzFy; Sat,  3 Oct 2026 07:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E96E40BDB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011009;
	b=gCrrSFw1yQHp7kKDjgwmtOds9tGDOl9w1oA5Re42HPfi+JQ+7RNh2xz47CuVyvVvdwgt
	 UZrcrD85VxRez44U++OmeWWKTpgrAAGmyfxAvOjxnD0EQn/53M6UMb0UO5eCVQF+itvgL
	 ineEaU5EY8C6Ysryc0Ls0O1zd4e4x/HEtRPjrmYjMEe+ZA/zwEAe+cYoSMqJg8kd9uMpu
	 AlgOxPibjzYIKeMeXFsqk7qU8AMPhshFjqC7sB7oGme+3+YyQ/cEXmkCeZGanXiSk7qDV
	 MWgQhjLbIYcZ6Sd9O9wVXS4CCCFYTGiXPENaZkUQ/m1/80VqVC8sSz0NBnLxJN71amw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TJd1LxaIq64mJoQ5SFICUIsVebj4QtSc3hbceqX/RtQ=;
	b=bx7cCSLeba4LTyhMzzksnM/QAZZB8CaygR7yk4ZusVin6gzI9hgRC1eMooCpuVPAujAk
	 g4snDq7narTxmyuADpxfwCpFVevLcaUzJ2Wq06d3ryqH9Yiw50oYaS7CWY0WtcdL/NHqo
	 VYhDkyqOWU+dMzW6CQwgMGqwML1aTuei53ZoJAXazYEkKue2YtCwpY8bgJlwyzPbPhXq4
	 tWC7wjrotwym/zIrwsDToqaa9XI5V4WZchxX18rvvJH7VMx9GGAuJQVLJUSjmq/WbfOQz
	 g8ApEJEdj1/5BJNeZ7X+2TTBf516QPne4bZRprSfbUjoTo688zEnaQuRtx/gpb2eVQg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011009;
	bh=TJd1LxaIq64mJoQ5SFICUIsVebj4QtSc3hbceqX/RtQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZJjTuDmns547NL3aSTIRNtKjkKmAnPME47PXycam3j3gxSCuayZ2v3Zrpbi18SZDt
	 C4i7hj28E1iqDsvxIZJri/bfZGs+wExanM6gxjrNNAbYtRhcg7Z2PShmKOfObz4BWA
	 I42OS9hcg/X4WQeE+WSgA6Tkp9UAxRsAqLCxscofb4ZK7aHi4cQx5BhDJa9wXtdtZw
	 0CTGX1i6IfV2W91FsKnOItp7zt3anJo82ZdYVujd0OuH9z0stQ0pV18GAuvx4fHM8f
	 HOLDAkRBboYsWBMJYk9JTSEKifshoIgnYwLKDm+0hAXGLvAjz6nvWvsgWcp4fm4Zj2
	 664LP9A+o9QWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E96E40BDB;
	Sat,  3 Oct 2026 07:03:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E46A0263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D657940064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak62E3eljfqj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:03:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E368B40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011007;
 b=H3/fyEwXmeOxNoNMlbxhVt3odlKai3e65rRFEhLuy00BXKAgE5N7Bm+2wUxTuRX74tkG
 MoxAtl8PN6jP14N6yg6lsMnvPwNM8Xi4qmn7iZuNPgRSI02GsQkVcAZL4Z5/M+6ltJl02
 VPFxM6Zr/c7bEqrTl/JjDw4v5vYCLgjeWQmQgzY4ydwSyopPTa+4rM40sTvbs6RNNURBd
 0OjoomXWekRWPQafEjQktdtq+1DxXzHH3CiIn+i0JiudVfqFrbeUtHG62GULSu9rsmWOs
 fK5Jcn4wofzUPSriZ1cbeGzdYeAJlUfqs/UJm5GYx/3US5mRluE29mWHTPwgRKB3F0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011007;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3i9m/lrufbu/8265rwgqmFL/G6QPhNGfT+eFCJKyB9A=;
 b=Ku8zBS4+BJO7s3dK9RwIss42ywgKiw4H7pAcjWFVBUmuqIFtXJjex205FzyLVTQ/uRQV
 NHHeWHPO5DetefaiVIt/w23p8kBVpmbYMRXZo1MOJUmr0EXBXOTALm6PTzYptuFKld6MW
 fIZw6aqFUgYrpk9ZKOgiNYJsMKBuzjvPNqZHy8Qkalsvgmn/1gqT94N2XBMxay+CNpM3z
 5RC9UZhT5R/9RYbhnZJV84c6s155zmULHvd1y4gL2g6YRS10VU6ER8b21ew6V7rz2+YMZ
 uRjFl3vxujIU6lbB8arWo/Zbu2UI1aUxE2QCoDr/H7Z5DQXGY0lzDNMoZYuqzan86ig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qj9O4YVp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qj9O4YVp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E368B40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010922;
 bh=3i9m/lrufbu/8265rwgqmFL/G6QPhNGfT+eFCJKyB9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qj9O4YVph03ebVS/oibSi7v7ICasADvuEmFBKovosNET1njlA1iQJro5wpNK+QoPG
 2lFIqE1wYkY50+DPKBkiJX8aYUm5RV1jlgpLSYO4YOIUAnxbkzXOlOZgDkiLFjfzI4
 Cc6u/FWL5xcRx1/8lEI0yifUi3Qqv9sgduqGEwJed032SYcmooxuQDkR2ihR3pX3Zn
 vQi3gUnCCMvCa7jw0G1HwLiXtbKIe3m68pTdRbVN3Kf2JOybl29mVqG3dj5pupDbeQ
 eL7tLnw1d8RvVBarr6+MsYmxO50I0It+5lUbHppbmlgOCvjg2ws7HNp+XdKleMzvRG
 pmWnolDFljUyw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 hAQophvPJ7Hx+bgTK+1UM+kujeZIHXz3CWV1qrN9atC9hiAOM2OWGaFqfYPrH/iOeVlN1j/mgom
 cUhgjGYpEhR/Qfakpkrrb00c22vICI4IUa3Y0YGNPMSrMAjnuqF1nFx54MikPvKVFgf3kI7jnbb
 Nko0x4MV7auaiPFo6lodFjc4wfSy3qEbX4JMTY1e6jiqtDEiyYebfDvI79tJ3YbtZTBfNu5Wqkt
 V2YZAPfitY0M/qJ6ZNHkQhaOsY+Mr+LLO/Hycrw5c6LdW67FJM/Q3+/zs0aTtfP0uZl9Wz8TFBj
 ponznT25d2YArPfGQ+JYnu3f0lX7/g31kltlAKSOxSKSlT9PeUU9J1s0HzmPw4Jk2kbP2C0C+3N
 ayXsE7F58S87FPL6qfWMdeXKAgCvPPk3FlWZ1I+EaP99KDBxYvxKo9nMKMUFcEQQtdGU7mumbfd
 3LpRMhclBHYELJGDfzdiUdchQLfUq6crdErDLfz0NbefUiornlxIZn/NnPG6YwokDt8B1ByRi8J
 tYhi5Lf5v2Or2ZDiQ+4N0TLBwhLr/dKTBR8msB7qCwNIYiOYFnfpF2KD2TOebDk1P92zVeMNrlE
 s7sUR/kFi8i0kZh3BQQreQJ59rxGVNoWpx0c1nRfgArefy/vY8BXTmd/NCUWdg1jeat1141Wcn8
 aGkZvdzI85jp2MpFVAkt4
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7220DA4C5410;
 Sat,  3 Oct 2026 09:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-1tWd;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:20 +0200
Message-ID: <20261003070128.1295458-108-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 108/114] package/python-wtforms: bump version to
 3.2.2
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
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index ba68361055..04774b2ce3 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  58a16ec4a96043b429c196bfafa5fd96  wtforms-3.2.1.tar.gz
-sha256  df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682  wtforms-3.2.1.tar.gz
+md5  94cfcc701458d2bfe1449bbfc7872be3  wtforms-3.2.2.tar.gz
+sha256  7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93  wtforms-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 69e051f150..76bd047ae6 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.2.1
+PYTHON_WTFORMS_VERSION = 3.2.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/01/e4/633d080897e769ed5712dcfad626e55dbd6cf45db0ff4d9884315c6a82da
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/e9/91/ed9b517da898e3fb747566aa3c12a734bd64ea7449a0d25ec74ce8f8b8eb
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
