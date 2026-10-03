Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFF9CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C5D40BCC;
	Sat,  3 Oct 2026 07:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iyWPuMmG7hj; Sat,  3 Oct 2026 07:12:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6F4BD40BBE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011544;
	b=MVMx/W4WTkp32zlLrWoo/EajQiVGnpnqO0saALdvmljVp+Z5aAztFLdJuGjTCyhPRlmH
	 Szi7h8IWVHCESMbTJML7s6MIkNlLN1WwjfrJMVrsDkjwjA32B4lb3H/KTFAU/v1Wam1DR
	 xTbrGEgAN2Z4kA4DlGSoRtu5HQenWrRy84Qic474QRAUTXjUweScDqY16WwsL02WUCIJS
	 bKZ1V8zRObJe79k5pmPZW2u0j34WMLfuYYSKrmqsWQRD6/CiCM0TU2locFjnNU8j6s1Ov
	 171W+9mJE7tmoTr+iGU5qEoTyUmluoieIxNFagStkp1mdVzckK3171GmbwT9qkKk3nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3izDvt8iYRd6l98I4sCDt9i4H4uUoUvJj5Sn5XOjavs=;
	b=Riv/8IntgtIObKwkISz/fPLG6pd+JjsTCmUTEEDdxdvGFc+D4NjPXphkNUZ6HgzC67Fb
	 +nokoic0mx1U5AA051p97qpAFVmaNhWanFvJyautUIhlK4Sr5psI9neEJlRPZ+lKtJA33
	 NhOU5ZZPsV3IhaTBx5Ayim2j5ABWKOU2vL35qjeqNErvdWluGDUA9vdJYQyhZv+jKq4Rp
	 +G+gGF+AOvW//aNR7yE/SyDhu9J+SgRU0SSZWPilhA453bi30mDkRG4SII8Vget64TWX1
	 O1JEjmmGwco+tuyo7DxdZYfSxjF7CatUALXHP96gsmsWtBmSAekQNluhO28FK1WjkgQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011544;
	bh=3izDvt8iYRd6l98I4sCDt9i4H4uUoUvJj5Sn5XOjavs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iGNTAy8T2gWokHh9QdiLz0BBDdmgl6wiXNa+oYSlacGENy7pyAVPNYYL2Xcs2V98k
	 +j5wjk0UDlltRd1MGTwLORvUlvm26BxNIPlyJU+FdAkB1VeFwN53j+QIfluJm1EdyH
	 vxjBcYwDLlliu1w6FQ7Xq4gXzWhl0E7g9vDUNbri+PsFRPRmp0S5LARIUzWuWYgIhZ
	 ia7wn/pi9zD2eDsk2wAwYvGBfSBuCHDWfY6sHMY6xm3kG0VtV11zno/3sEww29kYZU
	 JQ9tuZSMaCqRlFSpsPqNzK9CnwTpVsrbAC77OAK+402aHy6C2jI8ZIXQmMoVLAMVpq
	 m1iSJKPJIgY1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4BD40BBE;
	Sat,  3 Oct 2026 07:12:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5D9F435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7EC46062D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebu7kvVWrJjr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B6E3E60634
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011543;
 b=QI6lf2maIOyEYgmWRQqDx/+8DaASjBHf5qgAgGBACC826eZmHp70WiZGvIwUeBDCMgoJ
 AF16Ji8MmX6W0b/+fc5USjM6cTibFHfvttW3HpZlWS0VgWlKonnAG68t0+XGeaIWkmZ/L
 Wr6vfBXNo2QPL/k9ro3SJsNZ/eoZ/AqkImUT70gcvFhKLzXyeLeV6w0JsJFOsCEJdYcF0
 +aayG1IRhFOf8ypIn9ufDA1f88jOg1ibWq9CzpZoNmtTmkCXOKqf8lVkcC8eViX8JN+5F
 EKM/AW7+8DLF8H2aefr+E1aV+9iCLHkVvr8qbHlZqa7SNPdo4DkzkswkjrkVQ0fkRYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011543;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=O6p57B3sNboe+Ya/xyDXlF6OQUO1TRlZZbYDgJBk5gE=;
 b=F7963gw4fHHMEoDLSRwAY0c14LK7gS3VMPpO2lDTDMvo1Hopm6KZr6fKPEmy+4/ig3Pz
 yoA9wWzvcs88n6zW8cKqVwQSQjtZP0VxJDpn6IzZWT6GXafx268zK0BH6TZdkFrfdprhJ
 Gl1VMhS0df6s7/w5EnNHBaGqN2vEA3waEGX178mNvfy0DvCEdw9z7TJLY/i2I65vTUbcV
 xAZxbft/WtXDpKBGF++9BSjK9INXW7RQXx6vCfpWvE5zDHvblXeCQTJdFBlGPSDhvFJsE
 P7u9mOdmPKot+S2/VmSWLdkfnGS7t8Ey7G9ZE+nmbmbt/t4wE1CXiVIxf4pkxcyVnRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nkioRukw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nkioRukw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E3E60634
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010931;
 bh=O6p57B3sNboe+Ya/xyDXlF6OQUO1TRlZZbYDgJBk5gE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nkioRukw0x86IDAPL0/kT8N2zNAOw/CBMA4OpcR8hEt7/k7taoifFWmPc5EI0+6qu
 A1ees5zKsjsMff4t27gdHOy2Y/+qZsG7cXDKFRr/HpmeBUgGlrqxLiVlWqWaJn7ydv
 /OrUZLS5aGChFcDS5L9GTuE1bv3ijizhldrezl5gb/IMrRg+7Xo6yy5jgDH+24rLA3
 uU7yVrYgHQZkIrWiWgSnyuo9emOd29CXBi62C8DerHtiF17Vi4mJZOObwNCEzGX+JJ
 JhHOWmCBR742ZgksGDdU8nJ5d1EXF19lMLFbboR0/sCDxlVHsryLU4eyvIX+5//3XB
 +LGzN2RbOfHRg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 AItg7z07imyqOk1pGy+lqZzEuxHYoEYWtcyen04Ql2Wd7aATNdrqZdl6ClAOJMh38N3P++3Ka6F
 dw+f7YqJmnvQxkOyolWapI8Hddhl6Bw0BgBq0R/9ynETl82093a8nmBo6apRfRppYXliPJtABTq
 +P17y2sfHTaHquqlFemhDvc006nBZQylKtT8rdXS/bmu1pG1rT+vI3bea65uaVB388FRbat/d2i
 0AXr8sRknJxTerCfd9VUhTgoDnUrxXwAFDNKwBiwQRjv0+srrfCDPDtxq6hx2dspVpqTLnjB44X
 Lm0PfRFdUNouT7CLL/doeEfDhVqP9TUCbwFNHcenw+EdLdvqoyDDAEuO2X99PWKBI6+SrdTsTix
 nyUq5tp0j0GFHS4ys00LJVP69vBltZTXPYiXAuKLeZ2/gpv8UvYXSKPxM+7p7BXhDT+eCbxngDC
 Mwfo4mU7ut/ve4uaF04AYQmF/dAQBYnhHABXBbv1TxGgA+MPIXJnXSS4zYW/GH8Wus+C84rbwmM
 oQ6PRq9u/Ziz76t3fjbu38QP3E8QZl2SIRgSw63/p+tdCDCmtsNN4HL/9FRBA8IKMtzWEf1+5YS
 q3I0IbrkmFXCBdsYTe2ZaFNlrU2tOkQxe2yjU9Q+piUxlWE3YHg81C1iaMGorTuf
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1078A4C543D;
 Sat,  3 Oct 2026 09:02:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-0Qwv;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:02 +0200
Message-ID: <20261003070128.1295458-90-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 090/114] package/python-thrift: bump version to
 0.24.0
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
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinicius Tinti <viniciustinti@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-thrift/python-thrift.hash | 4 ++--
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index c6fea735c1..452bb7176b 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  d900f4b437b1ffba7258c58c3fde40db  thrift-0.22.0.tar.gz
-sha256  42e8276afbd5f54fe1d364858b6877bc5e5a4a5ed69f6a005b94ca4918fe1466  thrift-0.22.0.tar.gz
+md5  521e6b4fc5d135af2d16f7198dcfa0e2  thrift-0.24.0.tar.gz
+sha256  9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c  thrift-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index d0c7896f8e..182139015f 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.22.0
+PYTHON_THRIFT_VERSION = 0.24.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/b2/c2/db648cc10dd7d15560f2eafd92a27cd280811924696e0b4a87175fb28c94
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/5f/bd/8f90501b11206e545da3343ed0e5740fc694be24a5f637d7dd7e4e3af927
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
