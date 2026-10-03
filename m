Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E3CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EBB410E4;
	Sat,  3 Oct 2026 07:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2RMEuUl4oyc; Sat,  3 Oct 2026 07:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4AD8B410E3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012038;
	b=O9cLk0dFNBUZournMENrcwYrC4vx6QA/KcLevRbK9I/nQ64NKo1X3n20SS7/pkjls9+k
	 zU2bjaVeebW2xGTiZz2l6OYevP8gAMK09qgPTF/p4qsEk2hD85xrL2fHT+bEkIq+7gMsb
	 +r+AvEq4OSgfSAFMLhDuqTEofmXcpjYbzNZHChQQtC0PXZFJZY/qOxu5mtdcezY/KAOLu
	 IkxgycAuxPpGe8f7N+kthffTG9RQEvmduW/B8xPWtB5lOU/IP4NSypqF4TuStpgs1WBxd
	 VtTxwLAE2IYaXOTZfiWR4cp5bJAfYj/oD8yhK0fiDPXRKx7eHbcdzQiN81biAqlBCsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P1IBGWTPE/qbGzy5/W+13a29aePLZZJMznH4Zox6d/M=;
	b=jCSxWerP3Og43TqC6CJTqG3/xiI3TVxJDBZeC8mT1T1ZM4t4QHCJgS+J7FBC2vA7LCo2
	 3AQHS8bQ3qDHCYE8BRyFV6010/t5lpJWTH0cjGZtceDcgQBLvXviTkeMh9DtfulUjgb8K
	 WrkHYerEjV+VTPu4SsDzn1IexG2tbtJ7tsn85ZS+mBf8N6/ygeOVydeuOQMPKXX9U8eRr
	 pxvFHmGWxQ+z06lkheIU2VSWzkm/xJDqvO+bXeeKAe8qHtR9E2IkMHOL3MxWubqWN6lBd
	 7o8TD9iIrnV/n8E8TVbuOlJzT2suGC0Y8IVe1KlaD3AGPEl1mZq0e3ORDTGvv33lXMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012038;
	bh=P1IBGWTPE/qbGzy5/W+13a29aePLZZJMznH4Zox6d/M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lw+6s5AbtAW6tVuQrG/RTFKBgfsVTR6xdRWROWHHK/XzRGRuSG99RIJdq2d5W058R
	 chcOKnkTF7ASjLr8J/qej0yX0LvvyGhtI2vDSehsYrujS12lxrES629zvpfypfQPsq
	 gGhZ9Dy60pN6gDs11tfPmV4iDIEwxkypDzXJuobjGWJNewTwieLfBzKtXet8nd2ZrQ
	 wHAmw7+eWwlyRSeJ40ejhxIFtSCYGSqYTKJA1mrh17x7fYrCVzh8vxq2cR/TWQZJtR
	 Wak2KxundQuw4tgxENjb3Lv+w2tbrVeu3PJTS8wj5FOlRFybvmFaRIgcJSjz8W6unn
	 uf4VM7CxKFBfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD8B410E3;
	Sat,  3 Oct 2026 07:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C97D34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EBF240064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdTHbu3V-ka3 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 86BB040050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012035;
 b=AZ2JDZPz54VgSam0nvdMAtyccQn5hR/tByvnKLIh+i1tAUU2PmS/jeCCLqwMAaxrtBR8
 4LrxsBcM4MhtL1mcIwVHVc7EboNmtqfC3mk7QJ/H+A8PFcqIytoL2RCq06NJBbapYjatY
 gQoYn/aIdRpFIIOno/137cWLL6CpLb+vBcToN76sd74eQjtOfIZy0qvVToGcTT4nSd5i6
 CKQDsyItARypYcr6su/4mE20W9dXCVy+/UPphjtqwiEyqB0HBI6uuPyhazHFA5PHl5gIi
 6PNcffRpPA4VWxQlLWwte8mGJIL24OTXVVXGCpHcwTVk2Hq9R/vfZrQ20YMyTZ6KjAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012035;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wrjF3ozKQBczn+UE+rs+o7zpJ8eqzpAyX+6txCmMXZs=;
 b=ba7C3y/7vJU+UxKLGcpaZfEQ6f5r9yiBtyChoeH/GD7ZQwqKIysYFI1LDM54+WO8U8jt
 Oau68+y3ZEU2fJ0MbUjmjKpwFphpMLE8fwCGzO2/9H7grCP9F+TJU6uYO9bZG2qjL4KFD
 2/xmEtHKLrz2EimLjSpEMfuukjg1RAHarIb2f67PXGbezK8bf8/79QS7mX238okfsDKUy
 C+vayY5m7VdGd23+pGJhy9ypIUOx3uGyGRtt3S/PMnG7K+xK9TLCr0XT1bpnx8gC370lH
 AqRx7+8PRo/8v63wYTXAoybDcce57bg23JYoVDVlbwLzZGy7jfolC2952A2dQyVjixQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dw0KpHfA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dw0KpHfA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86BB040050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010939;
 bh=wrjF3ozKQBczn+UE+rs+o7zpJ8eqzpAyX+6txCmMXZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dw0KpHfAY+FSrK3du87OkXVgi6byuskjFpH1QqC+34grENJAjy6jtfyCSYvoqud8w
 83intJdTlf0JHwbaAINkq9hEbpKVgpEJzmLAnYJA4i/8Tmy1KwHNp6dDh/0Ijkoq4d
 iQr0RDMOmiAnd2oLTVlWoMm1GCnhDYo8RJmorbeAylmKkzY80uZq2a2FDEk7X38DdL
 6HMlsEIEB7AL9l0u6jzMApkvdDKEihTnEhjOTv7PQcFbJ1ghoBLieOLj9LmDViJOzS
 2WPTo+pke9n9FEKeVJXw7Bm3qG+dGxFuVK7BQ2r709jy5XA9+o9/UrvAvhGLVt6yEv
 ZzBRfWJyrbArg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 3zTC6bqTbK87Y+QNAHopnwYiuXOFc46KhMIf/S5plfpEmxikm4RXeXx6zHYGDx9mGJmjCEMfgiN
 /f7B7bSjGDHZwHasm1WtBo01Kljxw+wPhEsvhgtbhb2PHVNIxVCX4KwZly/DqdZPf3CEQiNTSQ8
 91W58E+a5nM1CKKk7wRd1RUUdIfN4cigtrng5PvMHSbrWi9A+8LWgL7aXNgv80uoIzeu/+GAOwL
 TKNAMvyUpPUpa6Usb3h+0+/wJvaNzhMr6qDbzvDU6hV5Prfk/hyv9OAR/JHnVqlCk2vcpyM8H9D
 CPF3jzsf6kggAC41DRbQyNnkEmH3sn6ykWGxlaMwUi/gz5aqjtLH9aIoAWs8/GrLtcug1WZ8uFP
 OToby7Yio7p7g2znJUyoqBC5zpLB5wM7PIjGPxHq1Jc53VOUSYHdW/dQmVR7u7vUoVChENv+qRa
 Wl5Li6ax+gARI43Y/ANF4gL6DtRyzqK7L2XdULjF+VYnjK5fsH2ACpUOshFyq0ZimZKSoDaF3YA
 KhjZP8awwiDmMRlyc6oNFO51OY7OxFinMND+9A1TOfK8oBNwCFUcsNILVWIyteBe2++959ar7Pz
 iqT2UEC7jogQNm1AarHLHr/TGlJPQZKJJWdcfRxIsQEuRf+MYHgUHAs6g5LpU0XR
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6228DA4C5492;
 Sat,  3 Oct 2026 09:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-1W0m;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:02 +0200
Message-ID: <20261003070128.1295458-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 030/114] package/python-greenlet: bump version
 to 3.5.6
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 8e2dbd4af4..79dee2c9ba 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  218f7f41d00dc84a8b84c57aa2ced62a  greenlet-3.5.0.tar.gz
-sha256  d419647372241bc68e957bf38d5c1f98852155e4146bd1e4121adea81f4f01e4  greenlet-3.5.0.tar.gz
+md5  334c931cef75cc40f6b7a81f7b50f0f0  greenlet-3.5.6.tar.gz
+sha256  8e67c43bdfc88d5fee6db0d3e40175b362fc95fb85f0412d233b9b203c53a575  greenlet-3.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index bf8181b0b3..e216da5689 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.5.0
+PYTHON_GREENLET_VERSION = 3.5.6
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/3c/3f/dbf99fb14bfeb88c28f16729215478c0e265cacd6dc22270c8f31bb6892f
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/3e/6e/0091f175ccd02b02bc8811bbcbcc6ac2e980be116e3b2f7a736ca322bf84
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
