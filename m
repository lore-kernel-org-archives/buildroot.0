Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56103CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20CAA605D9;
	Sat,  3 Oct 2026 07:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSQE3Qq8641Y; Sat,  3 Oct 2026 07:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3EDEA60DEE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012235;
	b=QHF09HYnB06Q8FOVGfMHPfk5Xe0gCzNxZNePXVQCTeT2LVJpoVOAMGT/GFxbUKAcZKk1
	 pecce1bJBs5RVBR92SpYnrywHuUttZYM3gNIilpWgkf7gc/+tKVK9ilbhidh9w4ZYsrws
	 MKd2DNnd4fjOdoypTUuSqM7s5O0pNAk5G773CTEI49LNdghV+hKAuukM7PFfsLPG3tdAc
	 pz9eBCBcKiz23rn0hQ62gCqD3R9m8Dsnp3KFsC/ZMYG6XmR+4dzmijXUAQMVrUr4LiLYd
	 xu5aZl54QtXFcFVhQ1xgMy8HVLIP0ornZYhAcy2Gv3MkqZpZ20c0oR+OBcLnza7GfFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FP72DusrI5Hy0pPXbVBfcyatYEXQwhW8GgCjyvytZBg=;
	b=bW0EMzK/vv6XqXN8m7V0lffUOWNNHA9yPRI+p30Jux5CaiZojGYmAE1K/1rk+95p291A
	 YaOwX0POkULd1ZlItNBeDipeb64PpNFBoKq3lCw6Vrts2Kh1j8a340DL0Rg3nYi6qtcpB
	 eOd40WcRQhawT2JXV55htP9CsnqEs/ZFS6qHADfK1ppFpfQYSEqGpZYZPhYOqfBlrKhV9
	 YLB7/hDFgEEW59Q7jE2JFatiKnYgdDReYVjDWQiEuaHQ19YJc+LMOL8hCBcVmkIu0phOy
	 2r6R/4Ojo38QpxokNJCSrdeDaSchC8zwpq2daCrES6Gl3VIa5OT50hAGmDaoE64kQYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012235;
	bh=FP72DusrI5Hy0pPXbVBfcyatYEXQwhW8GgCjyvytZBg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c7KWVQCSsQu5+5A2//9Wu7pJVi0/u6ttt49qt8dTjt/nFcb1TYAxOqh8sijxfqwqU
	 p5QfDUsnGFwAAD5QQWzeyH9kLeFPrg+2PdnXe/u2zbk+9dAUK2A6QIlNkUPfXi8nnL
	 aKzq9Mds2189Ic+ILWaZZhHASyYa5ySbvaWAQsY6bbhVb+kPT3wjgkEDnur0t02A74
	 KQEk2ObeRNabfSaoQ3YharqXcAr4XIbi1n8QnotKl/cbI1Hm6g88r0hHezjC305uIe
	 LO+22WuZgjjLhw2Lwyqmm4ilD/6nWs2rkaGy8bqLXLcVe8qKjnB9j8T9HCyG4BuZJu
	 d+0d4092Yslog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDEA60DEE;
	Sat,  3 Oct 2026 07:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C08634E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D2D34118A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOPYmeiWhDdd for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:23:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 348DC41188
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012233;
 b=Txod83dOPsez9X6qfRi5b4zftygWxX88l/rlnoDrTyH0SreZ8dnjJ475+bdhL7vJU/Rf
 BDysKUgzTBo6mShKrC9k80uQkZFPBQo4dOIl9MnrjlabyAXGrzrjrwVPnV1Q6O0x4zkj0
 KhXDANh73FTdhZ7kXBWwXpsKt8+qLBOXCvxlje8mTarJ14AWQtCcZh2ZrpFT1gFFae4t1
 NZI6P/wY7iJys7HsPC/71cBkWNY1Mi5mL4TiCS0mqU1gu56icUl/w6est85rZnzl8dJvw
 Boaad2gyVAJwC1Op2ee8K8CiuLZawyReuSa8wTlCZDn8bVBz3xGVVsHhq1iNVX4a8qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012233;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ma1aOdUiE/nzXiYVM6XqUxJrQvJT76CdsxCxIaDaFjU=;
 b=HcRsiqruRh8B2QzKhWMKtt3sRRodKDX9PlHE+qxusyP6V5nFf4JmfYssKz0jE7/G2Ycs
 s+kaFM2ADhGXG/vlfBrWgqn9/SYG7pjZvHHM5Eu0gF8m1YW2kINPfNOHR0Qd3M5PvHjLS
 JGVaKDRtgT5IrzO75CdnEf+q6uU2Xpcr97IBrRlNsZE7oetJkAprQiN2V2L9kVCtPF2cy
 KMQeJOqkxMyG93bqEaDVo+l9ZQngux62l8vSl4V2MaLPL2LSdYa0Qunqt3VkqN1rYciFS
 2LMNleh1aRq1dLzQn4IbMAI+4v6rsFISTkIat4mae41i/JvT0y7JqoKpOXr59UfnwBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cHqVjvI4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cHqVjvI4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 348DC41188
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=ma1aOdUiE/nzXiYVM6XqUxJrQvJT76CdsxCxIaDaFjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cHqVjvI4OLX+DmsWlpKp4urkdxziiJHsnT8EX1L278ec/5eXWFi+51cfUWDYuczQb
 tBObur0yHHAV0eiw7WYHKPpEMsE/8gV5FksVIrwE5qCMSpldMS1uNyezuQcnbdx/lO
 ZuguN1LgeTUAGB+fa8+6KyZvbB++qmqFwZf9HW0tmhOfA/Jn/KgI7L4jw1PP8rcJCh
 HxRtuVl5eGr/8Yp2n+OSpRLzP9gbgEoDL6do7e0vWimMaKxvpCq/H3PHtzXw1GADqH
 Z9XMsnLIoR+ePIGYNVscMQ7ljDXfRIII31GzV7ZbLs6QH1oX1dbLjNsnHff1Ag4ozj
 m9quE6DdLW7xQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 2l7QGg/rDtasRkfy3B9tA6RSEhNKVAwRELwKT+RSALpgkbU9k0b06qLqJ5sV6k4GuY/M9uNJ7Jt
 aROVr7Hpa4SvURwNWkEen/b49g8RSX6ihsmOf8B7I7kKJi+w7kO/gcJ/5sM3RGHI2mitwBYQ7Vi
 qtC+yU2WUf1hfUEIDK1j2KwemuPELwlrCPH44xfPBAGyJufwTmSbQhyssiKPnb9ZsbI7yv6Awzt
 oPkhZaP3WP3j9XHpCNAOFfD9zH/7fzsfWc87R5KG3jfbVAaAx/7HeRCggrywVww7DfQy1L6y79T
 xpXouE+IG5DzMopi0ZFVYFDX6+BSbm6gLSGmJ8/f8GEWoo9Dc6JiWLj2efQ7UlHum2OoyhWjsJr
 KiOLY0fK4Cp0fsZOaT09bPR8pqFBH+GcVDnUdETiWSQ2Yj3QTDLXN8IVCQKvbab5w9G5kfHKw5Q
 0ihPRZnV/A+b/wrAVOaL7b++9DcIRJEoP14kyHQRbobVoy2xvdFMckXwXEoc8cUXUfr1IGB8h/7
 1kZtfd+/UmjbADUC+NeRsFh4fudCSyyWqjC1P92+xA3q6hnEhpwVBK1Jq5J2C7erc5HVokg2/vq
 C6ozNi0j8mLfLkNNcK9OmbGCIwIBC05BLNkn/2eqo1KXbnIe5wMhta3w4rWTWglL
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83DBEA4C5521;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-2qHt;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:18 +0200
Message-ID: <20261003070128.1295458-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 046/114] package/python-mistune: bump version to
 3.3.4
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
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index b5478a6d57..1dc3277c31 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  26272a8d5ee997f80b32a93e51a24b54  mistune-3.2.0.tar.gz
-sha256  708487c8a8cdd99c9d90eb3ed4c3ed961246ff78ac82f03418f5183ab70e398a  mistune-3.2.0.tar.gz
+md5  d04c3e2670b837ddc418f3a70d4357d3  mistune-3.3.4.tar.gz
+sha256  58b5c96d6fcb61190dfe5fae498d2b2065f99cf61e9649418fd54cf1ada86dfe  mistune-3.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index b67700b1a7..30868d8e47 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.2.0
+PYTHON_MISTUNE_VERSION = 3.3.4
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/9d/55/d01f0c4b45ade6536c51170b9043db8b2ec6ddf4a35c7ea3f5f559ac935b
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/7b/92/328a294a6de83bacb95bed01f04e0eaff4e3616ee359fc821a5dfc539b02
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
