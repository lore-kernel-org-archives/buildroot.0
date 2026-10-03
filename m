Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7907DCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DA860628;
	Sat,  3 Oct 2026 07:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7uvnGTNT5Jc; Sat,  3 Oct 2026 07:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4D46C605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011282;
	b=AuzXOwRLCZTLJ2FKGSYBY9/80bBffFVfqC6/svwlAsDVB7GxDOipkQ3dRiaajpXscn4H
	 0eGEU879mlSCorm3IVZzro6Zm+kLs2w77Y/gCrWk0pnspO1mp7JgcMXybDtx7f6mBXb+J
	 3ydqs8/Bi1mevegbyVdw3ZAyeC1ltuhBAEfS9VjslmGSCef6eYoMnZKbH5zo14fmhb+Ft
	 0iXYCIE5hSM527xR+o0dROMG5/3n8cPqLhygaCFo4x5ZV3AHbnDHQDKaW7+5zyI4TmEZr
	 US30/inGWTd4dj4W7NzlcN2jlIcNt2DNLW/wXogSYsDyVFiq4xqAN/Uw1S5NqTUT6OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UgLFjxSfOGB+jh6zW2vZgwoEKausAR7WxwexMZRl6Hw=;
	b=bn/cjwPIhURK5WdjKiwv0jsy2KJcpzPdGdUapeBFkpq9ObIfjubH5/CwZFOEAVfaR+Jb
	 XNluPXD1gYUFqMzYs+uVL4n4q41RvQHBgK0+aNcsUONaOhjMGMlzbAkAhCUtdxS5eMhYl
	 Xe0gKr6n2j49/+NRFvkCs1sEWpGVKTHL6oOhnRMIuxX/CLvyocmeaRdKIImelA9cNyWu7
	 BwWoSO6L9oTtc9wC7sMrxwEX0pKOtAdZtff1ABxFWkcEzk3xgJQL0ESLdcgZJOM+GHxFh
	 ERR8CKXstzTl5DMv3HZgjSQHXhtmBjX0gv/GZUS75oRR9lsd6VVOn4HG08xX88SNtoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011282;
	bh=UgLFjxSfOGB+jh6zW2vZgwoEKausAR7WxwexMZRl6Hw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e0CEcWWhg/gCaCz6yxMhtExsHmkamPIWoi/ogvjpM7k14wrVIT0BfdL4hX94XDXn/
	 DWkLl9CD0KKfWIaZZqO5gCj1lhRZHCpS8runi6FdXOgy17kVvOn2sl2K4gJDWi2Oq6
	 EDZ7bLPNR+UpGuaNiJthrPI+HuA8ZYuGk+BVG0NWDOQUb62rQbwgkDIqqdO/JnycGb
	 Zylk8l/ReadORhd6yqZa9SD8Vn8Ic3KsHVlry04tZSLePFh2V2wclJnUvbzvfXjK+8
	 3xdm0WmFB2Z4IP35I/jNpo3U33KkUif+7SD6S2Jlxg70hSsM9sp8LGQ/PuujsrNiUC
	 fi4WE/QVOjeZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D46C605D1;
	Sat,  3 Oct 2026 07:08:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E720263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047AA40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYI8tEADe0nL for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 21FF940050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011279;
 b=BgXyyXm59bSBNmwQdVDCyNY8bABOdrAzOc158jVsP9vY89hjvTaLQXKgR5X6gQVf+NaN
 huNZxTWY1x/d9KHwHRlyrMkKjLyNQ10/pCQ5KqnXKXRrRi7orNzldozKipLaCoqvXJB/D
 8MahQbvgO4pOBNdTg299+BlMm+Xuls4x+3xyle2tMk8t2lipNZLDtVvzRl8thGVU7wA11
 rqXz1LdwY9ApwzuIvTe8E3heRQe4fgezlhvIJtulVNbtFsVf6S5g0GJ6Mco1izZFZ0KWz
 V/Vr1j9KHJLVqJ+PrZkG3iXytTX/qc2x/+RHsJHj6mnEW5t3CV0kYFoB5qStuVeVuiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011279;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dxDiuYedRz4M2WAnqUkE73l03qDscafvB5dqnB8M8IE=;
 b=pb2UCejFIDObZjUaY6J+s7p0aBrd53OH5sW6A5Fk+KrsXziCS2+jiULgqd0J4j+Glo3J
 96ifQosUOGyHnloXB4lZrAsX85sORSlHxN3WWxIKys9qUDg36wRBK6BRxUKulE81QrEKY
 6XMTHkc8T/W0kaBgDEOTOoS4nnO/aoVUeoGj/LavFjeU8v8Yr6SAfEiWVbF6o2n3hb/1r
 saBbrjUWbjOCkjkCoPlr8YWBBd8Kroxvbv4YsV8Gd572BlvliOnhdDOfXOGNOErl49UmL
 48EdsmQIA1oGAMZlNEjfMoKZcDD5zkaMdEUAHrq12GLel4sId73S/IXzoIzSqdRZvxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kaP1XYOd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kaP1XYOd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21FF940050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010927;
 bh=dxDiuYedRz4M2WAnqUkE73l03qDscafvB5dqnB8M8IE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kaP1XYOdZeqIGvRiIc2Bc/GRukDXIqSeHJqjvGrTEzRcXE1g55kkLnwsLWi0r+ixh
 5Qy8+wm3N91ZsmMswknhW4LpKPFqficTB60hQBBvC4t/kI8qEm+2BlRM7151ERi6cN
 pOSgHSNRlypkJE+6W2bMyUV+LoDOr9Lso0aPmMMC41dPNYNItYyMLSztznxNb2k3gq
 sDOf4Ocwj1KlLa0P2EGLwhZJR9cvhRU/CopRy/84jOgOT0qOe/t5ygbG5oTzfcYAaY
 7M10c/PacYJU0HEqxbVoRCI+mmHCZSIqDAyOFp/pVzu9x0RETRwgARTdPgYaQt3+Su
 bTWy0FNUF1kMA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 WrRviFAJb0A5PxhUJZbjdiDFHaFSLscJmGxJ4+jSiGUSn264GMH1JrwBieZwqm/k4Xh611hWqTH
 mvui3VgVvIiCS5shPEeMI/MQP5VEfFLliqPLf1FUi1EZlgbGRLtSmijqtdwL6vVlNZ1zMHALd++
 DcUiAvRu/hSOXaLLk5BSWUPkkhD2mM5i2vS+n/pNebX0U2zjvmMY80Y8fKf1n368tHp/q6hjUWk
 MOENUSfNzu9xXZvKg04GUzRlBW84oV20wS3/X0EfkLZMBlWUsAarPDmCwVCPdqNtZ8MHT//CnwL
 b9gXmb5Pr4wc1hZlg3r/LrI8KzAOpB+2qbcBinp882STFE7buA2rjiBOweH7sUiBqiSy+LTwGhb
 bp8O4lMkhDxa+HRIYsXLL+OQtBu52CT8jUeocSoNXhgSbdE/kRbpxcuw85R3BixkcF+ldvMYZWU
 O85NL5NW5ohsdz/ishuKO+oNGGcMGU2bnvlnZLnUMbS/8nMs0WNv713nOc8i3+tBS2lrmybLShV
 7n0+DWoLzIT+e/QnDL8OxOP/rF9mE0RaoKHOOP2JVDTZCJR2qgeeNPyJJZqLcgfCJPIc6auBqmZ
 qfJYNFGJQUO8kcODsJDd/ZxEifBPxawmNTcKrsCJUwu3AMmmOWtMdJJIua1oel8l
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B0A2A4C5429;
 Sat,  3 Oct 2026 09:02:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-20Dt;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:41 +0200
Message-ID: <20261003070128.1295458-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 069/114] package/python-pysmb: bump version to
 1.2.15
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
 package/python-pysmb/python-pysmb.hash | 4 ++--
 package/python-pysmb/python-pysmb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 55374ca005..ca0c4279e8 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmb/json
-md5  a719b8d2f333963ccc7cc71d4fdea184  pysmb-1.2.13.tar.gz
-sha256  89d37fc4f061acecf40e6864e555898f2ecc49994ec06949edbb94b94239a808  pysmb-1.2.13.tar.gz
+md5  8d5160914f8af29a6b50ab56b9062801  pysmb-1.2.15.tar.gz
+sha256  1c12eb0e251152e80b4bde5d816b33cab14d04b261b5f790cb4a5d9fd9653881  pysmb-1.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  d2ffe0ee7a0160534d80e21a8e531d78e67d9c29ca83b0c41ded5f7f6b50b551  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 9c8da126c1..17ec9d2c8a 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.13
+PYTHON_PYSMB_VERSION = 1.2.15
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/de/79/f9a2f2f3aea92ae5647079fcbf28e3969de9af7953bef10e31898fe435e2
+PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/9d/84/f5158ec04fdd813aa4f8df229a5f6319f20c6a555adb3967a33d69e24347
 PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
